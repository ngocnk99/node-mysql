import ecommerceOrderDetailService from '../services/ecommerceOrderDetailService'
import loggerHelpers from '../helpers/loggerHelpers';
import { recordStartTime } from '../utils/loggerFormat';
import errorCode from '../utils/errorCode';
import * as ApiErrors from '../errors';


export default {
  get_list: (req, res, next) => {
    recordStartTime.call(req);
    console.log("locals", res.locals);
    try {
      const { sort, range, filter } = res.locals;
      const param = {
        sort,
        range,
        filter,
        auth: req.auth
      };

      ecommerceOrderDetailService.get_list(param).then(data => {
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

        res.header('Content-Range', ` ${range}/${data.count}`);
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
      const param = { id, auth: req.auth }

      // console.log("ecommerceOrderDetailService param: ", param)
      ecommerceOrderDetailService.get_one(param).then(data => {
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

      ecommerceOrderDetailService.create(param).then(data => {

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

      ecommerceOrderDetailService.update(param).then(data => {
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

};
