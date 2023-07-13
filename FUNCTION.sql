DROP FUNCTION getReportProdi
CREATE FUNCTION getReportProdi(@start DATE, @end DATE, @id_jenis_dosen VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT singkatan, nama_prodi, SUM(gross_up) AS gross_up, SUM(pph21) AS pph21, SUM(net_income) AS net_income FROM view_report_prodi
	WHERE tanggal_mengajar BETWEEN @start and @end
	AND id_jenis_dosen = @id_jenis_dosen
	GROUP BY singkatan, nama_prodi
)
SELECT * FROM dbo.getReportProdi('2023-06-16', '2023-07-15', 'JDS002')

DROP FUNCTION getReportDosen
CREATE FUNCTION getReportDosen(@start DATE, @end DATE, @id_jenis_dosen VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT 
		id_dosen, nama_dosen, 
		SUM(kompensasi_mengajar) as kompensasi_mengajar,
		SUM(transport_mengajar) as transport_mengajar,
		SUM(insentif_kehadiran) as insentif_kehadiran,
		SUM(insentif_kehadiran+kompensasi_mengajar+transport_mengajar) as total,
		SUM(insentif_kehadiran+kompensasi_mengajar+transport_mengajar)+SUM(pph21) as gross_up,
		SUM(pph21) as pph21,
		SUM(insentif_kehadiran+kompensasi_mengajar+transport_mengajar) as net_income,
		SUM(persentase_pph21)/COUNT(id_dosen) as persentase_pph21,
		npwp FROM view_report_dosen
	WHERE tanggal_mengajar BETWEEN @start and @end
	AND id_jenis_dosen = @id_jenis_dosen
	GROUP BY id_dosen, nama_dosen, npwp
)
SELECT * FROM dbo.getReportDosen('2023-06-16', '2023-07-15', 'JDS002')

DROP FUNCTION getReportTransfer
CREATE FUNCTION getReportTransfer(@start DATE, @end DATE, @id_jenis_dosen VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
	SELECT 
		id_dosen, nama_dosen, nama_bank, cabang_bank,
		kota, no_rekening, atasnama,
		SUM(total) as total
		FROM view_report_Transfer
	WHERE tanggal_mengajar BETWEEN @start and @end
	AND id_jenis_dosen = @id_jenis_dosen
	GROUP BY id_dosen, nama_dosen, nama_bank, cabang_bank, kota, no_rekening, atasnama
)
SELECT * FROM dbo.getReportTransfer('2023-06-16', '2023-07-15', 'JDS002')

select id_absensi, dosen.id_dosen, id_jenis_dosen, nama_dosen, tanggal_mengajar from absensi 
JOIN dosen ON dosen.id_dosen = absensi.id_dosen

DROP FUNCTION getReportSlipGaji
CREATE FUNCTION getReportSlipGaji(@id_dosen VARCHAR(10), @start DATE, @end DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		dosen.id_dosen, nama_dosen,
		dbo.getListMatkulAbsensi(@id_dosen, @start, @end) as list_matkul,
		dbo.getListProdiAbsensi(@id_dosen, @start, @end) as list_prodi,
		SUM(kompensasi_mengajar) as kompensasi_mengajar,
		SUM(transport_mengajar) as transport_mengajar,
		SUM(insentif_kehadiran) as insentif_kehadiran,
		SUM(pph21) as tunjangan_pph21,
		SUM(pph21) as potongan_pph21,
		SUM(kompensasi_mengajar+transport_mengajar+insentif_kehadiran) as total_pendapatan,
		SUM(pph21) as total_potongan,
		SUM(kompensasi_mengajar+transport_mengajar+insentif_kehadiran) as total_dibayar,
		SUM(kompensasi_mengajar)/SUM(absensi.sks) as insentif_kehadiran_per_sks,
		SUM(absensi.sks) as jumlah_sks
		FROM absensi
	JOIN dosen ON dosen.id_dosen = absensi.id_dosen
	JOIN matkul ON matkul.id_matkul = absensi.id_matkul
	JOIN prodi ON prodi.id_prodi = absensi.id_prodi
	WHERE absensi.id_dosen = @id_dosen 
	AND tanggal_mengajar BETWEEN @start and @end
	GROUP BY dosen.id_dosen, nama_dosen, npwp
)
SELECT * FROM getReportSlipGaji('DSN002', '2023-06-16', '2023-07-15')

