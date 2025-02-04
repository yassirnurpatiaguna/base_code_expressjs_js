const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

const Gardu = sequelize.define(
  "m_gardu",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    id_gerbang: { type: DataTypes.INTEGER, allowNull: false },
    id_tipe_gardu: { type: DataTypes.INTEGER, allowNull: false },
    latitude: { type: DataTypes.STRING(255) },
    longitude: { type: DataTypes.STRING(255) },
    is_active: { type: DataTypes.BOOLEAN, defaultValue: true },
    created_by: { type: DataTypes.STRING },
    updated_by: { type: DataTypes.STRING },
  },
  {
    timestamps: true,
    underscored: true,
    tableName: "m_gardu",
  },
);

module.exports = Gardu;
