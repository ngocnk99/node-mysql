import Model from '../src/models/models';
import _ from 'lodash';

entity.ecommerceProductsModelList = entity.ecommerceProductsModelList.map(async _ecommerceProductsModelList => {
  const promiseArray = [];
  console.log(_ecommerceProductsModelList);
  let newEcommerceProductClassify1Result, newEcommerceProductClassify2Result;
  if (_ecommerceProductsModelList['ecommerceProductClassify1']) {
    const newEcommerceProductClassify1 = _ecommerceProductsModelList['ecommerceProductClassify1'];

    const _ecommerceProductClassify1Entity = {
      ...newEcommerceProductClassify1,
      ecommerceProductsId: finnalyResult.id
    };
    if (newEcommerceProductClassify1Name.indexOf(newEcommerceProductClassify1['name']) === -1) {
      newEcommerceProductClassify1Name.push(newEcommerceProductClassify1['name']);
      await Model.createOrUpdate(ecommerceProductClassify1, _ecommerceProductClassify1Entity, {
        where: {
          ..._.pick(_ecommerceProductClassify1Entity, ['name', 'ecommerceProductsId'])
        }
      }).then(async _newEcommerceProductClassify1Result => {
        newEcommerceProductClassify1Result = _newEcommerceProductClassify1Result;

        if (_ecommerceProductsModelList['ecommerceProductClassify2']) {
          const newEcommerceProductClassify2 = _ecommerceProductsModelList['ecommerceProductClassify2'];
          const _ecommerceProductClassify2Entity = {
            ...newEcommerceProductClassify2,
            ecommerceProductsId: finnalyResult.id
          };
          if (newEcommerceProductClassify2Name.indexOf(newEcommerceProductClassify2['name']) === -1) {
            newEcommerceProductClassify2Name.push(newEcommerceProductClassify2['name']);
            await Model.createOrUpdate(ecommerceProductClassify2, _ecommerceProductClassify2Entity, {
              where: {
                ..._.pick(_ecommerceProductClassify2Entity, ['name', 'ecommerceProductsId'])
              }
            }).then(_newEcommerceProductClassify2Result => {
              newEcommerceProductClassify2Result = _newEcommerceProductClassify2Result;
            });
          }
        }

        // console.log({
        //   newEcommerceProductClassify1Result,
        //   newEcommerceProductClassify2Result
        // });
        const ecommerceProductClassify1Id =
          newEcommerceProductClassify1Result &&
          newEcommerceProductClassify1Result.item &&
          newEcommerceProductClassify1Result.item['id']
            ? newEcommerceProductClassify1Result.item['id']
            : null;
        const ecommerceProductClassify2Id =
          newEcommerceProductClassify2Result &&
          newEcommerceProductClassify2Result.item &&
          newEcommerceProductClassify2Result.item['id']
            ? newEcommerceProductClassify2Result.item['id']
            : null;
        if (ecommerceProductClassify1Id || (ecommerceProductClassify1Id && ecommerceProductClassify2Id)) {
          const _ecommerceProductsModelListEnity = {
            ..._.pick(_ecommerceProductsModelList, ['price', 'dealPrice', 'stock']),
            ecommerceProductClassify1Id,
            ecommerceProductClassify2Id
          };
          const whereEcommerceProductsModelList = { ecommerceProductClassify1Id, ecommerceProductClassify2Id };
          // console.log({
          //   _ecommerceProductsModelListEnity,
          //   whereEcommerceProductsModelList
          // });
          await Model.createOrUpdate(ecommerceProductsModelList, _ecommerceProductsModelListEnity, {
            where: whereEcommerceProductsModelList,
            // logging: console.log
          });
        }
      });
    }
  }
});
