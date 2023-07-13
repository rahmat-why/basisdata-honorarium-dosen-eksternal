-- Stored procedure untuk membuat pengguna baru
CREATE PROCEDURE sp_CreateUser
  @nama VARCHAR(100),
  @username VARCHAR(100),
  @password VARCHAR(100),
  @role VARCHAR(10)
AS
BEGIN
  DECLARE @id_user VARCHAR(10)
  SET @id_user = dbo.GenerateUserID()
  
  INSERT INTO users (id_user, nama, username, password, role)
  VALUES (@id_user, @nama, @username, CONVERT(VARCHAR(32), HASHBYTES('MD5', @password), 2), @role)
END
EXEC sp_CreateUser 'Rahmat', 'rahmat', 'rahmat', 'ADMIN';

-- Stored procedure untuk mengubah data pengguna
CREATE PROCEDURE sp_UpdateUser
  @id_user VARCHAR(10),
  @nama VARCHAR(100),
  @username VARCHAR(100),
  @password VARCHAR(100),
  @role VARCHAR(10)
AS
BEGIN
  UPDATE users
  SET nama = @nama, username = @username, password = CONVERT(VARCHAR(32), HASHBYTES('MD5', @password), 2), role = @role
  WHERE id_user = @id_user
END

-- Stored procedure untuk menghapus pengguna
CREATE PROCEDURE sp_DeleteUser
  @id_user VARCHAR(10)
AS
BEGIN
  DELETE FROM users
  WHERE id_user = @id_user
END

-- Stored procedure untuk membuat data matkul baru
CREATE PROCEDURE sp_CreateMatkul
  @nama_matkul VARCHAR(100),
  @sks INT
AS
BEGIN
  DECLARE @id_matkul VARCHAR(10)
  
  SET @id_matkul = dbo.GenerateMatkulID() -- Menghasilkan ID matkul baru
  
  -- Insert data matkul baru ke tabel
  INSERT INTO matkul (id_matkul, nama_matkul, sks)
  VALUES (@id_matkul, @nama_matkul, @sks)
END

-- Stored procedure untuk mengubah data matkul
CREATE PROCEDURE sp_UpdateMatkul
  @id_matkul VARCHAR(10),
  @nama_matkul VARCHAR(100),
  @sks INT
AS
BEGIN
  -- Update data matkul berdasarkan ID matkul
  UPDATE matkul
  SET nama_matkul = @nama_matkul,
      sks = @sks
  WHERE id_matkul = @id_matkul
END


-- Stored procedure untuk menghapus data matkul
CREATE PROCEDURE sp_DeleteMatkul
  @id_matkul VARCHAR(10)
AS
BEGIN
  -- Hapus data matkul berdasarkan ID matkul
  DELETE FROM matkul
  WHERE id_matkul = @id_matkul
END
GO

-- Stored procedure untuk membuat data prodi baruD
CREATE PROCEDURE sp_CreateProdi
  @nama_prodi VARCHAR(100),
  @singkatan VARCHAR(10),
  @transport VARCHAR(50)
AS
BEGIN
  DECLARE @id_prodi VARCHAR(10)
  
  SET @id_prodi = dbo.GenerateProdiID() -- Menghasilkan ID prodi baru
  
  -- Insert data prodi baru ke tabel
  INSERT INTO prodi (id_prodi, nama_prodi, singkatan, transport)
  VALUES (@id_prodi, @nama_prodi, @singkatan, @transport)
END

-- Stored procedure untuk mengubah data prodi
CREATE PROCEDURE sp_UpdateProdi
  @id_prodi VARCHAR(10),
  @nama_prodi VARCHAR(100),
  @singkatan VARCHAR(10),
  @transport VARCHAR(100)
AS
BEGIN
  -- Update data prodi berdasarkan ID prodi
  UPDATE prodi
  SET nama_prodi = @nama_prodi,
      singkatan = @singkatan,
      transport = @transport
  WHERE id_prodi = @id_prodi
END

-- Stored procedure untuk menghapus data prodi
CREATE PROCEDURE sp_DeleteProdi
  @id_prodi VARCHAR(10)
AS
BEGIN
  -- Hapus data prodi berdasarkan ID prodi
  DELETE FROM prodi
  WHERE id_prodi = @id_prodi
END

-- Stored procedure untuk membuat data jenis_dosen baru
CREATE PROCEDURE sp_CreateJenisDosen
    @nama_jenis VARCHAR(100),
    @kompensasi_mengajar MONEY,
    @transport_mengajar MONEY,
    @persentase_pph21_npwp FLOAT,
    @persentase_pph21_nonnpwp FLOAT,
    @referensi_dosen VARCHAR(100)
