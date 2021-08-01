import ValidateJoi, { noArguments } from '../utils/validateJoi';
import regexPattern from '../utils/regexPattern';
import viMessage from '../locales/vi';
import { sequelize } from '../db/db';
import { parseSortVer2 } from '../utils/helper';
const DEFAULT_SCHEMA = {
  ordersId: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage.ordersId
  }),
  producersId: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage.producersId
  }),
  quantities: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceOrderDetails.quantities']
  }),
  price: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceOrderDetails.price']
  }),
  dealPrice: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceOrderDetails.dealPrice']
  })
};

export default {
  authenCreate: (req, res, next) => {
    // console.log("validate authenCreate")
    const usersCreatorId = req.auth.userId;

    const { ordersId, productsId, quantities, price, dealPrice } = req.body;
    const ecommerceOrderDetail = { ordersId, productsId, quantities, price, dealPrice };

    const SCHEMA = ValidateJoi.assignSchema(DEFAULT_SCHEMA, {
      productsId: {
        required: noArguments
      },
      ordersId: {
        required: noArguments
      }
    });

    // console.log('input: ', input);
    ValidateJoi.validate(ecommerceOrderDetail, SCHEMA)
      .then(data => {
        res.locals.body = data;
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenUpdate: (req, res, next) => {
    // console.log("validate authenUpdate")

    const { ordersId, productsId, quantities, price, dealPrice } = req.body;
    const ecommerceOrderDetail = { ordersId, productsId, quantities, price, dealPrice };

    const SCHEMA = ValidateJoi.assignSchema(DEFAULT_SCHEMA, {});

    ValidateJoi.validate(ecommerceOrderDetail, SCHEMA)
      .then(data => {
        res.locals.body = data;
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenFilter: (req, res, next) => {
    // console.log("validate authenFilter")
    const { filter, sort, range } = req.query;

    res.locals.sort = parseSortVer2(sort, 'ecommerceOrderDetails');
    res.locals.range = range ? JSON.parse(range) : [0, 49];

    if (filter) {
      const {
        id,
        ordersId,
        productsId,
        quantities,
        price,
        dealPrice,
        FromDate,
        ToDate,
        sitesId,
        placesId,
        categoriesId
      } = JSON.parse(filter);
      const ecommerceProduct = {
        id,
        ordersId,
        productsId,
        quantities,
        price,
        dealPrice,
        FromDate,
        ToDate,
        sitesId,
        placesId,
        categoriesId
      };

      // console.log(ecommerceProduct)
      const SCHEMA = {
        id: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage['api.ecommerceOrderDetails.id'],
          regex: regexPattern.listIds
        }),
        ...DEFAULT_SCHEMA,
        sitesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.sitesId,
          regex: regexPattern.listIds
        }),
        placesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.placesId,
          regex: regexPattern.listIds
        }),
        categoriesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.categoriesId,
          regex: regexPattern.listIds
        }),
        productsId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.productsId,
          regex: regexPattern.listIds
        }),
        ordersId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.ordersId,
          regex: regexPattern.listIds
        }),
        FromDate: ValidateJoi.createSchemaProp({
          date: noArguments,
          label: viMessage.FromDate
        }),
        ToDate: ValidateJoi.createSchemaProp({
          date: noArguments,
          label: viMessage.ToDate
        })
      };

      // console.log('input: ', input);
      ValidateJoi.validate(ecommerceProduct, SCHEMA)
        .then(data => {
          if (id) {
            ValidateJoi.transStringToArray(data, 'id');
          }
          if (productsId) {
            ValidateJoi.transStringToArray(data, 'productsId');
          }
          if (ordersId) {
            ValidateJoi.transStringToArray(data, 'ordersId');
          }
          if (placesId) {
            ValidateJoi.transStringToArray(data, 'placesId');
          }
          if (sitesId) {
            ValidateJoi.transStringToArray(data, 'sitesId');
          }
          if (categoriesId) {
            ValidateJoi.transStringToArray(data, 'categoriesId');
          }

          res.locals.filter = data;
          // console.log('locals.filter', res.locals.filter);
          next();
        })
        .catch(error => {
          next({ ...error, message: 'Định dạng gửi đi không đúng' });
        });
    } else {
      res.locals.filter = {};
      next();
    }
  }
};
