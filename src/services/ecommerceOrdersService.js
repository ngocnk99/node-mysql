// import moment from 'moment'
import Model from '../models/models';
// import placeModel from '../models/places'
import models from '../entity/index';
import _ from 'lodash';
// import errorCode from '../utils/errorCode';
import * as ApiErrors from '../errors';
import ErrorHelpers from '../helpers/errorHelpers';
import filterHelpers from '../helpers/filterHelpers';
import preCheckHelpers, { TYPE_CHECK } from '../helpers/preCheckHelpers';
import CONFIG from '../config';
import lodashHelpers from '../helpers/lodashHelpers';

const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');

const {
  ecommerceOrders,
  medCustomers,
  paymentMethods,
  ecommerceOrderDetails,
  ecommerceProducts,
  categories,
  sites
} = models;

export default {
  get_list: async param => {
    let finnalyResult;

    try {
      const { filter, range, sort /* , auth */, attributes } = param;
      let whereFilter = filter;
      const whereProducts = _.pick(whereFilter, ['categoriesId']);

      whereFilter = _.pick(whereFilter, [
        'id',
        'customersId',
        'notes',
        'paymentMethodsId',
        'shippingAddress',
        'states',
        'createDate'
      ]);
      try {
        whereFilter = filterHelpers.combineFromDateWithToDate(whereFilter);
      } catch (error) {
        throw error;
      }

      const perPage = range[1] - range[0] + 1;
      const page = Math.floor(range[0] / perPage);

      // filterHelpers.makeStringFilterRelatively(['name'], whereFilter);
      //
      //
      // if (!whereFilter) {
      //   whereFilter = { ...filter };
      // }

      const att = filterHelpers.atrributesHelper(attributes);

      const result = await Model.findAndCountAll(ecommerceOrders, {
        where: whereFilter,
        order: sort,
        offset: range[0],
        limit: perPage,
        distinct: true,
        attributes: att,
        include: [
          // { model: places, as: 'places', /* attributes: { include: ['name'] } */ },
          {
            model: ecommerceOrderDetails,
            as: 'orderDetails',
            required: true,
            include: [
              {
                model: ecommerceProducts,
                as: 'products',
                where: whereProducts,
                required: false
              }
            ]
          }
        ]
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceOrderservice');
      });

      finnalyResult = {
        ...result,
        page: page + 1,
        perPage
      };
    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceOrderservice');
    }

    return finnalyResult;
  },
  get_one: async param => {
    let finnalyResult;

    try {
      const { id /* , auth */, attributes } = param;
      const att = filterHelpers.atrributesHelper(attributes, ['usersCreatorId']);

      const whereFilter = { id: id };

      const result = await Model.findOne(ecommerceOrders, {
        where: whereFilter,
        attributes: att,
        include: [
          // { model: places, as: 'places', /* attributes: { include: ['name'] } */ },
          {
            model: ecommerceOrderDetails,
            as: 'orderDetails',
            required: true,
            include: [
              {
                model: ecommerceProducts,
                as: 'products',
                attributes: ['id', 'name']
              }
            ]
          }
        ]
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceOrderservice');
      });

      if (!result) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudNotExisted'
        });
      }

      finnalyResult = result;
    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceOrderservice');
    }

    return finnalyResult;
  },
  create: async param => {
    let finnalyResult = {};
    let token;
    let foundSite;
    let email;

    finnalyResult.token = null;

    try {
      const { entity /* , auth  */ } = param;

      console.log('entity', entity);

      console.log('customer', entity.customersId);
      await Model.create(ecommerceOrders, _.omit(param.entity, ['products']))
        .then(async ecommerceOrder => {
          finnalyResult = ecommerceOrder;
        })
        .catch(error => {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudError',
            error
          });
        });

      if (!finnalyResult) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudInfo'
        });
      }

      let entities = (param.entity && param.entity.products) || [];

      entities = entities.map(_entity => {
        return {
          ..._entity,
          ordersId: finnalyResult.id
        };
      });
      await Model.bulkCreate(ecommerceOrderDetails, entities).catch(err => {
        console.log('err', err);
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudError',
          err
        });
      });
    } catch (error) {
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceOrderservice');
    }

    return {
      result: finnalyResult
      // token
    };
  },
  update: async param => {
    let finnalyResult;

    try {
      const { id, entity } = param;

      console.log('ecommerceOrderservice update: ', entity);

      const foundecommerceOrderservice = await Model.findOne(ecommerceOrders, {
        where: {
          id: id
        }
      }).catch(error => {
        throw preCheckHelpers.createErrorCheck(
          {
            typeCheck: TYPE_CHECK.GET_INFO,
            modelStructure: { parent: 'medGroupCustomers' }
          },
          error
        );
      });

      if (foundecommerceOrderservice) {
        await Model.update(ecommerceOrders, entity, { where: { id: Number(id) } })
          .then(async () => {
            if (entity && entity.products) {
              await Model.destroy(ecommerceOrderDetails, {
                where: {
                  ordersId: Number(id)
                }
              });
              let entities = (entity && entity.products) || [];

              entities = entities.map(_entity => {
                return {
                  ..._entity,
                  ordersId: id
                };
              });
              await Model.bulkCreate(ecommerceOrderDetails, entities).catch(err => {
                throw new ApiErrors.BaseError({
                  statusCode: 202,
                  type: 'crudError',
                  err
                });
              });
            }

            if (entity.states) {
              const product = await Model.findAll(ecommerceOrderDetails, {
                where: {
                  ordersId: Number(id)
                }
              }).catch(err => {
                console.log(err);
                throw new ApiErrors.BaseError({
                  statusCode: 202,
                  type: 'listError',
                  err
                });
              });

              await Promise.all(
                product.map(async item => {
                  const productFound = await Model.findOne(ecommerceProducts, {
                    where: {
                      id: item.productsId
                    }
                  }).catch(err => {
                    console.log(err);
                    throw new ApiErrors.BaseError({
                      statusCode: 202,
                      type: 'listError',
                      err
                    });
                  });

                  await productFound.decrement('quantities', { by: item.quantities });
                  console.log(item.productsId);
                })
              );
            }
          })
          .catch(error => {
            throw new ApiErrors.BaseError({
              statusCode: 202,
              type: 'crudError',
              error
            });
          });

        finnalyResult = await Model.findOne(ecommerceOrders, { where: { Id: id } }).catch(error => {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudInfo',
            error
          });
        });

        if (!finnalyResult) {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudInfo'
          });
        }
      } else {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudNotExisted'
        });
      }
    } catch (error) {
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceOrderservice');
    }

    return { result: finnalyResult };
  }
};
