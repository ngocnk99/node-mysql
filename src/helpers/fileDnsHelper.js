import logger from '../utils/logger';
import Promise from '../utils/promise';
import * as ApiErrors from '../errors';
import CONFIG from '../config';
import { dateNowString } from '../utils';
import { ROOT_DIR } from '../utils';
// eslint-disable-next-line no-unused-vars
import log from '../logger';

/**
 *
 * @param {string} serial
 */
const generateNewSerial = serial => {
  const serialDateNow = dateNowString();
  const lastNum = serial[serial.length - 1];
  let nearLastNumber = serial[serial.length - 2];
  const prefixSerial = serial.slice(0, 8);

  if (Number(lastNum) === 9) {
    nearLastNumber = Number(nearLastNumber) + 1;
  } else {
    nearLastNumber = Number(nearLastNumber)
  }
  const newLastNum = Number(lastNum) + 1;

  console.log("serialDateNow: %o, prefixSerial: %o", serialDateNow, prefixSerial)
  if (serialDateNow === prefixSerial) {
    return `${prefixSerial}${nearLastNumber}${newLastNum}`;
  }

  return `${serialDateNow}00`;
}

/**
 * FileDnsHelper
 */
class FileDnsHelper {
  /**
   *
   * @param {Object} param
   */
  static _handleCopyFile({ fromDir, toDir }) {
    return new Promise(resolve => {
      const fsExtra = require('fs-extra');
      const fs = require('fs');
      let fileExisted = false;

      try {
        // eslint-disable-next-line no-unused-vars
        const stats = fs.statSync(fromDir);

        console.log("File exists.");
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
          console.log('File deleted!');
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
   * @param {string} outputFile
   */
  static _readJson(outputFile) {
    const fsExtra = require('fs-extra');

    return new Promise(resolve => {
      return fsExtra.readJson(`${outputFile}`, function (error, dataDns) {
        resolve(dataDns)
      })
    })
  }

  /**
   *
   * @param {string} outputDir
   * @param {string} outputFile
   * @param {Object} dataJson
   */
  static _writeJson(outputDir, outputFile, dataJson) {
    const fsExtra = require('fs-extra');

    return new Promise(resolve => {
      return fsExtra.ensureDir(outputDir).then(() => {
        return fsExtra.writeJson(outputFile, dataJson, function (error) {
          if (error) {
            console.log("writeFile output.outputFile ", error);
            /* throw new ApiErrors.BaseError({
              statusCode: 201,
              type: 'cSiteFileConfig',
              error
            }) */
            resolve(false)
          } else {
            // resolve(true)
            resolve(true);
          }
        });
      })
    })
  }

  /**
   *
   * @param {Object} param
   */
  static _createDnsFileJson({ siteName, fileName, group, domainServer }) {
    if (!group) {
      // eslint-disable-next-line no-param-reassign
      group = "isp";
    }
    const folderNow = dateNowString();
    const path = require('path');
    const suffixFileName = `${CONFIG.WEB_DNS_FILE_CONFIG_NAME}.json`;
    let outputDir = path.resolve(`${ROOT_DIR}/userfiles/dns`)

    if (CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT !== undefined)
      outputDir = path.resolve(`${CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;

    logger.dns(`${siteName} - ${fileName} - ${domainServer} - ${group} - ${outputFile}`)

    // return new Promise(resolve => {
    return Promise.try(() => {
      return this._backupDnsFileJson({ siteName, fileName, domainServer })
    }).then(() => {
      return this._readJson(`${outputFile}`);
    }).then(dataDns => {
      let objDns = dataDns;
      const record = fileName.split(`.${domainServer}`)[0];

      if (typeof dataDns !== 'object') {
        // chưa có dữ liệu file json
        objDns = {
          domain: [
            {
              name: domainServer,
              recordzone: [
                {
                  record,
                  zone: group
                }
              ],
              serial: `${folderNow}00`
            }
          ]
        }
      } else {
        let { domain } = dataDns;
        // logger.logInfo(`data dns json:  ${JSON.stringify(dataDns)}, domain.length: ${domain.length}`)

        const arrSiteInfo = domain.filter(item => item.name === domainServer);
        let siteInfo = {};

        // logger.logInfo(`data dns arrSiteInfo: ${JSON.stringify(arrSiteInfo)}`)
        if (arrSiteInfo && arrSiteInfo.length > 0) {
          // cùng 1 đại lý
          // eslint-disable-next-line prefer-destructuring
          siteInfo = arrSiteInfo[0];
          // eslint-disable-next-line prefer-const
          let { recordzone, serial } = siteInfo;
          const newSerial = generateNewSerial(serial);
          const arrRecordInfo = recordzone.filter(item => item.record === record);

          if (arrRecordInfo && arrRecordInfo.length > 0) {
            recordzone = recordzone.map(item => {
              if (item.record === record) {
                return {
                  ...item,
                  zone: group
                }
              }

              return item;
            })
          } else {
            recordzone.push({
              record,
              zone: group
            })
          }

          domain = domain.map(item => {
            if (item.name === domainServer) {
              return {
                ...item,
                recordzone,
                serial: newSerial
              }
            }

            return item;
          });
        } else {
          // logger.logInfo(`data dns domain: ${JSON.stringify(domain)}`)
          const newSerial = `${dateNowString()}00`;

          domain.push({
            name: domainServer,
            recordzone: [
              {
                record,
                zone: group
              }
            ],
            serial: `${newSerial}`
          })
        }
        objDns = {
          domain
        }
      }

      return objDns
    }).then(dataJson => {
      // logger.logInfo(`dataJson:  ${JSON.stringify(dataJson)}`)

      return this._writeJson(outputDir, outputFile, dataJson)
    })
      .then(dataWrite => {
        // logger.logInfo(`dataJson: ${JSON.stringify(dataWrite)}`)
        return dataWrite;
      })
    /*  .catch(error => {
       console.log("readJson error: ", error);
       logger.logError(`${error.message || ''}`)
       throw new ApiErrors.BaseError({
         statusCode: 202,
         type: 'cSiteFileConfig',
         error
       })
     }) */
  }

  /**
   *
   * @param {Object} param
   */
  static _removeDnsFileJson({ siteName, fileName, domainServer }) {
    const path = require('path');
    const suffixFileName = `${CONFIG.WEB_DNS_FILE_CONFIG_NAME}.json`;
    let outputDir = path.resolve(`${ROOT_DIR}/userfiles/dns`)

    if (CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT !== undefined)
      outputDir = path.resolve(`${CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;

    logger.dns(`remove dns - ${siteName} - ${fileName} - ${domainServer} - ${outputFile}`)

    // return new Promise(resolve => {
    return Promise.try(() => {
      return this._backupDnsFileJson({ siteName, fileName, domainServer })
    }).then(() => {
      return this._readJson(`${outputFile}`);
    }).then(dataDns => {
      let objDns = dataDns;
      const record = fileName.split(`.${domainServer}`)[0];

      if (typeof dataDns === 'object') {
        let { domain } = dataDns;
        // logger.logInfo(`data dns json:  ${JSON.stringify(dataDns)}, domain.length: ${domain.length}`)

        const arrSiteInfo = domain.filter(item => item.name === domainServer);
        let siteInfo = {};

        // logger.logInfo(`data dns arrSiteInfo: ${JSON.stringify(arrSiteInfo)}`)
        if (arrSiteInfo && arrSiteInfo.length > 0) {
          // cùng 1 đại lý
          // eslint-disable-next-line prefer-destructuring
          siteInfo = arrSiteInfo[0];
          const { recordzone, serial } = siteInfo;
          const newSerial = generateNewSerial(serial);
          const newRecordZone = recordzone.filter(item => item.record !== record)

          if (newRecordZone.length > 0) {
            siteInfo = {
              ...siteInfo,
              recordzone: newRecordZone
            }
            domain = domain.map(item => {
              if (item.name === domainServer) {
                return {
                  ...item,
                  ...siteInfo,
                  serial: newSerial
                }
              }

              return item
            })
          } else {
            domain = domain.filter(item => item.name !== domainServer)
          }
        }
        objDns = {
          domain
        }
      }

      return objDns
    }).then(dataJson => {
      // logger.logInfo(`dataJson:  ${JSON.stringify(dataJson)}`)

      return this._writeJson(outputDir, outputFile, dataJson)
    })
      .then(dataWrite => {
        // logger.logInfo(`dataJson: ${JSON.stringify(dataWrite)}`)
        return dataWrite;
      })
      .catch(error => {
        console.log("readJson error: ", error);
        logger.dns(`error - ${siteName} - ${error.message || ''}`)
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'cSiteFileConfig',
          error
        })
      })
  }

  /**
   *
   * @param {Object} param
   */
  static _backupDnsFileJson({ siteName, fileName, domainServer }) {
    const folderNow = dateNowString();
    const path = require('path');
    const suffixFileName = `${CONFIG.WEB_DNS_FILE_CONFIG_NAME}.json`;
    let outputDir = path.resolve(`${ROOT_DIR}/userfiles/dns`)

    if (CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT !== undefined)
      outputDir = path.resolve(`${CONFIG.WEB_DIR_DNS_FILE_CONFIG_OUT}`)
    const outputFile = `${outputDir}/${suffixFileName}`;
    const outputFileBackup = `${outputDir}/backup/${suffixFileName}_${folderNow}.bak`;

    logger.dns(`backup - ${siteName} - ${fileName} - ${domainServer} - ${outputFile} - ${outputFileBackup}`)

    // return new Promise(resolve => {
    return Promise.try(() => {
      return this._handleCopyFile({
        fromDir: outputFile,
        toDir: outputFileBackup
      })
    }).then(() => {
      // logger.logInfo(`BACKUP DNS JSON: \n dataBackup ${dataBackup}`)

      return true;
    })
  }
}

export default FileDnsHelper;
