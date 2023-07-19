SELECT id_dosen, kelas, SUM(sks), sum(kompensasi_mengajar), sum(insentif_kehadiran), sum(transport_mengajar), sum(pph21) FROM absensi
GROUP BY id_dosen, kelas

-- Luar Biasa
-- Dian Setyorini 
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN001',
	@id_matkul = 'MAT001',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-06-02',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN001',
	@id_matkul = 'MAT001',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-06-09',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN001',
	@id_matkul = 'MAT001',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-06-19',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN001',
	@id_matkul = 'MAT001',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-06-26',
	@sks = 4
GO
-- Catharina Irawani 
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN005',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-06-02',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN005',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-06-09',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN005',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-06-19',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN005',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-06-26',
	@sks = 4
GO
-- Abdul Syukur 
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN004',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-06-20',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN004',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-06-27',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN004',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-06-03',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN004',
	@id_matkul = 'MAT008',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-06-10',
	@sks = 2
GO
-- Dian Wahyunianto
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN008',
	@id_matkul = 'MAT021',
	@id_prodi = 'PRO006',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-20',
	@sks = 3
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN008',
	@id_matkul = 'MAT021',
	@id_prodi = 'PRO006',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-27',
	@sks = 3
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN008',
	@id_matkul = 'MAT021',
	@id_prodi = 'PRO006',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-03',
	@sks = 3
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN008',
	@id_matkul = 'MAT021',
	@id_prodi = 'PRO006',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-10',
	@sks = 3
GO
-- Deasy Thresia
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN006',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '2A',
	@tanggal_mengajar = '2023-07-26',
	@sks = 6
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN006',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '2B',
	@tanggal_mengajar = '2023-07-01',
	@sks = 6

-- Luar Biasa (Matrikulasi)
-- Dian Setyorini
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-05',
	@sks = 8
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-12',
	@sks = 6
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-05',
	@sks = 8
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-12',
	@sks = 6
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-05',
	@sks = 8
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-12',
	@sks = 6

-- Sofia Debi Puspa 
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-29',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-05',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-06',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-13',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-29',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-05',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-06',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-13',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-29',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-05',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN002',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO004',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-06',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN007',
	@id_matkul = 'MAT015',
	@id_prodi = 'PRO007',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-13',
	@sks = 2
GO

-- Soya Febeauty Y.O.P
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-26',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1A',
	@tanggal_mengajar = '2023-07-12',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-26',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1B',
	@tanggal_mengajar = '2023-07-12',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-26',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN003',
	@id_matkul = 'MAT002',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '1C',
	@tanggal_mengajar = '2023-07-12',
	@sks = 4
GO

-- Ambar Sri Hudoyo
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN012',
	@id_matkul = 'MAT003',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-21',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN012',
	@id_matkul = 'MAT003',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-28',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN012',
	@id_matkul = 'MAT003',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-04',
	@sks = 4
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN012',
	@id_matkul = 'MAT003',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-11',
	@sks = 4
GO

-- Mirza Al adhar
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN009',
	@id_matkul = 'MAT007',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-19',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN009',
	@id_matkul = 'MAT007',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-26',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN009',
	@id_matkul = 'MAT007',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-02',
	@sks = 2
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN009',
	@id_matkul = 'MAT007',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-09',
	@sks = 2
GO

-- Yosep Kuma
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN010',
	@id_matkul = 'MAT006',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-22',
	@sks = 6
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN010',
	@id_matkul = 'MAT006',
	@id_prodi = 'PRO005',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-05',
	@sks = 6
GO
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN009',
	@id_matkul = 'MAT007',
	@id_prodi = 'PRO008',
	@id_user = 'USR006',
	@kelas = '3',
	@tanggal_mengajar = '2023-07-12',
	@sks = 6
GO

-- Dian Setyorini
EXEC sp_CreateAbsensi
	@id_dosen = 'DSN001',
	@id_matkul = 'MAT001',
	@id_prodi = 'PRO001',
	@id_user = 'USR005',
	@kelas = '2A',
	@tanggal_mengajar = '2023-07-05',
	@sks = 3
GO

