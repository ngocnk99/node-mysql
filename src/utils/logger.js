import fs from 'fs';
import winston, { format } from 'winston';
const { combine, timestamp, label, printf } = format;
import CONFIG from '../config';

import 'winston-daily-rotate-file';
import moment from 'moment';

// Use LOG_DIR from env
const LOG_DIR = process.env.LOG_DIR || 'logs';
const LOG_LEVEL = process.env.LOG_LEVEL || 'debug';
const tz = 'ASIA/Ho_Chi_Minh';
const myFormat = printf(({ level, message, label, timestamp }) => {
  timestamp = moment(timestamp).tz(tz).format('YYYY-MM-DD HH:mm:ss');
  return `[${label}] ${level} ${timestamp} ${typeof message === 'object' ? JSON.stringify(message) : message } `;
});

// Create log directory if it does not exist
if (!fs.existsSync(LOG_DIR)) {
  fs.mkdirSync(LOG_DIR);
}

// Ignore log messages if they have { private: true }
const ignorePrivate = format((info/* , opts */) => {
  // console.log("info: %o \n opts: %o", info, opts)
  if (info.private) { return false; }
  if (CONFIG.LOGGING_DATA_OUTPUT === 'false')
    delete info.dataOutput;

  return info;
});

/**
 *
 */
const createTransports = () => {
  const arr = [

  ];

  if(CONFIG.LOGGING_CONSOLE !== 'false') {
    arr.push(
      new winston.transports.Console({
        format: combine(format.colorize(), ignorePrivate(), format.simple()),
        level: 'info'
      })
    );

  }

  if(CONFIG.LOGGING_FILE !== 'false') {
    arr.push(
      // new winston.transports.DailyRotateFile({
      //   format: combine(format.timestamp(), ignorePrivate(), format.json()),
      //   // maxFiles: '1d',
      //   maxSize: '3m',
      //   level: LOG_LEVEL,
      //   dirname: LOG_DIR,
      //   datePattern: 'YYYY-MM-DD',
      //   filename: '%DATE%-log.json'
      // })
      new winston.transports.DailyRotateFile({
        format: combine(
          //label({ label: '!' }),
          timestamp(),
          myFormat),
        maxFiles: '1d',
        maxSize: '3m',
        level: 'warn',
        dirname: LOG_DIR,
        datePattern: 'YYYY-MM-DD',
        filename: '%DATE%-warn-log.txt'
      }),
      new winston.transports.DailyRotateFile({
        format: combine(
          //label({ label: 'x' }),
          timestamp(),
          myFormat),
        maxFiles: '1d',
        maxSize: '3m',
        level: 'error',
        dirname: LOG_DIR,
        datePattern: 'YYYY-MM-DD',
        filename: '%DATE%-error-log.txt'
      })
    );

  }

  return arr;
}

/**
 * Create a new winston logger.
 */
const logger = winston.createLogger({
  levels: {
    error: 0,
    warn: 1,
    info: 2,
    verbose: 3,
    silly: 4,
    verify: 5,
    sync: 6,
    config: 7,
    configBackup: 8,
    configCopy: 9,
    configUndo: 10,
    configDelete: 11,
    dns: 12,
    login: 13,
    debug: 14,
  },

    transports: createTransports()
    // transports: [
    // new winston.transports.Console({
    //   format: format.combine(format.colorize(), ignorePrivate(), format.simple()),
    //   level: 'info'
    // }),
    // new winston.transports.Console({
    //   format: format.combine(format.colorize(), ignorePrivate(), format.simple()),
    //   level: 'error'
    // }),
    // new winston.transports.DailyRotateFile({
    //   format: format.combine(format.timestamp(), ignorePrivate(), format.json()),
    //   // maxFiles: '1d',
    //   maxSize: '3m',
    //   level: LOG_LEVEL,
    //   dirname: LOG_DIR,
    //   datePattern: 'YYYY-MM-DD',
    //   filename: '%DATE%-log.json'
    // })
    // ]
});

const colors = {
  verbose: 'white',
  info: 'green',
  warn: 'yellow',
  error: 'red',
  debug: 'white',
  silly: 'white',
  verify: 'brown',
  sync: 'chocolate',
  config: 'gold',
  configCopy: 'gray',
  configUndo: 'greenYellow',
  configDelete: 'indianRed',
  dns: 'lavender',
  configBackup: 'bisque',
  login: 'cadetblue'
};

winston.addColors(colors);


export const logStream = {
  /**
   * A writable stream for winston logger.
   *
   * @param {any} message
   */
  write(message) {
    logger.info(message.toString());
  }
};

export default logger;
