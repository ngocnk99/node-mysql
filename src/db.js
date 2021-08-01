import './env';
import Sequelize from 'sequelize'
import config from './config'

Sequelize.DATE.prototype._stringify = function _stringify(date, options) {
  return this._applyTimezone(date, options).format('YYYY-MM-DD HH:mm:ss.SSS');
};

export const { Op } = Sequelize;

const operatorsAliases = {
  $eq: Op.eq,
  $ne: Op.ne,
  $gte: Op.gte,
  $gt: Op.gt,
  $lte: Op.lte,
  $lt: Op.lt,
  $not: Op.not,
  $in: Op.in,
  $notIn: Op.notIn,
  $is: Op.is,
  $like: Op.like,
  $notLike: Op.notLike,
  $iLike: Op.iLike,
  $notILike: Op.notILike,
  $regexp: Op.regexp,
  $notRegexp: Op.notRegexp,
  $iRegexp: Op.iRegexp,
  $notIRegexp: Op.notIRegexp,
  $between: Op.between,
  $notBetween: Op.notBetween,
  $overlap: Op.overlap,
  $contains: Op.contains,
  $contained: Op.contained,
  $adjacent: Op.adjacent,
  $strictLeft: Op.strictLeft,
  $strictRight: Op.strictRight,
  $noExtendRight: Op.noExtendRight,
  $noExtendLeft: Op.noExtendLeft,
  $and: Op.and,
  $or: Op.or,
  $any: Op.any,
  $all: Op.all,
  $values: Op.values,
  $col: Op.col
};

const timezone = "+07:00";

const logging = process.env.NODE_ENV !== 'production' && process.env.LOGGING === 'true' ? console.log : false;

// if (process.env.NODE_ENV !== 'production') logging = process.env.LOGGING === 'true';

export const sequelize = new Sequelize(process.env.SQL_DATABASE, process.env.SQL_USER, process.env.SQL_PASSWORD, {
  host: process.env.SQL_SERVER,
  port: process.env.SQL_PORT,
  dialect: 'mysql',
  // dialectModule: 'require("mysql")',
  // dialectModulePath: 'mysql2',
  dialectOptions: {
    supportBigNumbers: true,
    bigNumberStrings: true,
    multipleStatements: true,
    // timezone,
    charset: 'utf8_general_ci',
    dateStrings: false,
    connectTimeout: config.sql.connectionTimeout,
    // typeCast: (field, next) => {
    //   if (field.type === 'DATETIME' || field.type === 'TIMESTAMP') {
    //     // return new Date(field.string() + 'Z');
    //     return new Date(field.string());
    //     // return field.string();
    //   }

    //   return next();
    // }
    // debug: true
  },
  pool: {
    // max: config.sql.pool.max,
    // min: config.sql.pool.min,
    // acquire: config.sql.connectionTimeout,
    // idle: config.sql.pool.idleTimeoutMillis,
    max: parseInt(config.SQL_POOL_MAX) || config.sql.pool.max,
    min: parseInt(config.SQL_POOL_MIN) || config.sql.pool.min,
    acquire: parseInt(config.SQL_POOL_CONNECTION_TIMEOUT) || config.sql.connectionTimeout,
    idle: parseInt(config.SQL_POOL_IDLE_TIMEOUT_MILLIS) || config.sql.pool.idleTimeoutMillis
  },
  define: {
    createdAt: true,
    updatedAt: true,
    underscored: true,
    freezeTableName: false,
    charset: 'utf8',
    dialectOptions: {
      multipleStatements: true,
      charset: 'utf8_general_ci'
    },
    timestamps: false,
    timezone, // for writng
  },
  timezone, // for writng
  logging,
  operatorsAliases
});

