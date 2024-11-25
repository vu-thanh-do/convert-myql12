module.exports = (sequelize) => {
  return sequelize.define('Conversation', {
      group_title: {
          type: DataTypes.STRING
      },
      members: {
          type: DataTypes.JSON
      },
      last_message: {
          type: DataTypes.TEXT
      },
      last_message_id: {
          type: DataTypes.STRING
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
      tableName: 'conversations',
      timestamps: false
  });
};
