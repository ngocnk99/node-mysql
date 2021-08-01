import { User, GroupUser } from '../model'

export default async (req) => {
  const userName = req.headers.user_name

  console.log("header userName: ", userName)
  if (userName === undefined || userName === null || userName === 'null' || userName === '') {
    return -1
  }
  const dataUser = await User.find({ where: { UserName: userName } })

  if(dataUser){
    const dataGroupUser = await GroupUser.findById(dataUser.dataValues.GroupUserId)

    if(dataGroupUser){
      // console.log("dataGroupUser ", dataGroupUser)
      const groupAdmin = !isNaN(Number(process.env.GROUP_ADMINISTRATOR)) ? Number(process.env.GROUP_ADMINISTRATOR) : 1

      if (Number(dataGroupUser.dataValues.id) === groupAdmin){
        return 0
      }else{
        return dataUser.dataValues.id
      }
    }

    return -1
  }

  return -1
}
