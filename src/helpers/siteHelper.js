/* eslint-disable camelcase */
import moment from 'moment';
import { pull } from 'lodash';
import models from '../model/index';
// import CONFIG from '../config';
import Promise from '../utils/promise';
import { md5 } from '../utils/crypto';
import * as ApiErrors from '../errors';
// import ErrorCode from '../util/errorCode';
import FileConfigHelper from './fileConfigHelper';
import SslEntity from '../entity/ssl';
// import UsersEntity from '../entity/usersEntity';
import log from '../logger';
import FileDnsHelper from './fileDnsHelper';

const { upstreams, addon_domains, add_headers, del_headers, access_control_blacklists,
  access_control_whitelists, http_referer_blacklists, http_referer_whitelists, ssl, Users } = models;

export const attributesUpstream = ['id', 'scheme', 'server', 'port', 'upstream_weight', 'type'];

export const defaultIncludeAttr = [
  { model: upstreams, as: 'upstreams', attributes: attributesUpstream },
  {
    model: addon_domains,
    as: 'addon_domains',
    include: [{ model: ssl, as: 'Ssl', attributes: ['id', 'domain_name', 'ssl_crt', 'ssl_key', 'created_on', 'modified_on'] }]
  },
  { model: access_control_blacklists, as: 'access_control_blacklists' },
  { model: access_control_whitelists, as: 'access_control_whitelists' },
  { model: add_headers, as: 'add_headers' },
  { model: del_headers, as: 'del_headers' },
  { model: http_referer_blacklists, as: 'http_referer_blacklists' },
  { model: http_referer_whitelists, as: 'http_referer_whitelists' },
  {
    model: Users,
    as: 'User',
    attributes: ['id', 'DomainServer']
  },
];

/* const get6RandomChars = () => {
  const chars = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z"
  ];

  const char1 = chars[Math.floor(Math.random() * 36)];
  const char2 = chars[Math.floor(Math.random() * 36)];
  const char3 = chars[Math.floor(Math.random() * 36)];
  const char4 = chars[Math.floor(Math.random() * 36)];
  const char5 = chars[Math.floor(Math.random() * 36)];
  const char6 = chars[Math.floor(Math.random() * 36)];

  return `${char1}${char2}${char3}${char4}${char5}${char6}`;
} */

/**
 * Substring 6 character.
 *
 * @param {string} name
 */
const sub6Chars = name => {
  const md5String = md5(`${moment().format("YYYYMMDDHHMM")}.${name}`);
  const md5Length = md5String.length;

  return md5String.substring(md5Length - 6, md5Length)
}

/**
 * Site Helper
 *
 */
