import logger from '../utils/logger';
import loggerFormat from '../utils/loggerFormat';
import config from '../config';
import moment, { months } from 'moment';
import { getIpAddress, getUserAgent } from '../utils/helper';
const tz = 'ASIA/Ho_Chi_Minh';
const TYPE = {
  CREATED: 1,
  UPDATED: 2,
  DELETED: 3,
  BLOCKDED: 4,
  APPROVED: 5,
  VIEWED: 6
};

export default {
  logInfor: (req, res, logs) => {
    const objLogger = loggerFormat(req, res);

    logger.info('Logs ', {
      ...objLogger
      // ...logs
    });
  },
  logAxiosInfo: response => {
    logger.info('Logs ', {
      ...response
    });
  },
  logInfo: (req, res, logs) => {
    const objLogger = loggerFormat(req, res);

    logger.info('Logs ', {
      ...objLogger
      // ...logs
    });
  },
  logError: (req, res, error) => {
    const objLogger = loggerFormat(req, res);

    logger.error('Error', {
      ...objLogger,
      ...error
    });
  },
  logAxiosError: error => {
    // logger.error('Error', {
    //   ...error
    // });
    logger.error('Error', error);
  },
  logUpdate: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); // moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');
      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message || '',
          type: TYPE.UPDATED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            logger.info('Logs ', {
              ...objLogger,
              ...logs,
              insertToDb: {
                success: false,
                error
              }
            });
            reject(error);
          });
      } else {
        logger.info('Logs ', {
          ...objLogger,
          ...logs,
          insertToDb: {
            success: null
          }
        });
        resolve();
      }
    }),
  logBLOCKDED: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); // moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');

      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message,
          type: TYPE.BLOCKDED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            logger.info('Logs ', {
              ...objLogger,
              ...logs,
              insertToDb: {
                success: false,
                error
              }
            });
            reject(error);
          });
      } else {
        logger.info('Logs ', {
          ...objLogger,
          ...logs,
          insertToDb: {
            success: null
          }
        });
        resolve();
      }
    }),
  logAPPROVED: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); // moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');
      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message,
          type: TYPE.APPROVED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            logger.info('Logs ', {
              ...objLogger,
              ...logs,
              insertToDb: {
                success: false,
                error
              }
            });
            reject(error);
          });
      } else {
        logger.info('Logs ', {
          ...objLogger,
          ...logs,
          insertToDb: {
            success: null
          }
        });
        resolve();
      }
    }),
  logVIEWED: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); // moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');
      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message,
          type: TYPE.VIEWED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: false,
            //     error
            //   }
            // });
            reject(error);
          });
      } else {
        logger.info('Logs ', {
          ...objLogger,
          ...logs,
          insertToDb: {
            success: null
          }
        });
        resolve();
      }
    }),
  logCreate: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); //  moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');

      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message,
          type: TYPE.CREATED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: false,
            //     error
            //   }
            // });
            reject(error);
          });
      } else {
        // logger.info('Logs ', {
        //   ...objLogger,
        //   ...logs,
        //   insertToDb: {
        //     success: null
        //   }
        // });
        resolve();
      }
    }),
  logDelete: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataReqQuery, dataReqBody, dataRes } = logs;
      const createDate = moment(); //  moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');

      const ip = getIpAddress(req);
      const userAgent = getUserAgent(req);

      if (config.LOGGING_DATA_TO_MONGO === 'true') {
        LogModel.create({
          username: (req.auth && req.auth.user) || '',
          userAgent: userAgent || '',
          ip: ip || '',
          message: objLogger.message,
          type: TYPE.DELETED,
          dataReqQuery,
          dataReqBody,
          dataRes: JSON.stringify(dataRes),
          createDate
        })
          .then(() => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: true
            //   }
            // });
            resolve();
          })
          .catch(error => {
            // logger.info('Logs ', {
            //   ...objLogger,
            //   ...logs,
            //   insertToDb: {
            //     success: false,
            //     error
            //   }
            // });
            reject(error);
          });
      } else {
        // logger.info('Logs ', {
        //   ...objLogger,
        //   ...logs,
        //   insertToDb: {
        //     success: null
        //   }
        // });
        resolve();
      }
    }),
  logTest: (req, res, logs) =>
    new Promise((resolve, reject) => {
      const objLogger = loggerFormat(req, res);
      const { /* userId, */ dataQuery } = logs;
      const createDate = moment(); // moment().tz(tz).format('YYYY-MM-DD HH:mm:ss');

      LogModel.create({
        userId: req.auth.userId,
        message: objLogger.message,
        dataQuery,
        createDate
      })
        .then(() => {
          logger.info('Logs ', {
            ...objLogger,
            ...logs,
            insertToDb: {
              succes: true
            }
          });
          resolve();
        })
        .catch(error => {
          logger.info('Logs ', {
            ...objLogger,
            ...logs,
            insertToDb: {
              succes: false,
              error
            }
          });
          reject(error);
        });
    })
};
