// const _eval = require('eval');
//
// const dataModel = {
//   "result": {
//     "list": [
//       {
//         "id": "26",
//         "name": "Siêu âm 2D",
//         "descriptions": null,
//         "servicesId": "10",
//         "price": "150000",
//         "time": "00:10:00",
//         "placesId": "39",
//         "usersCreatorId": "1",
//         "usersDoctorId": "46",
//         "createDate": "2019-12-02T08:29:35.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "1",
//           "username": "admin_nbm",
//           "fullname": "admin"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "46",
//           "username": "PK_baonam_bs2",
//           "fullname": "Bác sĩ Huệ"
//         }
//       },
//       {
//         "id": "27",
//         "name": "Siêu âm 4D",
//         "descriptions": "",
//         "servicesId": "11",
//         "price": "200000",
//         "time": "00:15:00",
//         "placesId": "39",
//         "usersCreatorId": "1",
//         "usersDoctorId": "45",
//         "createDate": "2019-12-02T08:30:00.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "1",
//           "username": "admin_nbm",
//           "fullname": "admin"
//         },
//         "services": {
//           "id": "11",
//           "name": "Bán thuốc"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "45",
//           "username": "PK_baonam_bs",
//           "fullname": "Bác sĩ Thành"
//         }
//       },
//       {
//         "id": "28",
//         "name": "Siêu âm phần phụ",
//         "descriptions": "",
//         "servicesId": "10",
//         "price": "100000",
//         "time": "00:00:05",
//         "placesId": "39",
//         "usersCreatorId": "1",
//         "usersDoctorId": "46",
//         "createDate": "2019-12-02T08:30:32.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "1",
//           "username": "admin_nbm",
//           "fullname": "admin"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "46",
//           "username": "PK_baonam_bs2",
//           "fullname": "Bác sĩ Huệ"
//         }
//       },
//       {
//         "id": "31",
//         "name": "Hỏi thôi",
//         "descriptions": "",
//         "servicesId": "10",
//         "price": "650000",
//         "time": "17:26:26",
//         "placesId": "39",
//         "usersCreatorId": "91",
//         "usersDoctorId": "45",
//         "createDate": "2020-01-15T10:27:29.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "91",
//           "username": "tranhue",
//           "fullname": "Trần Huế"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "45",
//           "username": "PK_baonam_bs",
//           "fullname": "Bác sĩ Thành"
//         }
//       },
//       {
//         "id": "34",
//         "name": "Sinh con trọn gói",
//         "descriptions": null,
//         "servicesId": "10",
//         "price": "10000000",
//         "time": "13:58:04",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "46",
//         "createDate": "2020-01-16T07:03:35.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "46",
//           "username": "PK_baonam_bs2",
//           "fullname": "Bác sĩ Huệ"
//         }
//       },
//       {
//         "id": "35",
//         "name": "An toàn khi mang thai ",
//         "descriptions": null,
//         "servicesId": "24",
//         "price": "2000000",
//         "time": "14:03:52",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "46",
//         "createDate": "2020-01-16T07:05:07.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "24",
//           "name": "TƯ VẤN"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "46",
//           "username": "PK_baonam_bs2",
//           "fullname": "Bác sĩ Huệ"
//         }
//       },
//       {
//         "id": "36",
//         "name": "thuy nguyen",
//         "descriptions": null,
//         "servicesId": "11",
//         "price": "222",
//         "time": "15:25:29",
//         "placesId": "39",
//         "usersCreatorId": "1",
//         "usersDoctorId": "41",
//         "createDate": "2020-01-16T07:26:44.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "1",
//           "username": "admin_nbm",
//           "fullname": "admin"
//         },
//         "services": {
//           "id": "11",
//           "name": "Bán thuốc"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "41",
//           "username": "admin_web",
//           "fullname": "Admin website"
//         }
//       },
//       {
//         "id": "37",
//         "name": "An toàn khi sinh",
//         "descriptions": null,
//         "servicesId": "10",
//         "price": "3000000",
//         "time": "14:03:52",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "46",
//         "createDate": "2020-01-16T07:57:19.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "46",
//           "username": "PK_baonam_bs2",
//           "fullname": "Bác sĩ Huệ"
//         }
//       },
//       {
//         "id": "55",
//         "name": "Tư vấn sau siêu âm",
//         "descriptions": null,
//         "servicesId": "51",
//         "price": "100000",
//         "time": "00:00:20",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "45",
//         "createDate": "2020-03-03T08:17:13.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "51",
//           "name": "Tư vấn sức khỏe ^-^ & ^~^"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "45",
//           "username": "PK_baonam_bs",
//           "fullname": "Bác sĩ Thành"
//         }
//       },
//       {
//         "id": "59",
//         "name": "Xin chào tôi có thể giúp gì cho bạn",
//         "descriptions": "",
//         "servicesId": "10",
//         "price": "100000",
//         "time": "01:00:00",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "50",
//         "createDate": "2020-03-04T10:08:12.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "50",
//           "username": "bs_nguyenngoc",
//           "fullname": "BS Nguyên Ngọc"
//         }
//       },
//       {
//         "id": "91",
//         "name": "Đo đường huyết",
//         "descriptions": null,
//         "servicesId": "10",
//         "price": "200000",
//         "time": "00:00:45",
//         "placesId": "39",
//         "usersCreatorId": "43",
//         "usersDoctorId": "45",
//         "createDate": "2020-03-16T03:48:56.000Z",
//         "status": true,
//         "usersCreator": {
//           "id": "43",
//           "username": "PK_baonam_qt",
//           "fullname": "Quản trị Bảo Nam"
//         },
//         "services": {
//           "id": "10",
//           "name": "Khám bệnh"
//         },
//         "places": {
//           "id": "39",
//           "name": "Phòng khám Bảo Nam"
//         },
//         "usersDoctor": {
//           "id": "45",
//           "username": "PK_baonam_bs",
//           "fullname": "Bác sĩ Thành"
//         }
//       }
//     ],
//     "pagination": {
//       "current": 1,
//       "pageSize": 50,
//       "total": 11
//     }
//   },
//   "success": true,
//   "errors": [],
//   "messages": []
// }
//
//
//
//
// const main = (key) => {
//   console.log(key.split('.'));
// }
// const createLine = (key, value) => {
//   return `const ${key} = ${value}`;
// }
//
// const getDataAutomation = ({data, value}) => {
//   if (Array.isArray(data) === false && typeof data !== 'string') {
//     const fields = value.split('.');
//     let markItem = 0;
//     const variable = {
//       'x0': data[fields[0]]
//     };
//
//     for (let i = 1; i < value.split('.').length; i ++) {
//       if (fields[i].indexOf('[]') >0) {
//         variable[`x${i}`] = getDataAutomation({data:variable[`x${i-1}`], value: []});
//       } else {
//         variable[`x${i}`] = variable[`x${i-1}`][fields[i]];
//       }
//       markItem++;
//
//     }
//     return variable[`x${markItem}`];
//   } else if (Array.isArray(data) === true) {
//     for () {
//
//     }
//   }
//
//
// };
//
// main('list[0][0].name');
// //const result = getDataAutomation({data: dataModel, value:'result.list', variableName:'x'});
// // console.log(result);
