/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define(
    'ecommerceOrderDetails',
    {
      id: {
        type: DataTypes.BIGINT,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        field: 'id'
      },
      productsId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'productsId'
      },
      quantities: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'quantities'
      },
      ordersId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'ordersId'
      },
      price: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'price'
      },
      dealPrice: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'dealPrice'
      },
      classifyName: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: 'classifyName'
      },
      createDate: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        field: 'createDate'
      }
    },
    {
      tableName: 'ecommerceOrdersDetail',
      timestamps: false
    }
  );
};
