import _ from 'lodash';
/**
 * @param {Object} source
 * @param {Object} target
 */
export default  (source, target) => {
  target = target ? target : {};
  source = source ? source : {};

  // console.log('source',source);
  // console.log('target',target);
  const targetClone = _.clone(target);
  // console.log('targetClone',targetClone);


  Object.keys(target).map(sourceKey => {
    // console.log('sourceKey',sourceKey);
    if (Object.keys(source).indexOf(sourceKey) !== -1) {
      targetClone[source[sourceKey]] = targetClone[sourceKey];
    }
    if (sourceKey !== source[sourceKey]) {
      delete targetClone[sourceKey];
    }
  });

  return { ...targetClone}
};


