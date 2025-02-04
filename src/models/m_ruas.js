const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Ruas = sequelize.define(
  "m_ruas",
  {
    kode_ruas: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_regional: { type: DataTypes.INTEGER, allowNull: true },
    nama_ruas: { type: DataTypes.STRING, allowNull: false },
    is_jm: { type: DataTypes.BOOLEAN, allowNull: false },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_ruas",
  },
);

module.exports = Ruas;
