const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const TipeGardu = sequelize.define(
  "m_tipe_gardu",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    tipe_gardu: { type: DataTypes.STRING(25), allowNull: false },
    deskripsi: { type: DataTypes.STRING(255) },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_tipe_gardu",
  },
);

module.exports = TipeGardu;
