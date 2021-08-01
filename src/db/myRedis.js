/* eslint-disable require-jsdoc */
import redis from 'redis';
import bluebird from 'bluebird';
import { fnCachedKey } from '../utils/helper';
import CONFIG from '../config';
import _ from 'lodash';

bluebird.promisifyAll(redis.RedisClient.prototype);
bluebird.promisifyAll(redis.Multi.prototype);
let instance = null;
// const ttl = Number(CONFIG.CACHED_DB_MINUTES) * 60;

export default class MyRedis {
  /**
   *
   */

  constructor() {
    if (!this._redisClient) {
      const config = {};

      config['host'] = CONFIG.CACHED_REDIS_HOST;
      config['port'] = CONFIG.CACHED_REDIS_PORT;
      config['auth_pass'] = CONFIG.REDIS_AUTH_PASS;
      config['db'] = CONFIG.REDIS_DATABASE;
      this._redisClient = redis.createClient(config);
    }

    this.initCached();
  }

  get redisClient() {
    return this._redisClient;
  }

  set redisClient(value) {
    this._redisClient = value;
  }
  /**
   *
   */
  initCached() {
    // Define your myRedis
    let redisClient = this.redisClient;

    if (!redisClient) {
      const config = {};

      config['host'] = CONFIG.CACHED_REDIS_HOST;
      config['port'] = CONFIG.CACHED_REDIS_HOST;
      config['auth_pass'] = CONFIG.REDIS_AUTH_PASS;
      config['db'] = CONFIG.REDIS_DB;
      redisClient = redis.createClient(config);
    }

    this._redisClient = redisClient;

    return {
      redisClient
    };
  }

  // eslint-disable-next-line require-jsdoc
  static getInstance() {
    if (!instance && instance === null) {
      instance = new MyRedis();
    }

    return instance;
  }

  // eslint-disable-next-line require-jsdoc
  static async setWithoutModel(prefixKey, value, infoFilter) {
    let finnalyResult;

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      if (prefixKey && value && infoFilter) {
        const instance = MyRedis.getInstance();
        const redisClient = instance.redisClient;
        let cachedKey = `${prefixKey}_${JSON.stringify(infoFilter)}`;

        cachedKey = fnCachedKey(cachedKey);

        if (typeof value !== 'string') {
          value = JSON.stringify(value);
        }

        if (redisClient) {
          // redisClient.setAsync(cachedKey, value, 'EX', ttl).then(console.log);
          await redisClient.set(cachedKey, value, function(error, result) {
            if (error) {
              throw new Error('setWithoutModel - Failed');
            }
            finnalyResult = result;
          });

          return finnalyResult;
        } else {
          throw new Error('!redisClient');
        }
      }
    }
  }

  // eslint-disable-next-line require-jsdoc
  static async getWithoutModel(prefixKey, infoFilter) {
    let finnalyResult;

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      if (prefixKey && infoFilter) {
        const instance = MyRedis.getInstance();
        const redisClient = instance.redisClient;
        let cachedKey = `${prefixKey}_${JSON.stringify(infoFilter)}`;

        cachedKey = fnCachedKey(cachedKey);
        if (redisClient) {
          finnalyResult = await redisClient.getAsync(cachedKey);
        } else {
          throw new Error('!redisClient');
        }
      }
    }

    return finnalyResult;
  }

  // eslint-disable-next-line require-jsdoc
  static async delWithoutModel(prefixKey, infoFilter) {
    let finnalyResult;

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      if (prefixKey && infoFilter) {
        const instance = MyRedis.getInstance();
        const redisClient = instance.redisClient;
        let cachedKey = `${prefixKey}_${JSON.stringify(infoFilter)}`;

        cachedKey = fnCachedKey(cachedKey);
        if (redisClient) {
          finnalyResult = await redisClient.del(cachedKey);
        } else {
          throw new Error('!redisClient');
        }
      }
    }

    return finnalyResult;
  }


  static async deleteKey(keyword) {
    let arr;

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
      const instance = MyRedis.getInstance();
      const redisClient = instance.redisClient;

      if (redisClient) {
        await redisClient.keys('*', async function(error, result) {
          if (error) {
            throw new Error(error);
          }
          if (keyword) {
            const re = new RegExp(`${keyword.toString()}`, 'i');
            console.log('result',result);
            arr = result.filter(element => element.match(re) && element.match(re).length > 0);
            console.log('1 ',arr);
          } else {
            console.log('2 ',arr);
            arr = result;
          }

          if (arr && Array.isArray(arr)) {
            await Promise.all(arr.map(element => {
              redisClient.del(element);
            }));
          }
        });
      }
    }

    return arr;
}







  static async getKeyList(keyword) {
    let finnalyResult;

    if (CONFIG.CACHED_DB_RESDIS === 'true') {
        const instance = MyRedis.getInstance();
        const redisClient = instance.redisClient;
        if (redisClient) {
          await redisClient.keys('*',function (error, result){
            if (error) {
              throw new Error(error);
            }
            if (keyword) {
              const re = new RegExp(`/${keyword}/`,'i');
              finnalyResult = result.filter(element => element.match(re) && element.match(re).length > 0);
            } else {
              finnalyResult = result;
            }
          })
        } else {
          throw new Error('!redisClient');
        }

    }

    return finnalyResult;
  }
}
