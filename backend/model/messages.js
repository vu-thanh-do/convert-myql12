module.exports = (sequelize) => {
  return sequelize.define('Message', {
      conversation_id: {
          type: DataTypes.STRING
      },
      text: {
          type: DataTypes.TEXT
      },
      sender: {
          type: DataTypes.STRING
      },
      images: {
          type: DataTypes.TEXT
      },
      created_at: {
          type: DataTypes.DATE,
          defaultValue: DataTypes.NOW
      },
      updated_at: {
          type: DataTypes.DATE,
          defaultValue: DataTypes.NOW
      }
  }, {
      tableName: 'messages',
      timestamps: false
  });
};
