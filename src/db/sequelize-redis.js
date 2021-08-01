import '../env';

import SequelizeRedis from 'sequelize-redis';
import redis from 'redis';
import bluebird from 'bluebird';

import { fnCachedKey } from '../utils/helper';
import CONFIG from '../config';

// Let's promisify Redis
bluebird.promisifyAll(redis.RedisClient.prototype);
bluebird.promisifyAll(redis.Multi.prototype);

let instance = null;
const ttl = Number(CONFIG.CACHED_DB_MINUTES) * 60;


/**
 *
 */
export default class MySequelizeRedis {
  /**
   *
   */
  constructor() {
    if (!this._redisClient)
      this._redisClient = redis.createClient({
        host: CONFIG.CACHED_REDIS_HOST,
        port: CONFIG.CACHED_REDIS_PORT
      });

    this.initCached();
  }

  // eslint-disable-next-line require-jsdoc
  get redisClient() {
    return this._redisClient;
  }

  // eslint-disable-next-line require-jsdoc
  set redisClient(value) {
    this._redisClient = value;
  }

  // eslint-disable-next-line require-jsdoc
  get sequelizeRedis() {
    return this._sequelizeRedis;
  }

  // eslint-disable-next-line require-jsdoc
  set sequelizeRedis(value) {
    this._sequelizeRedis = value;
  }

  /**
   *
   */
  initCached() {
    // Define your myRedis
    let redisClient = this.redisClient;

    if (!redisClient)
      redisClient = redis.createClient({
        host: CONFIG.CACHED_REDIS_HOST,
        port: CONFIG.CACHED_REDIS_PORT
      });

    // Let's start
    const sequelizeRedis = new SequelizeRedis(redisClient);

    this._sequelizeRedis = sequelizeRedis;

    return {
      sequelizeRedis
    };
  }

  /**
   *
   */
  static getInstance() {
    if (!instance && instance === null) {
      instance = new MySequelizeRedis();
    }

    return instance;
  }

  /**
   *
   * @param {*} pattern
   * @param {*} redisClient
   */
  static unlinkWithPattern(pattern, redisClient) {
    console.log('pattern', pattern);

    if (redisClient !== null) {
      redisClient.scanAsync('0', 'match', pattern, 'count', '100').then(result => {
        if (result[0] !== '0') {
          MySequelizeRedis.unlinkWithPattern(pattern, redisClient);
        }

        if (result[1].length > 0) {
          redisClient.unlinkAsync(...result[1]).then(console.log);
        }
      });
    }
  }

  /**
   *
   * @param {*} pattern
   */
  static unlinkWithoutModel(pattern) {
    console.log('pattern', pattern);

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      const instance = MySequelizeRedis.getInstance();
      const redisClient = instance.redisClient;

      if (redisClient !== null) {
        redisClient.scanAsync('0', 'match', pattern, 'count', '100').then(result => {
          if (result[0] !== '0') {
            MySequelizeRedis.unlinkWithPattern(pattern, redisClient);
          }

          if (result[1].length > 0) {
            redisClient.unlinkAsync(...result[1]).then(console.log);
          }
        });
      }
    }
  }

  /**
   *
   * @param {*} prefixKey
   * @param {*} value
   * @param {*} infoFilter
   */
  static setWithoutModel(prefixKey, value, infoFilter) {
    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      if (prefixKey && value && infoFilter) {
        const instance = MySequelizeRedis.getInstance();
        const redisClient = instance.redisClient;
        let cachedKey = `${prefixKey}_${JSON.stringify(infoFilter)}`;

        cachedKey = fnCachedKey(cachedKey);

        if(typeof value !== 'string') {
          value = JSON.stringify(value);
        }

        if (!redisClient) {
          redisClient.setAsync(cachedKey, value, 'EX', ttl).then(console.log);
        }
      }
    }
  }

  static getWithoutModel(prefixKey, infoFilter) {
    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      if (prefixKey && infoFilter) {
        const instance = MySequelizeRedis.getInstance();
        const redisClient = instance.redisClient;
        let cachedKey = `${prefixKey}_${JSON.stringify(infoFilter)}`;

        cachedKey = fnCachedKey(cachedKey);
        if (redisClient) {
          redisClient.getAsync(cachedKey, 'EX', ttl).then(console.log);
        }
      }
    }
  }
}
