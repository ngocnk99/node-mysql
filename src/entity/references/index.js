
export default models => {
  // eslint-disable-next-line no-empty-pattern
  const {
    ecommerceProducts,
    ecommerceOrders,
    ecommerceOrderDetails
  } = models;
  ecommerceOrders.hasMany(ecommerceOrderDetails, {
    foreignKey: 'ordersId',
    as: 'orderDetails'
  });
  ecommerceOrderDetails.belongsTo(ecommerceOrders, {
    foreignKey: 'ordersId',
    as: 'orders'
  });
  ecommerceOrderDetails.belongsTo(ecommerceProducts, {
    foreignKey: 'productsId',
    as: 'products'
  });
};
