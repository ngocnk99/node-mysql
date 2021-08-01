import _ from 'lodash';
/**
 * @param {string} str
 * @param {object} values
 */
export default (str,values) => {
  str = str ? str.toString().trim(): '';
  const re = /{{([\s\S]+?)}}/g;
  const reReplace = /([{} ])*/g;
  const keys = [];
  const data = {};

  _.templateSettings.interpolate = /{{([\s\S]+?)}}/g;
  const compiled = _.template(str);

  const _keys = str.match(re);

  if (_keys === null) {
    return str;
  }
  _keys.forEach(key => {
    keys.push(key.replace(reReplace,''));
  });
  keys.forEach(key => {
    data[key] = values[key];
  });

  return compiled(data);
};

