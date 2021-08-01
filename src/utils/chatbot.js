/* eslint-disable require-jsdoc */
import Model from '../models/models';
import models from '../entity';
import _ from 'lodash';
const { chatbotRegexs } = models;
/**
 * @param {*} q
 * */
const regExpFromString = (q) =>{
  let flags = q.replace(/.*\/([gimuy]*)$/, '$1');

  if (flags === q) flags = '';
  const pattern = flags ? q.replace(new RegExp('^/(.*?)/' + flags + '$'), '$1') : q;

  try {
    return new RegExp(pattern, flags);
  } catch (e) {
    return null;
  }
};

/**
 * @param {String} text
 * @param {String|Number} chatbotRegexsId
 * */
export const checkValidate = async (text, chatbotRegexsId) => {
  let isCheck = false;

  await Model.findOne(chatbotRegexs, {
    where: {
      id: parseInt(chatbotRegexsId)
    }
  })
    .then(data => {
      console.log(text.match(regExpFromString(data.regex)));
      // console.log("chatbotRegexs: ", data);
      if (data && data['dataValues']) {

        isCheck = !!text.match(regExpFromString(data.regex));
      } else {
        // console.log('false find');
        isCheck = false;
      }
    })
    .catch(error => {
      // console.log('false catch');
      isCheck = false;
    });

  return isCheck;
};

export const convertCards = (cards) => {
  let output = [];

  try {
    output = cards.reduce((arrStep, item) => {
      // console.log("item: ", item);
      item.dataUsers.map(dataUser => {

        arrStep.push(dataUser);
      });

      return arrStep;
    }, []);
  } catch (error) {
    // console.log(error);

    output = [];
  }

  return output;
};
