CREATE DATABASE DBTHUVIEN
GO

USE DBTHUVIEN;
GO

CREATE TABLE dbo.NhanVien
(
    MaNV int IDENTITY(1,1) PRIMARY KEY,
    HoTen nvarchar(50) NOT NULL,
    ChucVu nvarchar(30) NOT NULL,
    NgaySinh date,
    SDT varchar(15),
    Email varchar(30),
    TenDangNhap varchar(30) NOT NULL,
    MatKhau varchar(50) NOT NULL,
);
GO

CREATE TABLE dbo.DocGia
(
    MaDG varchar(15) PRIMARY KEY,
    TenDG nvarchar(50) NOT NULL,
    DonVi nvarchar(30) NOT NULL,
    NgaySinh date NOT NULL,
    SDT varchar(15) NOT NULL,
    NgayDK date NOT NULL,
    NgayHH date NOT NULL,
    TenDangNhap varchar(30) NOT NULL,
    MatKhau varchar(50) NOT NULL
);
GO

CREATE TABLE dbo.MuonTra
(
    MaMT int IDENTITY(1,1) PRIMARY KEY,
    NgayMuon datetime NOT NULL,
    HanTra date NOT NULL,
	MaNV int,
	MaDG varchar(15),
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien,
	FOREIGN KEY (MaDG) REFERENCES dbo.DocGia
);
GO

CREATE TABLE dbo.NhaXuatBan
(
    MaNXB int IDENTITY(1,1) PRIMARY KEY,
    TenNXB nvarchar(50) NOT NULL,
    DiaChi nvarchar(50),
    SDT varchar(15),
    Email varchar(30)
);
GO

CREATE TABLE dbo.DauSach
(
    MaDS int IDENTITY(1,1) PRIMARY KEY,
    TenDS nvarchar(50) NOT NULL,
    NgonNgu nvarchar(30),
    Tap nvarchar(15),													-- Tập 1, tập 2, . . . , tập đặc biệt
    LanTaiBan int,
    DichGia nvarchar(30),
	MoTa nvarchar(MAX),
	HinhAnh varbinary(MAX),
    SoTrang int,
    NamXuatBan int,
    GiaTien bigint,
    NgayNhap date,
    MaNXB int,
    FOREIGN KEY (MaNXB) REFERENCES dbo.NhaXuatBan
);
GO

CREATE TABLE dbo.CuonSach
(
    SoCaBiet varchar(20) PRIMARY KEY,
    ViTriSach nvarchar(30) NOT NULL,
    TinhTrang bit,													 --0: chưa sẵn sàng, 1: sẵn sàng
    MaDS int,
    FOREIGN KEY (MaDS) REFERENCES dbo.DauSach
);
GO

CREATE TABLE dbo.ChiTietMuonTra
(
	MaCTMT int IDENTITY(1,1) PRIMARY KEY,
	MaMT int,
	SoCaBiet varchar(20),
	TrangThai bit NOT NULL,		-- 0: Chưa trả, 1; Đã trả
	NgayTra datetime ,
	FOREIGN KEY (MaMT) REFERENCES dbo.MuonTra,
	FOREIGN KEY(SoCaBiet) REFERENCES dbo.CuonSach
);
GO

CREATE TABLE dbo.TheLoai
(
    MaTL int IDENTITY(1,1) PRIMARY KEY,
    TenTL nvarchar(50) NOT NULL
);
GO

CREATE TABLE dbo.TacGia
(
    MaTG int IDENTITY(1,1) PRIMARY KEY,
    TenTG nvarchar(50) NOT NULL,
    QuocTich nvarchar(30)
);
GO

CREATE TABLE dbo.XuLyViPham
(
    MaXL int IDENTITY(1,1) PRIMARY KEY,
    TienPhat bigint NOT NULL,
    LyDo nvarchar(50) NOT NULL,
    TinhTrang nvarchar(50),
    MaNV int ,
    MaMT int ,
	SoCaBiet varchar(20),
    FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien,
    FOREIGN KEY (MaMT) REFERENCES dbo.MuonTra,
	FOREIGN KEY (SoCaBiet) REFERENCES dbo.CuonSach
);
GO

CREATE TABLE dbo.TheLoaiDauSach
(
    MaTL int,
    MaDS int ,
	FOREIGN KEY(MaTL) REFERENCES dbo.TheLoai,
	FOREIGN KEY(MaDS) REFERENCES dbo.DauSach
);
GO

CREATE TABLE dbo.SangTac
(
    MaDS int ,
    MaTG int ,
    ViTriTacGia int, 
	FOREIGN KEY(MaDS) REFERENCES dbo.DauSach,
	FOREIGN KEY(MaTG) REFERENCES dbo.TacGia
);
GO

USE DBTHUVIEN
GO

--Thêm [NhanVien]
SET IDENTITY_INSERT [dbo].[NhanVien] ON 
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (1, N'Bùi Hồng Hạnh', N'Thủ Thư', CAST(N'1985-05-22' AS Date), '0392783940', 'honghanh85@gmail.com', 'nv001', 'E5446FD902468351C79B2A98E2989508')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (2, N'Xa Quốc An', N'Thủ Thư', CAST(N'1980-08-14' AS Date), '0343425472', 'anco@gmail.com', 'nv002', '9925D748C444686B76FC0000E26CE563')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (3, N'Nguyễn Việt Hùng', N'Thủ Thư', CAST(N'1972-06-05' AS Date), '0913902693', 'viethung72@gmail.com', 'nv003', '75F4E2919DF34918B5A8F00EB5155592')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (4, N'Bùi Tiểu Quỳnh Như', N'Thủ Thư', CAST(N'1990-12-06' AS Date), '039256874', 'nhuruoi@gmail.com', 'nv004', '170077FC28EE8BF27887EA667CD8AE50')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (5, N'Nguyễn Thị Thu Trang', N'Thủ Thư', CAST(N'1978-05-06' AS Date), '0392783666', 'thutrangnguyen@gmail.com', 'nv005', '1ECB28775E8CDD037585D9BE9E467691')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [ChucVu], [NgaySinh], [SDT], [Email], [TenDangNhap], [MatKhau]) VALUES (6, N'Trần Hà Hoàng Long', N'Thủ Thư', CAST(N'1989-06-23' AS Date), '0847783940', 'hoanglong89@gmail.com', 'nv006', '51B80E653324F4E350F6917B5BBCDEF2')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO

