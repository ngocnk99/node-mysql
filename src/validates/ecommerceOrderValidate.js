import ValidateJoi, { noArguments } from '../utils/validateJoi';
import regexPattern from '../utils/regexPattern';
import viMessage from '../locales/vi';
import { sequelize } from '../db/db';
import { parseSortVer2 } from '../utils/helper';
const DEFAULT_SCHEMA = {
  notes: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceOrders.notes'],
    allow: ['', null]
  }),
  paymentMethodsId: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage.paymentMethodsId
  }),
  sitesId: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage.sitesId
  }),
  states: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceOrders.states']
  }),
  orderUrl: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceOrders.link']
  }),
  shippingAddress: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceOrders.shippingAddress']
  }),
  customerName: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: 'name'
  }),
  customerMobile: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: 'mobie'
  }),
  siteName: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: 'name'
  })
};

const PRODUCTS_SCHEMA = ValidateJoi.createArraySchema(
  ValidateJoi.createObjectSchema({
    productsId: ValidateJoi.createSchemaProp({
      string: noArguments,
      label: viMessage.productsId
    }),
    quantities: ValidateJoi.createSchemaProp({
      number: noArguments,
      label: viMessage['api.ecommerceOrderDetails.quantities']
    }),
    price: ValidateJoi.createSchemaProp({
      number: noArguments,
      label: viMessage['api.ecommerceOrderDetails.price']
    }),
    dealPrice: ValidateJoi.createSchemaProp({
      number: noArguments,
      label: viMessage['api.ecommerceOrderDetails.dealPrice']
    }),
    classifyName: ValidateJoi.createSchemaProp({
      string: noArguments,
      allow: [null, ''],
      label: viMessage['api.ecommerceOrderDetails.classifyName']
    })
  })
);

export default {
  authenCreate: (req, res, next) => {
    // console.log("validate authenCreate")
    const {
      states,
      /*  placesId */ notes,
      customer,
      paymentMethodsId,
      products,
      orderUrl,
      shippingAddress,
      sitesId
    } = req.body;
    const ecommerceOrder = {
      states,
      /*  placesId */ notes,
      customer,
      paymentMethodsId,
      products,
      orderUrl,
      shippingAddress,
      sitesId
    };
    const SCHEMA = Object.assign(
      ValidateJoi.assignSchema(DEFAULT_SCHEMA, {
        sitesId: {
          required: noArguments
        },
        states: {
          required: noArguments
        },
        paymentMethodsId: {
          required: noArguments
        },
        orderUrl: {
          required: noArguments
        },
        shippingAddress: {
          required: noArguments
        }
      }),
      {
        products: PRODUCTS_SCHEMA,
        customer: CUSTOMER_SCHEMA
      }
    );
    // console.log('input: ', input);
    ValidateJoi.validate(ecommerceOrder, SCHEMA)
      .then(data => {
        res.locals.body = data;
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenUpdate: (req, res, next) => {
    // console.log("validate authenUpdate")
    const {
      states,
      /*  placesId */ notes,
      customersId,
      paymentMethodsId,
      products,
      shippingAddress,
      sitesId
    } = req.body;
    const ecommerceOrder = {
      states,
      /*  placesId */ notes,
      customersId,
      paymentMethodsId,
      products,
      shippingAddress,
      sitesId
    };
    const SCHEMA = Object.assign(ValidateJoi.assignSchema(DEFAULT_SCHEMA, {}), {
      products: PRODUCTS_SCHEMA
    });
    ValidateJoi.validate(ecommerceOrder, SCHEMA)
      .then(data => {
        res.locals.body = data;
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenFilter: (req, res, next) => {
    // console.log("validate authenFilter")
    const { filter, sort, range, attributes } = req.query;
    res.locals.sort = parseSortVer2(sort, 'ecommerceOrders');
    res.locals.range = range ? JSON.parse(range) : [0, 49];
    res.locals.attributes = attributes;
    if (filter) {
      const {
        id,
        states,
        customersId,
        paymentMethodsId,
        notes,
        sitesId,
        categoriesId,
        placesId,
        siteName,
        customerName,
        customerMobile
      } = JSON.parse(filter);
      const ecommerceOrder = {
        id,
        states,
        customersId,
        paymentMethodsId,
        notes,
        sitesId,
        categoriesId,
        placesId,
        siteName,
        customerName,
        customerMobile
      };
      // console.log(ecommerceOrder)
      const SCHEMA = {
        id: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage['api.ecommerceOrders.id'],
          regex: regexPattern.listIds
        }),
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
        ...DEFAULT_SCHEMA,
        customersId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.customersId,
          regex: regexPattern.listIds
        }),
        paymentMethodsId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.paymentMethodsId,
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
      ValidateJoi.validate(ecommerceOrder, SCHEMA)
        .then(data => {
          if (id) {
            ValidateJoi.transStringToArray(data, 'id');
          }
          if (sitesId) {
            ValidateJoi.transStringToArray(data, 'sitesId');
          }
          if (customersId) {
            ValidateJoi.transStringToArray(data, 'customersId');
          }
          if (paymentMethodsId) {
            ValidateJoi.transStringToArray(data, 'paymentMethodsId');
          }
          if (placesId) {
            ValidateJoi.transStringToArray(data, 'placesId');
          }
          if (categoriesId) {
            ValidateJoi.transStringToArray(data, 'categoriesId');
          }
          res.locals.filter = data;
          // console.log('locals.filter', res.locals.filter);
          next();
        })
        .catch(error => {
          console.log(error);
          next({ ...error, message: 'Định dạng gửi đi không đúng' });
        });
    } else {
      res.locals.filter = {};
      next();
    }
  }
};
