import LanguageModel from '../model/language'

export default async (req) => {
  console.log("i18n: ", req.headers.i18n)
  let i18n = req.headers.i18n
  if (i18n === undefined || i18n === 'null' || i18n === ''){
    console.log("i18n default")
    i18n = process.env.DEFAULT_I18N || 'vi'
  }
  console.log("i18n out: ", i18n)
  const data = await LanguageModel.find_one({ Code: i18n })
  return data.dataValues.id
}

export const i18nMessage = (req, ...args) => {
  console.log("args: ",args)
  let i18n = req.headers.i18n
  if (i18n === undefined || i18n === '' || i18n === 'null' || i18n === null) {
    // console.log("i18n default")
    i18n = 'vi'
  }
  console.log("i18n default", i18n)
  if(i18n === 'vi')
    return args[0] || ''
  if(i18n === 'en')
    return args[1] || ''
}