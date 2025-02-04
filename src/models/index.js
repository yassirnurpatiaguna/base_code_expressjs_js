const { DataTypes } = require("sequelize");
const sequelize = require("../../config/database");

// Import Modelsnpm
const Regional = require("./m_regional")(sequelize, DataTypes);
const Ruas = require("./m_ruas")(sequelize, DataTypes);
const JenisGerbang = require("./m_jenis_gerbang")(sequelize, DataTypes);
const Gerbang = require("./m_gerbang")(sequelize, DataTypes);
const InventarisTransaksi = require("./m_inventaris_transaksi")(
  sequelize,
  DataTypes,
);
const GerbangOperasi = require("./gerbang_operasi")(sequelize, DataTypes);
const GerbangLaporan = require("./gerbang_laporan")(sequelize, DataTypes);
const TipeGardu = require("./m_tipe_gardu")(sequelize, DataTypes);
const Gardu = require("./m_gardu")(sequelize, DataTypes);
const Apjt = require("./m_apjt")(sequelize, DataTypes);
const RepresentativeOfficer = require("./m_representative_officer")(
  sequelize,
  DataTypes,
);
const Integrator = require("./m_integrator")(sequelize, DataTypes);
const GolonganKendaraan = require("./m_golongan_kendaraan")(
  sequelize,
  DataTypes,
);
const Cuaca = require("./m_cuaca")(sequelize, DataTypes);
const Kecamatan = require("./m_kecamatan")(sequelize, DataTypes);

// Define Associations

// 1. Regional has many Ruas
Regional.hasMany(Ruas, { foreignKey: "id_regional", as: "ruas" });
Ruas.belongsTo(Regional, { foreignKey: "id_regional", as: "regional" });

// 2. Regional has many Inventaris Transaksi
Regional.hasMany(InventarisTransaksi, {
  foreignKey: "id_regional",
  as: "inventaris_transaksi",
});
InventarisTransaksi.belongsTo(Regional, {
  foreignKey: "id_regional",
  as: "regional",
});

// 3. Ruas has many Inventaris Transaksi
Ruas.hasMany(InventarisTransaksi, {
  foreignKey: "kode_ruas",
  as: "inventaris_transaksi",
});
InventarisTransaksi.belongsTo(Ruas, { foreignKey: "kode_ruas", as: "ruas" });

// 4. Ruas has many Gerbang Operasi
Ruas.hasMany(GerbangOperasi, {
  foreignKey: "kode_ruas",
  as: "gerbang_operasi",
});
GerbangOperasi.belongsTo(Ruas, { foreignKey: "kode_ruas", as: "ruas" });

// 5. Ruas has many Gerbang Laporan
Ruas.hasMany(GerbangLaporan, {
  foreignKey: "kode_ruas",
  as: "gerbang_laporan",
});
GerbangLaporan.belongsTo(Ruas, { foreignKey: "kode_ruas", as: "ruas" });

// 6. Jenis Gerbang has many Gerbang
JenisGerbang.hasMany(Gerbang, {
  foreignKey: "id_jenis_gerbang",
  as: "gerbang",
});
Gerbang.belongsTo(JenisGerbang, {
  foreignKey: "id_jenis_gerbang",
  as: "jenis_gerbang",
});

// 7. Gerbang has many Inventaris Transaksi
Gerbang.hasMany(InventarisTransaksi, {
  foreignKey: "id_gerbang",
  as: "inventaris_transaksi",
});
InventarisTransaksi.belongsTo(Gerbang, {
  foreignKey: "id_gerbang",
  as: "gerbang",
});

// 8. Gerbang has many Gerbang Operasi
Gerbang.hasMany(GerbangOperasi, {
  foreignKey: "id_gerbang",
  as: "gerbang_operasi",
});
GerbangOperasi.belongsTo(Gerbang, { foreignKey: "id_gerbang", as: "gerbang" });

// 9. Gerbang has many Gerbang Laporan
Gerbang.hasMany(GerbangLaporan, {
  foreignKey: "id_gerbang",
  as: "gerbang_laporan",
});
GerbangLaporan.belongsTo(Gerbang, { foreignKey: "id_gerbang", as: "gerbang" });

// 10. Tipe Gardu has many Gardu
TipeGardu.hasMany(Gardu, { foreignKey: "id_tipe_gardu", as: "gardu" });
Gardu.belongsTo(TipeGardu, { foreignKey: "id_tipe_gardu", as: "tipe_gardu" });

// 11. Gerbang has many Gardu
Gerbang.hasMany(Gardu, { foreignKey: "id_gerbang", as: "gardu" });
Gardu.belongsTo(Gerbang, { foreignKey: "id_gerbang", as: "gerbang" });

// 12. Regional has many APJT
Regional.hasMany(Apjt, { foreignKey: "id_regional", as: "apjt" });
Apjt.belongsTo(Regional, { foreignKey: "id_regional", as: "regional" });

// 13. Ruas has many APJT
Ruas.hasMany(Apjt, { foreignKey: "kode_ruas", as: "apjt" });
Apjt.belongsTo(Ruas, { foreignKey: "kode_ruas", as: "ruas" });

// 14. Regional has many Representative Officers
Regional.hasMany(RepresentativeOfficer, {
  foreignKey: "id_regional",
  as: "representative_officers",
});
RepresentativeOfficer.belongsTo(Regional, {
  foreignKey: "id_regional",
  as: "regional",
});

// 15. Kecamatan has many Cuaca records
Kecamatan.hasMany(Cuaca, { foreignKey: "id_kecamatan", as: "cuaca" });
Cuaca.belongsTo(Kecamatan, { foreignKey: "id_kecamatan", as: "kecamatan" });

// Export models and Sequelize instance
module.exports = {
  sequelize,
  Regional,
  Ruas,
  JenisGerbang,
  Gerbang,
  InventarisTransaksi,
  GerbangOperasi,
  GerbangLaporan,
  TipeGardu,
  Gardu,
  Apjt,
  RepresentativeOfficer,
  Integrator,
  GolonganKendaraan,
  Cuaca,
  Kecamatan,
};