class SiteHelper {
  /**
   *
   * @param {Object} param
   */
  static processMergeEntity({ dataInfo, entity, type, name, nameAttributeDelete }) {
    return Promise.try(() => {
      if (type === 'UPDATE_SETTING') {
        return {
          dataInfo: {
            ...dataInfo.dataValues,
            ...entity
          }
        }
      }

      return {
        dataInfo
      };
    }).then(result => {
      if (type === 'UPDATE_ADDON_DOMAIN') {
        const { ssl_id } = entity;
        // const { addon_domains } = dataInfo.dataValues;

        log("PROCESS MERGE ENTITY => SSL_ID: ", ssl_id)
        if (ssl_id > 0) {
          return SslEntity.findOne({ where: { id: ssl_id }, attributes: ['id', 'domain_name', 'ssl_crt', 'ssl_key', 'created_on', 'modified_on'] }).then(sslInfo => {
            // log("sslInfo: ", sslInfo)
            return {
              dataInfo: {
                ...dataInfo.dataValues,
                addon_domains: [
                  ...dataInfo.dataValues.addon_domains,
                  {
                    ...entity,
                    Ssl: sslInfo
                  }
                ]
              }
            }
          }).catch(error => {
            throw new ApiErrors.BaseError({
              statusCode: 202,
              type: 'cSSLInfo',
              error,
              name: 'SiteHelper'
            })
          })
        }

        return {
          dataInfo: {
            ...dataInfo.dataValues,
            addon_domains: [
              ...dataInfo.dataValues.addon_domains,
              {
                ...entity,
                Ssl: null
              }
            ]
          }
        }
      }

      return result;
    }).then(result => {
      if (type === 'DELETE_ADDON_DOMAIN') {
        const { domain } = entity;
        // let { addon_domains } = dataInfo.dataValues;
        const crud_addon_domains = dataInfo.dataValues.addon_domains.filter(item => item.domain !== domain)

        return {
          dataInfo: {
            ...dataInfo.dataValues,
            addon_domains: crud_addon_domains
          }
        }
      }

      return result
    }).then(result => {
      if (type === 'CREATE') {
        return {
          dataInfo: {
            ...dataInfo.dataValues,
            [name]: [
              ...dataInfo.dataValues[name],
              entity
            ]
          }
        }
      }

      return result
    })
      .then(result => {
        if (type === 'DELETE') {
          const deleteArr = dataInfo.dataValues[name].filter(item => item[nameAttributeDelete] !== entity[nameAttributeDelete])

          return {
            dataInfo: {
              ...dataInfo.dataValues,
              [name]: deleteArr
            }
          }
        }

        return result
      })
      .then(result => {
        if (type === 'ADD_UPSTREAM') {
          const { scheme, server, port, uri, upstream_weight, upstream_cache_status, host_header } = entity;
          const { upstreams } = dataInfo.dataValues;
          const newUpstreams = [
            ...upstreams,
            {
              scheme, server, port, upstream_weight, upstream_cache_status
            }
          ]

          return {
            dataInfo: {
              ...dataInfo.dataValues,
              host_header,
              uri,
              upstreams: newUpstreams
            }
          }
        }

        return result
      })
      .then(result => {
        if (type === 'UPDATE_UPSTREAM') {
          const { upstream_id, scheme, server, port, uri, upstream_weight, upstream_cache_status, host_header } = entity;
          const { upstreams } = dataInfo.dataValues;
          const newUpstreams = upstreams.map(item => {
            if (item.id === upstream_id) {
              return {
                ...item,
                scheme: scheme || item.scheme,
                server: server || item.server,
                port: port || item.port,
                upstream_weight: upstream_weight || item.upstream_weight,
                upstream_cache_status: upstream_cache_status || item.upstream_cache_status
              }
            }

            return item;
          })

          return {
            dataInfo: {
              ...dataInfo.dataValues,
              host_header,
              uri,
              upstreams: newUpstreams
            }
          }
        }

        return result
      })
  }

  /**
   *
   * @param {Object} param
   */
  static handleAttributes({ attributes }) {
    let includeAttr = [];

    return Promise.try(() => {
      if (!attributes || attributes === null) {
        includeAttr = [...defaultIncludeAttr]
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('upstreams') > -1) {
        pull(attributes, 'upstreams')
        includeAttr.push({ model: upstreams, as: 'upstreams', attributes: attributesUpstream })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('addon_domains') > -1) {
        pull(attributes, 'addon_domains')
        includeAttr.push({
          model: addon_domains,
          as: 'addon_domains',
          include: [{ model: ssl, as: 'Ssl', attributes: ['id', 'domain_name', 'ssl_crt', 'ssl_key', 'created_on', 'modified_on'] }]
        })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('access_control_blacklists') > -1) {
        pull(attributes, 'access_control_blacklists')
        includeAttr.push({ model: access_control_blacklists, as: 'access_control_blacklists' })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('access_control_whitelists') > -1) {
        pull(attributes, 'access_control_whitelists')
        includeAttr.push({ model: access_control_whitelists, as: 'access_control_whitelists' })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('add_headers') > -1) {
        pull(attributes, 'add_headers')
        includeAttr.push({ model: add_headers, as: 'add_headers' })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('del_headers') > -1) {
        pull(attributes, 'del_headers')
        includeAttr.push({ model: del_headers, as: 'del_headers' })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('http_referer_blacklists') > -1) {
        pull(attributes, 'http_referer_blacklists')
        includeAttr.push({ model: http_referer_blacklists, as: 'http_referer_blacklists' })
      }

      if (attributes && Array.isArray(attributes) && attributes.indexOf('http_referer_whitelists') > -1) {
        pull(attributes, 'http_referer_whitelists')
        includeAttr.push({ model: http_referer_whitelists, as: 'http_referer_whitelists' })
      }

      return { dataAttributes: attributes, includeAttr };
    }).catch(error => {
      log("error: ", error)
      throw new ApiErrors.BaseError({ type: 'getInfoError', statusCode: 500, error })
    })
  }