EXEC sp_CreateDosen 
	@nama_dosen = 'Dian Setyorini, S.Si, M.Si', 
	@email = 'dian@gmail.com',
	@id_jenis_dosen = 'JDS002',
	@nama_bank = 'BCA',
	@cabang_bank = 'Jakarta',
	@no_rekening = '0320220100',
	@npwp = NULL,
	@tanggal_gabung_kampus = '2018-07-04',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'DIAN SETYORINI',
	@kota = 'Jakarta',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Sofia Debi Puspa, S.Si', 
	@email = 'sofia@gmail.com',
	@id_jenis_dosen = 'JDS002',
	@nama_bank = 'BCA',
	@cabang_bank = 'Bandung',
	@no_rekening = '0320220101',
	@npwp = NULL,
	@tanggal_gabung_kampus = '2022-07-06',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'SOFIA DEBI PUSPA',
	@kota = 'Bandung',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Soya Febeauty Y.O.P', 
	@email = 'soya@gmail.com',
	@id_jenis_dosen = 'JDS002',
	@nama_bank = 'BCA',
	@cabang_bank = 'Bekasi',
	@no_rekening = '0320220102',
	@npwp = NULL,
	@tanggal_gabung_kampus = '2022-07-07',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'SOYA FEBEUTY',
	@kota = 'Bekasi',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Abdul Syukur. SPdl', 
	@email = 'abdul@gmail.com',
	@id_jenis_dosen = 'JDS001',
	@nama_bank = 'BCA',
	@cabang_bank = 'Bogor',
	@no_rekening = '0320220103',
	@npwp = '123456789001005',
	@tanggal_gabung_kampus = '2018-07-04',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'ABDUL SYUKUR',
	@kota = 'Bogor',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Catharina Irawani', 
	@email = 'catharina@gmail.com',
	@id_jenis_dosen = 'JDS001',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220104',
	@npwp = '123456789',
	@tanggal_gabung_kampus = '2018-07-04',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'CATHARINA IRAWANI',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
DELETE FROM absensi WHERE id_absensi = 'ABS056'

EXEC sp_CreateDosen 
	@nama_dosen = 'Deasy Thresia', 
	@email = 'deasy@gmail.com',
	@id_jenis_dosen = 'JDS001',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220105',
	@npwp = '123456789001007',
	@tanggal_gabung_kampus = '2018-07-04',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'DEASY THRESIA',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Dian Setyorini, S.Si, M.Si', 
	@email = 'dian@gmail.com',
	@id_jenis_dosen = 'JDS001',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220106',
	@npwp = NULL,
	@tanggal_gabung_kampus = '2018-07-04',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'DIAN SETYORINI',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Dian Wahyunianto', 
	@email = 'dianw@gmail.com',
	@id_jenis_dosen = 'JDS001',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220107',
	@npwp = '123456789001007',
	@tanggal_gabung_kampus = '2022-07-09',
	@tanggal_gabung_industri = NULL,
	@status = 'AKTIF',
	@atasnama = 'DIAN SETYORINI',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS001',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Mirza Al Adhar', 
	@email = 'mirza@gmail.com',
	@id_jenis_dosen = 'JDS003',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220108',
	@npwp = '123456789001008',
	@tanggal_gabung_kampus = '2022-07-09',
	@tanggal_gabung_industri = '2018-06-09',
	@status = 'AKTIF',
	@atasnama = 'MIRZA AL ADHAR',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS002',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Yosep Kuma', 
	@email = 'yosep@gmail.com',
	@id_jenis_dosen = 'JDS003',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220108',
	@npwp = '123456789001008',
	@tanggal_gabung_kampus = '2023-06-09',
	@tanggal_gabung_industri = '2018-06-09',
	@status = 'AKTIF',
	@atasnama = 'YOSEP KUMA',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS003',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Herlaniadi', 
	@email = 'herlaniadi@gmail.com',
	@id_jenis_dosen = 'JDS003',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220109',
	@npwp = '123456789001009',
	@tanggal_gabung_kampus = '2023-06-09',
	@tanggal_gabung_industri = '2018-06-09',
	@status = 'AKTIF',
	@atasnama = 'HERLANIADI',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS003',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Ambar Sri Hudoyo', 
	@email = 'ambar@gmail.com',
	@id_jenis_dosen = 'JDS003',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220109',
	@npwp = '123456789001009',
	@tanggal_gabung_kampus = '2023-06-09',
	@tanggal_gabung_industri = '2018-06-09',
	@status = 'AKTIF',
	@atasnama = 'AMBAR SRI HUDOYO',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS003',
	@foto_dosen = NULL
