const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const JenisGerbang = sequelize.define(
  "m_jenis_gerbang",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    jenis_gerbang: { type: DataTypes.STRING(100), allowNull: false },
    sistem_transaksi: { type: DataTypes.STRING(100), allowNull: false },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_jenis_gerbang",
  },
);

module.exports = JenisGerbang;