  /**
   * Init default value for create site.
   *
   * @param {Object} param
   */
  static initDefaultValue({ name, upstream, userId }) {
    return Promise.try(() => {
      const options = {
        where: {
          id: userId
        }
      }

      return Users.findOne(options)
    }).then(dataUser => {
      console.log("dataUser: ", dataUser)
      const domainServer = dataUser.dataValues.DomainServer;
      const defaultDomainMaster = `${sub6Chars(name)}.${domainServer}`;
      const defaultUpstreamWeight = "1";
      const defaultGzip = "enable";
      const defaultGzipCompLevel = "1";
      /* let defaultAddonDomain = [{
        addon_domain: name,
        addon_domain_ssl_crt: `${CONFIG.SSL_CERT_DEFAULT}`,
        addon_domain_ssl_key: `${CONFIG.SSL_KEY_DEFAULT}`,
      }]; */
      let defaultAddonDomain;
      const defaultHostHeader = name;
      const defaultXforwardFor = "disable";
      const x_forwarded_for_enable = null;
      const defaultDeverloperMode = "disable";
      const domain_master_var = defaultDomainMaster.replace(/\./g, '_');
      const developer_mode_enable = "enable";
      const defaultBrowserCacheExpiration = "max";
      const defaultHttpRefererBlackWhiteList = "whitelist";
      const defaultAccessControlBlackWhiteList = "whitelist";
      const defaultHttpRefererStatus = "disable";
      const defaultAccessControlStatus = "disable";

      const { uri } = upstream;

      log("initDefaultValue uri: ", uri);
      let defaultUri;

      if (uri === "") {
        defaultUri = ""
      } else if (uri[0] !== '/') {
        defaultUri = `/${uri}`;
        // defaultUri = uri.lastIndexOf('/') === uri.length - 1 ? `${uri}` : `${uri}`;
      } else defaultUri = uri;

      return {
        siteName: name,
        defaultDomainMaster,
        defaultUpstreamWeight,
        defaultGzip,
        defaultGzipCompLevel,
        defaultAddonDomain,
        defaultHostHeader,
        defaultXforwardFor,
        x_forwarded_for_enable,
        defaultDeverloperMode,
        domain_master_var,
        developer_mode_enable,
        defaultHttpRefererStatus,
        defaultAccessControlStatus,
        defaultHttpRefererBlackWhiteList,
        defaultAccessControlBlackWhiteList,
        defaultUri,
        domainServer,
        defaultBrowserCacheExpiration
      }
      /* return Promise.resolve({
        siteName: name, defaultDomainMaster, defaultUpstreamWeight, defaultGzip, defaultGzipCompLevel, defaultAddonDomain, defaultHostHeader, defaultXforwardFor, x_forwarded_for_enable, defaultDeverloperMode, domain_master_var, developer_mode_enable, defaultHttpRefererStatus, defaultAccessControlStatus, defaultHttpRefererBlackWhiteList, defaultAccessControlBlackWhiteList, defaultUri
      }) */
    })
  }

