import HttpStatus from 'http-status-codes';

/**
 * Build error response for validation errors.
 *
 * @param   {Error} err
 * @returns {Object}
 */
function buildError(err) {
  // Validation errors
  if (err.isJoi) {
    return {
      // code: HttpStatus.BAD_REQUEST,
      code: 202,
      message: err.message,
      result: null,
      success: false,
      details:
        err.details
    };
  }

  // HTTP errors
  if (err.isBoom) {
    return {
      code: err.output.statusCode,
      result: null,
      success: false,
      message: err.output.payload.message || err.output.payload.error
    };
  }

  // API errors
  if (err.isApiError) {
    const { statusCode, message, errors/* , stack */ } = err;

    return {
      code: statusCode || HttpStatus.BAD_REQUEST,
      message: message || HttpStatus.getStatusText(HttpStatus.BAD_REQUEST),
      result: null,
      success: false,
      errors: errors || [{ code: 1500, message /* , stack */ }],
      messages: [message]
    };
  }

  // Return INTERNAL_SERVER_ERROR for all other cases
  // console.log("errrrrrrror: ", err.code)

  return {
    code: err.code ? (isNaN(err.code) ? HttpStatus.INTERNAL_SERVER_ERROR : err.code) : HttpStatus.INTERNAL_SERVER_ERROR,
    result: null,
    success: false,
    message: err.message || HttpStatus.getStatusText(HttpStatus.INTERNAL_SERVER_ERROR)
  };
}

export default buildError;
