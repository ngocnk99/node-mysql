import sql from 'mssql'
import config from '../config'

const dbConfig = {
  user: config.sql.user,
  password: config.sql.password,
  server: config.sql.server,
  database: config.sql.database,
  connectionTimeout: config.sql.connectionTimeout,
  pool: {
    max: config.sql.pool.max,
    min: config.sql.pool.min,
    idleTimeoutMillis: config.sql.pool.idleTimeoutMillis
  }
};
const connection = new sql.ConnectionPool(dbConfig);

connection.connect(err => {
  if (err) {
    console.log('Failed to open a SQL Database connection.', err.stack);
  }
});

/* var dbSmsConfig = {
  user: config.sql.user,
  password: config.sql.password,
  server: config.sql.server,
  database: config.sqlSms.database,
  connectionTimeout: config.sql.connectionTimeout,
  pool: {
    max: config.sql.pool.max,
    min: config.sql.pool.min,
    idleTimeoutMillis: config.sql.pool.idleTimeoutMillis
  }
};
const connectionSms = new sql.ConnectionPool(dbSmsConfig);

connectionSms.connect(err => {
  if (err) {
    console.log('Failed to open a SQL Database connection.', err.stack);
  }
}); */

sql.on('error', err => console.log(err.stack));

export default connection