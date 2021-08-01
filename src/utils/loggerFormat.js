// import Slack from '../services/slack/index';
import CONFIG from '../config';
const auth = require('basic-auth');
// const onFinished = require('on-finished')
// const onHeaders = require('on-headers')

/**
 * Array of CLF month names.
 * @private
 */
const Slack = 'a';
const CLF_MONTH = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/**
 * Default log buffer duration.
 * @private
 */

// const DEFAULT_BUFFER_DURATION = 1000

export default async (req, res) => {
  // this._startAt = process.hrtime()
  // const endTime = new Date();
  const ip = getip(req);
  const method = req.method;
  const url = req.originalUrl || req.url;
  const httpVersion = req.httpVersionMajor + '.' + req.httpVersionMinor;
  const status = headersSent(res) ? String(res.statusCode) : undefined;
  // const usrAgent = req.headers['user-agent'];

  /*   // record response start
  onHeaders(res, recordStartTime)

  // log when response finished
  onFinished(res, logRequest) */

  const responseTime = getResponseTimeToken(req, res);
  if (responseTime > Number(CONFIG['SLACK_TIMEOUT_MIN_WARNING'] || 1000)) {
    await Slack.sendMessage({
      channel: CONFIG['SLACK_ACCEPT_ERROR_LOGGER'],
      accessToken: CONFIG['SLACK_ACCESS_TOKEN_APP'],
      type: 'mrkdwn',
      text: `*WARNING TIMEOUT ${responseTime} ms*\n*Datetime:* ${new Date()}\n*url:* ${JSON.stringify(
        req.url,
        null,
        2
      )}\n*query:* ${JSON.stringify(req.query, null, 2)}\n*params:* ${JSON.stringify(
        req.params,
        null,
        2
      )}\n*body:* ${JSON.stringify(req.body, null, 2)}\n`
    }).catch(e => {
      throw new ErrorHandler({
        type: 'slackWebhook',
        result: e
      });
    });
  }
  const message = `${ip} ${method} ${url} HTTP/${httpVersion} ${status} ${responseTime} ms`;

  return {
    message
  };
};

/**
 * Request url.
 *
 * @param {*} req
 */
export function getUrlToken(req) {
  return req.originalUrl || req.url;
}

/**
 * Request method.
 *
 * @param {*} req
 */
export function getMethodToken(req) {
  return req.method;
}

/**
 *
 * @param {*} req
 * @param {*} res
 * @param {*} digits
 */
export function getResponseTimeToken(req, res, digits) {
  if (!req._startAt || !res._startAt) {
    // missing request and/or response start time
    return;
  }

  // calculate diff
  const ms = (res._startAt[0] - req._startAt[0]) * 1e3 + (res._startAt[1] - req._startAt[1]) * 1e-6;

  // return truncated value
  return ms.toFixed(digits === undefined ? 3 : digits);
}

/**
 * Current date.
 *
 * @param {*} req
 * @param {*} res
 * @param {*} format
 */
export function getDateToken(req, res, format) {
  const date = new Date();

  switch (format || 'web') {
    case 'clf':
      return clfdate(date);
    case 'iso':
      return date.toISOString();
    case 'web':
      return date.toUTCString();
  }
}

/**
 * Response status code.
 *
 * @param {*} req
 * @param {*} res
 */
export function getStatusToken(req, res) {
  return headersSent(res) ? String(res.statusCode) : undefined;
}

/**
 * Normalized referrer.
 *
 * @param {*} req
 */
export function getReferrerToken(req) {
  return req.headers['referer'] || req.headers['referrer'];
}

/**
 * Remote user.
 *
 * @param {*} req
 */
export function getRemoteUserToken(req) {
  // parse basic credentials
  const credentials = auth(req);

  // return username
  return credentials ? credentials.name : undefined;
}

/**
 * HTTP version.
 *
 * @param {*} req
 */
export function getHttpVersionToken(req) {
  return req.httpVersionMajor + '.' + req.httpVersionMinor;
}

/**
 * UA string.
 *
 * @param {*} req
 */
export function getUserAgentToken(req) {
  return req.headers['user-agent'];
}

/**
 * Request header.
 *
 * @param {*} req
 * @param {*} res
 * @param {*} field
 */
export function getRequestToken(req, res, field) {
  // get header
  const header = req.headers[field.toLowerCase()];

  return Array.isArray(header) ? header.join(', ') : header;
}

/**
 * Response header.
 *
 * @param {*} req
 * @param {*} res
 * @param {*} field
 */
export function getResponseHeader(req, res, field) {
  if (!headersSent(res)) {
    return undefined;
  }

  // get header
  const header = res.getHeader(field);

  return Array.isArray(header) ? header.join(', ') : header;
}

/**
 * Format a Date in the common log format.
 *
 * @private
 * @param {Date} dateTime
 * @returns {string}
 */
function clfdate(dateTime) {
  const date = dateTime.getUTCDate();
  const hour = dateTime.getUTCHours();
  const mins = dateTime.getUTCMinutes();
  const secs = dateTime.getUTCSeconds();
  const year = dateTime.getUTCFullYear();

  const month = CLF_MONTH[dateTime.getUTCMonth()];

  return pad2(date) + '/' + month + '/' + year + ':' + pad2(hour) + ':' + pad2(mins) + ':' + pad2(secs) + ' +0000';
}

/**
 * Create a basic buffering stream.
 *
 * @param {object} stream
 * @param {number} interval
 * @public
 */
export function createBufferStream(stream, interval) {
  const buf = [];
  let timer = null;

  // flush function
  // eslint-disable-next-line require-jsdoc
  function flush() {
    timer = null;
    stream.write(buf.join(''));
    buf.length = 0;
  }

  // write function
  // eslint-disable-next-line require-jsdoc
  function write(str) {
    if (timer === null) {
      timer = setTimeout(flush, interval);
    }

    buf.push(str);
  }

  // return a minimal "stream"
  return { write: write };
}

/**
 * Get request IP address.
 *
 * @private
 * @param {IncomingMessage} req
 * @returns {string}
 */
function getip(req) {
  return req.ip || req._remoteAddress || (req.connection && req.connection.remoteAddress) || undefined;
}

/**
 * Determine if the response headers have been sent.
 *
 * @param {object} res
 * @returns {boolean}
 * @private
 */
function headersSent(res) {
  return typeof res.headersSent !== 'boolean' ? Boolean(res._header) : res.headersSent;
}

/**
 * Pad number to two digits.
 *
 * @private
 * @param {number} num
 * @returns {string}
 */
function pad2(num) {
  const str = String(num);

  return (str.length === 1 ? '0' : '') + str;
}

/**
 * Record the start time.
 *
 * @private
 */
export function recordStartTime() {
  this._startAt = process.hrtime();
  this._startTime = new Date();
}