GO
EXEC sp_CreateDosen 
	@nama_dosen = 'Gunardi', 
	@email = 'gunardi@gmail.com',
	@id_jenis_dosen = 'JDS003',
	@nama_bank = 'BCA',
	@cabang_bank = 'Cikarang',
	@no_rekening = '0320220109',
	@npwp = '123456789001009',
	@tanggal_gabung_kampus = '2023-06-09',
	@tanggal_gabung_industri = '2018-06-09',
	@status = 'AKTIF',
	@atasnama = 'GUNARDI',
	@kota = 'Cikarang',
	@id_perusahaan = 'PRS003',
	@foto_dosen = NULL

SELECT * FROM insentif_kehadiran_golongan
EXEC sp_CreateGolongan
	@nama = 'Golongan 1',
	@insentif_kehadiran = 25000,
	@tahun_batas_bawah = 0,
	@tahun_batas_atas = 2
GO
EXEC sp_CreateGolongan
	@nama = 'Golongan 2',
	@insentif_kehadiran = 35000,
	@tahun_batas_bawah = 2,
	@tahun_batas_atas = 5
GO
EXEC sp_CreateGolongan
	@nama = 'Golongan 3',
	@insentif_kehadiran = 50000,
	@tahun_batas_bawah = 5,
	@tahun_batas_atas = NULL

SELECT * FROM jenis_dosen
EXEC sp_CreateJenisDosen
	@nama_jenis = 'LUAR BIASA',
	@kompensasi_mengajar = 25000,
	@transport_mengajar = 30000,
	@persentase_pph21_npwp = 2.5,
	@persentase_pph21_nonnpwp = 3,
	@referensi_dosen = 'UMUM'
GO
EXEC sp_CreateJenisDosen
	@nama_jenis = 'LUAR BIASA (MATRIKULASI)',
	@kompensasi_mengajar = 25000,
	@transport_mengajar = 30000,
	@persentase_pph21_npwp = 2.5,
	@persentase_pph21_nonnpwp = 3,
	@referensi_dosen = 'UMUM'
GO
EXEC sp_CreateJenisDosen
	@nama_jenis = 'PARUH WAKTU INDUSTRI',
	@kompensasi_mengajar = 25000,
	@transport_mengajar = 30000,
	@persentase_pph21_npwp = 2.5,
	@persentase_pph21_nonnpwp = 3,
	@referensi_dosen = 'INDUSTRI'

SELECT * FROM matkul
EXEC sp_CreateMatkul @nama_matkul = 'Matematika', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Matematika 1', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Psikologi Industri & UU Perburuhan', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Psikologi Industri', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Teknik Supervisi', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Strategi Diagnosis', @sks = 2
GO
EXEC sp_CreateMatkul @nama_matkul = 'Organisasi dan Manajemen Bengkel', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Bahasa Inggris', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Pend. Agama Islam', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Pend. Agama Katholik', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Pend. Agama Protestan', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Pend. Pancasila', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Kewirausahaan', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Sistem Mutu Astra', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Bahasa Inggris 2', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Matematika 3', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Kewarganegaraan', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Bahasa Jepang', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Bahasa Indonesia', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Pend. Kewarganegaraan', @sks = 2 
GO
EXEC sp_CreateMatkul @nama_matkul = 'Bahasa Inggris Teknik 2', @sks = 2

