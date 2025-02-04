const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Cuaca = sequelize.define(
  "m_cuaca",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    id_kecamatan: { type: DataTypes.INTEGER, allowNull: false },
    icon_cuaca: { type: DataTypes.BLOB },
    jenis_cuaca: { type: DataTypes.INTEGER, allowNull: false },
    deskripsi: { type: DataTypes.STRING(100) },
    timestamp: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
    latitude: { type: DataTypes.STRING(255) },
    longitude: { type: DataTypes.STRING(255) },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_cuaca",
  },
);

module.exports = Cuaca;
