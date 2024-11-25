module.exports = (sequelize) => {
    return sequelize.define('Event', {
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
        start_date: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        finish_date: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        status: {
            type: DataTypes.STRING,
            defaultValue: 'Running'
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
        tableName: 'events',
        timestamps: false
    });
};
