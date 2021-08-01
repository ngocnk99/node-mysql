/* eslint-disable require-jsdoc */
// import moment from 'moment'
import Model from '../models/models';
// import placeModel from '../models/places'
import models from '../entity/index';
import _, { isLength } from 'lodash';
// import errorCode from '../utils/errorCode';
import * as ApiErrors from '../errors';
import ErrorHelpers from '../helpers/errorHelpers';
import filterHelpers from '../helpers/filterHelpers';
import preCheckHelpers, { TYPE_CHECK } from '../helpers/preCheckHelpers';
import lodashHelpers from '../helpers/lodashHelpers';
import { Op } from '../db/db';
const {
  /* sequelize, Op, */ users,
  categories,
  ecommerceProducts,

} = models;

export default {
  get_list: async param => {
    let finnalyResult;

    try {
      const { filter, range, sort /* , auth */, attributes } = param;
      let whereFilter = filter;


      const filterStatus = _.pick(filter, ['status']);

      const att = filterHelpers.atrributesHelper(attributes);

      whereFilter = _.pick(whereFilter, [
        'id',
        'name',
        'usersCreatorId',
        'shortDescription',
        'description',
        'price',
        'dealPrice',
        'producersId',
        'categoriesId',
        'suppliersId',
        'status',
        'fromValue',
        'toValue',
        'languagesId',
        'field'
      ]);
      console.log({ whereFilter });
      try {
        whereFilter = filterHelpers.combineFromDateWithToDate(whereFilter);
      } catch (error) {
        throw error;
      }
      try {
        whereFilter = filterHelpers.combineFromValueWithToValue(whereFilter);
      } catch (error) {
        throw error;
      }

      const perPage = range[1] - range[0] + 1;
      const page = Math.floor(range[0] / perPage);

      whereFilter = await filterHelpers.makeStringFilterRelatively(['name', 'description'], whereFilter, 'ecommerceProducts');

      // if (!whereFilter) {
      //   whereFilter = { ...filter };
      // }

      console.log("whereFilter==",whereFilter)

      const result = await Model.findAndCountAll(ecommerceProducts, {
        where: whereFilter,
        order: sort,
        offset: range[0],
        limit: perPage,
        // distinct: true,
        // subQuery: false,
        attributes: att,
        logging: true
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceProductService');
      });

      finnalyResult = {
        ...result,
        page: page + 1,
        perPage
      };
    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceProductService');
    }

    return finnalyResult;
  },
  get_one: async param => {
    let finnalyResult;

    try {
      const { id /* , auth */, attributes } = param;

      const whereFilter = { id: id };
      const att = filterHelpers.atrributesHelper(attributes, ['usersCreatorId']);

      const result = await Model.findOne(ecommerceProducts, {
        where: whereFilter,
        attributes: att

      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceProductService');
      });

      if (!result) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'crudNotExisted'
        });
      }

      finnalyResult = result;
    } catch (err) {
      ErrorHelpers.errorThrow(err, 'getInfoError', 'ecommerceProductService');
    }

    return finnalyResult;
  },
  create: async param => {
    let finnalyResult;

    try {
      const { entity /* , auth  */ } = param;
      console.log({ entity });
      const ecommerceProductEntity = _.pick(entity, [
        'name',
        'shortDescription',
        'description',
        'images',
        'price',
        'dealPrice',
        'producersId',
        'categoriesId',
        'suppliersId',
        'usersCreatorId',
        'status',
        'quantities',
        'languagesId',
        'imagesSizeConversionTable'
      ]);

      // console.log(' create: ', ecommerceProductEntity);


      // console.log(' create: ', productsCatalogEntity);




      /*
      const catagoriesID = await Model.findAll(categories, {
        where: {
          sitesId: Number(site.sitesId)
          // status: productsCatalogEntity.status || true
        }
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceProductCollectionCatalogervice');
      });

      let arr = [];

      await catagoriesID.forEach(e => {
        arr.push(e.id);
      });

      console.log('d', arr);

      */
      const dupProducte = await Model.findOne(ecommerceProducts, {
        where: {
          name: entity.name,
          // categoriesId: { [Op.in]: arr || [] }
        }
      }).catch(err => {
        ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceProductSerivce');
      });

      if (dupProducte) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'getInfoError',
          message: 'Tên sản phẩm trong cùng website bị trùng'
        });
      }


      finnalyResult = await Model.create(ecommerceProducts, ecommerceProductEntity).catch(error => {
        console.log('error', error);
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


    } catch (error) {
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceProductService');
    }

    return { result: finnalyResult };
  },
  update: async param => {
    let finnalyResult;


    try {
      const { id, entity } = param;

      console.log('ecommerceProductService update: ', entity);

      const foundecommerceProduct = await Model.findOne(ecommerceProducts, {
        where: {
          id: id
        }
      }).catch(error => {
        throw preCheckHelpers.createErrorCheck(
          {
            typeCheck: TYPE_CHECK.GET_INFO,
            modelStructure: { parent: 'ecommerceProduct' }
          },
          error
        );
      });

      // console.log('foundecommerceProduct.categoriesId===',foundecommerceProduct.categoriesId)
      if (foundecommerceProduct) {


        const dupProduct = await Model.findOne(ecommerceProducts, {
          where: {
            name: entity.name ? entity.name : null,
          },
          logging: true,
          include: [
            {
              model: categories, as: 'categories', required: true, where: { sitesId: Number(site.sitesId) }
            }
          ]
        }).catch(err => {
          ErrorHelpers.errorThrow(err, 'getListError', 'ecommerceProductService');
        });

        if (dupProduct) {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'getInfoError',
            message: 'Tên sản phẩm trong cùng website bị trùng'
          });
        }



        await Model.update(ecommerceProducts, entity, { where: { id: Number(id) } }).catch(error => {
          throw new ApiErrors.BaseError({
            statusCode: 202,
            type: 'crudError',
            error
          });
        });

        finnalyResult = await Model.findOne(ecommerceProducts, { where: { id: id } }).catch(error => {
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
      ErrorHelpers.errorThrow(error, 'crudError', 'ecommerceProductService');
    }

    return { result: finnalyResult };
  },
  delete: async param => {
      try {
          console.log('delete id', param.id);

      await Model.destroy(ecommerceProducts,{
              where: {
                  "id": param.id
              }
          }).catch((error) => {
              throw new ApiErrors.BaseError({
                  statusCode: 202,
                  type: 'getInfoError',
                  error
              })
          });
      } catch (err) {
          ErrorHelpers.errorThrow(err, 'crudError', 'MedGroupCustomerService');
      }

      return { status: 1 };
  },
};
