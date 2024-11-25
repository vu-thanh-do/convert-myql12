module.exports = (sequelize) => {
  return sequelize.define('Product', {
      name: {
          type: DataTypes.STRING,
          allowNull: false
      },
      description: {
          type: DataTypes.TEXT,
          allowNull: false
      },
      category: {
          type: DataTypes.STRING,
          allowNull: false
      },
      tags: {
          type: DataTypes.STRING
      },
      original_price: {
          type: DataTypes.DECIMAL(10, 2)
      },
      discount_price: {
          type: DataTypes.DECIMAL(10, 2),
          allowNull: false
      },
      stock: {
          type: DataTypes.INTEGER,
          allowNull: false
      },
      images: {
          type: DataTypes.JSON
      },
      ratings: {
          type: DataTypes.DECIMAL(3, 2)
      },
      shop_id: {
          type: DataTypes.STRING,
          allowNull: false
      },
      shop: {
          type: DataTypes.JSON,
          allowNull: false
      },
      sold_out: {
          type: DataTypes.INTEGER,
          defaultValue: 0
      },
      created_at: {
          type: DataTypes.DATE,
          defaultValue: DataTypes.NOW
      }
  }, {
      tableName: 'products',
      timestamps: false
  });
};
