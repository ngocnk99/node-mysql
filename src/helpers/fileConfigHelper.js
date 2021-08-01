/* eslint-disable camelcase */
import shell from 'shelljs';
import path from 'path';

import logger from '../utils/logger';
import Promise from '../utils/promise';
import * as ApiErrors from '../errors';
import CONFIG from '../config';
import log from '../logger';
import FileDnsHelper from './fileDnsHelper';
import { ROOT_DIR } from '../utils';

/**
 * FileConfigHelper
 */
class FileConfigHelper {
  /**
   *
   * @param {Object} param
   */
  static _handleFileConfigServer({ input, output }) {
    const fsExtra = require('fs-extra');
    const fs = require('fs');
    const Mustache = require('mustache');
    const customTags = ['@@', '@@'];

    Mustache.tags = customTags;
    Mustache.escape = function (text) { return text; };

    return new Promise(resolve => {
      return fs.readFile(input.tempFile, function (error, dataTemplate) {
        if (error) {
          console.log("readFile input.tempFile ", error);
          throw new ApiErrors.BaseError({
            statusCode: 201,
            type: 'cSiteFileConfig',
            error
          })
        } else {
          const templates = Buffer.from(dataTemplate).toString();
          const outputData = Mustache.render(templates, input.data);

          return fsExtra.ensureDir(output.outputDir).then(() => {
            return fs.writeFile(output.outputFile, outputData, function (error) {
              if (error) {
                console.log("writeFile output.outputFile ", error);
                throw new ApiErrors.BaseError({
                  statusCode: 201,
                  type: 'cSiteFileConfig',
                  error
                })
              } else {
                resolve(outputData)
              }
            });
          })
        }
      })
    })
    /* .catch(error => {
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: 'FileConfigHelper'
      })
    }) */
  }

  /**
   *
   * @param {String} fileName
   */
  static _handleDeleteFileConfigServer(fileName) {
    return new Promise(resolve => {
      // const fsExtra = require('fs-extra');
      const fs = require('fs');
      let fileExisted = false;

      try {
        // eslint-disable-next-line no-unused-vars
        const stats = fs.statSync(fileName);

        console.log("File exists.");
        fileExisted = true;
      } catch (error) {
        fileExisted = false;
      }
      if (!fileExisted) {
        resolve(true);
      }

      return fs.unlink(fileName, function (error) {
        if (error) {
          console.error("catch: ", error)
          resolve(false)
          /* throw new ApiErrors.BaseError({
            statusCode: 201,
            type: 'cSiteFileConfig',
            error
          }) */
        }
        // if no error, file has been deleted successfully
        console.log('File deleted!');
        resolve(true)
      });
    })
  }

  /**
   *
   * @param {Object} param
   */
  static _handleCopyFileConfigServer({ fromDir, toDir }) {
    return new Promise(resolve => {
      const fsExtra = require('fs-extra');
      const fs = require('fs');
      let fileExisted = false;

      try {
        // eslint-disable-next-line no-unused-vars
        const stats = fs.statSync(fromDir);

        console.log("File copy exists: ", fromDir);
        fileExisted = true;
      } catch (error) {
        fileExisted = false;
      }
      if (!fileExisted) {
        resolve(false);
      }
      const ensureToDir = `${toDir}`.slice(0, `${toDir}`.lastIndexOf('/'));

      return fsExtra.ensureDir(`${ensureToDir}`).then(() => {
        return fs.copyFile(`${fromDir}`, `${toDir}`, fs.constants.COPYFILE_FICLONE, function (error) {
          // return fsExtra.copy(fromDir, toDir, function (error) {
          if (error) {
            console.error("copy file catch: ", error)
            resolve(false)
          }
          // if no error, file has been deleted successfully
          console.log('File copied!');
          resolve(true)
        });
      });
    })
    /* .catch(() => {
      return Promise.resolve(false)
    }) */
  }

