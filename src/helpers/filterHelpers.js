/* eslint-disable require-jsdoc */
import models from '../entity/index';
import _ from 'lodash';
import * as ApiErrors from '../errors';
import ErrorHelpers from './errorHelpers';
import PreCheckHelpers from './preCheckHelpers';
import Model from '../models/models';

const { sequelize, Op, templateGroups, menus, categories } = models;

const GROUP_ADMINSTRATOR = 1;
const GROUP_ADMINSTRATOR_DRUG = 4;
const GROUP_ADMINSTRATOR_DRUGSTORE = 2;
const GROUP_EMPLOYEES_DRUGSTORE = 3;
const GROUP_ADMINSTRATOR_CLINIC = 5;
const GROUP_EMPLOYEES_CLINIC = 6;
const GROUP_DOCTOR_CLINIC = 7;

/**
 *
 * @param {*} input
 */
function getAuthPlaces(input) {
  let placesId = '0';
  let places = [];

  if (input) {
    let inputPlacesId = input.placesId && _.cloneDeep(input.placesId);
    const inputUserInfo = input.userInfo && _.cloneDeep(input.userInfo);

    const arrayPlacesIdOfUser =
      (inputUserInfo && inputUserInfo.places && inputUserInfo.places.map(e => Number(e.id))) || [];
    const arrayPlacesOfUser =
      (inputUserInfo && inputUserInfo.places && inputUserInfo.places.map(e => e.dataValues)) || [];

    let arrayAuthPlaces = [];
    let arrayAuthPlacesId = [];

    if (inputPlacesId) {

      if (typeof inputPlacesId === 'string') inputPlacesId = inputPlacesId.split(',');

      inputPlacesId = inputPlacesId['$in'] || _.concat([], inputPlacesId).map(e => parseInt(e));

      arrayAuthPlacesId = _.intersection(arrayPlacesIdOfUser, inputPlacesId);

      arrayAuthPlaces = _.intersectionBy(
        arrayPlacesOfUser.map(e => ({ ...e, id: parseInt(e.id) })),
        arrayAuthPlacesId.map(e => ({ id: e })),
        'id'
      );

      if (arrayAuthPlacesId.length > 0) {
        placesId = { $in: arrayAuthPlacesId };
        places = arrayAuthPlaces;
      } else {
        placesId = '0';
        places = [];
      }
      // else {
      //   // return whereFilter;
      //   throw new ApiErrors.BaseError({
      //     statusCode: 202,
      //     message: 'Bạn không có quyền đối với nội dung này'
      //   });
      // }

      console.log('inputPlacesId:', inputPlacesId);
      console.log('arrayPlacesIdOfUser:', arrayPlacesIdOfUser);
      console.log('arrayAuthPlacesId:', arrayAuthPlacesId);
      console.log('arrayAuthPlaces:', arrayAuthPlaces);
    } else {
      if (arrayPlacesIdOfUser.length > 0) {
        placesId = { $in: arrayPlacesIdOfUser };
        places = arrayPlacesOfUser;
      } else {
        placesId = '0';
        places = [];
      }
    }
  }

  return { placesId, places };
}

/**
 *
 * @param {*} model
 * @param {*} where
 */
// eslint-disable-next-line no-unused-vars
function createIncludeNestedWithWere(model, where) {
  if (model.length === 0) return;

  if (model.length === 1)
    return [
      {
        ...model.shift(),
        required: true,
        where
      }
    ];

  return [
    {
      ...model.shift(),
      required: true,
      include: createIncludeNestedWithWere(model, where)
    }
  ];
}

/**
 *
 * @param {*} model
 */
// eslint-disable-next-line no-unused-vars
function createIncludeNested(model) {
  if (model.length === 1)
    return [
      {
        ...model.shift()
      }
    ];

  return [
    {
      ...model.shift(),
      include: createIncludeNested(model)
    }
  ];
}
function makeArraySearch(array, arrTreeId) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      await Promise.all(array.map(async child => {
        arrTreeId.push(child.id);
        console.log("child.id====", child.id)
        if (child.parentId) {

          await makeArraySearch([{ id: child.parentId }], arrTreeId)
        }
      }));

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }
  })
}
function makeTreeArrayParentSearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      await Promise.all(array.map(async child => {
        arrTreeId.push(child.id);
        const arrayChild = [];

        if (child.menuParentId) {
          const dataListChild = await Model.findAll(model,
            {
              where: { id: child.menuParentId, ...option },
              attributes: ['id', 'menuName', 'menuParentId'],
            });


          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          // console.log("arrayChild=======",arrayChild)
          await makeTreeArrayParentSearch(arrayChild, arrTreeId, model, option)
        }
      }
      ));

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }
  })
}

function makeTreeArrayChildSearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      await Promise.all(array.map(async child => {
        arrTreeId.push(child.id);
        const arrayChild = [];

        if (child.id) {
          const dataListChild = await Model.findAll(model,
            {
              where: { menuParentId: child.id, ...option },
              attributes: ['id', 'menuName', 'menuParentId'],
            });


          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          // console.log("arrayChild=======",arrayChild)
          await makeTreeArrayChildSearch(arrayChild, arrTreeId, model, option)
        }
      }
      ));

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }
  })
}

function makeTreeParentChildrenArraySearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      //  console.log("dffffffffffffffffffffffff",array)

      await Promise.all(array.map(async child => {
        if (!_.includes(arrTreeId, child.id)) {
          arrTreeId.push(child.id);
          const arrayChild = [];

          if (child.menuParentId || Number(child.menuParentId) !== 0) {
            const data = await Model.findOne(model,
              {
                where: { id: child.menuParentId, ...option },
                attributes: ['id', 'menuName', 'menuParentId'],
              }
            );

            if (data) {

              arrayChild.push(data.dataValues)
            }
          }

          const dataListChild = await Model.findAll(model,
            {
              where: { menuParentId: child.id, ...option },
              attributes: ['id', 'menuName', 'menuParentId'],
            });

          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          await makeTreeParentChildrenArraySearch(arrayChild, arrTreeId, model, option)
        }
      })
      )

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }

  })
}
function makeTreeParentChildrenArraySearchLandType(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      //  console.log("dffffffffffffffffffffffff",array)

      await Promise.all(array.map(async child => {
          if (!_.includes(arrTreeId, child.id)) {
            arrTreeId.push(child.id);
            const arrayChild = [];
            if (child.landTypeParentId || Number(child.landTypeParentId) !== 0) {
              const data = await Model.findOne(model,
                {
                  where: { id: child.landTypeParentId, ...option },
                  attributes: ['id', 'landTypeName', 'landTypeParentId'],
                }
              );
              if (data) {

                arrayChild.push(data.dataValues)
              }
            }

            const dataListChild = await Model.findAll(model,
              {
                where: { landTypeParentId: child.id, ...option },
                attributes: ['id', 'landTypeName', 'landTypeParentId'],
              });

            // eslint-disable-next-line require-await
            dataListChild.map(async item => {
              arrayChild.push(item.dataValues)
            });

            await makeTreeParentChildrenArraySearchLandType(arrayChild, arrTreeId, model, option)
          }
        })
      )

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }

  })
}
function makeTreeParentChildrenArraySearchCoffeeLabor(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      //  console.log("dffffffffffffffffffffffff",array)

      await Promise.all(array.map(async child => {
          if (!_.includes(arrTreeId, child.id)) {
            arrTreeId.push(child.id);
            const arrayChild = [];
            if (child.coffeeLaborParentId || Number(child.coffeeLaborParentId) !== 0) {
              const data = await Model.findOne(model,
                {
                  where: { id: child.coffeeLaborParentId, ...option },
                  attributes: ['id', 'coffeeLaborName', 'coffeeLaborParentId'],
                }
              );
              if (data) {

                arrayChild.push(data.dataValues)
              }
            }

            const dataListChild = await Model.findAll(model,
              {
                where: { coffeeLaborParentId: child.id, ...option },
                attributes: ['id', 'coffeeLaborName', 'coffeeLaborParentId'],
              });

            // eslint-disable-next-line require-await
            dataListChild.map(async item => {
              arrayChild.push(item.dataValues)
            });

            await makeTreeParentChildrenArraySearchCoffeeLabor(arrayChild, arrTreeId, model, option)
          }
        })
      )

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }

  })
}

/*
  NHÓM VẬT TƯ
*/
function makeTreeArrayAgriculturalMaterialGroupsParentSearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      await Promise.all(array.map(async child => {
        arrTreeId.push(child.id);
        const arrayChild = [];

        if (child.agriculturalMaterialGroupParentsId) {
          const dataListChild = await Model.findAll(model,
            {
              where: { id: child.agriculturalMaterialGroupParentsId, ...option },
              attributes: ['id', 'agriculturalMaterialGroupName', 'agriculturalMaterialGroupParentsId'],
            });


          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          // console.log("arrayChild=======",arrayChild)
          // await makeTreeArrayAgriculturalMaterialGroupsParentSearch(arrayChild, arrTreeId, model, option)
        }
      }
      ));

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }
  })
}

