// import moment from 'moment'
import Model from '../models/models';
// import placeModel from '../models/places'
import models from '../entity/index'
import _ from 'lodash';
// import errorCode from '../utils/errorCode';
import * as ApiErrors from '../errors';
import ErrorHelpers from '../helpers/errorHelpers';
import filterHelpers from '../helpers/filterHelpers';
import preCheckHelpers, { TYPE_CHECK } from '../helpers/preCheckHelpers';

const { /* sequelize, Op, */ ecommerceProducts, ecommerceOrders, ecommerceOrderDetails } = models;

export default {
  get_list: async param => {
    let finnalyResult;

    try {
      const { filter, range, sort/* , auth */ } = param;
      let whereFilter = filter;

      console.log(filter);
      try {
        whereFilter = filterHelpers.combineFromDateWithToDate(whereFilter);
      } catch (error) {
        throw (error);
      }

      const perPage = (range[1] - range[0]) + 1
      const page = Math.floor(range[0] / perPage);

      // filterHelpers.makeStringFilterRelatively(['name'], whereFilter);


      if (!whereFilter) {
        whereFilter = { ...filter }
      }

      console.log('where', whereFilter);

      const result = await Model
        .findAndCountAll(ecommerceOrderDetails, {
          where: whereFilter,
          order: sort,
          offset: range[0],
          limit: perPage, distinct: true,
          logging: true,
          include: [
            { model: ecommerceOrders, as: 'orders', required: true },
            { model: ecommerceProducts, as: 'products', required: true },
          ]
        })
        .catch(err => {
          ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceOrderDetailService');
        });

      finnalyResult = {
        ...result,
        page: page + 1,
        perPage
      };

    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceOrderDetailService')
    }

    return finnalyResult;
  },
  get_one: async param => {
    let finnalyResult;

    try {
      const { id/* , auth */ } = param;

      const whereFilter = { 'id': id };

      const result = await Model.findOne(ecommerceOrderDetails, {
        where: whereFilter,
        include: [
          { model: ecommerceOrders, as: 'orders', required: true },
          { model: ecommerceProducts, as: 'products', required: true },
        ]
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceOrderDetailService')
      });

      if (!result) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudNotExisted',
        });
      }

      finnalyResult = result;

    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceOrderDetailService')
    }

    return finnalyResult;
  },
  create: async param => {
    let finnalyResult;

    try {
      const { entity/* , auth  */ } = param;

      console.log("medGroupCustomer create: ", entity)

      finnalyResult = await Model.create(ecommerceOrderDetails, param.entity).catch(error => {
        throw (new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudError',
          error,
        }));
      });

      if (!finnalyResult) {
        throw (new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudInfo',
        }));
      }

    } catch (error) {
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceOrderDetailService');
    }

    return { result: finnalyResult };
  },
  update: async param => {
    let finnalyResult;

    try {
      const { id, entity } = param;

      console.log("ecommerceOrderDetailService update: ", entity)

      const foundeCommerceOrderDetailService = await Model.findOne(ecommerceOrderDetails, {
        where: {
          "id": id
        }
      }).catch(error => { throw preCheckHelpers.createErrorCheck({ typeCheck: TYPE_CHECK.GET_INFO, modelStructure: { parent: 'medGroupCustomers' } }, error) });

      if (foundeCommerceOrderDetailService) {

        await Model.update(ecommerceOrderDetails,
          entity,
          { where: { id: Number(id) } }
        ).catch(error => {
          throw (new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudError',
            error,
          }));
        });

        finnalyResult = await Model.findOne(ecommerceOrderDetails, { where: { Id: id } }).catch(error => {
          throw (new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudInfo',
            error,
          }));
        })

        if (!finnalyResult) {
          throw (new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudInfo',
          }));
        }
      } else {
        throw (new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudNotExisted',
        }));
      }
    } catch (error) {
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceOrderDetailService');
    }

    return { result: finnalyResult };
  },

}
