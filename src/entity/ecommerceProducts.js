/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define(
    'ecommerceProducts',
    {
      id: {
        type: DataTypes.BIGINT,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        field: 'id'
      },
      name: {
        type: DataTypes.STRING(500),
        allowNull: false,
        field: 'name'
      },
      usersCreatorId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'usersCreatorId'
      },
      languagesId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        field: 'languagesId'
      },
      shortDescription: {
        type: DataTypes.STRING(1000),
        allowNull: true,
        field: 'shortDescription'
      },
      description: {
        type: DataTypes.TEXT,
        allowNull: true,
        field: 'description'
      },

      price: {
        type: DataTypes.BIGINT,
        allowNull: true,
        field: 'price'
      },
      dealPrice: {
        type: DataTypes.BIGINT,
        allowNull: true,
        field: 'dealPrice'
      },
      images: {
        type: DataTypes.JSON,
        field: 'images',
        defaultValue: []
      },
      producersId: {
        type: DataTypes.BIGINT,
        allowNull: true,
        field: 'producersId'
      },
      categoriesId: {
        type: DataTypes.BIGINT,
        allowNull: true,
        field: 'categoriesId'
      },
      createDate: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        field: 'createDate'
      },
      status: {
        type: DataTypes.INTEGER(11),
        allowNull: false,
        field: 'status'
      },
      quantities: {
        type: DataTypes.INTEGER(11),
        allowNull: false,
        field: 'quantities',
        defaultValue: 1
      },
      weigh: {
        type: DataTypes.DOUBLE,
        allowNull: false,
        field: 'weigh'
      }
    },
    {
      tableName: 'ecommerceProducts',
      timestamps: false
    }
  );
};
