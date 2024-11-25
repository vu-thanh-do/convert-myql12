module.exports = (sequelize) => {
  return sequelize.define('Shop', {
      name: {
          type: DataTypes.STRING,
          allowNull: false
      },
      email: {
          type: DataTypes.STRING,
          allowNull: false,
          unique: true
      },
      password: {
          type: DataTypes.STRING,
          allowNull: false
      },
      description: {
          type: DataTypes.TEXT
      },
      address: {
          type: DataTypes.STRING,
          allowNull: false
      },
      phone_number: {
          type: DataTypes.BIGINT,
          allowNull: false
      },
      role: {
          type: DataTypes.STRING,
          defaultValue: 'Seller'
      },
      avatar: {
          type: DataTypes.STRING,
          allowNull: false
      },
      zip_code: {
          type: DataTypes.INTEGER
      },
      withdraw_method: {
          type: DataTypes.JSON
      },
      available_balance: {
          type: DataTypes.DECIMAL(10, 2),
          defaultValue: 0
      },
      created_at: {
          type: DataTypes.DATE,
          defaultValue: DataTypes.NOW
      },
      reset_password_token: {
          type: DataTypes.STRING
      },
      reset_password_time: {
          type: DataTypes.DATE,
          allowNull: true
      }
  }, {
      tableName: 'shops',
      timestamps: false
  });
};
