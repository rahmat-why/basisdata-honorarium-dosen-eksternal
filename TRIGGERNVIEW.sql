CREATE TRIGGER trigger_log_aktivitas 
ON absensi
AFTER INSERT, DELETE
AS
BEGIN
    DECLARE @RandomNumber INT
    SET @RandomNumber = CAST(RAND() * 1000000 AS INT)

    IF EXISTS(SELECT 1 FROM inserted)
    BEGIN
        -- Insert operation
        INSERT INTO log_aktivitas (id_log, id_user, aktivitas, waktu_aktivitas)
        SELECT @RandomNumber, id_user, CONCAT('Insert ', id_absensi), GETDATE()
        FROM inserted
    END

    IF EXISTS(SELECT 1 FROM deleted)
    BEGIN
        -- Delete operation
        INSERT INTO log_aktivitas (id_log, id_user, aktivitas, waktu_aktivitas)
        SELECT @RandomNumber, id_user, CONCAT('Delete ', id_absensi), GETDATE()
        FROM deleted
    END
END

CREATE VIEW view_report_prodi AS 
SELECT 
	singkatan, nama_prodi,
	insentif_kehadiran+absensi.kompensasi_mengajar+absensi.transport_mengajar + pph21 as gross_up,
	pph21,
	insentif_kehadiran+absensi.kompensasi_mengajar+absensi.transport_mengajar as net_income,
	tanggal_mengajar, dosen.id_jenis_dosen
FROM absensi
	JOIN matkul ON absensi.id_matkul = matkul.id_matkul
	JOIN prodi ON prodi.id_prodi = absensi.id_prodi
	JOIN dosen ON dosen.id_dosen = absensi.id_dosen
	JOIN jenis_dosen ON jenis_dosen.id_jenis_dosen = dosen.id_jenis_dosen

SELECT * FROM view_report_prodi

CREATE VIEW view_report_dosen AS
SELECT 
    dosen.id_dosen, nama_dosen, 
	kompensasi_mengajar,
	transport_mengajar,
	insentif_kehadiran,
	insentif_kehadiran+absensi.kompensasi_mengajar+absensi.transport_mengajar as total,
	insentif_kehadiran+absensi.kompensasi_mengajar+absensi.transport_mengajar+pph21 as gross_up,pph21,
	insentif_kehadiran+absensi.kompensasi_mengajar+absensi.transport_mengajar as net_income,
	persentase_pph21, npwp,
	tanggal_mengajar, dosen.id_jenis_dosen
FROM absensi
	JOIN dosen ON dosen.id_dosen = absensi.id_dosen

SELECT * FROM view_report_dosen
DROP VIEW view_report_dosen


CREATE VIEW view_report_Transfer AS
SELECT 
	dosen.id_dosen, nama_dosen, nama_bank, cabang_bank,
	kota, no_rekening, atasnama,
	insentif_kehadiran+kompensasi_mengajar+transport_mengajar as total,
	tanggal_mengajar, dosen.id_jenis_dosen	
FROM absensi
	JOIN dosen ON dosen.id_dosen = absensi.id_dosen

SELECT * FROM view_report_Transfer
	