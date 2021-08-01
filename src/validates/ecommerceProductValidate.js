import ValidateJoi, { noArguments } from '../utils/validateJoi';
import regexPattern from '../utils/regexPattern';
import viMessage from '../locales/vi';
import { sequelize } from '../db/db';
import { parseSortVer2 } from '../utils/helper';

const DEFAULT_SCHEMA = {
  name: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceProducts.name']
  }),
  shortDescription: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceProducts.shortDescription'],
    allow: ['', null]
  }),
  description: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceProducts.description'],
    allow: ['', null]
  }),
  images: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage['api.ecommerceProducts.images'],
    allow: ['', null]
  }),
  categoriesId: ValidateJoi.createSchemaProp({
    string: noArguments,
    label: viMessage.categoriesId
  }),
  producersId: ValidateJoi.createSchemaProp({
    number: noArguments
  }),
  suppliersId: ValidateJoi.createSchemaProp({
    number: noArguments
  }),
  usersCreatorId: ValidateJoi.createSchemaProp({
    number: noArguments
  }),
  status: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage.status
  }),
  price: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceProducts.price'],
    allow: [null]
  }),
  dealPrice: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceProducts.dealPrice'],
    allow: [null]
  }),
  quantities: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: viMessage['api.ecommerceProducts.quantities']
  }),
  imagesSizeConversionTable: ValidateJoi.createSchemaProp({
    string: noArguments
  }),
  languagesId: ValidateJoi.createSchemaProp({
    number: noArguments,
    label: 'id'
  })
};