AS
BEGIN
	DECLARE @id_jenis_dosen VARCHAR(10)
  
	SET @id_jenis_dosen = dbo.GenerateJenisDosenID() -- Menghasilkan ID jenis dosen baru

    INSERT INTO jenis_dosen (id_jenis_dosen, nama_jenis, kompensasi_mengajar, transport_mengajar, persentase_pph21_npwp, persentase_pph21_nonnpwp, referensi_dosen)
    VALUES (@id_jenis_dosen, @nama_jenis, @kompensasi_mengajar, @transport_mengajar, @persentase_pph21_npwp, @persentase_pph21_nonnpwp, @referensi_dosen);
END

SELECT * FROM jenis_dosen

-- Stored procedure untuk mengubah data jenis_dosen
CREATE PROCEDURE sp_UpdateJenisDosen
    @id_jenis_dosen VARCHAR(10),
    @nama_jenis VARCHAR(100),
    @kompensasi_mengajar MONEY,
    @transport_mengajar MONEY,
    @persentase_pph21_npwp FLOAT,
    @persentase_pph21_nonnpwp FLOAT,
    @referensi_dosen VARCHAR(100)
AS
BEGIN
    UPDATE jenis_dosen
    SET nama_jenis = @nama_jenis,
        kompensasi_mengajar = @kompensasi_mengajar,
        transport_mengajar = @transport_mengajar,
        persentase_pph21_npwp = @persentase_pph21_npwp,
        persentase_pph21_nonnpwp = @persentase_pph21_nonnpwp,
        referensi_dosen = @referensi_dosen
    WHERE id_jenis_dosen = @id_jenis_dosen;
END

-- Stored procedure untuk menghapus data jenis_dosen
CREATE PROCEDURE sp_DeleteJenisDosen
    @id_jenis_dosen VARCHAR(10)
AS
BEGIN
    DELETE FROM jenis_dosen
    WHERE id_jenis_dosen = @id_jenis_dosen;
END

CREATE PROCEDURE sp_CreateGolongan
    @nama VARCHAR(100),
    @insentif_kehadiran MONEY,
    @tahun_batas_bawah INT,
    @tahun_batas_atas INT
AS
BEGIN
    DECLARE @id_golongan VARCHAR(10);
    SET @id_golongan = dbo.GenerateGolonganID();

    INSERT INTO insentif_kehadiran_golongan (id_golongan, nama, insentif_kehadiran, tahun_batas_bawah, tahun_batas_atas)
    VALUES (@id_golongan, @nama, @insentif_kehadiran, @tahun_batas_bawah, @tahun_batas_atas);
END
EXEC sp_CreateGolongan 'Golongan 3', 50000, 5, null

CREATE PROCEDURE sp_UpdateGolongan
    @id_golongan VARCHAR(10),
    @nama VARCHAR(100),
    @insentif_kehadiran MONEY,
    @tahun_batas_bawah INT,
    @tahun_batas_atas INT
AS
BEGIN
    UPDATE insentif_kehadiran_golongan
    SET nama = @nama, insentif_kehadiran = @insentif_kehadiran,
        tahun_batas_bawah = @tahun_batas_bawah, tahun_batas_atas = @tahun_batas_atas
    WHERE id_golongan = @id_golongan;
END

CREATE PROCEDURE sp_DeleteGolongan
    @id_golongan VARCHAR(10)
AS
BEGIN
    DELETE FROM insentif_kehadiran_golongan
    WHERE id_golongan = @id_golongan;
END

CREATE PROCEDURE sp_CreatePerusahaan
    @nama_perusahaan VARCHAR(100)
AS
BEGIN
	DECLARE @id_perusahaan VARCHAR(10);
	SET @id_perusahaan = dbo.GeneratePerusahaanID()

    INSERT INTO perusahaan_astra (id_perusahaan, nama_perusahaan)
    VALUES (@id_perusahaan, @nama_perusahaan)
END

CREATE PROCEDURE sp_UpdatePerusahaan
    @id_perusahaan VARCHAR(10),
    @nama_perusahaan VARCHAR(100)
AS
BEGIN
    UPDATE perusahaan_astra
    SET nama_perusahaan = @nama_perusahaan
    WHERE id_perusahaan = @id_perusahaan
END

CREATE PROCEDURE sp_DeletePerusahaan
    @id_perusahaan VARCHAR(10)
AS
BEGIN
    DELETE FROM perusahaan_astra
    WHERE id_perusahaan = @id_perusahaan
END

-- Stored procedure untuk membuat data dosen baru
CREATE PROCEDURE sp_CreateDosen
  @nama_dosen VARCHAR(100),
  @email VARCHAR(100),
  @id_jenis_dosen VARCHAR(10),
  @nama_bank VARCHAR(30),
  @cabang_bank VARCHAR(30),
  @no_rekening VARCHAR(20),
  @npwp VARCHAR(16),
  @tanggal_gabung_kampus DATE,
  @tanggal_gabung_industri DATE,
  @status VARCHAR(20),
  @atasnama VARCHAR(30),
  @kota VARCHAR(20),
  @id_perusahaan VARCHAR(10),
  @foto_dosen IMAGE
