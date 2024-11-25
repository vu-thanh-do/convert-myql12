module.exports = (sequelize) => {
    return sequelize.define('CoupounCode', {
        name: {
            type: DataTypes.STRING,
            unique: true,
            allowNull: false
        },
        value: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: false
        },
        min_amount: {
            type: DataTypes.DECIMAL(10, 2)
        },
        max_amount: {
            type: DataTypes.DECIMAL(10, 2)
        },
        shop_id: {
            type: DataTypes.STRING,
            allowNull: false
        },
        selected_product: {
            type: DataTypes.STRING
        },
        created_at: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW
        }
    }, {
        tableName: 'coupoun_codes',
        timestamps: false
    });
};