function makeTreeArrayAgriculturalMaterialGroupsChildSearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      await Promise.all(array.map(async child => {
        arrTreeId.push(child.id);
        const arrayChild = [];

        if (child.id) {
          const dataListChild = await Model.findAll(model,
            {
              where: { agriculturalMaterialGroupParentsId: child.id, ...option },
              attributes: ['id', 'agriculturalMaterialGroupName', 'agriculturalMaterialGroupParentsId'],
            });


          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          // console.log("arrayChild=======",arrayChild)
          await makeTreeArrayAgriculturalMaterialGroupsChildSearch(arrayChild, arrTreeId, model, option)
        }
      }
      ));

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }
  })
}

function makeTreeParentChildrenArrayAgriculturalMaterialGroupsSearch(array, arrTreeId, model, option) {
  return new Promise(async (resolve, reject) => {
    try {
      arrTreeId = typeof arrTreeId !== 'undefined' ? arrTreeId : [];
      option = option || {}
      //  console.log("dffffffffffffffffffffffff",array)

      await Promise.all(array.map(async child => {
        if (!_.includes(arrTreeId, child.id)) {
          arrTreeId.push(child.id);
          const arrayChild = [];

          if (child.agriculturalMaterialGroupParentsId || Number(child.agriculturalMaterialGroupParentsId) !== 0) {
            const data = await Model.findOne(model,
              {
                where: { id: child.agriculturalMaterialGroupParentsId, ...option },
                attributes: ['id', 'agriculturalMaterialGroupName', 'agriculturalMaterialGroupParentsId'],
              }
            );

            if (data) {

              arrayChild.push(data.dataValues)
            }
          }

          const dataListChild = await Model.findAll(model,
            {
              where: { agriculturalMaterialGroupParentsId: child.id, ...option },
              attributes: ['id', 'agriculturalMaterialGroupName', 'agriculturalMaterialGroupParentsId'],
            });

          // eslint-disable-next-line require-await
          dataListChild.map(async item => {
            arrayChild.push(item.dataValues)
          });

          await makeTreeParentChildrenArrayAgriculturalMaterialGroupsSearch(arrayChild, arrTreeId, model, option)
        }
      })
      )

      return resolve(arrTreeId);
    }
    catch (error) {
      reject(error);
    }

  })
}

