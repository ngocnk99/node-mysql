"use strict";
// import config from '../config';
const { workerData, parentPort } = require('worker_threads')
const nodemailer = require("nodemailer");
let emailService = {
  gmail: {
    name: 'Gmail',
    port: 587,
    secure: false,
    user: 'clbyeuamnhacdonghovuvovietnam@gmail.com',
    pass: 'yeuamnhacdonghovuvo'
  }
}
// const CONFIG =  require('../config');
// const ErrorHelpers = require('../helpers/errorHelpers');
// const { workerData, parentPort } = require('worker_threads')
/*

* */
const main = async ({emailServiceName, user, pass , email, text, subject, html}) => {
  let result;
  emailServiceName = emailServiceName || 'gmail';
  user = user || emailService[emailServiceName].user;
  pass = pass || emailService[emailServiceName].pass;
  const transporter = nodemailer.createTransport({
    service: emailService[emailServiceName].name,
    port: emailService[emailServiceName].port,
    secure: false,
    auth: {
      user,
      pass
    }
  });
  const mailOptions = {
    from: user,
    to: email,
    subject,
    text,
    html
  };
  await transporter.sendMail(mailOptions, function (err, data) {
    if (err) {
      console.log('error',err);
    }
    result = data
  });
  return result;
}
const {emailServiceName, user, pass , email, text, subject, html} = workerData;
main({ emailServiceName, user, pass, email, text, subject, html }).then( result =>{
  console.log(result);
  parentPort.postMessage({ result })

}).catch(error => {
  console.log(error);
  parentPort.postMessage({ error })

})
