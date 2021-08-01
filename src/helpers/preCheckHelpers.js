import _ from 'lodash';
import models from '../entity/index';
import MODELS from '../models/models';
import * as ApiErrors from '../errors';
import viMessage from '../locales/vi';
import ErrorHelpers from './errorHelpers';

const { /* sequelize, Op, */ users,userGroups, places } = models;

const TYPE_CHECK = {
  CHECK_DUPLICATE: 1001,
  CHECK_EXISTS: 1002,
  GET_INFO: 1003
};

const GROUP_ADMINSTRATOR = 1;
const GROUP_ADMINSTRATOR_DRUG = 4;
const GROUP_ADMINSTRATOR_DRUGSTORE = 2;
const GROUP_EMPLOYEES_DRUGSTORE = 3;
const GROUP_ADMINSTRATOR_CLINIC = 5;
const GROUP_EMPLOYEES_CLINIC = 6;
const GROUP_DOCTOR_CLINIC = 7;

export { TYPE_CHECK };

/**
 *
 */
export default class PreCheckHelpers {
  /**
   *
   * @param {*} modelCallback
   * @param {*} optionsCallback
   * @param {*} condition
   * @param {*} typeCheck
   * @param {*} modelStructure
   */
  static createPromiseCheck(modelCallback, optionsCallback, condition, typeCheck, modelStructure) {
    return new Promise((resolve, reject) => {
      if (modelCallback && optionsCallback && typeCheck) {
        console.log("pass: ",condition );
        if (condition) {
          try {
            // console.log("optionsCallback: ", optionsCallback);
            modelCallback(optionsCallback)
              .then(result => {
                console.log("result createPromiseCheck modelCallback check: ", result);
                
                switch (typeCheck) {
                  case TYPE_CHECK.CHECK_DUPLICATE:
                    // console.log(result.dataValues);
                    if (result && result.dataValues) {
                      resolve({
                        result,
                        isPass: false,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    } else {
                      resolve({
                        result: null,
                        isPass: true,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    }
                    break;
                  case TYPE_CHECK.CHECK_EXISTS:
                    // console.log(result.dataValues);
                    if (result && result.dataValues) {
                      resolve({
                        result,
                        isPass: true,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    } else {
                      resolve({
                        result,
                        isPass: false,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    }
                    break;
                  default:
                    resolve({
                      result: null,
                      isPass: false,
                      infoCheck: {
                        typeCheck,
                        modelStructure
                      }
                    });
                    break;
                }
              })
              .catch(error => {
                reject(PreCheckHelpers.createErrorCheck({ typeCheck: TYPE_CHECK.GET_INFO, modelStructure }, error));
              });
          } catch (error) {
            reject(error);
          }
        } else {
          resolve({
            result: null,
            isPass: true,
            infoCheck: {
              typeCheck,
              modelStructure
            }
          });
        }
      } else {
        reject(
          new ApiErrors.BaseError({
            statusCode: 202,
            message: 'All arguments is required!'
          })
        );
      }
    });
  }

  /**
   *
   * @param {*} promise
   * @param {*} condition
   * @param {*} typeCheck
   * @param {*} modelStructure
   */
  static createPromiseCheckNew(promise, condition, typeCheck, modelStructure) {
    // console.log("createPromiseCheckNew promise=",promise);
    
    return new Promise((resolve, reject) => {

      if (promise && typeCheck) {
        if (condition) {
          try {
            // console.log(optionsCallback);

              promise.then(result => {
                console.log('result=====',result);
                switch (typeCheck) {
                  case TYPE_CHECK.CHECK_DUPLICATE:
                    // console.log(result.dataValues);
                    if (result && result.dataValues) {
                      resolve({
                        result,
                        isPass: false,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    } else {
                      resolve({
                        result: null,
                        isPass: true,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    }
                    break;
                  case TYPE_CHECK.CHECK_EXISTS:
                    // console.log(result.dataValues);
                    if (result && result.dataValues) {
                      resolve({
                        result,
                        isPass: true,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    } else {
                      resolve({
                        result,
                        isPass: false,
                        infoCheck: {
                          typeCheck,
                          modelStructure
                        }
                      });
                    }
                    break;
                  default:
                    resolve({
                      result: null,
                      isPass: false,
                      infoCheck: {
                        typeCheck,
                        modelStructure
                      }
                    });
                    break;
                }
              })
              .catch(error => {
                reject(PreCheckHelpers.createErrorCheck({ typeCheck: TYPE_CHECK.GET_INFO, modelStructure }, error));
              });
          } catch (error) {
            reject(error);
          }
        } else {
          resolve({
            result: null,
            isPass: true,
            infoCheck: {
              typeCheck,
              modelStructure
            }
          });
        }
      } else {
        reject(
          new ApiErrors.BaseError({
            statusCode: 202,
            message: 'All arguments is required!'
          })
        );
      }
    });
  }

  /**
   *
   * @param {*} infoArr
   */
  static check(infoArr) {
    // console.log("============infoArr============",infoArr)
    infoArr.forEach(e => {
      // console.log("============e.infoCheck============",e.infoCheck)

      // console.log("============e.isPass============",e.isPass)
      if (!e.isPass) throw PreCheckHelpers.createErrorCheck(e.infoCheck);
    });

    return true;
  }

  /**
   *
   * @param {*} infoCheck
   * @param {*} error
   */
  static createErrorCheckNew(infoCheck, error) {
    const { typeCheck, modelStructure } = infoCheck;
    const detail = {};
    let leftMes = '',
      midMes = '',
      rightMes = '';

    if (modelStructure) {
      midMes = PreCheckHelpers.createMidMess(modelStructure) + ' này';
    } else {
      midMes = 'Bản ghi này' + midMes;
    }

    switch (typeCheck) {
      case TYPE_CHECK.CHECK_DUPLICATE:
        detail.type = 'crudExisted';
        rightMes = ' đã tồn tại';
        break;
      case TYPE_CHECK.CHECK_EXISTS:
        detail.type = 'crudNotExisted';
        rightMes = ' không tồn tại';
        break;
      case TYPE_CHECK.GET_INFO:
        detail.type = 'getInfoError';
        leftMes = 'Lấy thông tin ';
        rightMes = ' thất bại';
        break;
      default:
        midMes = 'Không tồn tại loại check này';
        break;
    }

    detail.message = `${leftMes}${midMes}${rightMes}!`;
    console.log("detail=",detail);

    if (!error)
      return new ApiErrors.BaseError({
        statusCode: 202,
        ...detail,
        error
      });

    return ErrorHelpers.errorReject(error, detail.type, '', 202, detail.message);
  }

  /**
   *
   * @param {*} infoCheck
   * @param {*} error
   */
  static createErrorCheck(infoCheck, error) {
    console.log("START createErrorCheck");
    const { typeCheck, modelStructure } = infoCheck;
    console.log("typeCheck=======",typeCheck);
    console.log("modelStructure=======",modelStructure)
    const detail = {};
    let leftMes = '',
      midMes = '',
      rightMes = '';
  
    switch (typeCheck) {
      case TYPE_CHECK.CHECK_DUPLICATE:
        detail.type = 'crudExisted';
        // leftMes = 'Đã tồn tại ';
        rightMes = ' đã tồn tại';
        break;
      case TYPE_CHECK.CHECK_EXISTS:
        detail.type = 'crudNotExisted';
        rightMes = ' không tồn tại';
        break;
      case TYPE_CHECK.GET_INFO:
        detail.type = 'getInfoError';
        leftMes = 'Lấy thông tin ';
        rightMes = ' thất bại';
        break;
      default:
        midMes = 'Không tồn tại loại check này';
        break;
    }
  
    if (modelStructure) {
      if (modelStructure.child) {
        midMes = modelStructure.child.reduce((mess, e, i) => {
          return i === 0 ? viMessage[e] : ' và ' + viMessage[e] + mess;
        }, '');

        // midMes = ' trong ' + midMes;
        midMes = ' chứa ' + midMes + ' này';
        // ex: Quảng cáo chứa tên quảng cáo này đã tồn tại
      }
      if (modelStructure.parent) midMes = viMessage[modelStructure.parent] + midMes;
    } else {
      midMes = 'Bản ghi này' + midMes;
    }


    detail.message = `${leftMes}${midMes}${rightMes}!`;
    console.log("detail=",detail);

    if (!error)
      return new ApiErrors.BaseError({
        statusCode: 202,
        ...detail,
        error
      });

    return ErrorHelpers.errorThrow(error, detail.type, '', 202, detail.message);
  }

  /**
   *
   * @param {*} arr
   * @param {*} options
   */
  static createMidMessWithOptions(arr, options) {
    return arr.reduce((mess, e, i) => {
      if (!Array.isArray(e)) {
        return i === 0 ? viMessage[e] : mess + ` ${options.shift()} ` + viMessage['api.' + e];
      } else
        return i === 0
          ? PreCheckHelpers.createMidMessWithOptions(e, options)
          : mess + ` ${options.shift()} ` + PreCheckHelpers.createMidMessWithOptions(e, options);
    }, '');
  }

  /**
   *
   * @param {*} arr
   */
  static createMidMess(arr) {
    return arr.reduce((mess, e, i) => {
      if (!Array.isArray(e)) {
        return i === 0 ? viMessage[e] : mess + ` và ` + viMessage[e];
      } else return i === 0 ? PreCheckHelpers.createMidMess(e) : mess + ` chứa ` + PreCheckHelpers.createMidMess(e);
    }, '');
  }

  /**
   *
   * @param {*} auth
   * @param {*} placesId
   */
  static async isAuthenPlaces(auth, placesId) {
    const userInfo = await PreCheckHelpers.getInfoUser(auth).catch(error => {
      ErrorHelpers.errorThrow(error, 'permisionInfoError', 'Login', 202);
    });

    if (userInfo) {
      switch (Number(userInfo.groupUserId)) {
        case GROUP_ADMINSTRATOR:
          return true;
        case GROUP_ADMINSTRATOR_DRUG:
        case GROUP_EMPLOYEES_DRUGSTORE:
        case GROUP_EMPLOYEES_CLINIC:
        case GROUP_DOCTOR_CLINIC:
        case GROUP_ADMINSTRATOR_DRUGSTORE:
        case GROUP_ADMINSTRATOR_CLINIC:
          // eslint-disable-next-line no-case-declarations
          const placesIds = userInfo.places.map(e => Number(e.id));

          return (
            Array.from(placesIds)
              .map(Number)
              .indexOf(Number(placesId)) !== -1
          );

        default:
          throw new ApiErrors.BaseError({
            statusCode: 202,
            message: 'Bạn không có quyền đối với nội dung này'
          });
      }


    }

    return false;
  }

  /**
   *
   * @param {*} auth
   */
  static async getInfoUser(auth) {
    console.log("getInfoUser auth",auth);
    const info_User = await MODELS.findOne(users,{
      where: { id: auth.userId },
      attributes: {
        // include: [],
        exclude: ['password']
      },
      include: [
        { model: userGroups, as: 'userGroups', attributes: ['id','userGroupName'],required:true },
      ],
      logging:console.log
    });

    // console.log("info_User",info_User)

    if (!info_User) {
      ErrorHelpers.errorThrow(null, 'userNotFoundError', 'Login', 202);
    }

    return info_User;
  }

  /**
   *
   * @param {*} auth
   * @param {*} placesId
   */
  static async getAuthPlacesId(auth, placesId) {
    const userInfo = await PreCheckHelpers.getInforUser(auth);
    const placesIds = userInfo.places.map(e => Number(e.id));

    if (!placesId) return placesIds;

    let inPlacesIds = placesId;

    if (typeof placesId === 'string') inPlacesIds = placesId.split(',');

    inPlacesIds = placesId['$in'] || _.concat([], inPlacesIds).map(e => parseInt(e));
    const authPlacesId = _.intersection(placesIds, inPlacesIds);

    // console.log("placesIds:", placesIds);
    // console.log("placesId:", placesId);
    // console.log("inPlacesIds:", inPlacesIds);
    // console.log("intersection:", authPlacesId);

    return authPlacesId;
  }

  // static async getInfoPlace(auth, placesId) {

  // }

  /**
   *
   */
  static main() {
    const midMes = PreCheckHelpers.createMidMess(['adsType.name', ['adsType.name', 'adsType.name']], ['chứa', 'và']);

    console.log(midMes);
  }
}

// PreCheckHelpers.main();