  /**
   * Process data file for create.
   *
   * @param {Object} param
   */
  static processWithFileConfig({ entity, defaultEntity }) {
    const { upstream } = entity;
    const {
      siteName, defaultDomainMaster, defaultUpstreamWeight, defaultAddonDomain, domain_master_var, defaultHostHeader, defaultXforwardFor, x_forwarded_for_enable, defaultGzip, defaultGzipCompLevel, defaultDeverloperMode, developer_mode_enable, defaultHttpRefererStatus, defaultAccessControlStatus, defaultHttpRefererBlackWhiteList, defaultAccessControlBlackWhiteList, defaultUri, domainServer
    } = defaultEntity;
    let http_referer_white = null;
    let http_referer_black = null;
    let access_control_white = null;
    let access_control_black = null;

    if (defaultHttpRefererStatus === "enable") {
      http_referer_white = defaultHttpRefererBlackWhiteList === "whitelist" ? "whitelist" : null;
      http_referer_black = defaultHttpRefererBlackWhiteList === "blacklist" ? "blacklist" : null;
    }
    if (defaultAccessControlStatus === "enable") {
      access_control_white = defaultAccessControlBlackWhiteList === "whitelist" ? "whitelist" : null;
      access_control_black = defaultAccessControlBlackWhiteList === "blacklist" ? "blacklist" : null;
    }

    return Promise.try(() => {
      /* BEGIN HANDLE FILE CONFIG */
      const dataConfig = {
        domain_name: siteName,
        domain_master: defaultDomainMaster,
        upstream_servers: [
          {
            upstream_server: upstream.server,
            upstream_port: upstream.port,
            upstream_weight: defaultUpstreamWeight,
          }
        ],
        addon_domains: defaultAddonDomain,
        domain_master_var,
        // addon_domain_ssl_crt: defaultAddonDomainSslCrt
      };
      const dataConfigInclude = {
        domain_master: defaultDomainMaster,
        domain_master_var,
        upstream_uri: defaultUri,
        host_header: defaultHostHeader,
        x_forwarded_for: defaultXforwardFor,
        x_forwarded_for_enable,
        gzip: defaultGzip === "enable" ? "on" : "off",
        gzip_comp_level: defaultGzipCompLevel,
        developer_mode: defaultDeverloperMode,
        developer_mode_enable,
        add_headers: null,
        del_headers: null,
        http_referer_white,
        http_referer_black,
        access_control_white,
        access_control_black,
        browser_cache_expiration: "max",
        scheme: upstream.scheme
      }

      return FileConfigHelper.handleFileConfig({ siteName, fileName: defaultDomainMaster, dataConfig, dataConfigInclude })
    }).then(fileConfigResult => {
      log("fileConfigResult: ", fileConfigResult)

      return FileConfigHelper.handleVerifyFileConfigAndSync({
        ...fileConfigResult,
        dns: true,
        domainServer
      })
    }).then(({ resultConfigOrSync, typeConfigOrSync, siteName, fileName }) => {
      // log("dataVerify: %o, dataCreate: %o", dataVerify, dataCreate)
      if (resultConfigOrSync) {
        return defaultEntity;
      }

      // return Promise.try(() => {
      return FileConfigHelper.handleDeleteFileConfig({ siteName, fileName }).then(() => {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: typeConfigOrSync === 'sync' ? 'syncFileError' : 'configFileError',
          name: "SiteHelper"
        })
      })
      // }).then(() => {

      // })
      // return transaction.rollback();
    })
    /* .catch(error => {
      log("SiteHelper error: ", error)
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: "SiteHelper"
      })
    }); */
    /* END HANDLE FILE CONFIG */
  }

  /**
   * Procees data file for update.
   *
   * @param {Object} param
   */
  static processWithUpdateFileConfig({ dataInfo, dataExtraInfo, dns }) {
    return Promise.try(() => {
      if (dataInfo.dataValues) {
        // eslint-disable-next-line no-param-reassign
        dataInfo = {
          ...dataInfo.dataValues
        }
      }
      // eslint-disable-next-line max-len
      const { dataConfig, dataConfigInclude } = FileConfigHelper.handleDataConfig(dataInfo);

      return { dataConfig, dataConfigInclude };
    }).then(({ dataConfig, dataConfigInclude }) => {
      return FileConfigHelper.handleFileConfig({
        siteName: dataInfo.name,
        fileName: dataInfo.domain_master,
        dataConfig,
        dataConfigInclude,
        type: 'backup',
      })
    }).then(fileConfigResult => {
      log("fileConfigResult: ", fileConfigResult)

      return FileConfigHelper.handleVerifyFileConfigAndSync({
        ...fileConfigResult,
        type: 'may_be_undo',
        dns,
        group_partition: dataInfo.group_partition,
        domainServer: dataInfo.User.DomainServer
      })
    }).then(({ resultConfigOrSync, typeConfigOrSync }) => {
      // log("dataExtraInfo: %o", dataExtraInfo)
      if (resultConfigOrSync) {
        if (dataExtraInfo) return dataExtraInfo;

        return dataInfo
      }
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: typeConfigOrSync === 'sync' ? 'syncFileError' : 'configFileError',
        name: "SiteHelper"
      })
      // return transaction.rollback();
    })
    /* END HANDLE FILE CONFIG */
  }

  /**
   * Process delete file config.
   *
   * @param {Object} param
   */
  static processDeleteFileConfig({ fileName, siteName, domainServer }) {
    return Promise.try(() => {
      return FileConfigHelper.handleDeleteFileConfig({ fileName, siteName, domainServer })
    })
      .then(fileConfigResult => {
        log("fileConfigResult: ", fileConfigResult)

        return FileConfigHelper.handleVerifyFileConfigAndSync({
          fileName,
          siteName,
          type: 'may_be_undo',
          domainServer,
          isSiteDelete: true,
        })
      }).then(resultVerifyAndSync => {
        // log("dataExtraInfo: %o", dataExtraInfo)
        return resultVerifyAndSync;
      })
      .then(({ resultConfigOrSync, typeConfigOrSync }) => {
        if (resultConfigOrSync) {
          console.log('CALL FileDnsHelper._removeDnsFileJson siteName %o, fileName %o, domainServer %o', siteName, fileName, domainServer)

          return FileDnsHelper._removeDnsFileJson({ siteName, fileName, domainServer })
        }
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: typeConfigOrSync === 'sync' ? 'syncFileError' : 'configFileError',
          name: "SiteHelper"
        })
      })
      .catch(error => {
        log("SiteHelper error: ", error)
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'cSiteFileConfig',
          error,
          name: "SiteHelper"
        })
      })
  }
}

export default SiteHelper;
