import path from 'path';
const { Worker, isMainThread, parentPort } = require('worker_threads');
const processService = async ({fileName, dirname, workerDataList}) =>  {
  dirname = dirname || __dirname;
  await Promise.all(workerDataList.map(workerData => {
    return new Promise((resolve, reject) => {
      const worker = new Worker(path.resolve(dirname,`./${fileName}`), { workerData });
      worker.on('message', message => {
        return resolve(message)
      });
      worker.on('error', error => {
        return reject(error)
      });
      worker.on('exit', (code) => {
        if (code !== 0)
          reject(new Error(`Worker stopped with exit code ${code}`));
      })
    });
  }));
}

// async function run() {
//   await processService({
//     fileName: 'careCampaignProcess.js',
//     workerDataList:[{
//       emailServiceName: 'gmail',
//       email: 'trongtrongtu169@gmail.com',
//       text: 'test 1',
//       subject: 'ok'
//     },{
//       emailServiceName: 'gmail',
//       email: 'tuanto002@gmail.com',
//       text: 'test 1',
//       subject: 'ok'
//     },{
//       emailServiceName: 'gmail',
//       email: 'toanhkma@gmail.com',
//       text: 'test 1',
//       subject: 'ok'
//     },{
//       emailServiceName: 'gmail',
//       email: 'vnkylin@gmail.com',
//       text: 'test 1',
//       subject: 'ok'
//     },{
//       emailServiceName: 'gmail',
//       email: 'leha3598@gmail.com',
//       text: 'test 1',
//       subject: 'ok'
//     }]
//   })
// }

// run().then(result => {console.log(result)}).catch(error => {
//   console.log(error);
// })
