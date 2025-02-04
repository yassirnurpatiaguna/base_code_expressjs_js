const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Gerbang = sequelize.define(
  "m_gerbang",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    nama_gerbang: { type: DataTypes.STRING, allowNull: false },
    id_jenis_gerbang: { type: DataTypes.INTEGER, allowNull: false },
    is_jm: { type: DataTypes.BOOLEAN, allowNull: false },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_gerbang",
  },
);

module.exports = Gerbang;
