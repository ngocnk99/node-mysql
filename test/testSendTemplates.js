import sendTemplates from '../src/web/services/facebookV2/sendTemplates';

const templates = [
  {
    "title": 'title',
    "image_url":  'https://img.nhathuocgpp.com.vn/api/c/images/connectcare/userfiles/admin_nbm/images/20200414/2020_04_14_8_42_52_541_logo.svg',
    "subtitle": 'subtitle',
    "buttons": [
      {
        type: "postback",
        title: "title",
        payload:  'payload'
      },
      {
        type: "web_url",
        url: 'https://google.com',
        title: 'title'
      }
    ]
  }
]
async function run() {
  await sendTemplates({
    userId: "3058526314176273",
    templates,
    accessToken:"EAAFbAeFEZAToBAA2XI6zPOJPMRJIzNCct6HQLkTQOWrl5bfRZALK0sO1oWm01a35RD36HPx4ZACx9m4TWZBGbOcxaDKGDTnYiZByoBhF4Sn6m4fJxmSZCS700ONVk4gY79t27c6EOF5uoZCbpZCRkFIV2NYHmh7rBSSm9VRxc2I9NdfZCYcF8Jx6ZC4FMx7zunRaZBsZAVPIO0L56jA8Un1Pf8Xmld2hFN2KSygZD"
  }).then((result)=> {
      console.log('result',result);
  }).catch((error)=> {
    console.log('error',error);
  })
}
run()