AS
BEGIN
  DECLARE @id_dosen VARCHAR(10)
  
  SET @id_dosen = dbo.GenerateDosenID() -- Menghasilkan ID dosen baru
  
  -- Insert data dosen baru ke tabel
  INSERT INTO dosen (id_dosen, nama_dosen, email, id_jenis_dosen, nama_bank, cabang_bank, no_rekening, npwp, tanggal_gabung_kampus, tanggal_gabung_industri, status, atasnama, kota, id_perusahaan, foto_dosen)
  VALUES (@id_dosen, @nama_dosen, @email, @id_jenis_dosen, @nama_bank, @cabang_bank, @no_rekening, @npwp, @tanggal_gabung_kampus, @tanggal_gabung_industri, @status, @atasnama, @kota, @id_perusahaan, @foto_dosen)
END
select * from dosen

-- Stored procedure untuk mengubah data dosen
CREATE PROCEDURE sp_UpdateDosen
  @id_dosen VARCHAR(10),
  @nama_dosen VARCHAR(100),
  @email VARCHAR(100),
  @id_jenis_dosen VARCHAR(10),
  @nama_bank VARCHAR(30),
  @cabang_bank VARCHAR(30),
  @no_rekening VARCHAR(20),
  @npwp VARCHAR(16),
  @tanggal_gabung_kampus DATE,
  @tanggal_gabung_industri DATE,
  @status VARCHAR(20),
  @atasnama VARCHAR(30),
  @kota VARCHAR(20),
  @id_perusahaan VARCHAR(10),
  @foto_dosen IMAGE
AS
BEGIN
  -- Update data dosen berdasarkan ID dosen
    UPDATE dosen
	SET nama_dosen = @nama_dosen,
		email = @email,
		id_jenis_dosen = @id_jenis_dosen,
		nama_bank = @nama_bank,
		cabang_bank = @cabang_bank,
		no_rekening = @no_rekening,
		npwp = @npwp,
		tanggal_gabung_kampus = @tanggal_gabung_kampus,
		tanggal_gabung_industri = @tanggal_gabung_industri,
		status = @status,
		atasnama = @atasnama,
		kota = @kota,
		id_perusahaan = @id_perusahaan,
		foto_dosen = @foto_dosen
	WHERE id_dosen = @id_dosen
END
SELECT * FROM jenis_dosen

-- Stored procedure untuk menghapus data dosen
CREATE PROCEDURE sp_DeleteDosen
  @id_dosen VARCHAR(10)
AS
BEGIN
  -- Hapus data dosen berdasarkan ID dosen
  DELETE FROM dosen
  WHERE id_dosen = @id_dosen
END

-- FUNCTION INSENTIF GOLONGAN
CREATE FUNCTION dbo.GetInsentifGolongan (@id_dosen VARCHAR(10))
RETURNS MONEY
AS
BEGIN
    DECLARE @id_jenis_dosen VARCHAR(10)
    DECLARE @tanggal_gabung DATE
    DECLARE @lama_bergabung INT
	DECLARE @insentif FLOAT

    SELECT 
        @id_jenis_dosen = jenis_dosen.id_jenis_dosen, 
        @tanggal_gabung = CASE WHEN jenis_dosen.referensi_dosen = 'INDUSTRI' THEN dosen.tanggal_gabung_industri ELSE dosen.tanggal_gabung_kampus END
    FROM dosen
    JOIN jenis_dosen ON dosen.id_jenis_dosen = jenis_dosen.id_jenis_dosen
    WHERE id_dosen = @id_dosen;

    SET @lama_bergabung = DATEDIFF(DAY, @tanggal_gabung, GETDATE());

	SELECT @insentif = insentif_kehadiran FROM insentif_kehadiran_golongan WHERE
	@lama_bergabung > tahun_batas_bawah*365 AND @lama_bergabung <= CASE WHEN tahun_batas_atas IS NULL THEN @lama_bergabung ELSE tahun_batas_atas * 365 END

	RETURN @insentif;
END;
SELECT dbo.GetInsentifGolongan('DSN006')
update dosen set npwp = null where id_dosen = 'DSN001'

DROP PROC sp_CalculateHonor
CREATE PROCEDURE sp_CalculateHonor
	@id_dosen VARCHAR(10),
	@id_prodi VARCHAR(10),
	@sks_absen INT,
	@id_matkul VARCHAR(10)