CREATE FUNCTION dbo.getListMatkulAbsensi (@id_dosen VARCHAR(10), @start DATE, @end DATE)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @list_matkul VARCHAR(100)

    SELECT @list_matkul = STRING_AGG(nama_matkul, ', ')
    FROM (
        SELECT DISTINCT matkul.id_matkul, nama_matkul
        FROM absensi
        JOIN matkul ON matkul.id_matkul = absensi.id_matkul
        WHERE absensi.id_dosen = @id_dosen
        AND absensi.tanggal_mengajar BETWEEN @start AND @end
    ) AS unique_matkul

    RETURN @list_matkul
END

DROP FUNCTION dbo.getListProdiAbsensi
CREATE FUNCTION dbo.getListProdiAbsensi(@id_dosen VARCHAR(10), @start DATE, @end DATE)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @list_prodi VARCHAR(100)

    SELECT @list_prodi = STRING_AGG(nama_prodi, ', ')
    FROM (
        SELECT DISTINCT prodi.id_prodi, nama_prodi
        FROM absensi
        JOIN prodi ON prodi.id_prodi = absensi.id_prodi
        WHERE absensi.id_dosen = @id_dosen
        AND absensi.tanggal_mengajar BETWEEN @start AND @end
    ) AS unique_prodi

    RETURN @list_prodi
END

CREATE FUNCTION dbo.getListUsers
(
    @nama VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM users
    WHERE nama LIKE '%' + ISNULL(@nama, '') + '%'
	AND role = 'DAAA'
)
SELECT * FROM dbo.getListUsers(null)

CREATE FUNCTION dbo.getListProdi
(
    @nama_prodi VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM prodi
    WHERE nama_prodi LIKE '%' + ISNULL(@nama_prodi, '') + '%'
)
SELECT * FROM dbo.getListProdi('Teknologi')

CREATE FUNCTION dbo.getListMatkul
(
    @nama_matkul VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM matkul
    WHERE nama_matkul LIKE '%' + ISNULL(@nama_matkul, '') + '%'
)
SELECT * FROM dbo.getListMatkul('Mat')

CREATE FUNCTION dbo.getListJenisDosen
(
    @nama_jenis VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM jenis_dosen
    WHERE nama_jenis LIKE '%' + ISNULL(@nama_jenis, '') + '%'
)
SELECT * FROM getListJenisDosen(NULL)

CREATE FUNCTION dbo.getSpecificJenisDosen
(
    @id_jenis_dosen VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    select * from jenis_dosen where id_jenis_dosen = @id_jenis_dosen
)
SELECT * FROM getSpecificJenisDosen('JDS001')

DROP FUNCTION dbo.getListDosen
CREATE FUNCTION dbo.getListDosen
(
    @nama_dosen VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT dosen.*, nama_perusahaan as asal_perusahaan, jenis_dosen.nama_jenis
    FROM dosen
	JOIN jenis_dosen ON dosen.id_jenis_dosen = jenis_dosen.id_jenis_dosen
	LEFT JOIN perusahaan_astra ON perusahaan_astra.id_perusahaan = dosen.id_perusahaan
    WHERE nama_dosen LIKE '%' + ISNULL(@nama_dosen, '') + '%'
	AND status = 'AKTIF'
)
SELECT * FROM getListDosen(null)

