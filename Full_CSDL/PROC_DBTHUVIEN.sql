USE DBTHUVIEN
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CTMT]
AS
SELECT DISTINCT ctmt.MaMT, mt.MANV, mt.MaDG, ctmt.SoCaBiet, mt.NgayMuon, ctmt.NgayTra, mt.HanTra, ctmt.TrangThai
FROM     dbo.ChiTietMuonTra AS ctmt JOIN
                  dbo.MuonTra AS mt ON mt.MaMT = ctmt.MaMT
GO

CREATE TRIGGER TR_DauSach_Delete
ON DauSach
INSTEAD OF DELETE
AS 
BEGIN 
	DELETE FROM dbo.CuonSach WHERE MaDS=(SELECT MaDS FROM deleted)
	DELETE FROM dbo.SangTac WHERE MaDS=(SELECT MaDS FROM deleted)
	DELETE FROM dbo.TheLoaiDauSach WHERE MaDS=(SELECT MADS FROM deleted)
	DELETE FROM dbo.DauSach WHERE MaDS=(SELECT MaDS FROM deleted)
END

CREATE TRIGGER TR_Muon_Insert
ON ChiTietMuonTra
AFTER INSERT 
AS 
BEGIN
	DECLARE @socabiet VARCHAR(15)
	SELECT @socabiet= SoCaBiet FROM inserted 
	UPDATE dbo.CuonSach SET TinhTrang=0 WHERE SoCaBiet=@socabiet
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ChiTietMuonTra_Insert]
	@MaMT int,
	@SoCaBiet varchar(20)
AS
BEGIN
	SET NOCOUNT ON
    INSERT INTO dbo.ChiTietMuonTra (MaMT, SoCaBiet, TrangThai, NgayTra) VALUES (@MaMT, @SoCaBiet, 0, NULL)
	BEGIN TRANSACTION CapNhatLaiCS
	UPDATE dbo.CuonSach SET TinhTrang = 0 WHERE SoCaBiet = @SoCaBiet
	COMMIT TRANSACTION CapNhatLaiCS
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CuonSach_Delete]
	@SoCaBiet varchar(20) 