  /**
   *
   * @param {Object} param
   */
  static _handleProcessTwoFileConfig({ fileName, siteName, fromConfigDir, toConfigDir, fromIncludeDir, toIncludeDir }) {
    /* const folderNow = dateNowString();
    const logger = createLogger(`fileConfigBackup/${folderNow}/${siteName}`) */
    /*
    const suffixFileName = `${fileName}.conf`;

    const outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;
    const outputFileBackup = `${outputDir}/backup/${suffixFileName}`

    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;
    const outputFileIncludeBackup = `${outputDir}/backup/${suffixFileName}-include`; */

    return Promise.try(() => {
      // logger.logInfo(`COPY FILE CONFIG siteName: ${siteName} - name: ${fileName} \n fromConfigDir: ${fromConfigDir} \n toConfigDir: ${toConfigDir} \n fromConfigIncludeDir: ${fromIncludeDir} \n toConfigIncludeDir: ${toIncludeDir}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)
      return this._handleCopyFileConfigServer({
        fromDir: fromConfigDir,
        toDir: toConfigDir,
        fileName,
        siteName
      })
    }).tap(dataCopyFile => log("dataCopyFile 1: ", dataCopyFile)).then(() => {
      return this._handleCopyFileConfigServer({
        fromDir: fromIncludeDir,
        toDir: toIncludeDir,
        fileName,
        siteName
      })
    }).tap(dataCopyFile => log("dataCopyFile 2: ", dataCopyFile))
      .then(dataCopyFile => {
        return dataCopyFile;
      })
    /* .catch(error => {
      const errMsg = new Error(error).message;
      logger.logError(errMsg);
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: 'FileConfigHelper'
      })
    }) */
  }