CREATE FUNCTION dbo.getListAbsensi
(
    @start_date DATE,
    @end_date DATE,
    @id_jenis_dosen VARCHAR(10),
    @filter VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
	SELECT absensi.id_absensi, dosen.nama_dosen, matkul.nama_matkul, prodi.nama_prodi, absensi.kelas, 
		   absensi.tanggal_mengajar, absensi.sks, absensi.kompensasi_mengajar, absensi.insentif_kehadiran, 
		   absensi.transport_mengajar, absensi.pph21, absensi.persentase_pph21
	FROM absensi
	INNER JOIN dosen ON dosen.id_dosen = absensi.id_dosen AND dosen.id_jenis_dosen = @id_jenis_dosen
	INNER JOIN matkul ON matkul.id_matkul = absensi.id_matkul
	INNER JOIN prodi ON prodi.id_prodi = absensi.id_prodi
	INNER JOIN users ON users.id_user = absensi.id_user
	WHERE absensi.tanggal_mengajar BETWEEN @start_date AND @end_date
	AND (dosen.nama_dosen LIKE '%' + ISNULL(@filter, '') + '%'
		OR matkul.nama_matkul LIKE '%' + ISNULL(@filter, '') + '%'
		OR prodi.nama_prodi LIKE '%' + ISNULL(@filter, '') + '%'
		OR absensi.kelas LIKE '%' + ISNULL(@filter, '') + '%')
)
SELECT * FROM dbo.getListAbsensi('2023-06-16', '2023-07-15', 'JDS003', NULL)

DROP FUNCTION dbo.getListAbsensi2
CREATE FUNCTION dbo.getListAbsensi2
(
    @start_date DATE,
    @end_date DATE,
    @id_jenis_dosen VARCHAR(10),
    @filter VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM (
		SELECT id_absensi, nama_dosen, nama_matkul, nama_prodi, kelas, tanggal_mengajar, absensi.sks,
		absensi.kompensasi_mengajar, absensi.insentif_kehadiran, absensi.transport_mengajar, absensi.pph21,
		absensi.persentase_pph21
		FROM absensi
		INNER JOIN dosen ON dosen.id_dosen = absensi.id_dosen AND dosen.id_jenis_dosen = @id_jenis_dosen
		INNER JOIN matkul ON matkul.id_matkul = absensi.id_matkul
		INNER JOIN prodi ON prodi.id_prodi = absensi.id_prodi
		INNER JOIN users ON users.id_user = absensi.id_user
		WHERE absensi.tanggal_mengajar BETWEEN @start_date AND @end_date
	) absensi
	WHERE absensi.nama_dosen LIKE '%' + ISNULL(@filter, '') + '%'
    OR absensi.nama_matkul LIKE '%' + ISNULL(@filter, '') + '%'
    OR absensi.nama_prodi LIKE '%' + ISNULL(@filter, '') + '%'
    OR absensi.kelas LIKE '%' + ISNULL(@filter, '') + '%'
)
SELECT * FROM dbo.getListAbsensi2('2023-06-16', '2023-07-15', 'JDS003', NULL)

-- Function untuk generate ID otomatis
CREATE FUNCTION GenerateUserID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @usr_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_user, 3))
  FROM users
  WHERE id_user LIKE 'USR%'

  -- Cek apakah tabel user masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @usr_id = 'USR001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @usr_id = 'USR' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @usr_id
END
SELECT dbo.GenerateUserID() as userid

DROP FUNCTION VerifyUser
CREATE FUNCTION VerifyUser
  (@username VARCHAR(100), @password VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
  SELECT *
  FROM users
  WHERE username = @username AND password = CONVERT(VARCHAR(32), HASHBYTES('MD5', @password), 2)
)
SELECT * FROM dbo.VerifyUser('rahmat', 'rahmat')
SELECT * FROM dbo.VerifyUser('fikri', 'fikri')

-- Fungsi untuk menghasilkan ID matkul yang unik dan berurutan
CREATE FUNCTION GenerateMatkulID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @matkul_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_matkul, 3))
  FROM matkul
  WHERE id_matkul LIKE 'MAT%'

  -- Cek apakah tabel matkul masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @matkul_id = 'MAT001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @matkul_id = 'MAT' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @matkul_id
END

SELECT dbo.GenerateMatkulID()

-- Fungsi untuk menghasilkan ID prodi yang unik dan berurutan
CREATE FUNCTION GenerateProdiID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @prodi_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_prodi, 3))
  FROM prodi
  WHERE id_prodi LIKE 'PRO%'

  -- Cek apakah tabel prodi masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @prodi_id = 'PRO001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @prodi_id = 'PRO' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @prodi_id
END
SELECT dbo.GenerateProdiID()