export default {
  authenCreate: (req, res, next) => {
    // console.log("validate authenCreate")
    const usersCreatorId = 1;

    const {
      name,
      status,
      /*  placesId */ categoriesId,
      suppliersId,
      producersId,
      description,
      shortDescription,
      price,
      dealPrice,
      images,
      quantities,
      imagesSizeConversionTable,
      ecommerceProductsModelList,
      languagesId
    } = req.body;
    const ecommerceProduct = {
      name,
      status,
      usersCreatorId,
      categoriesId,
      suppliersId,
      producersId,
      description,
      shortDescription,
      price,
      dealPrice,
      images,
      quantities,
      imagesSizeConversionTable,
      ecommerceProductsModelList,
      languagesId
    };
    const SCHEMA = Object.assign(
      ValidateJoi.assignSchema(DEFAULT_SCHEMA, {
        name: {
          // regex: regexPattern.name,
          max: 100,
          min: 1,
          required: noArguments
        },
        // placesId: {
        //   required: noArguments
        // },
        usersCreatorId: {
          required: noArguments
        },
        status: {
          required: noArguments
        },
        languagesId: {
          required: noArguments
        }
      }),
      {}
    );
    // console.log('input: ', input);
    ValidateJoi.validate(ecommerceProduct, SCHEMA)
      .then(data => {
        res.locals.body = data;
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenUpdate: (req, res, next) => {
    // console.log("validate authenUpdate")

    const {
      name,
      status,
      /*  placesId */ categoriesId,
      suppliersId,
      producersId,
      description,
      shortDescription,
      price,
      dealPrice,
      images,
      quantities,
      imagesSizeConversionTable,
      ecommerceProductsModelList,
      languagesId
    } = req.body;
    const ecommerceProduct = {
      name,
      status,
      categoriesId,
      suppliersId,
      producersId,
      description,
      shortDescription,
      price,
      dealPrice,
      images,
      quantities,
      imagesSizeConversionTable,
      ecommerceProductsModelList,
      languagesId
    };

    const SCHEMA = Object.assign(
      ValidateJoi.assignSchema(DEFAULT_SCHEMA, {
        name: {
          // regex: regexPattern.name,
          max: 200
        }
      }),
      {}
    );

    ValidateJoi.validate(ecommerceProduct, SCHEMA)
      .then(data => {
        res.locals.body = data;
        console.log(JSON.stringify(data));
        next();
      })
      .catch(error => next({ ...error, message: 'Định dạng gửi đi không đúng' }));
  },
  authenFilter: (req, res, next) => {
    // console.log("validate authenFilter")
    const { filter, sort, range, attributes } = req.query;

    res.locals.sort = parseSortVer2(sort, 'ecommerceProducts');
    res.locals.range = range ? JSON.parse(range) : [0, 49];
    res.locals.attributes = attributes;
    if (filter) {
      const {
        id,
        productsCatalogsId,
        name,
        status,
        usersCreatorId,
        /* placesId, */ suppliersId,
        categoriesId,
        producersId,
        FromDate,
        ToDate,
        field,
        fromValue,
        toValue,
        sitesId,
        quantities,
        placesId,
        imagesSizeConversionTable,
        languagesId
      } = JSON.parse(filter);
      const ecommerceProduct = {
        id,
        productsCatalogsId,
        name,
        status,
        usersCreatorId,
        /* placesId, */ FromDate,
        ToDate,
        suppliersId,
        categoriesId,
        producersId,
        field,
        fromValue,
        toValue,
        sitesId,
        quantities,
        placesId,
        imagesSizeConversionTable,
        languagesId
      };

      // console.log(ecommerceProduct)
      const SCHEMA = {
        id: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage['api.ecommerceProducts.id'],
          regex: regexPattern.listIds
        }),
        ...DEFAULT_SCHEMA,

        placesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.placesId,
          regex: regexPattern.listIds
        }),
        categoriesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: 'id',
          regex: regexPattern.listIds
        }),
        producersId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: 'id',
          regex: regexPattern.listIds
        }),

        FromDate: ValidateJoi.createSchemaProp({
          date: noArguments,
          label: viMessage.FromDate
        }),
        ToDate: ValidateJoi.createSchemaProp({
          date: noArguments,
          label: viMessage.ToDate
        }),
        fromValue: ValidateJoi.createSchemaProp({
          number: noArguments,
          label: viMessage.FromDate
        }),
        toValue: ValidateJoi.createSchemaProp({
          number: noArguments,
          label: viMessage.ToDate
        }),
        field: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.field
        })
      };

      // console.log('input: ', input);
      ValidateJoi.validate(ecommerceProduct, SCHEMA)
        .then(data => {
          if (id) {
            ValidateJoi.transStringToArray(data, 'id');
          }
          if (usersCreatorId) {
            ValidateJoi.transStringToArray(data, 'usersCreatorId');
          }
          if (producersId) {
            ValidateJoi.transStringToArray(data, 'producersId');
          }
          if (suppliersId) {
            ValidateJoi.transStringToArray(data, 'suppliersId');
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
          if (languagesId) {
            ValidateJoi.transStringToArray(data, 'languagesId');
          }
          // if (categoriesId) {
          //   ValidateJoi.ProductGetByCategoriesParentToArray(data, 'categoriesId');
          // }

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
  },
  authenProducerFilter: (req, res, next) => {
    // console.log("validate authenFilter")
    const { filter, sort, range } = req.query;

    res.locals.sort = parseSortVer2(sort, 'ecommerceProducts');
    res.locals.range = range ? JSON.parse(range) : [0, 49];

    if (filter) {
      const {
        id,
        productsCatalogsId,
        name,
        sitesId,
        createDate,
        address,
        groupProducersId,
        status,
        quantities,
        placesId
      } = JSON.parse(filter);
      const ecommerceProducer = {
        id,
        productsCatalogsId,
        name,
        sitesId,
        createDate,
        address,
        groupProducersId,
        status,
        quantities,
        placesId
      };

      // console.log(ecommerceProduct)
      const SCHEMA = {
        id: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: 'id',
          regex: regexPattern.listIds
        }),

        placesId: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.placesId,
          regex: regexPattern.listIds
        }),
        createDate: ValidateJoi.createSchemaProp({
          string: noArguments,
          label: viMessage.createDate
        })
      };

      // console.log('input: ', input);
      ValidateJoi.validate(ecommerceProducer, SCHEMA)
        .then(data => {
          if (id) {
            ValidateJoi.transStringToArray(data, 'id');
          }
          if (groupProducersId) {
            ValidateJoi.transStringToArray(data, 'groupProducersId');
          }
          if (sitesId) {
            ValidateJoi.transStringToArray(data, 'sitesId');
          }
          if (placesId) {
            ValidateJoi.transStringToArray(data, 'placesId');
          }

          // if (categoriesId) {
          //   ValidateJoi.ProductGetByCategoriesParentToArray(data,'categoriesId');
          // }
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