AS
BEGIN
	-- constanta
	DECLARE @id_jenis_dosen VARCHAR(10)
	DECLARE @insentif_kehadiran_dosen MONEY
	DECLARE @kompensasi_mengajar_dosen MONEY
	DECLARE @transport_mengajar_dosen MONEY
	DECLARE @persentase_pph21_dosen MONEY
	DECLARE @sks_matkul INT
	DECLARE @sks_transport INT

	-- perhitungan
	DECLARE @insentif_kehadiran MONEY
	DECLARE @kompensasi_mengajar MONEY
	DECLARE @transport_mengajar MONEY
	DECLARE @total_net MONEY
	DECLARE @potongan_pph21 MONEY

	SELECT @id_jenis_dosen = id_jenis_dosen 
	FROM dosen WHERE id_dosen = @id_dosen

	SELECT @sks_matkul = sks
	FROM matkul WHERE id_matkul = @id_matkul

	SET @insentif_kehadiran_dosen = dbo.GetInsentifGolongan(@id_dosen)
	SET @persentase_pph21_dosen = dbo.GetPersentasePPh21(@id_dosen)
	SET @sks_transport = dbo.GetSKSTransport(@id_prodi, @id_matkul, @sks_absen)

	SELECT 
	@kompensasi_mengajar_dosen = kompensasi_mengajar,
	@transport_mengajar_dosen = transport_mengajar
	FROM jenis_dosen WHERE id_jenis_dosen = @id_jenis_dosen

	SET @insentif_kehadiran = @insentif_kehadiran_dosen*@sks_absen
	SET @kompensasi_mengajar = @kompensasi_mengajar_dosen*@sks_absen
	SET @transport_mengajar = @transport_mengajar_dosen*@sks_transport
	SET @total_net = @insentif_kehadiran+@kompensasi_mengajar+@transport_mengajar
	SET @potongan_pph21 = @total_net/@persentase_pph21_dosen-@total_net

	SELECT 
	@insentif_kehadiran as insentif_kehadiran, 
	@kompensasi_mengajar as kompensasi_mengajar, 
	@transport_mengajar as transport_mengajar,
	@total_net as total_net,
	@potongan_pph21 as potongan_pph21,
	(1-@persentase_pph21_dosen)*100 as persentase_pph21
END

SELECT nama_dosen, jenis_dosen.* FROM dosen
JOIN jenis_dosen ON dosen.id_jenis_dosen = jenis_dosen.id_jenis_dosen
WHERE id_dosen = 'DSN002'

DROP PROC sp_CreateAbsensi
CREATE PROCEDURE sp_CreateAbsensi
    @id_dosen VARCHAR(10),
    @id_matkul VARCHAR(10),
    @id_prodi VARCHAR(10),
    @id_user VARCHAR(10),
    @kelas VARCHAR(10),
    @tanggal_mengajar DATE,
    @sks INT
AS
BEGIN
	DECLARE @id_absensi VARCHAR(10)
	DECLARE @insentif_kehadiran MONEY
	DECLARE @kompensasi_mengajar MONEY
	DECLARE @transport_mengajar MONEY
	DECLARE @potongan_pph21 MONEY
	DECLARE @persentase_pph21 FLOAT

	SET @id_absensi = dbo.GenerateAbsensiID()

	-- Declare a table variable to store the result
	DECLARE @HonorSummary TABLE (
		insentif_kehadiran MONEY,
		kompensasi_mengajar MONEY,
		transport_mengajar MONEY,
		total_net MONEY,
		potongan_pph21 MONEY,
		persentase_pph21 FLOAT
	);

	-- Execute the stored procedure and insert the result into the table variable
	INSERT INTO @HonorSummary
	EXEC sp_CalculateHonor @id_dosen, @id_prodi, @sks, @id_matkul;

	-- Query the table variable
	SELECT 
		@insentif_kehadiran = insentif_kehadiran,
		@kompensasi_mengajar = kompensasi_mengajar,
		@transport_mengajar = transport_mengajar,
		@potongan_pph21 = potongan_pph21,
		@persentase_pph21 = persentase_pph21
		FROM @HonorSummary;

    -- Lakukan operasi yang diinginkan, misalnya:
    INSERT INTO absensi (id_absensi, id_dosen, id_matkul, id_prodi, id_user, kelas, tanggal_mengajar, sks, kompensasi_mengajar, insentif_kehadiran, transport_mengajar, pph21, persentase_pph21)
    VALUES (@id_absensi, @id_dosen, @id_matkul, @id_prodi, @id_user, @kelas, @tanggal_mengajar, @sks, @kompensasi_mengajar, @insentif_kehadiran, @transport_mengajar, @potongan_pph21, @persentase_pph21)
END

CREATE PROCEDURE sp_DeleteAbsensi
  @id_absensi VARCHAR(10)
AS
BEGIN
  DELETE FROM absensi
  WHERE id_absensi = @id_absensi;
END