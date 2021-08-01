import { omit, join } from 'lodash';
import models from '../entity/index';
import Promise from './promise';
import * as ApiErrors from '../errors';
// import ErrorCode from './errorCode';
// import log from '../logger';

/**
 *
 * @param {*} args
 */
const log = (args) => console.log(args);

const { sequelize } = models;
const arrType = ['SELECT', 'INSERT', 'UPDATE', 'RAW', 'DELETE'];
const sequelizeType = {
  SELECT: sequelize.QueryTypes.SELECT,
  INSERT: sequelize.QueryTypes.INSERT,
  UPDATE: sequelize.QueryTypes.UPDATE,
  RAW: sequelize.QueryTypes.RAW,
  DELETE: sequelize.QueryTypes.DELETE,
}

/**
 * Class Query
 */
class Query {
  /**
   * Builds a new query instance.
   *
   * @param {String}  sql An object of key value pairs.
   * @param {Object}  options Instance construction options.
   */
  constructor(sql = '', options = {}) {
    console.log("constructor options: ", options)
    // eslint-disable-next-line no-param-reassign
    options = Object.assign({
      params: {},
      // eslint-disable-next-line dot-notation
      type: sequelizeType['SELECT']
    }, options || {});
    if (typeof options.params !== 'object') {
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'paramError'
      })
    }
    if (typeof sql !== 'string') {
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'sqlError'
      })
    }
    if (arrType.indexOf(options.type) === -1) {
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'typeSQLError'
      })
    }
    if (options.output && typeof options.output !== 'string') {
      throw new ApiErrors.BaseError({
        statusCode: 202,
        type: 'sqlError',
        name: "Query"
      })
    }
    this.output = options.output || 'p_output';
    this.params = options.params;
    this.sql = sql;
    this.type = sequelizeType[options.type];
    this._type = options.type;
    if (options.transaction) {
      this.transaction = options.transaction;
    }
    this._options = options || {};
  }

  /**
   * Query.
   */
  query() {
    return Promise.try(() => {
      const arrParamQuery = Object.keys(this.params).map(key => `$${key}`);
      const queryString = `CALL ${this.sql}(${join(arrParamQuery, ',')},@${this.output});`;
      let option = typeof this.transaction !== 'undefined' ? Object.assign({}, {
        bind: {
          ...this.params
        },
        type: this.type,
        transaction: this.transaction
      }) : Object.assign({}, {
        bind: {
          ...this.params
        },
        type: this.type,
      });

      if ('mapToModel' in this._options && this._options.model) {
        const newOption = omit(option, ['type']);

        Object.assign(newOption, {
          model: this._options.model,
          mapToModel: this._options.mapToModel
        })
        option = newOption;
      }

      log("queryString: %o \noption: %o", queryString, option)

      return sequelize.query(queryString, option).catch(error => {
        log("Query error: ", error)
        throw new ApiErrors.BaseError({
          type: 'sqlError',
          error,
          statusCode: 202,
          name: 'Query'
        })
      })
    }).tap(result => {
      log("query result length: ", result && result.length);
    }).then(result => {
      if (this._type === 'SELECT') {
        const dataResultOut = (result && result.length >= 0 && result[0]) || {};
        const resultOut = Object.values(dataResultOut);
        // log("dataResultOut: %o , resultOut: %o", dataResultOut, resultOut)
        const resultList = (result && result.length >= 1 && result[1]) || {};
        const dataResult = Object.values(resultList);

        if ('mapToModel' in this._options && this._options.model) {
          return {
            resultQuery: dataResult,
            resultOutput: resultOut.length >= 0 && Number(resultOut[0].dataValues.output)
          }
        }

        return {
          resultQuery: dataResult,
          resultOutput: resultOut.length >= 0 && Number(resultOut[0].output)
        }
      }

      return {
        resultQuery: result,
        resultOutput: result || -99
      }
    })
    /* .then(result => {
      const optionOutput = typeof this.transaction !== 'undefined' ? Object.assign({}, {
        type: sequelize.QueryTypes.SELECT,
        transaction: this.transaction
      }) : Object.assign({}, {
        type: sequelize.QueryTypes.SELECT,
      });
      // log("select output: ", `SELECT @${this.output} AS output;`)
      return sequelize.query(`SELECT @${this.output} AS output;`, optionOutput).then(resultOutput => {
        return {
          resultQuery: result,
          resultOutput
        }
      }).catch(error => {
        log("Query error: ", error)
        throw new ApiErrors.BaseError({
          type: 'sqlError',
          error,
          statusCode: 202,
          name: 'Query'
        })
      })
    }) */
    /* .catch(error => {
      log("Query error: ", error)
      // throw new Error(error.message || error)
      throw new ApiErrors.BaseError({
        type: 'sqlError',
        error,
        statusCode: 202,
        name: 'Query'
      })
    }) */
  }
}

export default Query;
