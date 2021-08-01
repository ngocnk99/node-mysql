/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define(
    'ecommerceOrders',
    {
      id: {
        type: DataTypes.BIGINT,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        field: 'id'
      },
      usersId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'usersId'
      },
      notes: {
        type: DataTypes.STRING(500),
        allowNull: true,
        field: 'notes'
      },
      paymentMethodsId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'paymentMethodsId'
      },
      shippingAddress: {
        type: DataTypes.TEXT,
        allowNull: false,
        field: 'shippingAddress'
      },
      createDate: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        field: 'createDate'
      },
      states: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'states'
      },
      sitesId: {
        type: DataTypes.BIGINT,
        allowNull: true,
        field: 'sitesId'
      },
      shippingFee: {
        type: DataTypes.DOUBLE,
        field: 'shippingFee'
      },
      shippingCompanyId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'shippingCompanyId'
      }
    },
    {
      tableName: 'ecommerceOrders',
      timestamps: false
    }
  );
};
