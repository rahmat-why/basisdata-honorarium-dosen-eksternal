CREATE DATABASE HonorariumDosenEksternal

USE HonorariumDosenEksternal

CREATE TABLE users (
  id_user VARCHAR(10) NOT NULL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  role VARCHAR(10) NOT NULL
);

CREATE TABLE matkul (
  id_matkul VARCHAR(10) NOT NULL PRIMARY KEY,
  nama_matkul VARCHAR(100) NOT NULL,
  sks INT NOT NULL
);

CREATE TABLE prodi (
  id_prodi VARCHAR(10) NOT NULL PRIMARY KEY,
  nama_prodi VARCHAR(100) NOT NULL,
  singkatan VARCHAR(10) NOT NULL,
  transport VARCHAR(100) NOT NULL
)

CREATE TABLE jenis_dosen (
  id_jenis_dosen VARCHAR(10) NOT NULL PRIMARY KEY,
  nama_jenis VARCHAR(100) NOT NULL,
  id_golongan VARCHAR(10),
  kompensasi_mengajar MONEY NOT NULL,
  transport_mengajar MONEY NOT NULL,
  persentase_pph21_npwp FLOAT NOT NULL,
  persentase_pph21_nonnpwp FLOAT NOT NULL,
  referensi_dosen VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_golongan) REFERENCES insentif_kehadiran_golongan (id_golongan)
);

CREATE TABLE insentif_kehadiran_golongan (
  id_golongan VARCHAR(10) NOT NULL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  insentif_kehadiran MONEY NOT NULL,
  tahun_batas_bawah INT NOT NULL,
  tahun_batas_atas INT NULL
);

CREATE TABLE perusahaan_astra (
  id_perusahaan VARCHAR(10) PRIMARY KEY,
  nama_perusahaan VARCHAR(100)
);

CREATE TABLE dosen (
  id_dosen VARCHAR(10) NOT NULL PRIMARY KEY,
  nama_dosen VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  id_jenis_dosen VARCHAR(10) NOT NULL,
  nama_bank VARCHAR(30) NOT NULL,
  cabang_bank VARCHAR(30) NOT NULL,
  no_rekening VARCHAR(20) NOT NULL,
  npwp VARCHAR(16) NULL,
  tanggal_gabung_kampus DATE NOT NULL,
  tanggal_gabung_industri DATE NULL,
  status VARCHAR(20) NOT NULL CHECK (status IN ('AKTIF', 'TIDAK AKTIF')),
  atasnama VARCHAR(30) NOT NULL,
  kota VARCHAR(20) NOT NULL,
  id_perusahaan VARCHAR(10) NOT NULL,
  foto_dosen IMAGE NOT NULL,
  FOREIGN KEY (id_jenis_dosen) REFERENCES jenis_dosen (id_jenis_dosen),
  FOREIGN KEY (id_perusahaan) REFERENCES perusahaan_astra(id_perusahaan)
);

SELECT * FROM dosen

DROP TABLE absensi
CREATE TABLE absensi (
  id_absensi VARCHAR(10) NOT NULL PRIMARY KEY,
  id_dosen VARCHAR(10) NOT NULL,
  id_matkul VARCHAR(10) NOT NULL,
  id_prodi VARCHAR(10) NOT NULL,
  id_user VARCHAR(10) NOT NULL,
  kelas VARCHAR(10) NOT NULL,
  tanggal_mengajar DATE NOT NULL,
  sks INT NOT NULL,
  kompensasi_mengajar MONEY NOT NULL,
  insentif_kehadiran MONEY NOT NULL,
  transport_mengajar MONEY NOT NULL,
  pph21 MONEY NOT NULL,
  persentase_pph21 FLOAT NOT NULL,
  FOREIGN KEY (id_dosen) REFERENCES dosen (id_dosen),
  FOREIGN KEY (id_matkul) REFERENCES matkul (id_matkul),
  FOREIGN KEY (id_prodi) REFERENCES prodi (id_prodi),
  FOREIGN KEY (id_user) REFERENCES users (id_user)
);