-- Fungsi untuk menghasilkan ID jenis_dosen yang unik dan berurutan
CREATE FUNCTION GenerateJenisDosenID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @jenis_dosen_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_jenis_dosen, 3))
  FROM jenis_dosen
  WHERE id_jenis_dosen LIKE 'JDS%'

  -- Cek apakah tabel jenis_dosen masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @jenis_dosen_id = 'JDS001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @jenis_dosen_id = 'JDS' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @jenis_dosen_id
END
SELECT dbo.GenerateJenisDosenID()

CREATE FUNCTION GenerateGolonganID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @golongan_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_golongan, 3))
  FROM insentif_kehadiran_golongan
  WHERE id_golongan LIKE 'GOL%'

  -- Cek apakah tabel jenis_dosen masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @golongan_id = 'GOL001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @golongan_id = 'GOL' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @golongan_id
END
SELECT dbo.GenerateGolonganID()

CREATE FUNCTION dbo.getListGolongan
(
    @nama_golongan VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM insentif_kehadiran_golongan
    WHERE nama LIKE '%' + ISNULL(@nama_golongan, '') + '%'
)
SELECT * FROM getListGolongan('Gol')

-- Fungsi untuk menghasilkan ID perusahaan yang unik dan berurutan
CREATE FUNCTION GeneratePerusahaanID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @perusahaan_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_perusahaan, 3))
  FROM perusahaan_astra
  WHERE id_perusahaan LIKE 'PRS%'

  -- Cek apakah tabel dosen masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @perusahaan_id = 'PRS001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @perusahaan_id = 'PRS' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @perusahaan_id
END

CREATE FUNCTION dbo.getListPerusahaan
(
    @nama_perusahaan VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM perusahaan_astra
    WHERE nama_perusahaan LIKE '%' + ISNULL(@nama_perusahaan, '') + '%'
)
SELECT * FROM getListPerusahaan(null)

-- Fungsi untuk menghasilkan ID dosen yang unik dan berurutan
CREATE FUNCTION GenerateDosenID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @dosen_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_dosen, 3))
  FROM dosen
  WHERE id_dosen LIKE 'DSN%'

  -- Cek apakah tabel dosen masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @dosen_id = 'DSN001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @dosen_id = 'DSN' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @dosen_id
END
SELECT dbo.GenerateDosenID()

-- FUNCTION NPWP OR NO
DROP FUNCTION dbo.GetPersentasePPh21
CREATE FUNCTION dbo.GetPersentasePPh21 (@id_dosen VARCHAR(10))
RETURNS DECIMAL(5,3)
AS
BEGIN
    DECLARE @persentase DECIMAL(5,2)
	DECLARE @npwp VARCHAR(16)

	SELECT @npwp = npwp FROM dosen WHERE id_dosen = @id_dosen

    IF @npwp IS NULL
        SET @persentase = 3.0;
    ELSE
        SET @persentase = 2.5;

    RETURN (100-@persentase)/100;
END;
SELECT dbo.GetPersentasePPh21('DSN001')

CREATE FUNCTION dbo.GetSKSTransport(@id_prodi VARCHAR(10), @id_matkul VARCHAR(10), @sks_absen INT)
RETURNS INT
AS
BEGIN
    DECLARE @sks_matkul INT
	DECLARE @transport VARCHAR(100)

    SELECT @transport = transport FROM prodi 
	WHERE id_prodi = @id_prodi

	SELECT @sks_matkul = sks FROM matkul
	WHERE id_matkul = @id_matkul

	IF @transport = 'PER HARI MENGAJAR'
		RETURN 1
	
	RETURN @sks_absen/@sks_matkul
END;

CREATE FUNCTION GenerateAbsensiID()
RETURNS VARCHAR(10)
AS
BEGIN
  DECLARE @absensi_id VARCHAR(10)
  DECLARE @LastID INT

  SELECT @LastID = MAX(RIGHT(id_absensi, 3))
  FROM absensi
  WHERE id_absensi LIKE 'ABS%'

  -- Cek apakah tabel absensi masih kosong
  IF (@LastID IS NULL)
  BEGIN
    SET @absensi_id = 'ABS001' -- ID pertama jika tabel kosong
  END
  ELSE
  BEGIN
    SET @absensi_id = 'ABS' + RIGHT('000' + CAST(@LastID + 1 AS VARCHAR(3)), 3)
  END

  RETURN @absensi_id
END