--Thêm [DocGia]
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS001', N'Đinh Công Hiển', N'ANHTTT-c154', CAST(N'2000-03-02' AS Date), '0932434345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS001', 'BBAD6EF00D55EB9489412C870779ECB7')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS002', N'Nguyễn Lê Minh', N'ANHTTT-c154', CAST(N'2000-11-07' AS Date), '0932434895', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS002', 'E3AF71949A8F46698AD3915F19DAFF51')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES  (N'19QS003', N'Nguyễn Văn Văn', N'ANHTTT-c154', CAST(N'2000-07-01' AS Date), '0892434345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS003', 'FD4D7BFF8F83CC30717AC75BC49708DA')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES  (N'19QS004', N'Trần Văn Hưng', N'ANHTTT-c154', CAST(N'1999-02-01' AS Date), '0732437365', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS004', '55B446CB74D7C4AF4C13BA751996CD9B')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES  (N'19QS005', N'Dương Ngọc Minh', N'ANHTTT-c154', CAST(N'2000-09-11' AS Date), '0932564345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS005', '62D70EDAB142A4D02036029730CB97BD')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS006', N'Phạm Duy Hưng', N'ANHTTT-c154', CAST(N'2000-12-03' AS Date), '0932378345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS006', 'A8AF6E539FBFE9DF5BA300D5D5F1A3FB')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS007', N'Nguyễn Thành Trung', N'ANHTTT-c154', CAST(N'2000-09-01' AS Date), '0932784345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS007', '9CADD5316BA7E47FAFB5D6A7F4F1599F')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS008', N'Lê Hữu Dũng', N'ANHTTT-c154', CAST(N'2000-09-26' AS Date), '0933784345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS008', 'B1EF568D319A1AD824194C337B786DA8')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS009', N'Lưu Phan Anh Dũng', N'ANHTTT-c154', CAST(N'2000-10-06' AS Date), '0932431905', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS009', '7B7B1713D585589EBC83078552CDCCFD')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS010', N'Bùi Tuấn Hưng', N'ANHTTT-c154', CAST(N'2000-03-31' AS Date), '0936214345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0010', 'EFDB99752BB7D121F4265B3DD56BB34B')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS011', N'Trần Xuân Công', N'ANHTTT-c154', CAST(N'2000-08-27' AS Date), '0590834345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0011', 'EC3ED7370264FAA5D4B27E48052EE4D4')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS012', N'Nguyễn Phúc Nam Sơn', N'ANHTTT-c154', CAST(N'2000-01-31' AS Date), '0939434345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0012', '635F8592BDE82AC9F095515951C576EE')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS013', N'Nguyễn Vĩnh Trọng', N'ANHTTT-c154', CAST(N'1999-08-13' AS Date), '0938724345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0013', '0D2D1140CC91BEAE63EED101E76CA241')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS014', N'Đinh Đức Hoàn', N'ANHTTT-c154', CAST(N'2000-11-02' AS Date), '0932784345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0014', '7E277E431124470FF53A167E90FF9D90')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS015', N'Hoàng Trọng Hùng', N'ANHTTT-c154', CAST(N'2000-04-04' AS Date), '0932012345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0015', '27AF84E0F0B32857881EC880983B47EB')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS016', N'Đặng Đình Hiếu', N'ANHTTT-c154', CAST(N'2000-08-10' AS Date), '0932467345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0016', '9FEA3297782E45D32E4784CB87E90CAA')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS017', N'Trần Văn Chí Công', N'ANHTTT-c154', CAST(N'2000-08-10' AS Date), '0932434261', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0017', 'AA617159FFEF67F87696B9CA0E05C4D4')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS018', N'Hoàng Anh Quý', N'ANHTTT-c154', CAST(N'1999-08-11' AS Date), '0932433715', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0018', '06897364DC9CC23E73633BE7192E1A09')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS019', N'Phạm Bảo Ngọc', N'ANHTTT-c154', CAST(N'2000-01-20' AS Date), '0932434415', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0019', '7F72DE507F0B917F424E9D1DE5866CE4')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS020', N'Nguyễn Thị Liên', N'ANHTTT-c154', CAST(N'2000-11-10' AS Date), '0950934345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0020', '03D28CE99FDF2CF2E6F96F09E91DAFFB')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS021', N'Nguyễn Thị Huyền Trang', N'ANHTTT-c154', CAST(N'2000-03-06' AS Date), '0931454345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0021', '2DC772DC83D35ED81074612EC4546703')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS022', N'Nguyễn Thị Hằng', N'ANHTTT-c154', CAST(N'2000-08-24' AS Date), '0932177345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0022', '87A77861CF5A6730C4DC83946D167B5A')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS023', N'Lê Thị Minh Châu', N'ANHTTT-c154', CAST(N'2000-11-05' AS Date), '0932434123', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0023', '7C3BAEF10A84EE9C81551F0E7A450D74')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS024', N'Dương Văn Dần', N'BĐATTT-c154', CAST(N'1998-06-28' AS Date), '0935734345', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0024', '66A511BC957783BBAE0AAEBA018073DF')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS025', N'Dương Văn Tuyên', N'BĐATTT-c154', CAST(N'2000-01-18' AS Date), '0932431455', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0025', '746F875FB7A42FC6B90BBC9717C2781F')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS026', N'Trịnh Văn Minh', N'BĐATTT-c154', CAST(N'2000-09-14' AS Date), '0932431777', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0026', 'F9D8C1D2137D6CA462D22AE6F133FBC6')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS027', N'Nguyễn Đức Trung Nguyên', N'BĐATTT-c154', CAST(N'2000-11-20' AS Date), '0932431149', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0027', '73BDD3E78862795CB13DABE83CB2B3AC')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS028', N'Phạm Tuấn Dũng', N'BĐATTT-c154', CAST(N'2000-11-04' AS Date), '0932148455', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0028', 'A80F9FCB8921405CF722790A0930B716')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS029', N'Ngô Quốc Cường', N'BĐATTT-c154', CAST(N'2000-03-05' AS Date), '0914831455', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0029', '689BA10C4AD4922D054C4497B5D1D5B7')
INSERT [dbo].[DocGia] ([MaDG], [TenDG], [DonVi], [NgaySinh], [SDT], [NgayDK], [NgayHH], [TenDangNhap], [MatKhau]) VALUES (N'19QS030', N'Lê Quang Minh', N'BĐATTT-c154', CAST(N'2000-10-27' AS Date), '0932434205', CAST(N'2019-02-24' AS Date), CAST(N'2023-12-20' AS Date), '19QS0030', '955333CC7140F1F55F7DED7A81031A6D')
GO

