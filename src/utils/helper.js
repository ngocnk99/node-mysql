/* eslint-disable no-useless-escape */

import { sequelize } from '../db/sequelize';

export const regUrl = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/i;

export const regUri = /(\/|\w+:)(\/?\/?)[^\s]+/i;

export const regName = /^([a-zA-Z0-9][\-a-zA-Z0-9]*\.)+[\-a-zA-Z0-9]{2,20}$/i;

export const regPath = /^([A-Za-z]:|[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*)((\/[A-Za-z0-9_.-] +)+)$/i;

export const regAccessControlName = /^[a-zA-Z0-9]{1,100}$/i;
export const regHttpOrHttps = /^(http|https):\/\//i;
export const regHttps = /^(https):\/\//i;
export const regHttp = /^(http):\/\//i;
export const regHeaderName = /^[a-zA-Z0-9-_]{1,100}$/i;
export const regHeaderValue = /(@)(?:.*?\1)/i;

export const regDomain = /^([a-zA-Z0-9][\-a-zA-Z0-9]*\.)+[\-a-zA-Z0-9]{2,20}$/i;
import moment from 'moment';
import path from 'path';
import fs from 'fs-extra';
import _ from 'lodash';
import CONFIG from '../config';
/**
 * Test partent.
 *
 * @param {RegEx} regEx
 * @param {String} value
 */
export const regTest = (regEx, value) => {
  return regEx.test(value);
};

/**
 * Test not undefined.
 *
 * @param {String} value
 */
export const isNotUndefined = value => {
  return typeof value === 'undefined';
};

export const addHttps = (str) => {
  if (str.match(regHttpOrHttps)) {
    if (!str.match(regHttps) && str.match(regHttp)) {
      str = str.replace(regHttp,'https');
    }
  } else {
    str = 'https://'+str;
  }
  return str;
}

export const generateRandomString = (length) => {
    let result           = '';
    let characters       = 'abcdefghijklmnopqrstuvwxyz0123456789';
    let charactersLength = characters.length;

    for ( let i = 0; i < length; i++ ) {
       result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    
  return result;
}

/**
 *
 * @param {*} str
 */
export const fnCachedKey = str => {
  let str1 = str;

  str1 = str1.replace(/[àáạảãâầấậẩẫăằắặẳẵ]/g, 'a');
  str1 = str1.replace(/[èéẹẻẽêềếệểễ]/g, 'e');
  str1 = str1.replace(/[ìíịỉĩ]/g, 'i');
  str1 = str1.replace(/[òóọỏõôồốộổỗơờớợởỡ]/g, 'o');
  str1 = str1.replace(/[ùúụủũưừứựửữ]/g, 'u');
  str1 = str1.replace(/[ỳýỵỷỹ]/g, 'y');
  str1 = str1.replace(/đ/g, 'd');
  str1 = str1.replace(/[:,]/g, '_');
  str1 = str1.replace(/[!@$%^*()+=<>?\/,.:' "&#\[\]{}~]/g, '');
  // str = str.replace(/-+-/g, " ");
  // str = str.replace(/^\-+|\-+$/g, "");
  str1 = str1.replace(/_$/g, '');

  return str1;
};

/**
 * @param {string} name */
export const chatbotBlockIntent = name => {
  let _name = name || '';

  _name = _name.toLowerCase().trim();
  _name = _name.replace(/[àáạảãâầấậẩẫăằắặẳẵ]/g, 'a');
  _name = _name.replace(/[èéẹẻẽêềếệểễ]/g, 'e');
  _name = _name.replace(/[ìíịỉĩ]/g, 'i');
  _name = _name.replace(/[òóọỏõôồốộổỗơờớợởỡ]/g, 'o');
  _name = _name.replace(/[ùúụủũưừứựửữ]/g, 'u');
  _name = _name.replace(/[ỳýỵỷỹ]/g, 'y');
  _name = _name.replace(/đ/g, 'd');
  _name = _name.replace(/[:,]/g, '');
  _name = _name.replace(/[!@$%^*()+=<>?\/,.:' "&#\[\]{}~]/g, '');

  return _name;
};
/**
 *
 * @param {*} array
 * @param {*} key
 */
export const groupBy = (array, key) => {
  // Return the end result
  return array.reduce((result, currentValue) => {
    // If an array already present for key, push it to the array. Else create an array and push the object
    (result[currentValue[key]] = result[currentValue[key]] || []).push(currentValue);
    // Return the current iteration `result` value, this will be taken as next iteration `result` value and accumulate

    return result;
  }, {}); // empty object is the initial value for result object
};

/**
 *
 * @param {*} workbook
 * @param {*} param1
 */
export const createTemplate = (workbook, { startRow, headerKey, headerTitle, place, reportName, param }) => {
  const worksheet = workbook.addWorksheet('Report', {
    pageSetup: { paperSize: 9, orientation: 'landscape', printTitlesRow: `${startRow}:${startRow}` ,fitToPage: true},
    views: [{ showGridLines: false, alignment: { wrapText: true, vertical: 'middle', horizontal: 'center' } }]
  });

  // adjust pageSetup settings afterwards
  worksheet.pageSetup.margins = {
    left: 0.7, right: 0.7,
    top: 0.75, bottom: 0.75,
    header: 0.3, footer: 0.3
  };

  const font = { name: 'Times New Roman', size: 11, bold: true, color: { argb: '000000' } };
  const alignment = { vertical: 'middle', horizontal: 'center' };

  worksheet.getRow(startRow).values = headerTitle;
  worksheet.getRow(startRow).height = 35;
  worksheet.getRow(startRow).eachCell({ includeEmpty: true }, function(cell) {
    cell.font = font;
    cell.alignment = { ...alignment, wrapText: true };
    cell.border = {
      top: { style: 'thin' },
      left: { style: 'thin' },
      bottom: { style: 'thin' },
      right: { style: 'thin' }
    };
  });
  worksheet.headerFooter.oddHeader = `&L${place.dataValues.name}&CMST/SĐT: ${place.dataValues.mobile}/${place.dataValues.taxCode}`;
  worksheet.headerFooter.oddFooter = `&C${CONFIG.REPORT_FOOTER}&R&P`;
  worksheet.mergeCells(`A2:${param.lastCol}2`);
  const titleCell = worksheet.getCell(`A2`);

  titleCell.value = reportName;
  titleCell.font = { name: 'Times New Roman', size: 18, bold: true, color: { argb: '000000' } };
  titleCell.alignment = alignment;
  worksheet.getRow(2).height = 40;
  if (param.filter.FromDate && param.filter.ToDate) {
    worksheet.mergeCells(`A4:${param.lastCol}4`);
    const filterDateCell = worksheet.getCell(`A4`);

    filterDateCell.value = `Từ ngày ${param.filter.FromDate} - Đến ngày ${param.filter.ToDate}`;
    filterDateCell.font = font;
    filterDateCell.alignment = alignment;
  }
  worksheet.mergeCells(`B5:F5`);
  const reportDateCell = worksheet.getCell(`B5`);

  reportDateCell.value = `Ngày xuất báo cáo: ${moment().format('YYYY-MM-DD')}`;
  reportDateCell.font = font;
  worksheet.columns = headerKey;

  return worksheet;
};
/**
 *
 * @param {*} workbook
 * @param {*} param1
 */
export const createExportTemplate = (workbook, { startRow, headerKey, headerTitle, place, reportName, param }) => {
  const worksheet = workbook.addWorksheet('Report', {
    pageSetup: { paperSize: 9, orientation: 'landscape', printTitlesRow: `${startRow}:${startRow}` },
    views: [{ showGridLines: false, alignment: { wrapText: true, vertical: 'middle', horizontal: 'center' } }]
  });
  const font = { name: 'Times New Roman', size: 12, bold: true, color: { argb: '000000' } };
  const alignment = { vertical: 'middle', horizontal: 'center' };

  worksheet.headerFooter.oddHeader = `&LTên nhà thuốc: ${place.dataValues.name}&CMST/SĐT: ${place.dataValues.mobile}/${place.dataValues.taxCode}&RMẫu B02 - NT`;
  worksheet.headerFooter.oddFooter = `&C${'nhathuocgpp.com.vn'}&R&P`;
  worksheet.mergeCells(`A2:${param.lastCol}2`);
  const titleCell = worksheet.getCell(`A2`);

  titleCell.value = reportName;
  titleCell.font = { name: 'Times New Roman', size: 18, bold: true, color: { argb: '000000' } };
  titleCell.alignment = alignment;
  worksheet.getRow(2).height = 40;
  if (param.filter.FromDate && param.filter.ToDate) {
    worksheet.mergeCells(`A4:${param.lastCol}4`);
    const filterDateCell = worksheet.getCell(`A4`);

    filterDateCell.value = `Từ ngày ${param.filter.FromDate} - Đến ngày ${param.filter.ToDate}`;
    filterDateCell.font = font;
    filterDateCell.alignment = alignment;
  }
  worksheet.mergeCells(`B5:F5`);
  const reportDateCell = worksheet.getCell(`B5`);

  reportDateCell.value = `Ngày xuất báo cáo: ${moment().format('YYYY-MM-DD')}`;
  reportDateCell.font = font;
  worksheet.columns = headerKey;

  worksheet.getRow(startRow).values = headerTitle;
  worksheet.getRow(startRow).height = 30;
  worksheet.getRow(startRow).eachCell({ includeEmpty: true }, function(cell) {
    cell.font = font;
    cell.alignment = { ...alignment, wrapText: true };
    cell.border = {
      top: { style: 'thin' },
      left: { style: 'thin' },
      bottom: { style: 'thin' },
      right: { style: 'thin' }
    };
  });

  return worksheet;
};

const ROOT_DIR = process.cwd();
const ROOT_DIR_CONTAINER = `${ROOT_DIR}/container`;
/**
 *
 * @param {*} req
 * @param {*} res
 * @param {*} callback
 */

export const uploadFileExcelFunc = (req, res, callback) => {
  let multer = require('multer');
  let storage = multer.diskStorage({
    //multers disk storage settings
    destination: function(req, file, cb) {
      const dir = path.resolve(`${ROOT_DIR_CONTAINER}/uploads`);

      fs.ensureDir(dir)
        .then(() => {
          // console.log('success!')
          cb(null, dir);
        })
        .catch(err => {
          console.log('upload err ', err);

          cb(err);
        });

      // cb(null, dir);
      // cb(null, 'uploads/')
    },
    filename: function(req, file, cb) {
      let datetimestamp = Date.now();

      cb(
        null,
        file.fieldname +
          '-' +
          datetimestamp +
          '.' +
          file.originalname.split('.')[file.originalname.split('.').length - 1]
      );
    }
  });
  let upload = multer({
    //multer settings
    storage: storage,
    fileFilter: function(req, file, cb) {
      //file filter
      if (['xls', 'xlsx'].indexOf(file.originalname.split('.')[file.originalname.split('.').length - 1]) === -1) {
        return cb('Wrong extension type', false);
      }
      cb(null, true);
    }
  }).single('file');

  return upload(req, res, function(err) {
    // console.log(err);
    // console.log(req.file);
    if (err || !(req.file && req.file.originalname)) {
      res.json({ error_code: 1, err_desc: err });
      return;
    }
    const { file } = req;
    const filePath = path.resolve(file.path).replace(/\\/g, '/');
    // return callback(filePath)
    console.log(req.file.path);

    return callback(req.file.path);
  });
};
export const fnReplaceSpecialChar = str => {
  str = _.replace(str, /'/g, "\\'");
  str = _.replace(str, /"/g, '\\"');
  str = _.replace(str, /[\r\n]/g, '');
  str = _.trim(str);

  return str;
};

export const parseFilter = (filter) => {
  filter = (typeof filter === 'string') ? JSON.parse(filter) : filter;
  return filter.map((i) => sequelize.literal(`\`${i}\``));
};

export const getIpAddress = (req) =>{
  let ip = req.headers['x-forwarded-for'] ||
  req.connection.remoteAddress ||
  req.socket.remoteAddress ||
  req.connection.socket.remoteAddress;
  console.log("ip====",ip);

  // ip = ip.split(',')[0];

  // ip = ip.split(':').slice(-1); //in case the ip returned in a format: "::ffff:146.xxx.xxx.xxx"

  return ip;
}
export const getUserAgent= (req) =>{
  console.log("req====",JSON.stringify(req.headers));
  let userAgent = req.headers['User-Agent'] || req.headers['user-agent'] || '' ;
  console.log("userAgent====",userAgent);
  return userAgent;
};
// eslint-disable-next-line require-jsdoc
export const parseSort = (sort) => {
  let isPass = true;
  const defaultValue = [['id','asc']];
  const regexSort = /(asc|desc|ASC|DESC)/g;

  try {
    // sort = (typeof sort === 'string') ? JSON.parse(sort).map((e, i) => i % 2 === 0 ? sequelize.literal(`\`${e}\` COLLATE utf8_unicode_ci`) : e) : defaultValue;
    sort = (typeof sort === 'string') ? JSON.parse(sort).map((e, i) => i % 2 === 0 ? sequelize.literal(`\`${e}\``) : e) : defaultValue;
    console.log("sort===",sort)
    if (sort.length % 2 === 0) {
      sort = _.chunk(sort,2) || defaultValue;
      sort.map(element => {
        if (!element[1].match(regexSort)) {
          isPass = false;
        }
      });
    } else {
      isPass = false;
    }
    if (isPass) {
      return sort;
    } else {
      return defaultValue
    }
  } catch (e) {
    return defaultValue
  }
};
export const parseSortVer2 = (sort,table) => {
  let isPass = true;
  const defaultValue = [['id','asc']];
  const regexSort = /(asc|desc|ASC|DESC)/g;
  // console.log("table===",table)
  
  try {
    // console.log("sort12====***===",sort)
     sort = (typeof sort === 'string') ? JSON.parse(sort).map(
                  (e, i) => 
                     i % 2 === 0 ?  (e.includes('.') ?  ((e.includes('.status')|| e.includes('.createDate') || e.includes('.dateScheduled') || e.includes('.price') || e.includes('.dateCreate') || e.includes('.dealPrice')) ? sequelize.literal(`\`${e}\``):sequelize.literal(`\`${e}\` COLLATE utf8_unicode_ci`)): (e.includes('status')|| e.includes('createDate') || e.includes('dateScheduled') || e.includes('price') || e.includes('dateCreate') || e.includes('dealPrice')  ? sequelize.literal(`\`${table}\`.\`${e}\``): sequelize.literal(`\`${table}\`.\`${e}\` COLLATE utf8_unicode_ci`)) ): e
          ) : defaultValue;
          
       //  sort = (typeof sort === 'string') ? JSON.parse(sort).map((e, i) => i % 2 === 0 ? sequelize.literal(`\`${e}\``) : e) : defaultValue;
    // console.log("sort1===",sort)
    if (sort.length % 2 === 0) {
      sort = _.chunk(sort,2) ;// || defaultValue;
      
      // console.log("sort2===",sort)
      sort.map(element => {
        // console.log("element===",element)
        if (!element[1].toUpperCase().match(regexSort)) {
          isPass = false;
        }
      });
    } else {
      isPass = false;
    }

    // console.log("isPass===",isPass)
    if (isPass) {
      return sort;
    } else {
      return defaultValue
    }
  } catch (e) {
    // console.log("e===error ===", e)
    return defaultValue
  }
  
};