AS
BEGIN
	DELETE FROM dbo.XuLyViPham WHERE SoCaBiet = @SoCaBiet
	DELETE FROM dbo.ChiTietMuonTra WHERE SoCaBiet = @SoCaBiet
    DELETE FROM dbo.CuonSach WHERE SoCaBiet = @SoCaBiet
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CuonSach_Insert]
	@SoCaBiet varchar(20),
	@ViTriSach nvarchar(30),
	@MaDS int
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO dbo.CuonSach (SoCaBiet, ViTriSach, TinhTrang, MaDS) VALUES (@SoCaBiet, @ViTriSach, 1, @MaDS)
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DauSach_Delete]
	@MaDS int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM dbo.CuonSach WHERE MaDS=@MaDS
	DELETE FROM dbo.SangTac WHERE MaDS=@MaDS
	DELETE FROM dbo.TheLoaiDauSach WHERE MaDS=@MaDS
	DELETE FROM dbo.DauSach WHERE MaDS=@MaDS
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DauSach_Insert] (
	@TenDS nvarchar(50),
	@NgonNgu nvarchar(30),
	@Tap nvarchar(15),
	@LanTaiBan int,
	@DichGia nvarchar(30),
	@MoTa nvarchar(max),
	@SoTrang int,
	@NamXuatBan int,
	@GiaTien bigint,
	@NgayNhap date,
	@MaNXB int,
	@Link nvarchar (1000)
   )
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @str nvarchar(400)
   DECLARE @sql varbinary(max)
   SET @str = N'Select @sql = CAST( BULKCOLUMN as varbinary(max)) FROM '
   SET @str += N'OPENROWSET( BULK'''
   SET @str += @Link
   SET @str += N''',single_blob) AS image'
   EXEC sys.sp_executesql @str, N'@sql varbinary(max) out', @sql OUTPUT;
   BEGIN TRANSACTION insTrans
		INSERT INTO dbo.DauSach (TenDS, NgonNgu,Tap,LanTaiBan, DichGia, MoTa,HinhAnh,SoTrang, NamXuatBan,GiaTien,NgayNhap,MaNXB)
		VALUES (@TenDS, @NgonNgu, @Tap, @LanTaiBan, @DichGia, @MoTa, @sql, @SoTrang, @NamXuatBan, @GiaTien, @NgayNhap, @MaNXB)
	COMMIT TRANSACTION insTrans
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DauSach_Update]
	@MaDS int,
	@TenDS nvarchar(50),
	@NgonNgu nvarchar(30),
	@Tap nvarchar(15),
	@LanTaiBan int,
	@DichGia nvarchar(30),
	@MoTa nvarchar(max),
	@SoTrang int,
	@NamXuatBan int,
	@GiaTien bigint,
	@NgayNhap date,
	@MaNXB int,
	@Link nvarchar (1000)
AS
BEGIN
   SET NOCOUNT ON
   DECLARE @str nvarchar(400)
   DECLARE @sql varbinary(max)
   SET @sql = (SELECT HinhAnh FROM dbo.DauSach WHERE MaDS = @MaDS)
   IF @Link !=''
   BEGIN
	   SET @str = N'Select @sql = CAST( BULKCOLUMN as varbinary(max)) FROM '
	   SET @str += N'OPENROWSET( BULK'''
	   SET @str += @Link
	   SET @str += N''',single_blob) AS image'
	   EXEC sys.sp_executesql @str, N'@sql varbinary(max) out', @sql OUTPUT;
   END
   BEGIN TRANSACTION insTrans
	UPDATE dbo.DauSach
		SET TenDS = @TenDS, NgonNgu = @NgonNgu, Tap = @Tap, LanTaiBan = @LanTaiBan, DichGia = @DichGia,
		MoTa = @MoTa, HinhAnh = @sql, SoTrang = @SoTrang, NamXuatBan = @NamXuatBan, GiaTien = @GiaTien, 
		NgayNhap = @NgayNhap,  MaNXB = @MaNXB
		WHERE MaDS = @MaDS
	COMMIT TRANSACTION insTrans
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DocGia_Delete]
@MaDG VARCHAR(15)
AS
BEGIN
    DECLARE @MaMT INT
    DECLARE point CURSOR FOR
	SELECT MaMT FROM dbo.MuonTra
	WHERE MaDG = @MaDG
	OPEN point
	FETCH NEXT FROM point INTO @MaMT
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM dbo.XuLyViPham WHERE MaMT = @MaMT
		DELETE FROM dbo.ChiTietMuonTra WHERE MaMT = @MaMT
		DELETE FROM dbo.MuonTra WHERE MaMT = @MaMT
	    FETCH NEXT FROM point INTO @MaMT
	END
	CLOSE point
	DEALLOCATE point
	DELETE FROM dbo.DocGia WHERE MaDG = @MaDG
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DocGia_Insert]
	@MaDG varchar(15),
    @TenDG nvarchar(50),
    @DonVi nvarchar(30),
    @NgaySinh date,
    @SDT varchar(15),
    @NgayDK date,
    @NgayHH date,
	@TENDANGNHAP varchar(30),
	@MatKhau varchar(20)
AS
BEGIN
	SET NOCOUNT ON
	IF (SELECT MaDG FROM dbo.DocGia WHERE MaDG = @MaDG) IS NULL
		INSERT INTO dbo.DocGia (MaDG, TenDG, DonVi,NgaySinh,SDT,NgayDK,NgayHH,TENDANGNHAP, MatKhau) 
		VALUES (@MaDG, @TenDG, @DonVi, @NgaySinh, @SDT, @NgayDK, @NgayHH, @TENDANGNHAP, @MatKhau)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Find_DauSach]
	@Key nvarchar(100)
AS 
BEGIN
	SET NOCOUNT ON
	SELECT DISTINCT ds.MaDS, ds.TenDS,
	TenTG=STUFF(
	(SELECT DISTINCT ',' + CAST(tg.TenTG AS nvarchar(max))
	 FROM dbo.SangTac st2 ,dbo.TacGia tg
	 WHERE st2.MaDS=st.MaDS AND tg.MaTG=st2.MaTG
	 FOR XML PATH('')
	 ),1,1,''),
	TheLoaiSach=STUFF(
	(SELECT DISTINCT ',' + CAST(tl.TenTL AS nvarchar(max))
	 FROM dbo.TheLoaiDauSach tlds2 ,dbo.TheLoai tl
	 WHERE tlds2.MaDS=st.MaDS AND tl.MaTL=tlds2.MaTL
	 FOR XML PATH('')
	 ),1,1,'') , ds.Tap, ds.SoTrang, ds.GiaTien , ds.NgayNhap, nxb.TenNXB, ts.Tong
	FROM dbo.DauSach ds JOIN dbo.SangTac st ON st.MaDS = ds.MaDS
	JOIN dbo.TheLoaiDauSach tlds ON tlds.MaDS = ds.MaDS
	JOIN dbo.NhaXuatBan nxb ON nxb.MaNXB = ds.MaNXB
	JOIN (SELECT MaDS,COUNT(MaDS) AS Tong FROM dbo.CuonSach GROUP BY MaDS ) AS TS ON ts.MaDS=ds.MaDS
	WHERE ds.MaDS LIKE '%' + @Key + '%' OR ds.TenDS LIKE '%' + @Key + '%' OR ds.Tap LIKE '%' + @Key + '%' OR
	ds.SoTrang LIKE '%' + @Key + '%' OR ds.GiaTien LIKE '%' + @Key + '%' OR nxb.TenNXB LIKE '%' + @Key + '%'
	GROUP BY ds.MaDS,ds.TenDS,st.MaDS, ds.Tap, ds.SoTrang,ds.GiaTien,ds.NgayNhap, nxb.TenNXB, ts.Tong
	ORDER BY 1
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Find_DocGia]
@Key nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
    SELECT MaDG,TenDG,DonVi,NgaySinh,SDT,NgayDK,NgayHH,TENDANGNHAP,MatKhau FROM dbo.DocGia
	WHERE MaDG LIKE '%' + @key + '%' OR TenDG LIKE '%' + @key + '%' OR DonVi LIKE '%' + @key + '%' OR 
	NgaySinh LIKE '%' + @key + '%' OR SDT LIKE '%' + @key + '%' OR
	NgayDK LIKE '%' + @key + '%' OR NgayHH LIKE '%' + @key + '%'
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Find_MuonTra]
	@Key nvarchar(100)
AS
BEGIN 
	SET NOCOUNT ON
	SELECT mt.MaMT, mt.MANV, mt.MaDG , 
	SoCaBiet=STUFF((SELECT DISTINCT ',' + CAST(mt1.SoCaBiet AS nvarchar(max))
		 FROM View_CTMT mt1
		 WHERE mt1.MaMT=mt.MaMT AND mt1.TrangThai = mt.TrangThai
		 FOR XML PATH('')
		 ),1,1,''),mt.NgayMuon,mt.NgayTra,mt.HanTra,mt.TrangThai FROM dbo.View_CTMT mt
		 WHERE mt.MaMT LIKE '%' + @key + '%' OR mt.MANV LIKE '%' + @key + '%' OR mt.MaDG LIKE '%' + @key + '%' OR 
		 mt.NgayMuon LIKE '%' + @key + '%' OR mt.NgayTra LIKE '%' + @key + '%' OR 
		 mt.HanTra LIKE '%' + @key + '%' OR  mt.TrangThai LIKE '%' + @key + '%'
	GROUP BY mt.MaMT, mt.MANV, mt.MaDG, mt.NgayMuon,mt.NgayTra,mt.HanTra,mt.TrangThai
	ORDER BY mt.MaMT
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Find_ViewBook] 
	@Key nvarchar(100)
AS 
BEGIN
	SET NOCOUNT ON
	SELECT DISTINCT ds.MaDS, ds.TenDS,
	TenTG=STUFF(
		(SELECT DISTINCT ',' + CAST(tg.TenTG AS nvarchar(max))
		 FROM dbo.SangTac st2 ,dbo.TacGia tg
		 WHERE st2.MaDS=st.MaDS AND tg.MaTG=st2.MaTG
		 FOR XML PATH('')
		 ),1,1,''
	),
	TheLoaiSach=STUFF(
		(SELECT DISTINCT ',' + CAST(tl.TenTL AS nvarchar(max))
		 FROM dbo.TheLoaiDauSach tlds2 ,dbo.TheLoai tl
		 WHERE tlds2.MaDS=st.MaDS AND tl.MaTL=tlds2.MaTL
		 FOR XML PATH('')
		 ),1,1,''
	) , ds.Tap, ds.SoTrang, ds.GiaTien ,nxb.TenNXB, ds.HinhAnh
	FROM dbo.DauSach ds
	JOIN dbo.SangTac st ON st.MaDS = ds.MaDS
	JOIN dbo.TheLoaiDauSach tlds ON tlds.MaDS = ds.MaDS
	JOIN dbo.NhaXuatBan nxb ON nxb.MaNXB = ds.MaNXB
	JOIN (SELECT MaDS,COUNT(MaDS) AS Tong FROM dbo.CuonSach GROUP BY MaDS ) AS TS 
	ON ts.MaDS=ds.MaDS
	WHERE ds.MaDS LIKE '%' + @Key + '%' OR ds.TenDS LIKE '%' + @Key + '%' OR ds.Tap LIKE '%' + @Key + '%' OR
	ds.SoTrang LIKE '%' + @Key + '%' OR ds.GiaTien LIKE '%' + @Key + '%' OR nxb.TenNXB LIKE '%' + @Key + '%' 
	GROUP BY ds.MaDS,ds.TenDS,st.MaDS, ds.Tap, ds.SoTrang,ds.GiaTien, nxb.TenNXB, ds.HinhAnh
	ORDER BY 1
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Find_XuLyViPham]
	@Key nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON
	SELECT xlvp.MAXL,dg.TenDG, ds.TenDS, xlvp.TienPhat,xlvp.LyDo,xlvp.TinhTrang, xlvp.MANV,xlvp.SoCaBiet,mt.MaDG
	FROM dbo.XuLyViPham xlvp JOIN dbo.MuonTra mt
	ON mt.MaMT = xlvp.MaMT
	JOIN dbo.DocGia dg
	ON dg.MaDG = mt.MaDG
	JOIN dbo.CuonSach cs
	ON cs.SoCaBiet = xlvp.SoCaBiet
	JOIN dbo.DauSach ds
	ON ds.MaDS = cs.MaDS
	WHERE xlvp.MAXL LIKE '%' + @Key + '%' OR dg.TenDG LIKE '%' + @Key + '%' OR ds.TenDS LIKE '%' + @Key + '%' OR 
	xlvp.TienPhat LIKE '%' + @Key + '%' OR xlvp.LyDo LIKE '%' + @Key + '%' OR xlvp.TinhTrang LIKE '%' + @Key + '%' 
	OR xlvp.MANV LIKE '%' + @Key + '%' OR xlvp.SoCaBiet LIKE '%' + @Key + '%' OR mt.MaDG LIKE '%' + @Key + '%' 
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_InHoaDon]
	@MaDG varchar(15)
AS
BEGIN
	DECLARE @MaMT INT
	SELECT @MaMT = xlvp.MaMT FROM dbo.XuLyViPham xlvp INNER JOIN dbo.ChiTietMuonTra ctmt
	ON ctmt.MaMT = xlvp.MaMT
	INNER JOIN dbo.MuonTra mt
	ON mt.MaMT = ctmt.MaMT
	WHERE mt.MaDG = @MaDG AND xlvp.TinhTrang IS NULL
    SELECT dg.TenDG,dg.NgaySinh,dg.DonVi,dg.SDT,SUM(xlvp.TienPhat) AS SoTien FROM dbo.MuonTra mt INNER JOIN dbo.XuLyViPham xlvp
	ON xlvp.MaMT = mt.MaMT 
	INNER JOIN dbo.DocGia dg
	ON dg.MaDG = mt.MaDG
	WHERE mt.MaDG = @MaDG AND xlvp.TinhTrang IS NULL
	GROUP BY dg.TenDG,dg.NgaySinh,dg.DonVi,dg.SDT
	UPDATE dbo.XuLyViPham SET TinhTrang =N'Đã Trả' WHERE TinhTrang IS NULL AND MaMT = @MaMT
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LayMaDS]
	@TenDS nvarchar(50),
	@SoTrang int
AS
BEGIN 
	SELECT MaDS FROM dbo.DauSach
	WHERE TenDS = @TenDS AND SoTrang = @SoTrang
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LayMaMuonTra]
	@MaDG varchar(15),
	@NgayMuon date
	AS
BEGIN
    SELECT MaMT FROM dbo.MuonTra WHERE MaDG = @MaDG AND NgayMuon = @NgayMuon
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LayThongTin]
	@MaDG varchar(15)
AS
BEGIN
	SELECT TENDANGNHAP,MatKhau,MaDG,TenDG,NgaySinh,DonVi,SDT,NgayDK,NgayHH FROM dbo.DocGia 
	WHERE MaDG= @MaDG
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MatKhau_Update]
	@MaDG varchar(15),
	@MatKhau varchar(20)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.DocGia SET MatKhau = @MatKhau 
	WHERE MaDG = @MaDG
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_MuonTra_Insert]
@NgayMuon date,
@HanTra date,
@Manv int,
@MaDG varchar(15)
AS
BEGIN
    INSERT INTO dbo.MuonTra (NgayMuon,HanTra,MANV,MaDG) VALUES (@NgayMuon, @HanTra, @Manv, @MaDG)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_NXB_Insert]
	@Ten nvarchar(50),
	@DiaChi nvarchar(50),
	@SDT varchar(15),
	@Email varchar(30)
AS
BEGIN 
	INSERT INTO dbo.NhaXuatBan (TenNXB, DiaChi, SDT, Email) VALUES (@Ten, @DiaChi, @SDT, @Email)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_SachCon]
	@MaDS int 
AS
BEGIN
	SELECT SoCaBiet,MaDS,TinhTrang,ViTriSach FROM dbo.CuonSach
	WHERE TinhTrang = 1 AND MaDS=@MaDS
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_SangTac_Insert]
	@MaDS int,
	@MaTG int,
	@ViTri int
AS
BEGIN
	INSERT INTO dbo.SangTac (MaDS, MaTG, ViTriTacGia) VALUES (@MaDS, @MaTG, @ViTri)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_SangTac_Update]
	@MaDS int,
	@MaTG int,
	@MaTG1 int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.SangTac SET MaTG = @MaTG1
	WHERE MaDS = @MaDS AND MaTG=@MaTG
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Search_DauSach]
	@MaDS int
AS
BEGIN
	SET NOCOUNT ON
	SELECT  ds.MaDS, ds.TenDS,ds.NgonNgu,ds.Tap,ds.LanTaiBan,ds.DichGia,ds.MoTa,
	ds.HinhAnh,ds.SoTrang,ds.NamXuatBan,ds.GiaTien,ds.NgayNhap,ds.MaNXB
	FROM dbo.DauSach ds
	WHERE ds.MaDS = @MaDS
	SET NOCOUNT OFF
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_TacGia_Insert]
	@Ten nvarchar(50),
	@QuocTich nvarchar(30)
AS
BEGIN 
	INSERT INTO dbo.TacGia (TenTG, QuocTich) VALUES (@Ten, @QuocTich)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_TheLoaiDauSach_Insert]
	@MaDS int,
	@MaTL int
AS
BEGIN 
	INSERT INTO dbo.TheLoaiDauSach (MaTL, MaDS) VALUES (@MaTL, @MaDS)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_TheLoaiDauSach_Update]
	@MaDS int,
	@MaTL int,
	@MaTL1 int
AS
BEGIN 
	SET NOCOUNT ON
	UPDATE dbo.TheLoaiDauSach SET MaTL = @MaTL1
	WHERE MaDS = @MaDS AND MaTL = @MaTL
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeDauSach]
AS
BEGIN
	    SET NOCOUNT ON
		SELECT _Tong.MaDS, _Tong.TenDS, _Tong.Tong, 
		(CASE WHEN _ChoMuon.ChoMuon IS NULL THEN 0
		 ELSE _ChoMuon.ChoMuon
		 END) AS ChoMuon, 
		(_Tong.Tong - (CASE WHEN _ChoMuon.ChoMuon IS NULL THEN 0
										ELSE _ChoMuon.ChoMuon
										END)) AS CONLAI
		FROM (SELECT CuonSach.MaDS, TenDS, COUNT(SoCaBiet) AS Tong 
		FROM dbo.CuonSach JOIN dbo.DauSach ON DauSach.MaDS = CuonSach.MaDS
		GROUP BY CuonSach.MaDS, TenDS) AS _Tong
		LEFT JOIN
		(SELECT MaDS, COUNT(SoCaBiet) AS ChoMuon FROM dbo.CuonSach 
		WHERE TinhTrang = 0 
		GROUP BY CuonSach.MaDS) AS _ChoMuon
		ON _Tong.MaDS = _ChoMuon.MaDS
       SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeQuaHanTra]
AS
BEGIN
	SELECT MT.MaMT, CTMT.SoCaBiet,TenDG,DonVi,SDT,MT.NgayMuon, MT.HanTra FROM DBO.MuonTra AS MT 
	INNER JOIN DBO.ChiTietMuonTra AS CTMT
	ON MT.MAMT = CTMT.MAMT INNER JOIN dbo.DocGia ON DOCGIA.MADG = MT.MADG
	WHERE GETDATE()>MT.HanTra
	AND NGAYTRA IS NULL
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeSachItMuon]
AS
BEGIN
	SET NOCOUNT ON
	SELECT DS.MaDS, DS.TenDS, MT.NgayMuon FROM dbo.ChiTietMuonTra AS CTMT 
	JOIN dbo.CuonSach AS CS ON CS.SoCaBiet = CTMT.SoCaBiet
	FULL JOIN dbo.DauSach AS DS ON DS.MaDS = CS.MaDS
	FULL JOIN dbo.MuonTra AS MT ON MT.MaMT = CTMT.MaMT
	WHERE MT.NgayMuon IS NULL OR NOT EXISTS 
	(
		SELECT CuonSach.MaDS FROM dbo.MuonTra AS MT1 JOIN dbo.ChiTietMuonTra AS CTMT1
		ON CTMT1.MaMT = MT1.MaMT
		JOIN dbo.CuonSach ON CuonSach.SoCaBiet = CTMT1.SoCaBiet
		JOIN dbo.DauSach ON DauSach.MaDS = CuonSach.MaDS
		WHERE YEAR(MT1.NgayMuon) > (YEAR(GETDATE()) - 3)
	)
	GROUP BY MT.NgayMuon, DS.MaDS, DS.TenDS
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeSachMat]
AS
BEGIN
	SET NOCOUNT ON
	SELECT CS.SoCaBiet, CS.ViTriSach, DS.TenDS 
	FROM dbo.CuonSach AS CS JOIN dbo.DauSach AS DS ON DS.MADS = CS.MADS
	JOIN dbo.XuLyViPham AS XLVP ON XLVP.SoCaBiet = CS.SoCaBiet
	WHERE LyDo LIKE '%'+N'Mất'+'%'
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeTanSoDauSachMuon]
	@NgayBatDau date,
	@NgayKetThuc date
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.CuonSach.MaDS, TenDS, COUNT(dbo.CuonSach.MaDS) AS TanSo
	FROM dbo.DauSach JOIN dbo.CuonSach ON CuonSach.MaDS = DauSach.MaDS
	JOIN dbo.ChiTietMuonTra ON ChiTietMuonTra.SoCaBiet = CuonSach.SoCaBiet 
	JOIN dbo.MuonTra ON MuonTra.MaMT = ChiTietMuonTra.MaMT
	WHERE	dbo.MuonTra.NgayMuon BETWEEN @NgayBatDau AND @NgayKetThuc
	GROUP BY dbo.CuonSach.MaDS, TenDS
	ORDER BY dbo.CuonSach.MaDS
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongTinDocGia_Update]
	@MaDG varchar(15),
    @TenDG nvarchar(50),
    @DonVi nvarchar(30),
    @NgaySinh date,
    @SDT varchar(15),
    @NgayDK date,
    @NgayHH date
AS
BEGIN
	SET NOCOUNT ON
	UPDATE dbo.DocGia SET MaDG = @MaDG, TenDG = @TenDG, DonVi = @DonVi,
	NgaySinh = @NgaySinh, SDT = @SDT, NgayDK = @NgayDK, NgayHH = @NgayHH
	WHERE MaDG = @MaDG
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_TraSach]
	@SoCaBiet varchar(20),
	@MANV int,
	@TinhTrang tinyint				--0: Sách không bị hư hỏng/mất, 
												--1:Hư hỏng/mất có thể đền sách mới 
												--2: Hư hỏng/mất không thể đền lại được sách
AS
BEGIN
	DECLARE @HanTra date
	DECLARE @MaMT int
	DECLARE @GiaBiaSach int
	DECLARE @SoTrangSach int
	SELECT @GiaBiaSach = ds.GiaTien, @SoTrangSach = ds.SoTrang FROM dbo.CuonSach cs JOIN dbo.DauSach ds
	ON ds.MaDS = cs.MaDS
	WHERE cs.SoCaBiet = @SoCaBiet
	GROUP BY ds.GiaTien,ds.SoTrang

	SELECT @HanTra = HanTra FROM dbo.MuonTra JOIN dbo.ChiTietMuonTra 
	ON ChiTietMuonTra.MaMT = MuonTra.MaMT 
	WHERE SoCaBiet = @SoCaBiet
	SELECT @MaMT = MaMT FROM dbo.ChiTietMuonTra
	WHERE SoCaBiet = @SoCaBiet AND TrangThai = 0
	IF @TinhTrang = 0
	BEGIN
		IF @HanTra >= GETDATE()
		BEGIN
		--Cập nhật chi tiết mượn trả
			UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE() WHERE SoCaBiet =@SoCaBiet AND TrangThai = 0
		 --cập nhật tình trạng sách
			UPDATE dbo.CuonSach SET TinhTrang = 1 WHERE SoCaBiet = @SoCaBiet
		END 
		ELSE -- quá hạn
		BEGIN 
			UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE() WHERE SoCaBiet =@SoCaBiet AND TrangThai = 0
			UPDATE dbo.CuonSach SET TinhTrang = 1 WHERE SoCaBiet = @SoCaBiet
		 --thêm mới vào xử lý vi phạm 
			INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)
			VALUES (DATEDIFF(day, @HanTra, GETDATE()) *3000, N'Quá Hạn', NULL, @MANV, @MaMT, @SoCaBiet)
		END
	END

	IF @TinhTrang = 1 
	BEGIN
		IF @HanTra >= GETDATE()
			BEGIN
				UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE() WHERE SoCaBiet =@SoCaBiet AND TrangThai = 0
				UPDATE dbo.CuonSach SET TinhTrang = 1 WHERE SoCaBiet = @SoCaBiet
			INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)
			VALUES (5000, N'Mất Sách', NULL, @MANV, @MaMT, @SoCaBiet)
			END 
			ELSE -- quá hạn
			BEGIN 
				UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE() WHERE SoCaBiet = @SoCaBiet AND TrangThai = 0	
				UPDATE dbo.CuonSach SET TinhTrang = 1 WHERE SoCaBiet = @SoCaBiet
				INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)VALUES
				(DATEDIFF(day, @HanTra, GETDATE())*3000 + 5000, N'Quá Hạn + Mất/Rách Sách', NULL, @MANV, @MaMT, @SoCaBiet)
			END
	END

	IF @TinhTrang = 2
	BEGIN
	    IF @HanTra >= GETDATE()
		BEGIN
				UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE() WHERE SoCaBiet =@SoCaBiet AND TrangThai = 0
			--không cập nhật lại cuốn sách
			--thêm vào xử lý vi phạm
			IF @GiaBiaSach IS NOT NULL
			BEGIN
			    INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)
			    VALUES (@GiaBiaSach + 5000, N'Mất Sách', NULL, @MANV, @MaMT, @SoCaBiet)
			END
			ELSE
			BEGIN
			    INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)
			    VALUES (@SoTrangSach * 2000 + 5000, N'Mất Sách', NULL, @MANV, @MaMT, @SoCaBiet)
			END
		END
		ELSE -- quá hạn trả
		BEGIN
		    --cập nhật chi tiết mượn trả
				UPDATE dbo.ChiTietMuonTra SET TrangThai = 1, NgayTra =GETDATE()
				WHERE SoCaBiet =@SoCaBiet AND TrangThai = 0
			--không cập nhật lại cuốn sách
			--thêm vào xử lý vi phạm
			IF @GiaBiaSach IS NOT NULL
			BEGIN
			    INSERT INTO dbo.XuLyViPham (TienPhat, LyDo, TinhTrang, MANV, MaMT, SoCaBiet)
				VALUES (@GiaBiaSach + 5000 + DATEDIFF(day,@HanTra,GETDATE())*3000 ,N'Mất Sách', NULL, @MANV, @MaMT,   @SoCaBiet)
			END
			ELSE
			BEGIN
			    INSERT INTO dbo.XuLyViPham (TienPhat,LyDo,TinhTrang,MANV,MaMT,SoCaBiet)
			    VALUES (@SoTrangSach*2000 + 5000 + DATEDIFF(day,@HanTra,GETDATE())*3000,N'Mất Sách',NULL,@MANV,@MaMT,@SoCaBiet )
			END
		END
	END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ViewBook] 
AS 
BEGIN
    SET NOCOUNT ON
	SELECT DISTINCT ds.MaDS, ds.TenDS,
	TenTG=STUFF(
		(SELECT DISTINCT ',' + CAST(tg.TenTG AS nvarchar(max))
		 FROM dbo.SangTac st2 ,dbo.TacGia tg
		 WHERE st2.MaDS=st.MaDS AND tg.MaTG=st2.MaTG
		 FOR XML PATH('')
		 ),1,1,''),
	TheLoaiSach=STUFF(
		(SELECT DISTINCT ',' + CAST(tl.TenTL AS nvarchar(max))
		 FROM dbo.TheLoaiDauSach tlds2 ,dbo.TheLoai tl
		 WHERE tlds2.MaDS=st.MaDS AND tl.MaTL=tlds2.MaTL
		 FOR XML PATH('')
		 ),1,1,''
	) , ds.Tap, ds.SoTrang, ds.GiaTien ,nxb.TenNXB, ds.HinhAnh
	FROM dbo.DauSach ds
	JOIN dbo.SangTac st ON st.MaDS = ds.MaDS
	JOIN dbo.TheLoaiDauSach tlds ON tlds.MaDS = ds.MaDS
	JOIN dbo.NhaXuatBan nxb ON nxb.MaNXB = ds.MaNXB
	JOIN (SELECT MaDS,COUNT(MaDS) AS Tong FROM dbo.CuonSach GROUP BY MaDS ) AS TS 
	ON ts.MaDS=ds.MaDS
	GROUP BY ds.MaDS,ds.TenDS,st.MaDS, ds.Tap, ds.SoTrang,ds.GiaTien, nxb.TenNXB, ds.HinhAnh
	ORDER BY 1
   SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_ViewChiTietMuonTra]
AS
BEGIN 
	SET NOCOUNT ON
	SELECT mt.MaMT, mt.MANV, mt.MaDG , 
	SoCaBiet=STUFF((SELECT DISTINCT ',' + CAST(mt1.SoCaBiet AS nvarchar(max))
		 FROM View_CTMT mt1
		 WHERE mt1.MaMT=mt.MaMT AND mt1.TrangThai = mt.TrangThai
		 FOR XML PATH('')
		 ),1,1,''),mt.NgayMuon,mt.NgayTra,mt.HanTra,mt.TrangThai FROM View_CTMT mt
	GROUP BY mt.MaMT, mt.MANV, mt.MaDG, mt.NgayMuon,mt.NgayTra,mt.HanTra,mt.TrangThai
	ORDER BY mt.MaMT
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewCuonSachAdmin] 
@MaDS int
AS 
BEGIN
    SELECT cs.SoCaBiet,cs.ViTriSach,cs.TinhTrang FROM dbo.CuonSach cs
	WHERE cs.MaDS=@MaDS
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewDauSachAdmin]
AS
BEGIN
	SET NOCOUNT ON
	SELECT DISTINCT ds.MaDS, ds.TenDS,
	TenTG=STUFF(
		(SELECT DISTINCT ',' + CAST(tg.TenTG AS nvarchar(max))
		 FROM dbo.SangTac st2 ,dbo.TacGia tg
		 WHERE st2.MaDS=st.MaDS AND tg.MaTG=st2.MaTG
		 FOR XML PATH('')
		 ),1,1,''
	),
	TheLoaiSach=STUFF(
		(SELECT DISTINCT ',' + CAST(tl.TenTL AS nvarchar(max))
		 FROM dbo.TheLoaiDauSach tlds2 ,dbo.TheLoai tl
		 WHERE tlds2.MaDS=st.MaDS AND tl.MaTL=tlds2.MaTL
		 FOR XML PATH('')
		 ),1,1,'') , ds.Tap, ds.SoTrang, ds.GiaTien , ds.NgayNhap, nxb.TenNXB, ts.Tong
	FROM dbo.DauSach ds JOIN dbo.SangTac st ON st.MaDS = ds.MaDS
	JOIN dbo.TheLoaiDauSach tlds ON tlds.MaDS = ds.MaDS
	JOIN dbo.NhaXuatBan nxb ON nxb.MaNXB = ds.MaNXB
	JOIN (SELECT MaDS,COUNT(MaDS) AS Tong FROM dbo.CuonSach GROUP BY MaDS ) AS ts ON ts.MaDS=ds.MaDS
	GROUP BY ds.MaDS,ds.TenDS,st.MaDS, ds.Tap, ds.SoTrang,ds.GiaTien,ds.NgayNhap, nxb.TenNXB, ts.Tong
	ORDER BY 1
	SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewDocGiaAdmin]
AS
BEGIN
	SELECT MaDG,TenDG,DonVi,NgaySinh,SDT,NgayDK,NgayHH FROM dbo.DocGia
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewLichSuMuonTraUser]
@MaDG varchar(15)
AS
BEGIN
	SET NOCOUNT ON
	SELECT dg.MaDG,dg.TenDG,ds.TenDS, cs.SoCaBiet,mt.NgayMuon,ctmt.NgayTra 
	FROM dbo.DocGia dg  JOIN dbo.MuonTra mt ON mt.MaDG = dg.MaDG
	JOIN dbo.ChiTietMuonTra ctmt ON ctmt.MaMT = mt.MaMT
	JOIN dbo.CuonSach cs ON cs.SoCaBiet = ctmt.SoCaBiet
	JOIN dbo.DauSach ds ON ds.MaDS = cs.MaDS
	WHERE dg.MaDG = @MaDG
	ORDER BY dg.MaDG
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewTacGiaSangTac]
	@MaDS INT 
AS
BEGIN
	SET NOCOUNT ON
	SELECT st.MaDS , st.MaTG , tg.TenTG,st.ViTriTacGia 
	FROM dbo.SangTac st JOIN dbo.TacGia tg ON tg.MaTG = st.MaTG 
	WHERE st.MaDS = @MaDS
	ORDER BY MaDS
    SET NOCOUNT OFF
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewTheLoaiDS]
	@MaDS int
AS
BEGIN
	SET NOCOUNT ON
	SELECT tlds.MaDS,tl.MaTL,tl.TenTL FROM dbo.TheLoaiDauSach tlds JOIN dbo.TheLoai tl
	ON tl.MaTL = tlds.MaTL
	WHERE tlds.MaDS = @MaDS
	ORDER BY tlds.MaDS
    SET NOCOUNT OFF
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_viewXuLyViPham]
AS
BEGIN 
	SET NOCOUNT ON
	SELECT xlvp.MAXL,dg.TenDG, ds.TenDS, xlvp.TienPhat,xlvp.LyDo,xlvp.TinhTrang, xlvp.MANV,xlvp.SoCaBiet,mt.MaDG
	FROM dbo.XuLyViPham xlvp JOIN dbo.MuonTra mt ON mt.MaMT = xlvp.MaMT
	JOIN dbo.DocGia dg ON dg.MaDG = mt.MaDG
	JOIN dbo.CuonSach cs ON cs.SoCaBiet = xlvp.SoCaBiet
	JOIN dbo.DauSach ds ON ds.MaDS = cs.MaDS
    SET NOCOUNT OFF
END
GO