-- THÊM [MuonTra]
--đã trả đúng thời hạn
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200207','20200807',1,'19QS002')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200207','20200807',1,'19QS004')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200708','20210108',2,'19QS007')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200420','20201020',3,'19QS015')
--mượn nh chưa đến hạn trả và chưa trả
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20210108','20210708',1,'19QS017')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20210325','20210925',2,'19QS002')
--mượn bị quá hạn trả nh chưa trả
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20201017','20210417',2,'19QS009')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200930','20210330',5,'19QS010')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200825','20210225',6,'19QS022')
-- mượn bị quá hạn và đã trả
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200628','20201228',2,'19QS011')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200914','20210314',2,'19QS004')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200225','20200825',6,'19QS024')
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20201025','20210425',4,'19QS003')
--mượn mà hư hỏng
INSERT INTO [dbo].[MuonTra](NgayMuon,HanTra,MaNV,MaDG) VALUES ('20200420','20201020',3,'19QS021')
GO

--THÊM [NhaXuatBan]
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB QUÂN ĐỘI NHÂN DÂN',N'23 Lý Nam Đế, Hà Nội','8455766','nxbqd@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB  Hà Nội',N'số 4 Tống Duy Tân,Hàng Bông','024 3825 2916','nxbHN@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Đại Học Quốc Gia Hà Nội',N'14 Đào Duy Từ','024555231','nxbdhqg@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Khoa Học Kĩ Thuật',N'Bách Khoa hà Nội','19152365','nxbkhkt@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Trẻ',N'Phường 7, quận 4, tp Hồ Chí Minh','0243773258','nxbtre@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Kim Đồng',N'Số 55 Phố Quang Trung, Nguyễn Du, Hai Bà Trưng',' 024 3943 4730','nxbkimdong@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Văn Học',N'18 Nguyễn Trường Tộ, phường Trúc Bạch,',' 024 3943 147','nxbvanhoc@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Thế Giới',N'46 Trần Hưng Đạo, Hà Nội',' 024 3978 525','thegioi@thegioipublishers')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Kinh tế TPHCM',N'53/8 vườn lài, Q. Tân Phú, TP HCM',' 19172254','nxb.ueh.edu.vn')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Hội Nhà Văn',N'65 Nguyễn Du Hai Bà Trưng Hà Nội',' 024 252 3214','nxbhnv65@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Đồng nai',N'Số 1953J,P.Trung Dũng,Tp.Biên Hòa',' 061.3946521','stttt@dongnai.gov.vn')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Thanh Niên',N'64 Bà Triệu, Hoàn Kiếm, Hà Nội',' 098 25 26 569','info@nxbthanhnien.vn')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Dân Trí',N'Ngõ 26 Hoàng Cầu, Đống Đa,Hà Nội','  66860752','nxbdantri@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Hồng Đức',N'Ngã Tư Sở, Hà Nội',' 66862578','nxbhd@gmail.com')
INSERT INTO [dbo].[NhaXuatBan](TenNXB, DiaChi , SDT, Email) VALUES(N'NXB Giáo Dục',N'28 Hoàng Quốc Việt, Cổ nhuế',' 091782635','nxbgd@gmail.com')
INSERT INTO [dbo].[NhaXuatBan] ([TenNXB], [DiaChi], [SDT], [Email]) VALUES (N'Khác', NULL, NULL, NULL)
GO