export default {
  makeOrderWithAssociated: (sort, prefix) => {
    const order = _.cloneDeep(sort).map(e => {
      if (e[0].split) {
        const listModel = e[0].split('.');
        const field = listModel.splice(listModel.length - 1, 1);

        // const normalField = ['usersCreator']
        // console.log(listModel);

        // console.log(prefix);

        if (prefix === undefined) {
          return [
            ...listModel.map(model => {
              if (model.indexOf('users') !== -1) return { model: models.users, as: model };

              return {
                model: models['med' + model.charAt(0).toUpperCase() + model.slice(1)],
                as: model.replace(/^(med)||(clinic)||(vaccination)/, '')
              };
            }),
            ...field,
            e[1]
          ];
        } else {
          return [
            ...listModel.map(model => {
              if (model.indexOf('users') !== -1) return { model: models.users, as: model };

              const name = model.replace(/^(med)||(clinic)||(vaccination)/, '');

              return {
                model: models[model],
                as: name.charAt(0).toLowerCase() + name.slice(1)
              };
            }),
            ...field,
            e[1]
          ];
        }
      }

      return e;
    });

    console.log(order);

    return order;
  },

  convert(string) {
    return string.split('').map(function (char) {
      return char.charCodeAt(0).toString(2);
    }).join(' ');
  },


  combineFromValueWithToValue: (filter, option, field) => {
    let whereFilter = _.assign({}, filter);
    option = filter['field'] || option || 'field';
    (field && field.length > 0) || (field = ['fromValue', 'toValue']);

    // console.log(field);

    if (filter[field[0]] && filter[field[1]]) {
      const fromValue = Number(filter[field[0]]);
      const toValue = Number(filter[field[1]]);

      // console.log(fromDate.toISOString());
      // console.log(toDate.toISOString());

      if (fromValue > toValue) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'getListError',
          name: 'filter value Error',
          message: 'Giá trị bắt đầu lớn hơn giá trị kết thúc'
        });
      }
      whereFilter = _.omit(filter, field);
      const fromToValueFilter = _.assign({}, { [option]: { [Op.between]: [fromValue, toValue] } });

      whereFilter = _.assign(whereFilter, fromToValueFilter);

    } else {
      if (filter[field[0]]) {
        const fromValue = Number(filter[field[0]]);

        whereFilter = _.omit(filter, [field[0]]);
        const fromToValueFilter = _.assign({}, { [option]: { [Op.gte]: fromValue } });
        // const fromtoDateFilter = _.assign({}, { [option]: { [Op.gte]: filter[field[0]] } });

        whereFilter = _.assign(whereFilter, fromToValueFilter);
      }
      if (filter[field[1]]) {
        const toValue = Number(filter[field[1]]);

        whereFilter = _.omit(filter, [field[1]]);
        const fromToValueFilter = _.assign({}, { [option]: { [Op.lte]: toValue } });
        // const fromtoDateFilter = _.assign({}, { [option]: { [Op.lte]: filter[field[1]] } });

        whereFilter = _.assign(whereFilter, fromToValueFilter);
      }
    }
    delete whereFilter['field'];
    return whereFilter;
  },

  combineFromDateWithToDate: (filter, option, field) => {
    let whereFilter = _.assign({}, filter);

    option = option || 'dateCreated';

    (field && field.length > 0) || (field = ['FromDate', 'ToDate']);

    // console.log(field);

    if (filter[field[0]] && filter[field[1]]) {
      const fromDate = new Date(filter[field[0]]);
      const toDate = new Date(filter[field[1]]);

      // console.log(fromDate.toISOString());
      // console.log(toDate.toISOString());

      if (fromDate > toDate) {
        throw new ApiErrors.BaseError({
          statusCode: 202,
          type: 'getListError',
          name: 'filter Date Error',
          message: 'Ngày bắt đầu lớn hơn ngày kết thúc'
        });
      }
      whereFilter = _.omit(filter, field);
      const fromtoDateFilter = _.assign({}, { [option]: { [Op.between]: [fromDate.toISOString(), toDate.toISOString()] } });

      whereFilter = _.assign(whereFilter, fromtoDateFilter);

      // if (filter[field[0]] > filter[field[1]]) {
      //   throw new ApiErrors.BaseError({
      //     statusCode: 202,
      //     type: 'getListError',
      //     name: 'filter Date Error',
      //     message: 'Ngày bắt đầu lớn hơn ngày kết thúc'
      //   });
      // }
      // whereFilter = _.omit(filter, field);
      // const fromtoDateFilter = _.assign({}, { [option]: { [Op.between]: [filter[field[0]], filter[field[1]]] } });

      // whereFilter = _.assign(whereFilter, fromtoDateFilter);
    } else {
      if (filter[field[0]]) {
        const fromDate = new Date(filter[field[0]]);

        whereFilter = _.omit(filter, [field[0]]);
        const fromtoDateFilter = _.assign({}, { [option]: { [Op.gte]: fromDate.toUTCString() } });
        // const fromtoDateFilter = _.assign({}, { [option]: { [Op.gte]: filter[field[0]] } });

        whereFilter = _.assign(whereFilter, fromtoDateFilter);
      }
      if (filter[field[1]]) {
        const toDate = new Date(filter[field[1]]);

        whereFilter = _.omit(filter, [field[1]]);
        const fromtoDateFilter = _.assign({}, { [option]: { [Op.lte]: toDate.toISOString() } });
        // const fromtoDateFilter = _.assign({}, { [option]: { [Op.lte]: filter[field[1]] } });

        whereFilter = _.assign(whereFilter, fromtoDateFilter);
      }
    }

    console.log(whereFilter);

    return whereFilter;
  },
  /* makeStringFilterRelatively: (keys, filter) => {
    const keysFilter = _.pick(filter, keys);

    keys.forEach(key => {
      let keyword = keysFilter[key];

      if (new RegExp(/[^A-Za-z0-9]/).test(keyword))
        keyword = keyword
          .split('')
          .map(e => (new RegExp(/[^A-Za-z0-9]/).test(e) ? '\\' + e : e))
          .join('');

      if (keysFilter[key]) {
        keysFilter[key] = { $like: sequelize.literal(`CONCAT('%','${keyword}','%')`) };
      }
    });

    filter = _.assign(filter, keysFilter);

    return filter;
  },*/
  // tim tương đối
  makeStringFilterRelatively: async (keys, filter, tableName) => {

    const keysFilter = _.pick(filter, keys);

    let filterNew = _.omit(filter, keys);

    let jsonWhere = [];

    await keys.forEach(key => {
      let keyword = keysFilter[key];

      if (new RegExp(/[^A-Za-z0-9]/).test(keyword))
        keyword = keyword
          .split('')
          .map(e => (new RegExp(/[^A-Za-z0-9]/).test(e) ? '\\' + e : e))
          .join('');
      if (keysFilter[key]) {

        // keysFilter[key] = { $like: sequelize.literal(`CONCAT('%','${keyword}','%')`) };
        if (tableName) {
          keysFilter[key] = sequelize.where(
            sequelize.fn('lower', sequelize.col(`${tableName}.${key}`)), 'LIKE',
            sequelize.literal(`CONCAT('%',CONVERT(LOWER('${keyword}') USING BINARY),'%')`)
          )
        }
        else {
          keysFilter[key] = sequelize.where(
            sequelize.fn('lower', sequelize.col(`${key}`)), 'LIKE',
            sequelize.literal(`CONCAT('%',CONVERT(LOWER('${keyword}') USING BINARY),'%')`)
          )

        }

        jsonWhere.push(keysFilter[key]);
        console.log("filterNew news=", filterNew)
      }
    });
    filterNew = { ...filterNew, ...jsonWhere };



    // filter = _.assign(filterNew, keysFilter.name);
    // filter = filterNew;
    console.log("==== filter ====", filterNew)

    return filterNew;
  },
  // tìm tuyệt đối
  makeStringFilterAbsolutely: async (keys, filter,tableName) => {

    // console.log("makeStringFilterAbsolutely filter===",filter)
    const keysFilter = _.pick(filter, keys);

    let filterNew = _.omit(filter, keys);

    let jsonWhere = [];

    // console.log("keysFilter===",keysFilter)
    // console.log("filterNew===",filterNew)
    await keys.forEach(key => {
      let keyword = keysFilter[key];

      if (new RegExp(/[^A-Za-z0-9]/).test(keyword))
        keyword = keyword
          .split('')
          .map(e => (new RegExp(/[^A-Za-z0-9]/).test(e) ? '\\' + e : e))
          .join('');
      if (keysFilter[key]) {

        // keysFilter[key] = { $like: sequelize.literal(`CONCAT('%','${keyword}','%')`) };
        keysFilter[key] = sequelize.where(
          sequelize.fn('lower', sequelize.col(`${tableName}.${key}`)),
          sequelize.literal(`CONVERT(LOWER('${keyword}') USING BINARY)`)
        )

        jsonWhere.push(keysFilter[key]);
        // console.log("filterNew news=", filterNew)
      }
    });
    filterNew = { ...filterNew, ...jsonWhere };



    // filter = _.assign(filterNew, keysFilter.name);
    // filter = filterNew;
    // console.log("==== filter chuyển doi  ====", filterNew)

    return filterNew;
  },
  createIncludeWithAuthorization: async (auth, structure, option) => {

    console.log("auth===",auth)
    const key = option || 'placesId';
    const userInfo = await PreCheckHelpers.getInfoUser(auth).catch(error => {
      ErrorHelpers.errorThrow(error, 'permisionInfoError', 'Login', 202);
    });

    if (!userInfo) {
      ErrorHelpers.errorThrow(null, 'userNotFoundError', 'Login', 202);
    }

    const { groupUserId } = userInfo;
    const placesId = userInfo.places.map(e => Number(e.id));
    console.log("placesId=====", placesId)
    switch (Number(groupUserId)) {
      case GROUP_ADMINSTRATOR:
      case GROUP_ADMINSTRATOR_DRUG:
        return structure.map(e => {
          return createIncludeNested(e)[0];
        });
      case GROUP_ADMINSTRATOR_DRUGSTORE:
      case GROUP_ADMINSTRATOR_CLINIC:
        {
          const where = placesId ? { [key]: { $in: placesId } } : {};
          
          return structure.map((e, i) => (i !== 0 ? { ...e[0] } : createIncludeNestedWithWere(e, where)[0]));
        }
      case GROUP_EMPLOYEES_DRUGSTORE:
      case GROUP_EMPLOYEES_CLINIC:
      case GROUP_DOCTOR_CLINIC:
        return structure.map((e, i) =>
          i !== 1
            ? { ...e[0] }
            : {
              ...e.shift(),
              where: {
                $or: [
                  {
                    id: auth.userId
                  },
                  {
                    parentId: auth.userId
                  }
                ]
              }
            }
        );
      default:
        throw new ApiErrors.BaseError({
          statusCode: 202,
          message: 'Bạn không có quyền đối với nội dung này'
        });
    }
  },
  createIncludeForInnerJoin: structure => {
    return structure.map(e => {
      return createIncludeNested(e)[0];
    });
  },
  getInfoAuthorization: async (auth, info, isPlaceOnly, url) => {
    /**
     * @param auth [Object] - JWT decode -> include: userId
     * @param info [Object] - include: placesId if specify, userParentId
     * @param isPlaceOnly[boolean] - true if GROUP_EMPLOYEES_DRUGSTORE and GROUP_ADMINSTRATOR_DRUG is the same acces resource
     * @return [Object] - list placesId, userParentId, placesInfomation of auth.userId
     */

    let { placesId, userParentId } = info;

   console.log("info",info);
   console.log("auth",auth);
   console.log("isPlaceOnly",isPlaceOnly);
   console.log("url",url);
    /**
     * @summary Get information of User
     */
    const userInfo = await PreCheckHelpers.getInfoUser(auth).catch(error => {
      ErrorHelpers.errorThrow(error, 'permisionInfoError', 'Login', 202);
    });

    if (!userInfo) {
      ErrorHelpers.errorThrow(null, 'userNotFoundError', 'Login', 202);
    }

    /**
     * @summary combine arguments placesId with userInfo above
     */
    const { groupUserId } = userInfo;
    const { isLienThong } = userInfo;

    const placesIds = userInfo.places.map(e => Number(e.id));

    let placesResultInfo = userInfo.places.map(e => e.dataValues);
    let placesInfo = [];
    let authPlacesId = [];
    let accessResourceAll = false;

    // if (url && url === '/api/c/medicines') {
    //   isLienThong = true;
    // }

    if (placesId) {
      // console.log(placesId);
      let inPlacesIds = _.cloneDeep(placesId);

      if (typeof placesId === 'string') inPlacesIds = placesId.split(',');

      inPlacesIds = placesId['$in'] || _.concat([], inPlacesIds).map(e => Number(e));
      authPlacesId = _.intersection(placesIds, inPlacesIds);

      placesResultInfo = _.intersectionBy(
        placesResultInfo.map(e => ({ ...e, id: Number(e.id) })),
        authPlacesId.map(e => ({ id: e })),
        'id'
      );

      // console.log("placesIds:", placesIds);
      // console.log("placesId:", placesId);
      // console.log("inPlacesIds:", inPlacesIds);
      // console.log("intersection:", authPlacesId);
    }

    /**
     * @summary if isLienThong is true then return information of places of this user for calling API duocquocgia
     */
    if (isLienThong) {
      placesInfo = placesResultInfo;
    }

    switch (Number(groupUserId)) {
      case GROUP_ADMINSTRATOR:
        // console.log("this");
        accessResourceAll = true;
        break;
      case GROUP_ADMINSTRATOR_DRUG:
        // placesInfo = placesResultInfo;
        accessResourceAll = true;
        break;
      case GROUP_EMPLOYEES_DRUGSTORE:
      // case GROUP_EMPLOYEES_CLINIC:
      // eslint-disable-next-line no-fallthrough
      case GROUP_DOCTOR_CLINIC:
        if (!isPlaceOnly) userParentId = auth.userId;

      // eslint-disable-next-line no-fallthrough
      case GROUP_EMPLOYEES_CLINIC:
        {
          accessResourceAll = false;
          // eslint-disable-next-line no-case-declarations
          if (placesId) {
            if (authPlacesId.length > 0) {
              placesId = { $in: authPlacesId };
            } else {
              placesId = '0';
            }
          } else {
            placesId = placesIds ? { $in: placesIds } : '0';
          }
        }
        break;
      case GROUP_ADMINSTRATOR_DRUGSTORE:
      case GROUP_ADMINSTRATOR_CLINIC:
        accessResourceAll = true;
        // eslint-disable-next-line no-case-declarations
        if (placesId) {
          // let inPlacesIds = placesId;
          // console.log("???")
          // if (typeof placesId === 'string') inPlacesIds = placesId.split(',');

          // inPlacesIds = placesId['$in'] || _.concat([], inPlacesIds).map(e => parseInt(e));
          // const authPlacesId = _.intersection(placesIds, inPlacesIds);

          // placesInfo = _.intersectionBy(placesInfo, authPlacesId.map(e => ({ id: e })), 'id');

          if (authPlacesId.length > 0) {
            placesId = { $in: authPlacesId };
          } else {
            placesId = '0';
          }
          // else {
          //   // return whereFilter;
          //   throw new ApiErrors.BaseError({
          //     statusCode: 202,
          //     message: 'Bạn không có quyền đối với nội dung này'
          //   });
          // }
        } else {
          placesId = placesIds ? { $in: placesIds } : '0';
        }
        // console.log("as", placesIds);

        break;

      default:
        console.log('Bạn không có quyền đối với nội dung này');
        throw new ApiErrors.BaseError({
          statusCode: 202,
          message: 'Bạn không có quyền đối với nội dung này'
        });
    }

    // console.log(placesId," ---", userParentId);
    // console.log(placesInfo);
    // console.log(placesId," ---", userParentId , "===placesInfo ",placesInfo);
    return { placesId, userParentId, placesInfo, accessResourceAll };
  },
  getInfoAccessResource: async (auth, inputInfo, isPlaceOnly) => {
    /**
     * @param auth [Object] - JWT decode -> include: userId
     * @param inputInfo [Object] - include: placesId if specify, userParentId
     * @param isPlaceOnly[boolean] - true if GROUP_EMPLOYEES_DRUGSTORE and GROUP_ADMINSTRATOR_DRUG is the same acces resource
     * @return [Object] - list placesId, userParentId, placesInfomation of auth.userId
     */

    /**
     * @summary Get information of User
     */
    const userInfo = await PreCheckHelpers.getInfoUser(auth).catch(error => {
      ErrorHelpers.errorThrow(error, 'permisionInfoError', 'Login', 202);
    });

    if (!userInfo) {
      ErrorHelpers.errorThrow(null, 'userNotFoundError', 'Login', 202);
    }

    /**
     * @summary combine arguments placesId with userInfo above
     */
    const { groupUserId, isLienThong } = userInfo;
    const authInfo = {};
    const authPlaces = getAuthPlaces({ placesId: inputInfo.placesId, userInfo });

    /**
     * @summary if isLienThong is true then return information of places of this user for calling API duocquocgia
     */
    if (isLienThong) authInfo.places = authPlaces.places;

    switch (Number(groupUserId)) {
      case GROUP_ADMINSTRATOR:
        // console.log("this");
        break;
      case GROUP_ADMINSTRATOR_DRUG:
        // placesInfo = placesResultInfo;
        break;
      case GROUP_EMPLOYEES_DRUGSTORE:
        if (!isPlaceOnly) {
          authInfo.users = { usersParentId: auth.userId, usersCreatorId: auth.userId };
        }
        authInfo.placesId = authPlaces.placesId;
        break;
      case GROUP_EMPLOYEES_CLINIC:
        if (!isPlaceOnly) {
          authInfo.users = { usersParentId: auth.userId, usersCreatorId: auth.userId, groupUserId: 7 };
        }
        authInfo.placesId = authPlaces.placesId;
        break;
      case GROUP_DOCTOR_CLINIC:
        if (!isPlaceOnly) {
          authInfo.users = { usersParentId: auth.userId, usersCreatorId: auth.userId, groupUserId: 7 };
        }
        authInfo.placesId = authPlaces.placesId;
        break;
      case GROUP_ADMINSTRATOR_DRUGSTORE:
        authInfo.placesId = authPlaces.placesId;
        break;
      case GROUP_ADMINSTRATOR_CLINIC:
        authInfo.placesId = authPlaces.placesId;
        break;
      default:
        throw new ApiErrors.BaseError({
          statusCode: 202,
          message: 'Bạn không có quyền đối với nội dung này'
        });
    }

    // console.log(placesId," ---", userParentId);
    // console.log(placesInfo);
    // console.log(JSON.stringify(authInfo))

    return { authInfo, userInfo };
  },
  createWhereWithAuthorization: async (auth, whereFilter) => {
    const { placesId } = whereFilter;

    const userInfo = await PreCheckHelpers.getInfoUser(auth).catch(error => {
      ErrorHelpers.errorThrow(error, 'permisionInfoError', 'Login', 202);
    });

    if (!userInfo) {
      ErrorHelpers.errorThrow(null, 'userNotFoundError', 'Login', 202);
    }

    const { groupUserId } = userInfo;
    const placesIds = userInfo.places.map(e => Number(e.id));

    switch (Number(groupUserId)) {
      case GROUP_ADMINSTRATOR:
      case GROUP_ADMINSTRATOR_DRUG:
        return whereFilter;
      case GROUP_EMPLOYEES_DRUGSTORE:
      case GROUP_EMPLOYEES_CLINIC:
      case GROUP_DOCTOR_CLINIC:
      // eslint-disable-next-line no-fallthrough
      case GROUP_ADMINSTRATOR_DRUGSTORE:
      case GROUP_ADMINSTRATOR_CLINIC:
        // eslint-disable-next-line no-case-declarations
        // console.log("placesId:", placesId);

        if (placesId) {
          let inPlacesIds = placesId;

          if (typeof placesId === 'string') inPlacesIds = placesId.split(',');

          inPlacesIds = placesId['$in'] || _.concat([], inPlacesIds).map(e => parseInt(e));
          const authPlacesId = _.intersection(placesIds, inPlacesIds);

          // console.log("placesIds:", placesIds);
          // console.log("placesId:", placesId);
          // console.log("inPlacesIds:", inPlacesIds);
          console.log('intersection:', authPlacesId);

          if (authPlacesId.length > 0) {
            return _.assign(whereFilter, { placesId: { $in: authPlacesId } });
          }

          // return whereFilter;
          throw new ApiErrors.BaseError({
            statusCode: 202,
            message: 'Bạn không có quyền đối với nội dung này'
          });
        }

        // eslint-disable-next-line no-case-declarations
        const wherePermision = placesIds ? { placesId: { $in: placesIds } } : {};
        // const wherePermision = placesId ? { placesId: { "$in": placesId } } : {};

        return _.assign(whereFilter, wherePermision);
      default:
        throw new ApiErrors.BaseError({
          statusCode: 202,
          message: 'Bạn không có quyền đối với nội dung này'
        });
    }
  },
  // findPlacesIdOfUsers
  paginationOfSchema: (range) => {
    const perPage = (range[1] - range[0]) + 1
    const page = Math.floor(range[0] / perPage);

    return {
      perPage,
      page
    }
  },
  /* makeArrayTemplateGroupsSearch: async (array, arrTreeId) =>{

    await makeArrayTemplateGroupsSearch(array,arrTreeId)

    return  arrTreeId;
  },
  makeArrayCategoriesSearch: async (array, arrTreeId) =>{

    await makeArrayCategoriesSearch(array,arrTreeId)

    return  arrTreeId;
  },
  makeArrayMenusSearch: async (array, arrTreeId) =>{

    await makeArrayMenusSearch(array,arrTreeId)

    return  arrTreeId;
  },*/
  makeTreeParentChildrenArraySearch: async (array, arrTreeId, model, filterStatus) => {

    await makeTreeParentChildrenArraySearch(array, arrTreeId, model, filterStatus)

    return arrTreeId;
  },

  makeTreeParentChildrenArraySearchLandType: async (array, arrTreeId, model, filterStatus) => {
    await makeTreeParentChildrenArraySearchLandType(array, arrTreeId, model, filterStatus);
    return arrTreeId;
  },
  makeTreeParentChildrenArraySearchCoffeeLabor: async (array, arrTreeId, model, filterStatus) => {
    await makeTreeParentChildrenArraySearchCoffeeLabor(array, arrTreeId, model, filterStatus);
    return arrTreeId;
  },
  makeTreeArrayChildSearch: async (array, arrTreeId, model, option) => {

    await makeTreeArrayChildSearch(array, arrTreeId, model, option)

    return arrTreeId;
  },
  makeTreeArrayParentSearch: async (array, arrTreeId, model, option) => {

    await makeTreeArrayParentSearch(array, arrTreeId, model, option)

    return arrTreeId;
  },
  makeTreeParentChildrenArrayAgriculturalMaterialGroupsSearch: async (array, arrTreeId, model, filterStatus) => {

    await makeTreeParentChildrenArrayAgriculturalMaterialGroupsSearch(array, arrTreeId, model, filterStatus)

    return arrTreeId;
  },
  makeTreeArrayAgriculturalMaterialGroupsChildSearch: async (array, arrTreeId, model, option) => {

    await makeTreeArrayAgriculturalMaterialGroupsChildSearch(array, arrTreeId, model, option)

    return arrTreeId;
  },
  makeTreeArrayAgriculturalMaterialGroupsParentSearch: async (array, arrTreeId, model, option) => {

    await makeTreeArrayAgriculturalMaterialGroupsParentSearch(array, arrTreeId, model, option)

    return arrTreeId;
  },
  atrributesHelper: (attributes, exclude) => {
    let att = [];

    if (attributes) {
      att = attributes.split(',');
      if (exclude)
        exclude.forEach(e => {
          const index = att.indexOf(e);

          if (index !== -1)
            att.splice(index, 1);
        })
      att = att.length > 0 ? att : { exclude: exclude };

      return att;
    } else {
      att = { exclude: exclude };
      return att;
    }
  }

};

export const multiFilter = () => {

}
