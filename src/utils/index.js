import jwt from 'jsonwebtoken';
// import _ from 'lodash';
import path from 'path';
import dotenv from 'dotenv';
import moment from 'moment';

export const ROOT_DIR = process.cwd();

if (process.env.NODE_ENV === "production") {
  dotenv.config({ path: path.resolve(process.cwd(), '.env.production') });
} else {
  dotenv.config();
}
const APP_SECRET = process.env.JWT_SECRET

/**
 *
 * @param {string} token
 * @param {bool} authRoutes
 */
export function getUserId(token, authRoutes) {
  console.log("token ", token)
  const authorization = token

  if (authorization) {
    const token = authorization.replace('Bearer ', '')

    console.log("token ", token)
    try {
      const { userId } = jwt.verify(token, APP_SECRET)

      return userId
    } catch (error) {
      console.log("token verify error", error)

      return -9999;
    }

  }
  if (authRoutes) throw new AuthError()
  else return -9999;
}

/**
 * AuthError Class
 */
export class AuthError extends Error {
  /**
   * Contructor.
   */
  constructor() {
    super('Token hết hạn')
    this.code = 401;
    this.status = 401
  }
}

export const codeMessage = {
  200: 'The server successfully returned the requested data.',
  201: 'New or modified data is successful.',
  202: 'A request has entered the background queue (asynchronous task).',
  204: 'The data was deleted successfully.',
  /* ----------------------------------------------------------------------------- */
  304: 'Not modified',
  400: 'The request was made with an error and the server did not perform any new or modified data operations.',
  401: 'User does not have permission (token, username, password is incorrect).',
  403: 'Request not authenticated.',
  404: 'The request is made for a record that does not exist and the server does not operate.',
  405: 'Incorrect HTTP method provided',
  406: 'The format of the request is not available.',
  410: 'The requested resource is permanently deleted and will not be retrieved.',
  415: 'Response is not valid JSON',
  422: 'A validation error occurred when creating an object.',
  429: 'Client is rate limited',
  500: 'An error occurred on the server.',
  502: 'Gateway error.',
  503: 'The service is unavailable and the server is temporarily overloaded or maintained.',
  504: 'The gateway timed out.',
};

/**
 *
 * @param {Object} param0
 */
export const handleFileConfigServer = ({ input, output }) => new Promise((resolve, reject) => {
  try {
    const fsExtra = require('fs-extra');
    const fs = require('fs');
    const Mustache = require('mustache');
    const customTags = ['@@', '@@'];

    Mustache.tags = customTags;
    Mustache.escape = function (text) { return text; };

    fs.readFile(input.tempFile, function (error, dataTemplate) {
      if (error) {
        console.log("readFile input.tempFile ", error);
        reject(error)
      }
      else {
        const templates = Buffer.from(dataTemplate).toString();
        const outputData = Mustache.render(templates, input.data);

        fsExtra.ensureDir(output.outputDir).then(() => {
          fs.writeFile(output.outputFile, outputData, function (error) {
            if (error) {
              console.log("writeFile output.outputFile ", error);
              reject(error)
            }
            else {
              resolve(outputData)
            }
          });
        }).catch(error => {
          console.error("fsExtra.ensureDir: ", error)
          reject(error)
        })
      }
    })
  } catch (error) {
    console.error("catch: ", error)
    reject(error)
  }
})

/**
 *
 * @param {string} fileName
 */
export const handleDeleteFileConfigServer = (fileName) => new Promise((resolve, reject) => {
  try {
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
    if(!fileExisted) {
      resolve(true);

      return;
    }
    fs.unlink(fileName, function (error) {
      if (error) {
        console.error("catch: ", error)
        reject(error)

        return;
      }
      // if no error, file has been deleted successfully
      console.log('File deleted!');
      resolve(true)
    });
  } catch (error) {
    console.error("catch: ", error)
    reject(error)
  }
})

/**
 * Date now string.
 */
export const dateNowString = () => {
  const now = moment();
  const month = now.month() + 1 < 10 ? `0${now.month() + 1}` : `${now.month() + 1}`;
  const date = now.date() < 10 ? `0${now.date()}` : `${now.date()}`;
  const year = now.year();

  return `${year}${month}${date}`;
}

/**
 * Datetime now string.
 *
 */
export const datetimeNowString = () => {
  const now = moment();
  const month = now.month() + 1 < 10 ? `0${now.month() + 1}` : `${now.month() + 1}`;
  const date = now.date() < 10 ? `0${now.date()}` : `${now.date()}`;
  const year = now.year();
  const hour = now.hour();
  const minute = now.minute();
  const second = now.second();
  const miliSecond = now.millisecond();

  return `${year}_${month}_${date}_${hour}_${minute}_${second}_${miliSecond}`;
}