--Thêm DauSach
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
select N'Dế Mèn Phiêu Lưu Ký', N'Vietnam','1', 15,NULL, 144, 2019, 35000, CAST(N'2019-01-15' AS Date), N'Ấn bản minh họa màu đặc biệt của Dế Mèn phiêu lưu ký, với phần tranh ruột được in hai màu xanh - đen ấn tượng, gợi không khí đồng thoại.
“Một con dế đã từ tay ông thả ra chu du thế giới tìm những điều tốt đẹp cho loài người. Và con dế ấy đã mang tên tuổi ông đi cùng trên những chặng đường phiêu lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thiên nhiên và văn hóa của các quốc gia khác. Dế Mèn Tô Hoài đã lại sinh ra Tô Hoài Dế Mèn, một nhà văn trẻ mãi không già trong văn chươ” - Nhà phê bình Phạm Xuân Nguyên
“Ông rất hiểu tư duy trẻ thơ, kể với chúng theo cách nghĩ của chúng, lí giải sự vật theo lô gích của trẻ. Hơn thế, với biệt tài miêu tả loài vật, 
Tô Hoài dựng lên một thế giới gần gũi với trẻ thơ. Khi cần, ông biết đem vào chất du ký khiến cho độc giả nhỏ tuổi vừa hồi hộp theo dõi, 
vừa thích thú khám phá.” - TS Nguyễn Đăng Điệp',6,
BulkColumn FROM OPENROWSET(BULK N'D:\ANH_DauSach\de-men-phieu-luu-ky.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Hướng dẫn học tập môn dân tộc học và tôn giáo', N'Vietnam',NULL, 0, NULL, 236, 2018, NULL, CAST(N'2018-09-13' AS Date), NULL,1,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\z2424116582328_ba13863e45fe69ba72e35c766bc2f484.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Nhà Giả Kim', N'Vietnam', NULL, 9, N'Hoàng Dị Thi', 228, 2013, 108000, CAST(N'2013-10-02' AS Date), N'Nhà Giả Kim là câu chuyện được xoay quanh cậu bé chăn cừu có tên Santiago trong chuyến hành trình đi tìm kho báu của mình. Cuộc hành trình này 
đã giúp cậu nhận ra nhiều bài học trong cuộc sống cũng như mục đích và ý nghĩa cuộc đời mình. ', 2,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\737846efdb9f28f0f51352cacf9225c5.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT  N'Giáo trình tư tưởng Hồ Chí Minh', N'Vietnam', NULL, 2,NULL, 253, 2006, NULL, CAST(N'2006-08-01' AS Date), NULL,1,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\z2424116775903_cf6138c5e2e3f88108a0a3494c084917.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Assembly Language for x86 Processors', N'English ', NULL, 7, NULL, 720, 2014, 500000, CAST(N'2014-08-11' AS Date), N'Cuốn sách ngôn ngữ lắp ráp được sử dụng rộng rãi, được cập nhật đầy đủ này cung cấp thông tin cơ bản cho lập trình viên mới bắt đầu quan tâm đến kiến trúc máy tính, hệ điều hành, thao tác phần cứng và viết trình biên dịch. CHỦ ĐỀ CHÍNH: Được viết riêng cho nền tảng Intel / Windows 32 và 64 bit, nghiên cứu đầy đủ và đầy đủ về ngôn ngữ lắp ráp này dạy người đọc viết và gỡ lỗi các chương trình ở cấp máy. Văn bản này đơn giản hóa và giải thích các khái niệm mà người đọc cần nắm bắt trước khi họ có thể tham gia các khóa học kiến trúc máy tính và hệ điều hành tiên tiến hơn.
Học viên đưa lý thuyết vào thực tiễn thông qua phần mềm viết ở cấp độ máy, tạo ra trải nghiệm đáng nhớ mang lại cho họ sự tự tin để làm việc trong bất kỳ môi trường định hướng hệ điều hành / máy móc nào. THỊ TRƯỜNG: Dành cho các lập trình viên và kỹ sư hệ thống nhúng,
chuyên gia truyền thông, lập trình viên trò chơi và lập trình viên đồ họa.', 4,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\41tu7E0zarL._SX258_BO1,204,203,200_.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Harry Potter Và Hòn Đá Phù Thuỷ ', N'Vietnam', '1', 4, N'Lý Lan', 366, 2017, 108000, CAST(N'2017-02-01' AS Date), N'Khi một lá thư được gởi đến cho cậu bé Harry Potter bình thường và bất hạnh, cậu khám phá ra một bí mật đã được che giấu suốt cả một thập kỉ. Cha mẹ cậu chính là phù thủy và cả hai đã bị lời nguyền của Chúa tể Hắc ám giết hại khi Harry mới chỉ là một đứa trẻ, và bằng cách nào đó, cậu đã giữ được mạng sống của mình. Thoát khỏi những người giám hộ Muggle không thể chịu đựng nổi để nhập học vào trường Hogwarts, 
một trường đào tạo phù thủy với những bóng ma và phép thuật, Harry tình cờ dấn thân vào một cuộc phiêu lưu đầy gai góc khi cậu phát hiện 
ra một con chó ba đầu đang canh giữ một căn phòng trên tầng ba. Rồi Harry nghe nói đến một viên đá bị mất tích sở hữu những sức mạnh lạ kì,
rất quí giá, vô cùng nguy hiểm, mà cũng có thể là mang cả hai đặc điểm trên.', 5,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image26.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Harry Potter Và Phòng Chứa Bí Mật', N'Vietnam ', '2', 4, N'Lý Lan', 436, 2017, 119250, CAST(N'2017-02-01' AS Date), N'Harry khổ sở mong ngóng cho kì nghỉ hè kinh khủng với gia đình Dursley kết thúc. Nhưng một con gia tinh bé nhỏ tội nghiệp đã cảnh báo cho Harry biết về mối nguy hiểm chết người đang chờ cậu ở trường Hogwarts.
 Trở lại trường học, Harry nghe một tin đồn đang lan truyền về phòng chứa bí mật, nơi cất giữ những bí ẩn đáng sợ dành cho giới phù thủy có nguồn gốc Muggle. Có kẻ nào đó đang phù phép làm tê liệt mọi người, khiến họ gần như đã chết, và một lời cảnh báo kinh hoàng được tìm thấy trên bức tường. Mối nghi ngờ hàng đầu – và luôn luôn sai lầm – là Harry.
 Nhưng một việc còn đen tối hơn thế đã được hé mở.',5,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\nxbtre_full_21472017_034753.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Harry Potter Và Tên Tù Nhân Ngục Azkaban', N'Vietnam','3', 4, N'Lý Lan', 560, 2017, 147600, CAST(N'2017-04-01' AS Date), N'Harry Potter may mắn sống sót đến tuổi 13, sau nhiều cuộc tấn công của Chúa tể hắc ám.
Nhưng hy vọng có một học kỳ yên ổn với Quidditch của cậu đã tiêu tan thành mây khói khi một kẻ điên cuồng giết người hàng loạt vừa thoát khỏi nhà tù Azkaban, với sự lùng sục của những cai tù là giám ngục.
Dường như trường Hogwarts là nơi an toàn nhất cho Harry lúc này. Nhưng có phải là sự trùng hợp khi cậu luôn cảm giác có ai đang quan sát mình từ bóng đêm, và những điềm báo của giáo sư Trelawney liệu có chính xác?
‘Câu chuyện được kể với trí tưởng tượng bay bổng, sự hài hước bất tận có thể quyến rũ cả người lớn lẫn trẻ em.’ - Sunday Express', 5,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\harry-potter.u5102.d20170425.t095624.709837.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT  N'Lập trình cở sở dữ liệu', N'Vietnam','1', 0, NULL, 376, 2009, 98000, CAST(N'2009-10-12' AS Date), NULL, 4,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\z2424294604129_90adb94a20d1f12085fde75e36405b1f.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Cà Phê Cùng Tony', N'Vietnam', NULL, 6, NULL, 268, 2017, 90000, CAST(N'2017-06-15' AS Date), N'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.
Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động 
viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp,
như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.', 2,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\ca-phe-cung-tony.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'The Blue Book of Grammar and Punctuation', N'English', N'', '11', NULL, 224, 2014, 127600, CAST(N'2016-07-13' AS Date), N'Blue Book of Grammar and Punctuation là một sổ làm việc ngắn gọn, giải trí và hướng dẫn về ngữ pháp, dấu câu và cách sử dụng tiếng Anh. 
Tài nguyên thân thiện với người dùng này bao gồm các giải thích đơn giản về ngữ pháp, dấu câu và cách sử dụng; điểm số của các ví dụ hữu ích; hàng chục bảng tính có thể tái sản xuất; và trước và sau các bài kiểm tra để giúp dạy ngữ pháp cho học sinh ở mọi lứa tuổi. Thích hợp cho hầu hết mọi lứa tuổi, hướng dẫn có thẩm quyền này làm cho việc học ngữ pháp và cách sử dụng tiếng Anh trở nên đơn giản và thú vị. Phiên bản thứ mười một được cập nhật này phản ánh các bản cập nhật mới nhất về cách sử dụng và ngữ pháp tiếng Anh và có thiết 
kế hai màu được sửa đổi hoàn toàn và ràng buộc lay-flat để sao chép dễ dàng.', 8,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\51zuAbvtwgL._SX383_BO1,204,203,200_.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Không Gia Đình', N'Vietnam ', NULL, 5, NULL, 464, 2019, 106240, CAST(N'2019-09-23' AS Date), N'KHÔNG GIA ĐÌNH kể chuyện về cuộc đời của cậu bé Reeesmi. Từ nhỏ, Rémi đã bị bắt cóc, rồi bị bố nuôi bán cho một đoàn xiếc thú. Em đã theo đoàn xiếc ấy đi lưu lạc khắp nước Pháp.
KHÔNG GIA ĐÌNH luôn cuốn hút, hấp dẫn người đọc vì đây chính là những cuộc phiêu lưu của lòng dũng cảm và tình cảm gia đình. KHÔNG GIA ĐÌNH là quyển sách hay nhất về giáo dục, xứng đáng nhận giải thưởng của viện hàn lâm văn học Pháp.', 6,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\khong_gia_dinh_16x24_bia_2019.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Python Crash Course', N'English ', N'1', 2, NULL, 544, 2019, 254000, CAST(N'2019-12-03' AS Date), N'Python Crash Course was selected as one of the best books for learning Python by Real Python
“It has been interesting to see, over the last few years, No Starch Press, which produces this book, growing and producing future classics that should be alongside the more traditional O’Reilly Press programming books. Python Crash Course is one of those books.”', 6,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\510-dE3N1PL._A.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Truyện Kiều',N'Việt Nam',NULL,24,NULL,296,2018,78000,cast(N'2019-02-14' as date),NULL,7,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\z2424116582328_ba13863e45fe69ba72e35c766bc2f484.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Giáo trình cơ sở văn hoá việt nam', N'Vietnam ', N'1', 1, N'', 200, 2003, NULL, CAST(N'2004-03-15' AS Date), NULL,1,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\z2424116523207_14c35b2edc68ec7c5ba27ae63ad791eb.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Nhân cách Bác Hồ', N'Vietnam ', NULL, 7, NULL, 200, 2003, 36000, CAST(N'2004-03-15' AS Date), N'48 năm Người đã đi xa. Lật giở từng trang thời gian trên mặt báo tuổi trẻ, năm tháng đã gọi nên hàng ngàn bài viết về Người. Mỗi giá trị to lướn không ngừng , từ một di sản vô giá của dân tộc, nhân cách
và tư tưởng Hồ Chí Minh. Chọn lấy 1 giá trị trên bài báo, góp lại thành quyển sách nhỏ, như là một việc thiết thực nhân kỉ niệm 48 năm thực hiện Di chúc Bác Hồ. Cũng là để góp phần vào thư viện nhà trường, tủ sách gia đình, và ngăn sách bồi dưỡng tâm hồn
của mỗi bạn trẻ thêm một cuốn sách học làm người',5,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\nhan_cach_bac_ho_1_2019_02_20_15_49_40.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Sói đội lốt Cừu', N'Vietnam ', NULL, NULL, N'Nguyễn Hưởng- Hạo Thiên', 172, 2020, 95000, CAST(N'2020-12-12' AS Date), N'Mỗi khi bị thao túng và đối xử tàn tệ, nạn nhân thường tự diễn giải và hợp lí hóa cho các hành vi lệch lạc của kẻ thao túng. Họ cho rằng kẻ thao túng- những con sói đột lốt cừu- thường khồn
cố ý làm hại người xung quang, rằng các hành vi xấu ấy vốn có nguyên nhân là những tổn thương tâm lí ẩn bên trong kẻ thao túng',9,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\soi_front.png', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Trần Thủ Độ', N'Vietnam ', NULL,3, NULL, 172, 2010, 62000, CAST(N'2017-10-10' AS Date), N'Trong cuốn tiểu thuyết, Trần Thủ Độ hiện lên với hình ảnh một vị tướng lĩnh trung trinh, hết lòng vì dòng tộc, vì nhân dân Đại Việt. Từng bước đi của ông
trong tiến trình thực hiện sự nghiệp lón đều thể hiện rõ tài mưu lược, sự quyết đoán và tinh thần dân tộc mãnh liệt. Đọsachsch chúng ta có thể thấy được một góc nhìn về Trần Thủ Độ, về triều đại nhà Trần và hiểu được 
vì sao Hào khí Đông A lại lưu danh sử sách',10,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\8936184340095.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Hai số phận', N'Vietnam ', NULL,NULL, N'Nguyễn Việt Hải', 768, 2018, 122000, CAST(N'2019-04-25' AS Date), N'"Hai số phận không chỉ đơn thuần là một cuốn tiểu thuyết, đây có thể xem là "thánh kinh" cho người đọc. 
Làm rung động mọi trái tim quả cảm, có thể làm thay đổi cuộc đời bạn"',7,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\hai-so-phan.jpg', SINGLE_BLOB) image;--tiểu thuyết
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Bước đường cùng', N'Vietnam ', NULL,NULL, NULL, 235, 2017, 78000, CAST(N'2019-04-25' AS Date), N'Bước đường cùng đánh dấu đỉnh cao về tư tưởng của nhà văn Nguyễn Công Hoan và là một trong những tác phẩm tiêu biểu nhất. Lúc viết, tác giả cũng đã có lường trước sách sẽ bị cấm
. Là tiểu thuyết nói về anh Pha, một nông dân nghèo bị Trương Thi- người hàng xóm không tốt bỏ bã rượu vào ruộng rồi bảo Tây đoan về bắt. nhưng thi bỏ lầm vào ruộng Nghị lại, một địa chủ lớn trong vùng. Pha thoát nạn. Nghị Lại xúi Trương Thi kiện Pha rồi lại xúi Pha kiện Trương Thi...',7,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\sach-buoc-duong-cung.png', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Khở nghiệp kinh doanh', N'Vietnam ', NULL,3, NULL, 800, 2015, 62000, CAST(N'2018-10-11' AS Date), N'Tinh thần kinh doanh và nỗ lực khởi nghiệp vừa là xu thế vừa là động lực quan trọng để phát triển kinh tế thế giới nói chung và Việt Nam nói riêng. Đi cùng với xu thế này, uqarn trị khởi nghiệp là một chủ đề mang tính thực tiễn và 
cả tính học thuật nhằm đáp ứng xu hướng phát triển ở nhiều quốc gia.',14,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\b1_1_3.jpg', SINGLE_BLOB) image;--kinh tế
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Sức mạnh của việc đặt câu hỏi đúng', N'Vietnam ', NULL,5,N'Thu Thảo', 226, 2018, 57000, CAST(N'2018-10-11' AS Date), N'',6,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\3_13.png', SINGLE_BLOB) image; -- thẻ loại giáo dục
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Con tim Stokholm', N'Vietnam ', NULL,5,NULL, 228, 2021, 36000, CAST(N'2021-02-04' AS Date), N'Truyện ngắn nói về mọt sự đười đắng ngắt, ấy là con người thật đáng thương trong khát vọng tư do. "Người ta có cởi trói cho nhau được không?" câu hỏi quá khó nếu như người ta còn muốn trói buộc nhau, muốn
bắt nhau làm con tin. Ngược lại thì quá dễ. Khó khó dễ dễ, được được mất mất, sắc sắc không không, những câu hỏi tự do đều vậy cả',5,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_227308.jpg', SINGLE_BLOB) image;-- thể loại tản văn
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Tục ngữ ca dao Việt Nam', N'Vietnam ', N'2',7,NULL, 179, 2017, 22500, CAST(N'2018-07-15' AS Date), N'Giúp các bạn có thêm tư liệu học tập và giúp mọi người hiểu chính xác hơn về loại hình văn học truyền miệng bao đời nay. Cùng với đó còn giúp ta hiểu được bản sắc văn hóa dân tộc, hiểu được đặc điểm
của xã hội Việt Nam cổ truyền',11,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_222873.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Thơ ngụ ngôn La Fontaine', N'Vietnam ', N'1',4,N'Nguyễn Văn Vĩnh', 74, 2020, 32500, CAST(N'2020-03-05' AS Date), N'',8,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_220115.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Thơ ngụ ngôn La Fontaine', N'Vietnam ', N'2',4,N'Nguyễn Văn Vĩnh', 82, 2020, 33000, CAST(N'2020-03-05' AS Date), N'',8,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_220115.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Biến thân', N'Vietnam ', NULL,2,N'Cẩm Hương', 384, 2020, 110000, CAST(N'2020-03-05' AS Date), N'Một thanh niên trung hậu hiền lành, không may gặp tai bay vạ gió. Người ta đưa cậu vào bệnh viện, tiến hành 1 ca phaaxux thuật lần đâu tiên trên thế giới.
Ra viện, thanh niên trở lại với công việc. Nhưng câu không còn hiền lành, trung hậu, cũng không nín nhịn nữa...',11,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\bien-than---bia1.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Kể chuyện Bác hồ', N'Vietnam ', NULL,2,NULL, 198, 2014,47000, CAST(N'2017-06-19' AS Date), N'Các em học sinh thân mến. Có một câu hát đã từng làm say sưa, xúc động bao thế hệ thiếu niên nhi đồng nửa thế kỉ nay, vẫn được các em hát lên, hát mãi
để tỏ lòng kính yêu Bác hồ vô hạn..',14,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\9786040067098.jpg', SINGLE_BLOB) image;--thể loại giáo dục
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Đại Việt sử ký toàn thư', N'Vietnam ', NULL,6,N'Ngô Đức Thọ, Hoàng Văn Lâu', 1263, 2017,257000, CAST(N'2017-06-19' AS Date), N'Đại Việt sử ký toàn thư là bộ quốc sử danh tiếng, một di sản quý báu của dân tộc ta. Đó là một bộ sử cái, có giá trị nhiều mặt, gắn liên với tên tuổi các nhà sử học nổi tiếng như Ngô Sỹ Liên, Phạm Công Trứ...
Việc phát hiện và in bản xưa nhất của bộ Đại Việt sử ký toàn thư mang ý nghĩa đặc biệt..',8,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\8936071674074_1_1.jpg', SINGLE_BLOB) image;-- nhiều tác giả
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Tiếng anh giao tiếp', N'Vietnam ', NULL,NULL,NULL, 360, 2020,112000, CAST(N'2017-06-19' AS Date), N'',3,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_195509_1_37892.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Lập trình Windows Form và Web Form', N'Vietnam ', NULL,NULL,NULL, 432, 2020,112000, CAST(N'2020-12-12' AS Date), N'Sách gồm 3 phần: 1. Ứng dụng Windows Form; 2. Xây dựng ứng dụng quản lí bán hàng; 
3. Xây dựng ứng dụng quản lý tuyển sinh',12,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_195509_1_27691.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Từ Điển Nga', N'Vietnam ', NULL,NULL,NULL, 442, 2018,265000, CAST(N'2018-07-15' AS Date), N'',8,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_190187.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Từ Điển Anh', N'Vietnam ', NULL,NULL,NULL, 852, 2019,265000, CAST(N'2019-07-15' AS Date), N'',13,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_195509_1_18808.jpg', SINGLE_BLOB) image;
INSERT INTO dbo.DAUSACH(TENDS, NGONNGU,TAP,LANTAIBAN,DICHGIA,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MOTA,MANXB,HINHANH)
SELECT N'Ngữ pháp Tiếng Anh thường dùng', N'Vietnam ', NULL,2,NULL, 980, 2016,247000, CAST(N'2019-07-15' AS Date), N'Sách gồm 145 bài học. Mỗi bài tập trung vào một điểm ngữ pháp cụ thể. Cấu trúc mỗi bài học gồm bài học ngữ pháp có ví dụ và giải thích cụ thể,
tiếp theo là bài tập để củng cố ngữ pháp',12,
* FROM OPENROWSET(BULK N'D:\ANH_DauSach\image_84849.jpg', SINGLE_BLOB) image;
GO

