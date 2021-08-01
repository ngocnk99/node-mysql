import _ from 'lodash';
export const rename = function(obj, arr) {
  arr.forEach( item => {
    const key = item[0];
    const newKey = item[1];

    if(_.includes(_.keys(obj), key)) {
      obj[newKey] = _.clone(obj[key]);

      delete obj[key];
    }
  });
  
  return new Object(obj);
};
export default {
  rename
}
