const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Regional = sequelize.define(
  "m_regional",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    nama_regional: { type: DataTypes.STRING, allowNull: false },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_regional",
  },
);

module.exports = Regional;