-- Thêm [CuonSach]
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0001', N'Phòng 1,Ngăn 3,Kệ 6', 0, 1)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0002', N'Phòng 1,Ngăn 2,Kệ 2', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0003', N'Phòng 1,Ngăn 2,Kệ 3', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0004', N'Phòng 1,Ngăn 2,Kệ 4', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0005', N'Phòng 1,Ngăn 1,Kệ 5', 1, 3)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0006', N'Phòng 1,Ngăn ,Kệ', 0, 3)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0007', N'Phòng 1,Ngăn ,Kệ', 0, 3)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0008', N'Phòng 1,Ngăn ,Kệ', 1, 3)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0009', N'Phòng 1,Ngăn ,Kệ', 0, 4)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0010', N'Phòng 1,Ngăn ,Kệ', 1, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0011', N'Phòng 1,Ngăn ,Kệ', 0, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0012', N'Phòng 1,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0013', N'Phòng 1,Ngăn ,Kệ', 1, 7)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0014', N'Phòng 1,Ngăn ,Kệ', 1, 8)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0015', N'Phòng 1,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0016', N'Phòng 1,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0017', N'Phòng 2,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0018', N'Phòng 2,Ngăn ,Kệ', 1, 13)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0019', N'Phòng 2,Ngăn ,Kệ', 1, 11)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0020', N'Phòng 2,Ngăn ,Kệ', 1, 11)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0021', N'Phòng 2,Ngăn ,Kệ', 1,2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0022', N'Phòng 2,Ngăn ,Kệ', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0023', N'Phòng 2,Ngăn ,Kệ', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0024', N'Phòng 2,Ngăn ,Kệ', 1, 10)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0025', N'Phòng 2,Ngăn ,Kệ', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0026', N'Phòng 2,Ngăn ,Kệ', 1, 10)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0027', N'Phòng 2,Ngăn ,Kệ', 1, 9)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0028', N'Phòng 2,Ngăn ,Kệ', 1, 9)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0029', N'Phòng 2,Ngăn ,Kệ', 1, 9)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0030', N'Phòng 2,Ngăn ,Kệ', 1, 12)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0031', N'Phòng 2,Ngăn ,Kệ', 1, 9)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0032', N'Phòng 2,Ngăn ,Kệ', 1, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0033', N'Phòng 2,Ngăn ,Kệ', 1, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0034', N'Phòng 2,Ngăn ,Kệ', 1, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0035', N'Phòng 2,Ngăn ,Kệ', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0036', N'Phòng 2,Ngăn ,Kệ', 1, 2)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0037', N'Phòng 2,Ngăn ,Kệ', 1, 3)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0038', N'Phòng 3,Ngăn ,Kệ', 1, 5)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0039', N'Phòng 3,Ngăn ,Kệ', 1, 1)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0040', N'Phòng 3,Ngăn ,Kệ', 1, 7)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0041', N'Phòng 3,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0042', N'Phòng 1,Ngăn ,Kệ', 1, 14)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0043', N'Phòng 1,Ngăn ,Kệ', 1, 14)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0044', N'Phòng 1,Ngăn ,Kệ',1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0045', N'Phòng 1,Ngăn ,Kệ', 0, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0046', N'Phòng 1,Ngăn ,Kệ', 0, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0047', N'Phòng 1,Ngăn ,Kệ',1, 15)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0048', N'Phòng 2,Ngăn ,Kệ', 1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0049', N'Phòng 2,Ngăn ,Kệ',1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0050', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0051', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0052', N'Phòng 2,Ngăn ,Kệ', 1, 19)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0053', N'Phòng 3,Ngăn ,Kệ', 1, 20)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0054', N'Phòng 3,Ngăn ,Kệ', 1, 21)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0055', N'Phòng 3,Ngăn ,Kệ', 1, 21)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0056', N'Phòng 3,Ngăn ,Kệ', 1, 22)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0057', N'Phòng 3,Ngăn ,Kệ', 1, 23)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0058', N'Phòng 3,Ngăn ,Kệ', 1, 23)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0059', N'Phòng 3,Ngăn ,Kệ', 1, 24)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0060', N'Phòng 3,Ngăn ,Kệ', 1, 25)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0061', N'Phòng 1,Ngăn ,Kệ', 1, 26)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0062', N'Phòng 1,Ngăn ,Kệ', 1, 26)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0063', N'Phòng 1,Ngăn ,Kệ', 1, 26)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0064', N'Phòng 1,Ngăn ,Kệ', 1, 27)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0065', N'Phòng 2,Ngăn ,Kệ', 1, 27)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0066', N'Phòng 1,Ngăn ,Kệ', 1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0067', N'Phòng 1,Ngăn ,Kệ', 1, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0068', N'Phòng 1,Ngăn ,Kệ', 1, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0069', N'Phòng 1,Ngăn ,Kệ', 1, 28)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0070', N'Phòng 2,Ngăn ,Kệ', 1, 29)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0071', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0072', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0073', N'Phòng 2,Ngăn ,Kệ', 1, 30)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0074', N'Phòng 2,Ngăn ,Kệ', 1, 30)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0075', N'Phòng 3,Ngăn ,Kệ', 1, 30)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0076', N'Phòng 3,Ngăn ,Kệ', 1, 31)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0077', N'Phòng 3,Ngăn ,Kệ', 0, 31)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0078', N'Phòng 3,Ngăn ,Kệ', 1, 32)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0079', N'Phòng 3,Ngăn ,Kệ', 1, 33)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0080', N'Phòng 3,Ngăn ,Kệ', 1, 34)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0082', N'Phòng 3,Ngăn ,Kệ', 1, 7)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0083', N'Phòng 3,Ngăn ,Kệ', 1, 6)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0084', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0085', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0086', N'Phòng 2,Ngăn ,Kệ', 1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0087', N'Phòng 2,Ngăn ,Kệ', 1, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0088', N'Phòng 3,Ngăn ,Kệ', 1,16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0089', N'Phòng 1,Ngăn ,Kệ', 1, 9)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0090', N'Phòng 1,Ngăn ,Kệ', 1, 15)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0091', N'Phòng 1,Ngăn ,Kệ', 1, 25)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0092', N'Phòng 1,Ngăn ,Kệ', 1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0093', N'Phòng 1,Ngăn ,Kệ', 1, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0094', N'Phòng 2,Ngăn ,Kệ', 1, 29)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0095', N'Phòng 2,Ngăn ,Kệ', 1, 18)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0096', N'Phòng 2,Ngăn ,Kệ', 1, 16)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0097', N'Phòng 2,Ngăn ,Kệ', 1, 17)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0098', N'Phòng 2,Ngăn ,Kệ', 1, 25)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0099', N'Phòng 3,Ngăn ,Kệ', 1, 27)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0100', N'Phòng 3,Ngăn ,Kệ', 0, 22)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0101', N'Phòng 3,Ngăn ,Kệ', 1, 27)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0102', N'Phòng 3,Ngăn ,Kệ', 1, 7)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0103', N'Phòng 3,Ngăn ,Kệ', 1, 21)
INSERT [dbo].[CuonSach] ([SoCaBiet], [ViTriSach], [TinhTrang], [MaDS]) VALUES (N'CS0104', N'Phòng 2,Ngăn ,Kệ',1, 4)
GO

