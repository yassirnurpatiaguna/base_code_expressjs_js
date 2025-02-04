const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const GerbangOperasi = sequelize.define(
  "gerbang_operasi",
  {
    id_gerbang: { type: DataTypes.INTEGER, primaryKey: true },
    kode_ruas: { type: DataTypes.INTEGER, primaryKey: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "gerbang_operasi",
  },
);

module.exports = GerbangOperasi;
