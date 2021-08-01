import rethinkdb from 'rethinkdb';
import config from '../config';
import r from 'rethinkdb';

// eslint-disable-next-line require-jsdoc
export const rethinkdbConfig = () =>{

  return {
    host: config.RETHINKDB_SERVER,
    port: config.RETHINKDB_PORT,
    db: config.RETHINKDB_DB
  }

};

/*
  export const connection = rethinkdb.connect(dbRethinkdbConfig, function (error , conn) {
    if (error ) throw error ;
    console.log("connected rethinkdb database");

    return conn;
  });
  */
export default {
  connection: async () => {
    let connect;

    await r.connect(dbRethinkdbConfig, function (err, conn){
      if (err) {
        throw err;
      }
      console.log('connnect rethinkDB');

      connect = conn;
    });

    return connect;
  },
  connectionMiddleware: () => {
    return async (req, res, next) => {

      await r.connect(dbRethinkdbConfig, function (err, conn){
        if (err) {
          throw err;
        }
        req.connectionRethinkDb = conn;
        next();
      });
    }
  }
};
