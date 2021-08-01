import _ from 'lodash';

/**
 *
 */
export default class DataUtils {
  /**
   *
   * @param {*} obj
   * @param {*} parentId
   */
  static getChildren(obj, parentId) {
    return obj[parentId] && obj[parentId].map(e => ({ ...e, children: DataUtils.getChildren(obj, e.id) || [] })) || [];
  }

  /**
   *
   * @param {*} id
   * @param {*} data
   */
  static makeTree(id, data) {
    const obj = _.groupBy(data, 'parentId');
    const tree = obj[id].map(e => ({ ...e, children: DataUtils.getChildren(obj, e.id) || [] }));

    return tree;
  }
}