  /**
   *
   * @param {Object} param
   */
  static handleBackupFileConfig({ fileName, siteName }) {

    const suffixFileName = `${fileName}.conf`;

    const outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    let outputDirBackup = path.resolve(`${ROOT_DIR}/userfiles/config/backup`)

    if (CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT !== undefined)
      outputDirBackup = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT}`)

    const outputFile = `${outputDir}/${suffixFileName}`;
    const outputFileBackup = `${outputDirBackup}/${suffixFileName}`

    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;
    const outputFileIncludeBackup = `${outputDirBackup}/${suffixFileName}-include`;

    return Promise.try(() => {
      logger.configBackup(`BACKUP FILE CONFIG siteName: ${siteName} - name: ${fileName} \n fromConfigDir: ${outputFile} \n toConfigDir: ${outputFileBackup} \n fromConfigIncludeDir: ${outputFileInclude} \n toConfigIncludeDir: ${outputFileIncludeBackup}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)

      return this._handleProcessTwoFileConfig({
        fromConfigDir: outputFile,
        toConfigDir: outputFileBackup,
        fromIncludeDir: outputFileInclude,
        toIncludeDir: outputFileIncludeBackup,
        fileName,
        siteName
      })
    }).catch(error => {
      const errMsg = new Error(error).message;

      logger.configBackup(errMsg);
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: 'FileConfigHelper'
      })
    })
  }

  /**
   *
   * @param {Object} param
   */
  static handleUndoFileConfig({ fileName, siteName }) {

    const suffixFileName = `${fileName}.conf`;

    const outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    let outputDirBackup = path.resolve(`${ROOT_DIR}/userfiles/config/backup`)

    if (CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT !== undefined)
      outputDirBackup = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT}`)
    // const extBack = `${CONFIG.FILE_CONFIG_BACKUP_SERVER_EXTENSION}`;

    const outputFile = `${outputDir}/${suffixFileName}`;
    const outputFileBackup = `${outputDirBackup}/${suffixFileName}`

    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;
    const outputFileIncludeBackup = `${outputDirBackup}/${suffixFileName}-include`;

    return Promise.try(() => {
      logger.configUndo(`UNDO FILE CONFIG siteName: ${siteName} - name: ${fileName} \n fromConfigDir: ${outputFileBackup} \n toConfigDir: ${outputFile} \n fromConfigIncludeDir: ${outputFileIncludeBackup} \n toConfigIncludeDir: ${outputFileInclude}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)

      return this._handleProcessTwoFileConfig({
        fromConfigDir: outputFileBackup,
        toConfigDir: outputFile,
        fromIncludeDir: outputFileIncludeBackup,
        toIncludeDir: outputFileInclude,
        fileName,
        siteName
      })
    })
      .catch(error => {
        const errMsg = new Error(error).message;

        logger.configUndo(errMsg);
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'cSiteFileConfig',
          error,
          name: 'FileConfigHelper'
        })
      })
  }

  /**
   *
   * @param {Object} param
   */
  static handleSaveErrorFileConfig({ fileName, siteName }) {

    const suffixFileName = `${fileName}.conf`;

    const outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    let outputDirBackup = path.resolve(`${ROOT_DIR}/userfiles/config/backup`)

    if (CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT !== undefined)
      outputDirBackup = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_BACKUP_SERVER_OUT}`)

    const outputFile = `${outputDir}/${suffixFileName}`;
    const outputFileBackup = `${outputDirBackup}/error/${suffixFileName}.error`

    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;
    const outputFileIncludeBackup = `${outputDirBackup}/error/${suffixFileName}-include.error`;

    return Promise.try(() => {
      logger.configBackup(`backup - ${siteName} - ${fileName} - fromConfigDir ${outputFile} - toConfigDir ${outputFileBackup} - fromConfigIncludeDir ${outputFileInclude} - toConfigIncludeDir ${outputFileIncludeBackup}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)

      return this._handleProcessTwoFileConfig({
        fromConfigDir: outputFile,
        toConfigDir: outputFileBackup,
        fromIncludeDir: outputFileInclude,
        toIncludeDir: outputFileIncludeBackup,
        fileName,
        siteName
      })
    }).catch(error => {
      const errMsg = new Error(error).message;

      logger.configBackup(errMsg);
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: 'FileConfigHelper'
      })
    })
  }

  /**
   *
   * @param {Object} data
   */
  static handleDataConfig(data) {
    console.log("handleDataConfig data: ", data);
    const domain_master_var = data.domain_master.replace(/\./g, '_');
    const developer_mode_enable = data.developer_mode && data.developer_mode === "enable" ? null : data.developer_mode;
    let { browser_cache_expiration } = data;

    if (developer_mode_enable === null) {
      browser_cache_expiration = null;
    }
    const x_forwarded_for_enable = data.x_forwarded_for && data.x_forwarded_for === "disable" ? null : data.x_forwarded_for;

    const formatAddonDomains = data.addon_domains && data.addon_domains.map(item => {
      /* if (index === data.addon_domains.length - 1){
        console.log("handleDataConfig ssl: ", item.Ssl.dataValues)
      }
      console.log("handleDataConfig ssl: ", item.Ssl.dataValues.domain_name) */
      return {
        scheme: item.scheme,
        domain: item.domain,
        addon_domain_ssl_crt: item.ssl_id && item.Ssl ? `${item.Ssl.dataValues.domain_name}.cert` : ``,
        addon_domain_ssl_key: item.ssl_id && item.Ssl ? `${item.Ssl.dataValues.domain_name}.key` : ``,
      }
    });
    const formatAddHeaders = data.add_headers && data.add_headers.map(item => ({
      name_header: item.name,
      value_header: item.value
    }));
    const formatDelHeaders = data.del_headers && data.del_headers.map(item => ({
      name_header: item.name,
    }));
    const formatHttpRefererBlacklists = data.http_referer_status === "enable" && data.http_referer_blacklists && data.http_referer_blacklists.map(item => ({
      http_referer_blacklist: item.domain,
    }));
    const formatHttpRefererWhitelists = data.http_referer_status === "enable" && data.http_referer_whitelists && data.http_referer_whitelists.map(item => ({
      http_referer_whitelist: item.domain,
    }));
    const formatAccessControlBlacklists = data.access_control_status === "enable" && data.access_control_blacklists && data.access_control_blacklists.map(item => ({
      access_control_blacklist: item.name,
    }));
    const formatAccessControlWhitelists = data.access_control_status === "enable" && data.access_control_whitelists && data.access_control_whitelists.map(item => ({
      access_control_whitelist: item.name,
    }));
    const formatUpStreamServer = data.upstreams && data.upstreams.map(item => ({
      upstream_server: item.server,
      upstream_port: item.port,
      upstream_weight: item.upstream_weight,
    }));

    let scheme = 'http';

    data.upstreams.forEach(it => {
      if (it.type === 'root') {
        scheme = it.scheme
      }
    })
    let http_referer_white = null;
    let http_referer_black = null;
    let access_control_white = null;
    let access_control_black = null;
    let geoIP_country_redirect = null;

    if (data.http_referer_status === "enable") {
      http_referer_white = data.http_referer_black_white_list === "whitelist" ? "whitelist" : null;
      http_referer_black = data.http_referer_black_white_list === "blacklist" ? "blacklist" : null;
    }
    if (data.access_control_status === "enable") {
      access_control_white = data.access_control_black_white_list === "whitelist" ? "whitelist" : null;
      access_control_black = data.access_control_black_white_list === "blacklist" ? "blacklist" : null;
    }

    if (access_control_black !== null) {
      const { access_control_redirect_path } = data;

      geoIP_country_redirect = access_control_redirect_path;
    }

    const { uri } = data;

    log("handleDataConfig uri ", uri);
    let defaultUri;

    if (uri === "") {
      defaultUri = ""
    } else if (uri[0] !== '/') {
      defaultUri = `/${uri}`;
      // defaultUri = uri.lastIndexOf('/') === uri.length - 1 ? `${uri}` : `${uri}`;
    } else defaultUri = uri;
    defaultUri = defaultUri.replace('//', '/');

    const dataConfig = {
      domain_name: data.name,
      domain_master: data.domain_master,
      domain_master_var,
      upstream_servers: formatUpStreamServer,
      addon_domains: formatAddonDomains,
      // eslint-disable-next-line require-jsdoc
      addon_domain: function () {
        return `${this.domain}`;
        // return this.scheme + "://" + this.domain;
      },
      // addon_domain_ssl_crt: data.addon_domain_ssl_crt,

      http_referer_blacklists: data.http_referer_black_white_list === "blacklist" ? formatHttpRefererBlacklists : null,
      http_referer_whitelists: data.http_referer_black_white_list === "whitelist" ? formatHttpRefererWhitelists : null,
      access_control_blacklists: data.access_control_black_white_list === "blacklist" ? formatAccessControlBlacklists : null,
      access_control_whitelists: data.access_control_black_white_list === "whitelist" ? formatAccessControlWhitelists : null
    };
    const dataConfigInclude = {
      domain_master: data.domain_master,
      domain_master_var,
      upstream_uri: defaultUri,
      host_header: data.host_header,
      x_forwarded_for: data.x_forwarded_for,
      x_forwarded_for_enable,
      gzip: data.gzip === "enable" ? "on" : "off",
      gzip_comp_level: data.gzip_comp_level,

      developer_mode: data.developer_mode,
      developer_mode_enable,
      add_headers: formatAddHeaders,
      del_headers: formatDelHeaders,
      http_referer_white,
      http_referer_black,
      access_control_white,
      access_control_black,
      geoIP_country_redirect,
      browser_cache_expiration,
      scheme
    }

    return { dataConfig, dataConfigInclude };
  }

  /**
   *
   * @param {Object} param
   */
  static handleFileConfig({ siteName, fileName, dataConfig, dataConfigInclude, type /* , group */ }) {
    console.log("_dirName: ", ROOT_DIR)

    const suffixFileName = `${fileName}.conf`;
    let tempDir = path.resolve(`${ROOT_DIR}/templates`)

    if (CONFIG.WEB_DIR_FILE_CONFIG_SERVER_TEMPLATE !== undefined)
      tempDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_TEMPLATE}`);

    const tempFile = path.resolve(`${tempDir}/site_name.kcdn.vn.conf`)
    let outputDir = path.resolve(`${ROOT_DIR}/userfiles/config`)

    if (CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT !== undefined)
      outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;

    const tempFileInclude = path.resolve(`${tempDir}/site_name.kcdn.vn.conf-include`);
    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;

    return Promise.try(() => {
      if (type === 'backup') {
        return this.handleBackupFileConfig({ siteName, fileName });
      }

      return true;
    }).then(() => {
      logger.config(`create - ${siteName} - ${fileName} - dataConfig: ${JSON.stringify(dataConfig)} - dataConfigInclude: ${JSON.stringify(dataConfigInclude)} - output: ${outputFile} - outputInclude: ${outputFileInclude}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)

      return this._handleFileConfigServer({
        input: {
          tempFile,
          data: dataConfig
        },
        output: {
          outputDir,
          outputFile
        }
      })
    }).then(() => {
      return this._handleFileConfigServer({
        input: {
          tempFile: tempFileInclude,
          data: dataConfigInclude
        },
        output: {
          outputDir,
          outputFile: outputFileInclude
        }
      })
    }).then(result => {
      return { fileName, siteName, result };
      // eslint-disable-next-line newline-per-chained-call
    }).catch(error => {
      const errMsg = new Error(error).message;

      logger.config(errMsg);
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'cSiteFileConfig',
        error,
        name: 'FileConfigHelper'
      })
    })
  }

  /**
   *
   * @param {Object} param
   */
  static handleDeleteFileConfig({ fileName, siteName/* , domainServer */ }) {

    const suffixFileName = `${fileName}.conf`;

    const outputDir = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;

    const outputFileInclude = `${outputDir}/${suffixFileName}-include`;

    return Promise.try(() => {
      // backup site file truoc khi xoa
      return this.handleBackupFileConfig({ siteName, fileName });
    }).then(() => {
      logger.configDelete(`delete - ${siteName} - ${fileName} - output: ${outputFile} - outputInclude: ${outputFileInclude}`);
      // console.log("tempFileInclude: %o \noutputFileInclude: %o", tempFileInclude, outputFileInclude)

      return this._handleDeleteFileConfigServer(outputFile)
    }).then(() => {
      // console.log("created file config %s successful", fileName)
      return this._handleDeleteFileConfigServer(outputFileInclude)
    })
      // .then(() => {
      //   console.log('CALL FileDnsHelper._removeDnsFileJson siteName %o, fileName %o, domainServer %o', siteName, fileName, domainServer)
      //   return FileDnsHelper._removeDnsFileJson({ siteName, fileName, domainServer })
      // })
      .then(() => {
        return true;
      })
      .catch(error => {
        logger.configDelete(error.message)
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'cSiteFileConfig',
          error,
          name: 'FileConfigHelper'
        })
      })
  }

  /**
   *
   * @param {Object} param
   */
  static _verifyFileConfig({ filePath, siteName, logDir }) {
    if (logDir === 'verify') logger.verify(`${siteName} - ${filePath}`);
    else logger.sync(`${siteName} - ${filePath}`);

    return new Promise((resolve) => {
      try {
        const options = {
          timeout: 20000
        }

        shell.exec(`${filePath}`, options, function (code, stdout, stderr) {
          // console.log('Exit code:', code);
          console.log('Program output:', stdout);
          console.log('Program stderr:', stderr);
          if (stdout) {
            if (logDir === 'verify') logger.verify(`${siteName} - read echo ${stdout}`);
            else logger.sync(`${siteName} - ${stdout}`);
          }
          if (stderr) {
            if (logDir === 'verify') logger.verify(`${siteName} - read echo ${stderr}`);
            else logger.sync(`${siteName} - ${stderr}`);
          }
          let checkOk = false;

          if (
            (stdout !== '' && stdout.toLowerCase().indexOf(`${CONFIG.CHECK_CONFIG_FILE}`) > -1)
            || (stderr !== '' && stderr.toLowerCase().indexOf(`${CONFIG.CHECK_CONFIG_FILE}`) > -1)
          ) {
            checkOk = true
            console.log('checkOk:', checkOk);
          }
          resolve(checkOk);
        });
      } catch (error) {
        if (logDir === 'verify') logger.verify(`${siteName} - error ${error.message}`);
        else logger.sync(`${siteName} - error ${error.message}`);
        resolve(false)
      }
    })
    /* .catch(error => {
      const errMsg = new Error(error).message;
      logger.logError(`CHECK FILE: ${filePath} - error: ${errMsg}`);
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: logDir === 'sync' ? 'syncFileError' : 'configFileError',
        error,
        name: 'FileConfigHelper'
      })
    }) */
  }

  /**
   * Hàm xử lý veriy và sync file config site.
   *
   * @param {Object} param
   * @param {string} param.importPath - Tên site.
   * @param {string} param.fileName - Tên domain_master đã được mã hóa dùng làm tên file config.
   * @param {string} param.type - Loại backup hoặc undo dùng để backup file config.
   * @param {string} param.group_partition - Phân vùng group_partition.
   * @param {string} param.dns - True/false dùng để ghi file dns.json, trong t/h này là update group_partition.
   * @returns {boolean} - Imported model, returned from cache if was already imported.
   */
  static handleVerifyFileConfigAndSync({ siteName, fileName, type, group_partition, dns, domainServer, isSiteDelete }) {
    console.log("BEGIN VERIFY AND SYNC FILE CONFIG")

    return Promise.try(() => {
      return this._verifyFileConfig({ filePath: `${CONFIG.WEB_DIR_VERIFY_FILE_CONFIG}`, siteName, logDir: 'verify' })
    }).then(dataVerifyConfig => {
      logger.verify(`${siteName} - ${CONFIG.WEB_DIR_VERIFY_FILE_CONFIG} - result ${dataVerifyConfig}`);
      if (!dataVerifyConfig) {
        // this.handleDeleteFileConfig({ siteName, fileName })
        return { resultConfigOrSync: false, typeConfigOrSync: 'config', siteName, fileName };
      }

      return this._verifyFileConfig({ filePath: `${CONFIG.WEB_DIR_VERIFY_FILE_SYNC}`, siteName, logDir: 'sync' }).then(dataVerifySync => {
        logger.sync(`${siteName} - ${CONFIG.WEB_DIR_VERIFY_FILE_SYNC} - result ${dataVerifySync}`);
        if (!dataVerifySync) {
          // this.handleDeleteFileConfig({ siteName, fileName })
          return { resultConfigOrSync: false, typeConfigOrSync: 'sync', siteName, fileName };
        }

        return { resultConfigOrSync: true, typeConfigOrSync: 'sync', siteName, fileName };
      })
    }).then(dataVerifySync => {
      const { resultConfigOrSync } = dataVerifySync

      log("RESULT CONFIG OR SYNC => BEGINNING WRITE FILE IF resultConfigOrSync false : ", resultConfigOrSync)
      if (!resultConfigOrSync) {
        // nếu là cập nhật site
        if (!isSiteDelete) {
          return this.handleSaveErrorFileConfig({ siteName, fileName }).then(() => {
            if (type === 'may_be_undo') {
              return this.handleUndoFileConfig({ siteName, fileName }).then(() => {
                return dataVerifySync;
              })
            }

            return dataVerifySync;
          })
        }
        // nếu là gọi từ việc xóa site
        if (type === 'may_be_undo') {
          return this.handleUndoFileConfig({ siteName, fileName }).then(() => {
            return dataVerifySync;
          })
        }

        return dataVerifySync;
      }
      // nếu là cập nhập group_partition site => cập nhập file dns.json
      if (resultConfigOrSync && dns) {
        return FileDnsHelper._createDnsFileJson({ siteName, fileName, group: group_partition, domainServer }).then(() => {
          return dataVerifySync;
        })
      }
      log("VERIFY & SYNC SUCCESSFUL: ", dataVerifySync)

      return dataVerifySync;
    })
      .catch(error => {
        const errMsg = new Error(error).message;

        logger.config(`${siteName} - ${errMsg}`);
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'cSiteFileConfig',
          error,
          name: 'FileConfigHelper'
        })
      })
  }
}

/* module.exports = FileConfigHelper;
module.exports.FileConfigHelper = FileConfigHelper;
module.exports.default = FileConfigHelper; */
export default FileConfigHelper;
