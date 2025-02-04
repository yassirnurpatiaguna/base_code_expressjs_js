const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Kecamatan = sequelize.define(
  "m_kecamatan",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    nama_kecamatan: { type: DataTypes.STRING(100), allowNull: false },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_kecamatan",
  },
);

module.exports = Kecamatan;
