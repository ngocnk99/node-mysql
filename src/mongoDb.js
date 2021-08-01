import mongoose from 'mongoose';
import config from './config';

const URL_CONNECTION = config.MONGO_HOST + ':' + config.MONGO_PORT + '/' + config.MONGO_DATABASE;

/**
 *
 */
export default class MongoDb {
  /**
   *
   */
  constructor() {
    this.mongoDb = null;
  }

  /**
   *
   */
  init() {
    if (config.LOGGING_DATA_TO_MONGO === 'true') {
      mongoose.connect(URL_CONNECTION, { useNewUrlParser: true });
      this.mongoDb = mongoose.connection;

      this.mongoDb.on('error', console.error.bind(console, 'connection error:'));
      this.mongoDb.once('open', function () {
        console.log('Mongoose Connect succes on ' + URL_CONNECTION);
      });
    }

    return this.mongoDb;
  }
};
