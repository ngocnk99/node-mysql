import ecommerceProductsService from '../services/ecommerceProductsService'
import loggerHelpers from '../helpers/loggerHelpers';
import { recordStartTime } from '../utils/loggerFormat';
import errorCode from '../utils/errorCode';
import * as ApiErrors from '../errors';
import { codeMessage } from '../utils';


export default {
  get_list: (req, res, next) => {
    recordStartTime.call(req);
    console.log("locals", res.locals);
    try {
      const { sort, range, filter, attributes } = res.locals;
      const param = {
        sort,
        range,
        filter,
        auth: req.auth, attributes
      };

      ecommerceProductsService.get_list(param).then(data => {
        const dataOutput = {
          result: {
            list: data.rows,
            pagination: {
              current: data.page,
              pageSize: data.perPage,
              total: data.count
            }
          },
          success: true,
          errors: [],
          messages: []
        };

        res.header('Content-Range', `ecommerceProductss ${range}/${data.count}`);
        res.send(dataOutput);
        // write log
        recordStartTime.call(res);
        loggerHelpers.logInfor(req, res, {
          dataParam: req.params,
          dataQuery: req.query,
        });
      }).catch(error => {
        error.dataQuery = req.query;
        next(error)
      })
    } catch (error) {
      error.dataQuery = req.query;
      next(error)
    }
  },
  get_one: (req, res, next) => {
    recordStartTime.call(req);
    try {
      const { id } = req.params;
      const { attributes } = req.query;
      const param = { id, auth: req.auth, attributes }

      // console.log("ecommerceProductsService param: ", param)
      ecommerceProductsService.get_one(param).then(data => {
        res.send(data);

        recordStartTime.call(res);
        loggerHelpers.logInfor(req, res, {
          dataParam: req.params,
          dataQuery: req.query,
        });
      }).catch(error => {
        next(error)
      })
    } catch (error) {
      error.dataParams = req.params;
      next(error)
    }
  },
  create: (req, res, next) => {
    recordStartTime.call(req);
    try {
      console.log("Request-Body:", req.body);
      const entity = res.locals.body;
      const param = { entity, auth: req.auth }

      ecommerceProductsService.create(param).then(data => {

        if (data && data.result) {
          const dataOutput = {
            result: data.result,
            success: true,
            errors: [],
            messages: []
          };

          res.send(dataOutput);
          recordStartTime.call(res);
          loggerHelpers.logCreate(req, res, {
            dataQuery: req.query,
            dataOutput: data.result,
          }).catch(error => console.log(error));
        } else {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudNotExisted',
          });
        }
      }).catch(error => {
        next(error)
      })
    } catch (error) {
      next(error)
    }
  },
  update: (req, res, next) => {
    recordStartTime.call(req);
    try {
      const { id } = req.params
      const entity = res.locals.body
      // const entity = req.body
      const param = { id, entity, auth: req.auth }

      ecommerceProductsService.update(param).then(data => {
        if (data && data.result) {
          const dataOutput = {
            result: data.result,
            success: true,
            errors: [],
            messages: []
          };

          res.send(dataOutput);

          recordStartTime.call(res);
          loggerHelpers.logUpdate(req, res, {
            dataQuery: req.query,
            dataOutput: data.result,
          }).catch(error => console.log(error));
        } else {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudNotExisted',
          });
        }
      }).catch(error => {
        error.dataInput = req.body;
        error.dataParams = req.params;
        next(error)
      })
    } catch (error) {
      error.dataInput = req.body;
      error.dataParams = req.params;
      next(error)
    }
  },
  delete: (req, res, next) => {
      recordStartTime.call(req);
      try {
          const { id } = req.params;
          // const entity = { Status: 0 }
          const param = { id, auth: req.auth }

          ecommerceProductsService.delete(param).then(data => {
              if (data && data.status === 1) {
                  const dataOutput = {
                      result: null,
                      success: true,
                      errors: [],
                      messages: []
                  };

                  res.send(dataOutput);

                  recordStartTime.call(res);
                  loggerHelpers.logInfor(req, res, {});
              }
              else {
                  throw new ApiErrors.BaseError({
                      statusCode: 202,
                      type: 'deleteError',
                  });
              }
          }).catch(error => {
              error.dataParams = req.params;
              next(error)
          })
      } catch (error) {
          error.dataParams = req.params;
          next(error)
      }
  },
  get_all: (req, res, next) => {
    try {
      recordStartTime.call(req);
      const { sort, attributes, filter } = res.locals;

      try {
        // param = {
        //   sort: sort ? JSON.parse(sort) : ["id", "asc"],
        //   filter: filter ? JSON.parse(filter) : {},
        //   attributes: attributes ? JSON.parse(attributes) : null,
        //   auth: req.auth
        // };
        const param = {
          sort,
          filter,
          auth: req.auth
        };

        ecommerceProductsService.get_all(param).then(data => {
          res.send({
            result: data,
            success: true,
            errors: null,
            messages: null
          });

          recordStartTime.call(res);
          loggerHelpers.logInfor(req, res, { data });
        }).catch(err => {
          next(err)
        })
      } catch (error) {
        const { code } = errorCode.paramError;
        const statusCode = 406
        const errMsg = new Error(error).message;

        recordStartTime.call(res);
        loggerHelpers.logError(req, res, { errMsg });
        res.send({
          result: null,
          success: false,
          errors: [{ code, message: errorCode.paramError.messages[0] }],
          messages: [codeMessage[statusCode], errMsg]
        })
      }
    } catch (error) {
      next(error)
    }
  },
};
