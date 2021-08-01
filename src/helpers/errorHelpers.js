import * as ApiErrors from '../errors';

/**
 *
 */
class ErrorHelpers {
  /**
   *
   * @param {*} err
   * @param {*} type
   * @param {*} nameError
   * @param {*} statusCode
   * @param {*} message
   */
  static errorReject(err, type, nameError, statusCode, message) {
    if (err.isApiError) return err;

    return new ApiErrors.BaseError({
      statusCode: statusCode || 200,
      type,
      error: err,
      message,
      name: nameError
    })
  }

  /**
   *
   * @param {*} err
   * @param {*} type
   * @param {*} nameError
   * @param {*} statusCode
   */
  static error(err, type, nameError, statusCode) {
    if (err.isApiError) return err;
    throw new ApiErrors.BaseError({
      statusCode: statusCode || 422,
      type,
      error: err,
      name: nameError
    })
  }

  /**
   *
   * @param {*} err
   * @param {*} type
   * @param {*} nameError
   * @param {*} statusCode
   * @param {*} message
   */
  static errorThrow(err, type, nameError, statusCode, message) {
    if (err.isApiError) throw err;
    if(message)
      throw new ApiErrors.BaseError({
        statusCode: statusCode || 422,
        type,
        error: err,
        name: nameError,
        message
      })
    throw new ApiErrors.BaseError({
      statusCode: statusCode || 422,
      type,
      error: err,
      name: nameError
    })
  }
}

export default ErrorHelpers;