-- Thêm [ChiTietMuonTra]
--trả sách đúng thời hạn
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (1,N'CS0001','20200807',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (1,N'CS0007','20200807',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (2,N'CS0005','20200807',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (2,N'CS0014','20200807',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (2,N'CS0022','20200729',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (3,N'CS0088','20210108',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (4,N'CS0072','20200920',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (6,N'CS0007','20210425',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (8,N'CS0055','20210325',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (12,N'CS0033','20200729',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (13,N'CS0028','20210130',1)
--trả đúng hạn nhưng làm hư hỏng
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (14,N'CS0035','20201020',1)
--mượn nhưng chưa đến hạn trả và chưa trả
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (5,N'CS0001',NULL,0)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (5,N'CS0046',NULL,0)
--6 có 2 quyển chưa trả và 1 quyển trả rồi
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (6,N'CS0045',NULL,0)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (6,N'CS0037',NULL,0)
--mượn sách quá hạn trả nh chưa trả
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (7,N'CS0092',NULL,0)
--số 8 mượn 3 quyển,1 trả đúng hạn, 2 chưa trả và quá hạn
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (8,N'CS0011',NULL,0)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (8,N'CS0077',NULL,0)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (9,N'CS0006',NULL,0)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (13,N'CS0100',NULL,0)
--mượn bị quá hạn và đã trả
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (10,N'CS0057','20210125',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (10,N'CS0058','20210125',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (11,N'CS0067','20210325',1)
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (12,N'CS0041','20201025',1)
--13 mượn 3 quyển,1 trả đúng thời hạn, 1 quá hạn chưa trả, 1 quá hạn đã trả
INSERT INTO [dbo].[ChiTietMuonTra](MaMT,SoCaBiet,NgayTra,TrangThai) VALUES (13,N'CS0037','20210428',1)
GO

-- Thêm [TheLoai]
INSERT INTO [dbo].[TheLoai](TenTL) VALUES  (N'Tiểu thuyết')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Quân Sự')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Ngoại Ngữ')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Khoa học Công nghệ')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Kinh dị, phiêu lưu')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Kĩ năng sống')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Giáo dục')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Tiểu thuyết lịch sử')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Kinh Tế')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Tản Văn')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Ca dao, Tục ngữ')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Truyện cười')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Truyện Trinh Thám')
INSERT INTO [dbo].[TheLoai](TenTL) VALUES (N'Từ điển')
GO

-- Thêm [TacGia]
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Paulo Coelho',N'Bồ Đào Nha') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Trần Mạnh Tường',N'Việt Nam') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Kip R Irvine',N'England') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Tô Hoài',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Tony',N'Pháp') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Du',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'J. K. Rowling',N'Mỹ')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Hector Malot',N'Đữ') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'jane straue',N'Anh') 
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Hồ Tri',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Phạm Văn Thịnh',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Quang Thanh',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nhiều tác giả',NULL)
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Trần Thanh Cảnh',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'JEFFREY ARCHER',N'Pháp')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Công Hoan',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Donald F Kuratko',N'Bồ Đào Nha')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Mihiro Mátuda',N'Ý')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Hoàng Công Danh',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Đức Trí',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'La Fontaine',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Keigo Higashion',N'Nhật Bản')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Hữu Đảng',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Thanh Yến',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Tất Bảo Thiện',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Phạm Quang Hiển',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Ngọc Hùng',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Thu lan',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Đức Long',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Phạm Ngọc Anh',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Mạnh Quang Thắng',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Ngọc Cơ',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'GEOGRE K.SIMON',N'Ấn Độ')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Hữu Quyền',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Nguyễn Thị Nga',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Bùi Gia Tùng',N'Việt Nam')
INSERT INTO [dbo].[TacGia](TenTG, QuocTich ) VALUES (N'Phạm Bảo Ngọc',N'Việt Nam')
INSERT INTO [dbo].[TacGia] ([TenTG], [QuocTich]) VALUES (N'Khác', NULL)

-- Thêm [XuLyViPham]
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (28000,N'Quá hạn',N'Đã trả',2,10,'CS0057')
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (28000,N'Quá hạn',N'Đã trả',2,10,'CS0058')
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (11000,N'Quá hạn',N'Đã trả',3,11,'CS0067')
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (5000,N'Mất sách',N'Đã mua đền',4,12,'CS0041')
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (540000,N'Mất sách',N'Đã đền theo giá bìa',2,13,'CS0037')
INSERT INTO [dbo].[XuLyViPham](TienPhat, LyDo, TinhTrang, MaNV, MaMT,  SoCaBiet) VALUES (708000,N'Quá hạn',N'Đã đền',6,14,'CS0035')
GO

-- Thêm [TheLoaiDauSach]
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 1)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 3)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 6)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 7)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 8)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 10)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 12)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 18)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 20)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 21)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 28)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (1, 15)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (2, 2)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (2, 4)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (2, 16)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 8)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 6)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 7)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 28)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 18)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (5, 24)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (3, 34)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (3, 33)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (3, 31)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 9)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 14)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 22)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 23)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 5)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (6, 21)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (6, 23)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (6, 5)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 2)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 9)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 14)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 16)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 17)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 25)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 29)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (7, 31)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (8, 29)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (8, 30)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (9, 22)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (9, 23)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (10, 24)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (11, 25)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (11, 26)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (11, 27)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (13, 28)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (14, 33)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (11, 34)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (3, 11)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (3, 13)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (8, 19)
INSERT [dbo].[TheLoaiDauSach] ([MaTL], [MaDS]) VALUES (4, 32)
GO

-- thêm [SangTac]
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (1, 4, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (3, 1, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (10, 5, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (15, 6, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (12, 8, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (8, 7, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (6, 7, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (7, 7, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (11, 9, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (16, 10, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (16, 11, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (16, 12, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (17, 13, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (19, 14, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (20, 15, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (21, 16, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (22, 17, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (23, 18, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (24, 19, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (25, 20, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (26, 21, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (27, 21, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (28, 22, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (29, 23, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (30, 13, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (31, 24, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (32, 25, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (33, 27, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (34, 28, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (4, 28, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (4, 29, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (4, 30, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (9, 9, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (2, 32, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (2, 34, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (2, 35, 2)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (5, 3, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (13, 9, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (14, 36, 1)
INSERT [dbo].[SangTac] ([MaDS], [MaTG], [ViTriTacGia]) VALUES (18, 37, 1)
GO
