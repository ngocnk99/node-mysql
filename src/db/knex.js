import config from '../config'

const knex = require('knex')({
  client: 'mssql',
  connection: {
    host: config.sql.server,
    user: config.sql.user,
    password: config.sql.password,
    database: config.sql.database
  },
  pool: { min: config.sql.pool.min, max: config.sql.pool.max },
  acquireConnectionTimeout: config.sql.connectionTimeout
});


export default knex