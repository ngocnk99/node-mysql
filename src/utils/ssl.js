import sslUtils from 'ssl-utils';
// import { validateSSL } from 'ssl-validator';
import CONFIG from '../config';
import { ROOT_DIR } from './index';

export default (cert, key, domain) => new Promise((resolve, reject) => {
  const fs = require('fs');
  const path = require('path');
  const fsExtra = require('fs-extra');

  try {
    let sslDirOut = path.resolve(`${ROOT_DIR}/userfiles/ssl`)

    if (CONFIG.WEB_DIR_SSL_OUT !== undefined)
      sslDirOut = path.resolve(`${CONFIG.WEB_DIR_SSL_OUT}`);
    const sslCertFile = `${sslDirOut}/${domain}.cert`;
    const sslKeyFile = `${sslDirOut}/${domain}.key`;
    const dataCert = Buffer.from(cert);
    const dataKey = Buffer.from(key);
    /* const dataCert = cert.trim();
    const dataKey = key.trim(); */
    // console.log("dataCert: %s \ndataKey: %s", dataCert, dataKey)

    /* validateSSL(dataCert, {
      key: dataKey,
      domain
    }).then(data => {
      console.log("validateSSL: ", data)
    }); */

    sslUtils.verifyCertificateKey(dataCert, dataKey, function (err, { certStatus, keyStatus, match }) {
      if (err) {
        console.log("verifyCertificateKey error: ", err)
        reject(err);

        return;
      }
      if (match) {
        fsExtra.ensureDir(sslDirOut).then(() => {
          fs.writeFile(sslCertFile, dataCert, function (errWriteCert) {
            if (errWriteCert) {
              console.log("writeFile errWriteCert: ", errWriteCert)
              reject(new Error(errWriteCert).message);

              return;
            }
            fs.writeFile(sslKeyFile, dataKey, function (errWriteKey) {
              if (errWriteKey) {
                console.log("writeFile errWriteKey: ", errWriteKey)
                reject(new Error(errWriteKey).message);

                return;
              }
              console.log("errWriteCert: %o, errWriteKey %o", errWriteCert, errWriteKey)
              // console.log("verifyCertificateKey certStatus %o, keyStatus %o, match %o", certStatus, keyStatus, match)
              resolve({
                certStatus, keyStatus, match
              })
            })
          })
        }).catch(error => {
          console.error("fsExtra.ensureDir: ", error)
          reject(error)
        })
      }else {
        resolve({
          certStatus, keyStatus, match
        })
      }
    })
    /* const tempCertFile = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_TEMPLATE}/ssl/24h.com.vn.cert`);
    const tempKeyFile = path.resolve(`${CONFIG.WEB_DIR_FILE_CONFIG_SERVER_TEMPLATE}/ssl/24h.com.vn.key`);
    fs.readFile(`${tempCertFile}`, function (error, dataCert) {
      console.log("dataCert: ", dataCert)
      fs.readFile(`${tempKeyFile}`, function (error, dataKey) {
        sslUtils.verifyCertificateKey(dataCert, dataKey, function (err, { certStatus, keyStatus, match }) {
          if (err) {
            console.log("verifyCertificateKey error: ", err)
          }
          console.log("verifyCertificateKey certStatus %o, keyStatus %o, match %o", certStatus, keyStatus, match)
        })

        validateSSL(dataCert, {
          key: dataKey,
          domain: '24h.com.vn'
        }).then(data => {
          console.log("validateSSL: ", data)
        });
      })
    }) */
  } catch (error) {
    console.log("error: ", error)
    reject(new Error(error).message)
  }
})