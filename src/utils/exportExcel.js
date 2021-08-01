// import reportService from '../services/reportService'
import placeService from '../services/placeService'
// import loggerHelpers from '../helpers/loggerHelpers';
// import { recordStartTime } from '../utils/loggerFormat';
// import path from 'path';
// import { codeMessage } from '../utils';
// import errorCode from '../utils/errorCode';
// import * as ApiErrors from '../errors';
import Excel from 'exceljs';
import moment from 'moment';
// import _ from 'lodash';

/**
 *
 */
export default class ExportExcel {
  /**
   *
   * @param {*} fileName
   * @param {*} data
   * @param {*} options
   */
  static async exportReport(fileName, data, options) {
    const { param, startRow } = options;

    // const dataConverted = _.cloneDeep(data).map((e, i) => {
    //   return [i + 1, ...e];
    // });


    const place = await placeService.get_one({ id: param.filter.placesId });

    let workbook = new Excel.Workbook();

    workbook = await workbook.xlsx.readFile(fileName);

    const worksheet = workbook.getWorksheet("Template-Report");

    worksheet.pageSetup = { paperSize: 'A4', /* orientation: 'landscape' */ }
    worksheet.views = [{ showGridLines: false, alignment: { wrapText: true } }]
    worksheet.getCell(`A1`).value = `Tên nhà thuốc: ${place.dataValues.name}`
    worksheet.getCell(`A2`).value = `Địa chỉ: ${place.dataValues.address}`
    worksheet.getCell(`A3`).value = `MST/SĐT: ${place.dataValues.mobile}/${place.dataValues.taxCode}`
    worksheet.getCell(`C5`).value = `Từ ngày ${param.filter.FromDate}`
    worksheet.getCell(`E5`).value = `Đến ngày ${param.filter.ToDate}`
    worksheet.getCell(`B6`).value = `Ngày xuất báo cáo: ${moment().format('YYYY-MM-DD')}`
    let currentRow = startRow;

    data.rows.forEach((item) => {
      worksheet.spliceRows(currentRow, 0, item)
      worksheet.getCell(`H${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
      worksheet.getCell(`I${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
      worksheet.getCell(`J${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
      const row = worksheet.getRow(currentRow)
      // row.height = 20

      row.eachCell((cell) => {
        // cell.fill = { type: 'pattern',  pattern: 'solid',  fgColor: fgColor };
        cell.alignment = { wrapText: true };
        cell.border = {
          top: { style: "thin" },
          left: { style: "thin" },
          bottom: { style: "thin" },
          right: { style: "thin" }
        };
      });
      currentRow += 1;

    })

    worksheet.mergeCells(`A${currentRow}:G${currentRow}`)
    worksheet.getCell(`H${currentRow}`).value = parseInt(data.total.totalDiscounts)
    worksheet.getCell(`H${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
    worksheet.getCell(`I${currentRow}`).value = parseInt(data.total.totalMoney)
    worksheet.getCell(`I${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
    worksheet.getCell(`J${currentRow}`).value = parseInt(data.total.totalProfit)
    worksheet.getCell(`J${currentRow}`).numFmt = '#,##0.00;[Red]-#,##0.00';
    worksheet.getRow(currentRow).height = 40
    worksheet.getRow(currentRow).eachCell((cell) => {
      cell.font = { size: 12, bold: true, color: { argb: '993300' } };
    });

    const tempfile = require('tempfile');
    const tempFilePath = tempfile('.xlsx');

    console.log("tempFilePath : ", tempFilePath);
    try {
      await workbook.xlsx.writeFile(tempFilePath);
    } catch(error){
      throw error;
    }

    return tempFilePath;
  }
}
