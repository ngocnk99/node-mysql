import crypto from "crypto";
import path from "path";
import fs from "fs";
// import _ from 'lodash';

/**
 * 
 * @param {*} toEncrypt 
 * @param {*} relativeOrAbsolutePathToPublicKey 
 */
export const encryptStringWithRsaPublicKey = function (toEncrypt, relativeOrAbsolutePathToPublicKey) {
  const absolutePath = path.resolve(relativeOrAbsolutePathToPublicKey);
  const publicKey = fs.readFileSync(absolutePath, "utf8");
  const buffer = new Buffer(toEncrypt);
  const encrypted = crypto.publicEncrypt(publicKey, buffer);

  return encrypted.toString("base64");
};

/**
 * 
 * @param {*} toDecrypt 
 * @param {*} relativeOrAbsolutePathtoPrivateKey 
 */
export const decryptStringWithRsaPrivateKey = function (toDecrypt, relativeOrAbsolutePathtoPrivateKey) {
  const absolutePath = path.resolve(relativeOrAbsolutePathtoPrivateKey);
  const privateKey = fs.readFileSync(absolutePath, "utf8");
  const buffer = new Buffer(toDecrypt, "base64");
  const decrypted = crypto.privateDecrypt(privateKey, buffer);

  return decrypted.toString("utf8");
};

const iterations = 1000;
const bytes = 24;
// 1000:qcMqVYE0EzAU9Uz+mQxBaKFICG1vR1iq:RkdpgAcpijFqYgVxBCvJugMXqnt4j5f3

/**
 * 
 */
export const createSalt = () => {
  return new Buffer(crypto.randomBytes(bytes)).toString('base64');
}

/**
 * 
 * @param {*} text 
 * @param {*} salt 
 */
export const hash = (text, salt) => new Promise((resolve, reject) => {
  crypto.pbkdf2(text, salt, iterations, bytes, 'sha1', function (err, derivedKey) {
    if (err) { reject(err) }
    else {
      // C# return Pbkdf2Iterations + ":" + Convert.ToBase64String(salt) + ":" + Convert.ToBase64String(hash);
      const hash = new Buffer(derivedKey).toString('base64');
      const pass = `${iterations}:${salt}:${hash}`

      resolve(pass);
    }
  });
})

/**
 * 
 * @param {*} passWord 
 * @param {*} goodHash 
 */
export const verifyPassword = (passWord, goodHash) => new Promise((resolve, reject) => {
  try {
    if (!goodHash || goodHash === '' || !passWord || passWord === '') {
      console.log('false')
      resolve(false)
    }
    const delimiter = ':'
    const split = goodHash.split(delimiter)
    const salt = new Buffer(split[1], 'base64')
    const hashPass = split[2]
    const testHash = crypto.pbkdf2Sync(passWord, salt, iterations, bytes, 'sha1').toString('base64')

    if (hashPass.length != testHash.length) {
      console.log('iterations: %o | hashPass: %s | hashPass.length: %o | testHash.length: %o => false', iterations, hashPass, hashPass.length, testHash.length)
      resolve(false)
    }
    // var isOk = _.difference(hashPass, testHash)
    console.log("hasPass: %o | testHash: %o", hashPass, testHash)
    resolve(hashPass === testHash)
  } catch (error) {
    console.log(error)
    resolve(false)
  }
})

/**
 * 
 * @param {*} data 
 * @param {*} passWord 
 */
export const encryptedString = (data, passWord) => new Promise((resolve) => {
  const cipher = crypto.createCipher('aes192', passWord)
  let encrypted = cipher.update(data, 'utf8', 'hex')

  encrypted += cipher.final('hex')
  console.log("encrypted with pass %s: %s", passWord, encrypted)
  resolve(encrypted)
})

/**
 * 
 * @param {*} data 
 * @param {*} passWord 
 */
export const decryptedString = (data, passWord) => new Promise((resolve) => {
  const decipher = crypto.createDecipher('aes192', passWord)
  let decrypted = decipher.update(data, 'hex', 'utf8')

  decrypted += decipher.final('utf8')
  console.log("decrypted with pass %s: %s", passWord, decrypted)
  resolve(decrypted)
})

/**
 * 
 * @param {*} data 
 */
export const md5 = data => crypto.createHash('md5').update(data).digest("hex")

/**
 * 
 * @param {*} passWord 
 * @param {*} goodHash 
 */
export const verifyPasswordMd5 = (passWord, goodHash) => new Promise((resolve, reject) => {
  try {
    if (!goodHash || goodHash === '' || !passWord || passWord === '') {
      console.log('false')
      resolve(false)
    }

    const testHash = md5(passWord)

    console.log("goodHash: %o | testHash: %o", goodHash, testHash)
    resolve(goodHash === testHash)
  } catch (error) {
    console.log(error)
    resolve(false)
  }
})