SELECT * FROM perusahaan_astra
EXEC sp_CreatePerusahaan @nama_perusahaan = 'UMUM', @singkatan_perusahaan = 'UMUM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Otoparts Tbk', @singkatan_perusahaan = 'AOP'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Digital Internasional', @singkatan_perusahaan = 'ADI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Arya Kharisma', @singkatan_perusahaan = 'AK'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Autoprima', @singkatan_perusahaan = 'AAP'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Auto Trust', @singkatan_perusahaan = 'AAT'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Multi Trucks Indonesia', @singkatan_perusahaan = 'AMTI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Fuji Technica Indonesia', @singkatan_perusahaan = 'FTI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Gaya Motor', @singkatan_perusahaan = 'GM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Inti Pantja Press Industri', @singkatan_perusahaan = 'IPPI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Pulogadung Pawitra Laksana', @singkatan_perusahaan = 'PPL'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Tjahja Sakti Motor', @singkatan_perusahaan = 'TSM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Federal International Finance', @singkatan_perusahaan = 'FIF'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Asuransi Jiwa Astra', @singkatan_perusahaan = 'AJA'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Mitra Ventura', @singkatan_perusahaan = 'AMV'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Multi Finance', @singkatan_perusahaan = 'AMF'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Sedaya Finance', @singkatan_perusahaan = 'ASF'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Asuransi Astra Buana', @singkatan_perusahaan = 'AAB'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Cipta Sedaya Digital Indonesia', @singkatan_perusahaan = 'CSDI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Garda Era Sedaya', @singkatan_perusahaan = 'GES'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Matra Graha Sarana', @singkatan_perusahaan = 'MGS'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Sedaya Multi Investama', @singkatan_perusahaan = 'SMI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Sedaya Pratama', @singkatan_perusahaan = 'SP'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Sharia Multifinance Astra', @singkatan_perusahaan = 'SMA'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Swadharma Bhakti Sedaya Finance', @singkatan_perusahaan = 'SBSF'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT United Tractors Tbk', @singkatan_perusahaan = 'UT'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Agro Lestari Tbk', @singkatan_perusahaan = 'AAL'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Tol Nusantara', @singkatan_perusahaan = 'ATN'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Serasi Autoraya', @singkatan_perusahaan = 'SA'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Graphia Tbk', @singkatan_perusahaan = 'ASGR'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Menara Astra', @singkatan_perusahaan = 'MA'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Brahmayasa Bahtera', @singkatan_perusahaan = 'BB'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Samadista Karya', @singkatan_perusahaan = 'SK'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Toyota-Astra Motor', @singkatan_perusahaan = 'TAM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Daihatsu Motor', @singkatan_perusahaan = 'ADM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Isuzu Astra Motor Indonesia', @singkatan_perusahaan = 'IAMI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT UD Astra Motor Indonesia', @singkatan_perusahaan = 'AMI'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Traktor Nusantara', @singkatan_perusahaan = 'TN'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Astra Honda Motor', @singkatan_perusahaan = 'AHM'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Toyota Astra Financial Services', @singkatan_perusahaan = 'TAFS'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Komatsu Astra Finance', @singkatan_perusahaan = 'KAF'
GO
EXEC sp_CreatePerusahaan @nama_perusahaan = 'PT Bank Jasa Jakarta', @singkatan_perusahaan = 'BJJ'
GO

SELECT * FROM prodi
EXEC sp_CreateProdi @nama_prodi = 'Teknologi Rekayasa Logistik', @singkatan = 'TRL', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Teknologi Rekayasa Pemeliharaan Alat Barat', @singkatan = 'TAB', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Manajemen Informatika', @singkatan = 'MI', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Mekatronika', @singkatan = 'MK', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Mesin Otomotif', @singkatan = 'MO', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Teknologi Konstruksi Bangunan Gedung', @singkatan = 'TKBG', @transport = 'PER HARI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Teknologi Produksi dan Proses Manufaktur', @singkatan = 'TPM', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Pembuatan Peralatan dan Perkakas Produksi', @singkatan = 'P4', @transport = 'PER SEKALI MENGAJAR'
GO
EXEC sp_CreateProdi @nama_prodi = 'Teknik Sipil', @singkatan = 'TS', @transport = 'PER SEKALI MENGAJAR'
GO

SELECT * FROM users
EXEC sp_CreateUser @nama = 'Fikri', @username = 'fikri', @password = 'fikri', @role = 'DAAA'
GO
EXEC sp_CreateUser @nama = 'Rahmat', @username = 'rahmat', @password = 'rahmat', @role = 'ADMIN'
SELECT * FROM users