import './env';
import './db';
import MongoDb from './mongoDb';
import fs from 'fs-extra';
import cors from 'cors';
import path from 'path';
import helmet from 'helmet';
import morgan from 'morgan';
import express from 'express';
import favicon from 'serve-favicon';
import bodyParser from 'body-parser';

// import _rethinkDb from './db/rethinkdb';
// import r from 'rethinkdb';
// export const connectionRethinkDb = _rethinkDb.connection();
import compression from 'compression';
import routes from './routes';
import json from './middlewares/json';
import logger, { logStream } from './utils/logger';
import * as errorHandler from './middlewares/errorHandler';
// import CONFIG from './config';

// import moment from 'moment';
// import * as Sentry from '@sentry/node';
// import * as apm from 'elastic-apm-node/start';
// import morgan from './utils/morgan';

console.log('ROOT_DIR: ', process.cwd());
// Add this to the VERY top of the first file loaded in your app
/* const apm = require('elastic-apm-node').start({
  // Override service name from package.json
  // Allowed characters: a-z, A-Z, 0-9, -, _, and space
  serviceName: process.env.ELASTIC_APM_SERVICE_NAME,

  // Use if APM Server requires a token
  secretToken: process.env.ELASTIC_APM_SECRET_TOKEN,

  // Set custom APM Server URL (default: http://localhost:8200)
  serverUrl: process.env.ELASTIC_APM_SERVER_URL,
  // logger: logger
  // active: process.env.NODE_ENV === 'production'
}) */

// Initialize Sentry
// https://docs.sentry.io/platforms/node/express/
// Sentry.init({ dsn: process.env.SENTRY_DSN });

const app = express();

const APP_PORT =
  (process.env.NODE_ENV === 'test' ? process.env.TEST_APP_PORT : process.env.WEB_PORT) || process.env.PORT || '3000';
const APP_HOST = process.env.APP_HOST || '0.0.0.0';

const pathToSwaggerUi = require('swagger-ui-dist').absolutePath();

app.set('port', APP_PORT);
app.set('host', APP_HOST);
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, '/views'));
app.locals.title = process.env.WEB_NAME;
app.locals.version = process.env.APP_VERSION || '1.0.0';

// This request handler must be the first middleware on the app
// app.use(Sentry.Handlers.requestHandler());
// app.use(_rethinkDb.connectionMiddleware());
app.use(favicon(path.join(__dirname, '/../public', 'favicon.ico')));
app.use(
  cors({
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE, OPTIONS',
    allowedHeaders: [
      'Content-Type',
      'Cache-Control',
      'X-Requested-With',
      'X-Auth-Key',
      'X-Auth-Email',
      'authorization',
      'username',
      'token'
    ],
    exposedHeaders: ['Content-Range', 'X-Content-Range'],
    credentials: true,
    maxAge: 3600
  })
);

app.use(helmet());
app.use(compression());
app.use(morgan('short', { stream: logStream }));
// app.use(bodyParser.json());
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));
app.use(errorHandler.bodyParser);
app.use(json);

app.get('/zalo', (req, res) => {
  res.render('zalo');
});
// Swagger UI
// Workaround for changing the default URL in swagger.json
// https://github.com/swagger-api/swagger-ui/issues/4624
const swaggerIndexContent = fs
  .readFileSync(`${pathToSwaggerUi}/index.html`)
  .toString()
  .replace('https://petstore.swagger.io/v2/swagger.json', '/api/swagger.json');

app.get('/api-docs/index.html', (req, res) => res.send(swaggerIndexContent));
app.get('/api-docs', (req, res) => res.redirect('/api-docs/index.html'));
app.use('/api-docs', express.static(pathToSwaggerUi));

// const multer = require('multer')

/* BEGIN RICH FILE MANAGER */
// const filemanager = require("rich-filemanager-node");
// // eslint-disable-next-line import/order
// const configRichFileManager = require('./filemanager.config.json')

// app.use('/filemanager', filemanager(`${config.filemanager}`, configRichFileManager));
/* END RICH FILE MANAGER */

/* JWT authentication middleware authenticates */

app.get('/', (req, res) => {
  console.log('req path: ', req.path);
  if (req.path === '/') {
    res.send(process.env.WEB_NAME);
  }
});
/* import socialRoutes from './routes/socialRoutes'
socialRoutes(app); */

// import { mongo } from 'mongoose';

new MongoDb().init();

// API Routes
app.use('/api', routes);

// This error handler must be before any other error middleware
// app.use(Sentry.Handlers.errorHandler());

// add Elastic APM in the bottom of the middleware stack
// app.use(apm.middleware.connect())

// Error Middlewares
app.use(errorHandler.genericErrorHandler);
app.use(errorHandler.methodNotAllowed);

// if (process.env.NODE_TARGET !== 'build') {
// if (require.main === module) {
app.listen(app.get('port'), app.get('host'), () => {
  logger.info(`Server started at http://${app.get('host')}:${app.get('port')}/api`);
});
// }

// Catch unhandled rejections
process.on('unhandledRejection', err => {
  console.log('@unhandledRejection', err);
  logger.error('Unhandled rejection ', err);

  try {
    // apm.captureError(err);
    // Sentry.captureException(err);
  } catch (err) {
    logger.error('Raven error', err);
  } finally {
    // process.exit(1);
  }
});

// Catch uncaught exceptions
process.on('uncaughtException', err => {
  console.log('@uncaughtException', err);
  logger.error('Uncaught exception ', err);

  try {
    // apm.captureError(err)
    // Sentry.captureException(err);
  } catch (err) {
    logger.error('Raven error', err);
  } finally {
    // process.exit(1);
  }
});

export default app;
