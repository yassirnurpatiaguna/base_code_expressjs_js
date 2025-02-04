const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const InventarisTransaksi = sequelize.define(
  "m_inventaris_transaksi",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    id_regional: { type: DataTypes.INTEGER, allowNull: false },
    kode_ruas: { type: DataTypes.INTEGER, allowNull: false },
    id_gerbang: { type: DataTypes.INTEGER, allowNull: false },
    tipe_gerbang: { type: DataTypes.STRING(100), allowNull: false },
    jenis_gerbang: { type: DataTypes.STRING(100), allowNull: false },
    jumlah_multi: { type: DataTypes.INTEGER },
    jumlah_single: { type: DataTypes.INTEGER },
    jumlah_oab: { type: DataTypes.INTEGER },
    jumlah_mr: { type: DataTypes.INTEGER },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_inventaris_transaksi",
  },
);

module.exports = InventarisTransaksi;
