module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('quoteViewStyle',{
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        label:{
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                notEmpty: {msg: "Un nom doit être renseigné"},
                notNull: {msg: "Un nom doit être renseigné"}
            }
        },
        contentFontSize:{
            type: DataTypes.FLOAT,
            allowNull: false
        },
        authorFontSize:{
            type: DataTypes.FLOAT,
            allowNull: false,
        }
    },
    {
        timestamps: false
    })
}


//id content font
//id auth font
//id fg color
//id bg color
