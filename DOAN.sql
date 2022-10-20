CREATE DATABASE QLHT_Sinh_Vien
GO

USE QLHT_Sinh_Vien
GO

--Tao Bang Mon Hoc --
Create Table MonHoc
 (
   MaMonHoc nvarchar(100) primary key,
   TenMonHoc nvarchar(100) not null,
   SoTinChi smallint not null,
   SoTietHoc smallint not null

 )
 ALTER TABLE MonHoc	add constraint MonHoc_SoTietHoc check (SoTietHoc = SoTinChi *15)	

--- Tao Bang Khoa Hoc ---
Create Table KhoaHoc
 (
   MaKhoaHoc nvarchar(100) primary key,
   TenKhoaHoc nvarchar(100) not null,
   NamBatDau smallint,
   NamKetThuc smallint
 )
 ALTER TABLE KhoaHoc add constraint KhoaHoc_NamBD_NamKT check (NamKetThuc = NamBatDau + 4)	

--- Tao Bang Khoa --
Create Table Khoa
 (
   MaKhoa nvarchar(10) primary key,
   TenKhoa nvarchar(100) not null,
   ChuyenNganh nvarchar(100) not null
 )
-- Tao Bang Lop ---
Create Table Lop
 (
   MaLop nvarchar(100) primary key,
   TenLop nvarchar(100) not null,
   MaKhoa nvarchar(10) not null,
   MaKhoaHoc nvarchar(100) not null,
   foreign key(MaKhoa) references Khoa(MaKhoa),
   foreign key(MaKhoaHoc) references KhoaHoc(MaKhoaHoc),
 )

 --Tao bang Sinh vien --
 Create Table SinhVien (
    MaSV int primary key,
    MaLop nvarchar(100) foreign key references Lop (MaLop),
    MaKhoa nvarchar(10) foreign key references Khoa (MaKhoa),
    HoTen  nvarchar(100) ,
    NgaySinh date ,
    GioiTinh bit,
    QueQuan nvarchar(100) ,
    Email nvarchar(100)  ,
    SDT char(15) 
    )
	alter table SinhVien add constraint SinhVien_Email unique(Email)
	alter table SinhVien add constraint SinhVien_SDT unique(SDT)

 --Tao bang Hoc--
 Create Table Hoc (
 MaSV int foreign key references SinhVien(MaSV),
 MaMonHoc nvarchar(100) foreign key references MonHoc(MaMonHoc),
 DiemQT float ,
 DiemThi float ,
 DiemKetThuc float 
 )
  alter table Hoc 
  add constraint  Ktra_Hoc check ((DiemKetThuc > 0 AND DiemKetThuc <= 10) and(DiemQT > 0 AND DiemQT <= 10) and (DiemThi > 0 AND DiemThi <= 10) and(DiemKetThuc = 0.3*DiemQT + 0.7*DiemThi))

  --NHAP LIEU

--Nhap lieu cho Bang MonHoc
INSERT INTO MonHoc values('01',N'Công nghệ phần mềm',4,60)
INSERT INTO MonHoc values('02',N'Công nghệ Java',3,45)
INSERT INTO MonHoc values('03',N'Mạng máy tính ',2,30)
INSERT INTO MonHoc values('05',N'SQL Server',4,60)
INSERT INTO MonHoc values('06',N'Tiếng Anh TOEIC',2,30)
INSERT INTO MonHoc values('12',N'Kiến trúc máy tính',3,45)
INSERT INTO MonHoc values('11',N'Trí tuệ nhân tạo',3,45)
INSERT INTO MonHoc values('10',N'Xác suất thống kê',2,30)
INSERT INTO MonHoc values('09',N'Triết học Mác',1,15)
INSERT INTO MonHoc values('08',N'Vật lý đại cương',2,30)
INSERT INTO MonHoc values('07',N'Thể chất',1,15)
INSERT INTO MonHoc values('13',N'Vi xử lý',2,30)
INSERT INTO MonHoc values('14',N'Kinh tế chính trị ',3,45)
INSERT INTO MonHoc values('15',N' Kỹ thuật truyền thông',3,45)
INSERT INTO MonHoc values('16',N'Cơ học cơ sở',2,30)
INSERT INTO MonHoc values('17',N'Sức bền vật liệu',1,15)
INSERT INTO MonHoc values('18',N'Kinh tế vi mô',3,45)
INSERT INTO MonHoc values('19',N'Phiên dịch nâng cao',1,15)
INSERT INTO MonHoc values('20',N'Kỹ thuật thi công',2,30)
INSERT INTO MonHoc values('21',N'Vật liệu xây dựng',2,30)
INSERT INTO MonHoc values('22',N'Marketing',3,45)
--Nhap lieu cho Bang KhoaHoc
INSERT INTO KhoaHoc values('K62',N'Khoá 62',2017,2021)
INSERT INTO KhoaHoc values('K63',N'Khoá 63',2018,2022)
INSERT INTO KhoaHoc values('K61',N'Khoá 61',2016,2020)
INSERT INTO KhoaHoc values('K64',N'Khoá 64',2019,2023)
INSERT INTO KhoaHoc values('K65',N'Khoá 65',2020,2024)
INSERT INTO KhoaHoc values('K66',N'Khoá 66',2021,2025)

--Nhap lieu cho Bang Khoa
INSERT INTO Khoa values('IT',N'Công nghệ thông tin',N'Mạng và hệ thống')
INSERT INTO Khoa values('CS',N'Khoa học máy tính',N'Phần mềm')
INSERT INTO Khoa values('KT',N'Kinh tế',N'Kinh tế quốc tế')
INSERT INTO Khoa values('XD',N'Xây dựng',N'Xây dựng dân dụng')
INSERT INTO Khoa values('FL',N'Ngoại ngữ',N'Ngôn ngữ')

--Nhap lieu cho Bang Lop
INSERT INTO Lop values('65IT3',N'Công nghệ thông tin 03','IT','K65')
INSERT INTO Lop values('62FL4',N'Ngoại ngữ 04','FL','K62')
INSERT INTO Lop values('61XD1',N'Xây dựng 01','XD','K61')
INSERT INTO Lop values('66CS2',N'Máy tính 02','CS','K66')
INSERT INTO Lop values('64KT6',N'Kinh tế 06','KT','K66')

--Nhap lieu cho Bang Hoc
INSERT INTO Hoc values('55202011','02',8,9,8.7) 
INSERT INTO Hoc values('55202005','18',5,10,8.5) 
INSERT INTO Hoc values('55202002','13',10,10,10) 
INSERT INTO Hoc values('55202020','19',7,7,7) 
INSERT INTO Hoc values('55202017','07',9,9,9) 
INSERT INTO Hoc values('55202001','11',10,10,10) 
INSERT INTO Hoc values('55202012','17',7.5,7.5,7.5) 
INSERT INTO Hoc values('55202004','22',5,10,8.5)  
INSERT INTO Hoc values('55202015','21',6.5,6.5,6.5) 
INSERT INTO Hoc values('55202009','05',1.5,10,7.45) 
INSERT INTO Hoc values('55202012','22',5,10,8.5)
INSERT INTO Hoc values('55202020','02',8,9,8.7)
INSERT INTO Hoc values('55202017','18',9,10,9.7)
INSERT INTO Hoc values('55202001','02',7.5,7.5,7.5)
INSERT INTO Hoc values('55202020','11',5,5,5)
INSERT INTO Hoc values('55202015','11',9,9,9)
INSERT INTO Hoc values('55202001','13',4,4,4)
INSERT INTO Hoc values('55202001','13',7.5,7.5,7.5)
INSERT INTO Hoc values('55202015','22',7,7,7)
INSERT INTO Hoc values('55202011','09',4,4,4)

--Nhap lieu cho Bang SinhVien
INSERT INTO SinhVien values ('55202001','65IT3','IT',N'Đỗ Xuân H','2002-11-06',1,N'Hà Nội','dxh5501@nuce.edu','0866334212')
INSERT INTO SinhVien values ('55202002','65IT3','IT',N'Phạm Thị A','2002-07-21',0,N'Nam Định','pta5502@nuce.edu','0842634775')
INSERT INTO SinhVien values ('55202003','64KT6','KT',N'Trịnh Ngọc X','2001-01-24',1,N'Hải Phòng','tnx5503@nuce.edu','0961534001')
INSERT INTO SinhVien values ('55202004','64KT6','KT',N'Nguyễn Văn T','2001-02-14',1,N'Bắc Giang','nvt5504@nuce.edu','0266154272')
INSERT INTO SinhVien values ('55202005','64KT6','KT',N'Nguyễn Thị L','2001-02-28',0,N'Hà Nội','ntl5505@nuce.edu','0332445671')
INSERT INTO SinhVien values ('55202006','64KT6','KT',N'Ngô Lan A','2001-10-01',0,N'Hưng Yên','nla5506@nuce.edu','0126333996')
INSERT INTO SinhVien values ('55202007','65IT3','IT',N'Đồng Quang H','2002-02-11',1,N'Quảng Ninh','dqh5507@nuce.edu','0771252465')
INSERT INTO SinhVien values ('55202008','65IT3','IT',N'Phan Mạnh C','2002-07-04',1,N'Nghệ An','pmc5508@nuce.edu','0892114769')
INSERT INTO SinhVien values ('55202009','66CS2','CS',N'Nguyễn Kim C','2003-02-02',0,N'Thanh Hoá','nkc5509@nuce.edu','0996745213')
INSERT INTO SinhVien values ('55202010','66CS2','CS',N'Phan Đăng L','2003-05-01',1,N'Thái Bình','pdl5510@nuce.edu','0273667120')
INSERT INTO SinhVien values ('55202011','66CS2','CS',N'Đỗ Thị K','2003-06-06',0,N'Nam Định','dtk5511@nuce.edu','0780220006')
INSERT INTO SinhVien values ('55202012','61XD1','XD',N'Nguyễn Quang V','1998-11-08',1,N'Hà Nội','nqv5512@nuce.edu','0771009323')
INSERT INTO SinhVien values ('55202013','61XD1','XD',N'Bùi Thanh S','1998-11-11',1,N'Hà Nội','bts5513@nuce.edu','0231446705')
INSERT INTO SinhVien values ('55202014','61XD1','XD',N'Vương Ngọc M','1998-01-29',1,N'Phú Thọ','vnm5514@nuce.edu','0321366704')
INSERT INTO SinhVien values ('55202015','61XD1','XD',N'Lưu Quốc G','1998-08-31',1,N'Hải Dương','lqg5515@nuce.edu','0445892771')
INSERT INTO SinhVien values ('55202016','61XD1','XD',N'Mai Hương N','1998-09-02',0,N'Cao Bằng','mhn5516@nuce.edu','0131767842')
INSERT INTO SinhVien values ('55202017','62FL4','FL',N'Phạm Hà A','1999-09-28',0,N'Hưng Yên','pha5517@nuce.edu','0364904911')
INSERT INTO SinhVien values ('55202018','62FL4','FL',N'Nguyễn Ngọc L','1999-07-17',0,N'Bắc Giang','nnl5518@nuce.edu','0977620058')
INSERT INTO SinhVien values ('55202019','65IT3','IT',N'Nguyễn Đăng T','2002-08-20',1,N'Hà Nội','ndt5519@nuce.edu','0196002438')
INSERT INTO SinhVien values ('55202020','62FL4','FL',N'Luyện Thị Y','1999-05-26',0,N'Quảng Ninh','lty5520@nuce.edu','0445632071')



--TRUY VAN DU LIEU 

--		Theo bảng SINH VIÊN


-- 1.Hiện thi danh sách sinh viên gồm các thông tin sau : MaSV, MaLop , HoTen_SinhVien , QueQuan , Email, SDT
SELECT SinhVien.MaSV, SinhVien.MaLop, SinhVien.HoTen, SinhVien.QueQuan, SinhVien.Email,SinhVien.SDT FROM SinhVien

-- 2.Hiển thị thông tin sinh viên có giới tinh Nữ và có số tuổi > 19
SELECT * FROM SinhVien 
where (GioiTinh = 0) and (Year(GETDATE()) - YEAR(NgaySinh) >19)
-- 3.Hiển thị top 5 sinh viên có số tuổi lớn nhất 
select top 5 SinhVien.MaSV, SinhVien.HoTen
from SinhVien
order by SinhVien.NgaySinh desc

-- 3.Hiển thị tất cả sinh viên thuộc khoa CÔNG NGHỆ THÔNG TIN [IT] && khoa XÂY DỰNG [XD]
SELECT * FROM SinhVien where MaKhoa = 'XD' or MaKhoa ='IT';

-- 4.Hiển thị DiemTBTichLuy sinh viên lớp 61XD1 , sắp xếp theo thứ tự giảm dần :
SELECT SinhVien.MaSV,SinhVien.MaLop, Hoc.DiemKetThuc FROM SinhVien INNER JOIN Hoc on SinhVien.MaSV = Hoc.MaSV
WHERE MaLop ='61XD1'
Order by DiemKetThuc desc


-- 5.Thống kê sinh viên có điểm thi  >= 8 và học lớp hành chính 64KT6
SELECT HoTen,MaLop,DiemThi FROM SinhVien,Hoc
WHERE SinhVien.MaSV =Hoc.MaSV and (DiemThi >=8) and (MaLop ='64KT6')

--		Theo bảng KHOA

-- 6.Đếm số lượng sinh viên của từng khoa :
SELECT Khoa.MaKhoa, COUNT(*) AS [So_Luong] FROM SinhVien, Lop , Khoa
WHERE SinhVien.MaLop = Lop.MaLop and Lop.MaKhoa = Khoa.MaKhoa
GROUP BY Khoa.MaKhoa

--		Theo bảng LỚP 

-- 7.Đưa ra tên Lớp thuộc Khoá 65
SELECT TenLop, MaKhoaHoc FROM Lop
where MaKhoaHoc ='K65'


--		Theo bảng MÔN HỌC 

-- 8.Tìm các môn học có chứa cụm tên "Công nghệ " :
select *
from MonHoc
where TenMonHoc = N'%Công nghệ'

-- 9.Đưa ra tên của các Môn học mà có (Số tín chỉ = 3) 
SELECT TenMonHoc FROM 
MonHoc 
where (SoTinChi =3)


--		Theo bảng HỌC
-- 10.Hiển thị sinh viên học lại môn (Diem ket thuc mon < 4) :
SELECT HoTen, TenMonHoc, DiemQT, DiemThi
FROM SinhVien, Hoc, MonHoc
WHERE SinhVien.MaSV = Hoc.MaSV and Hoc.MaMonHoc = MonHoc.MaMonHoc and (DiemKetThuc < 4)

-- 11.Đưa ra điểm kết thúc môn lớn nhất của sinh viên với mã môn học 07 :
select max(DiemKetThuc) [Diem cao nhat]
from Hoc
where MaMonHoc = 07

-- 12.Thống kê điểm kết thúc thấp nhất của từng Môn học :
SELECT MonHoc.MaMonHoc, min(DiemKetThuc) AS [Diem_thap_nhat] 
FROM MonHoc inner join Hoc on MonHoc.MaMonHoc = Hoc.MaMonHoc
GROUP BY MonHoc.MaMonHoc
-- 13.In ra danh sách mã sinh viên có top3 điểm kết thúc môn cao nhất 
select Hoc.MaSV, Hoc.DiemKetThuc from Hoc where DiemKetThuc in (select distinct top 3 DiemKetThuc from Hoc order by DiemKetThuc desc )

-- 14.Với mỗi Mã môn học , tìm Mã sinh viên có Điểm kết thúc môn cao nhất !
select Hoc.MaSV, Hoc.MaMonHoc from Hoc
where Hoc.MaMonHoc = '02' and Hoc.DiemKetThuc = (select max (Hoc.DiemKetThuc) as Diem_max from Hoc
													where Hoc.MaMonHoc = '02')
union
select Hoc.MaSV, Hoc.MaMonHoc from Hoc
where Hoc.MaMonHoc = '05' and Hoc.DiemKetThuc = (select max (Hoc.DiemKetThuc) as Diem_max from Hoc
													where Hoc.MaMonHoc = '05')
union
select Hoc.MaSV, Hoc.MaMonHoc from Hoc
where Hoc.MaMonHoc = '11' and Hoc.DiemKetThuc = (select max (Hoc.DiemKetThuc) as Diem_max from Hoc
													where Hoc.MaMonHoc = '11')
union
select Hoc.MaSV, Hoc.MaMonHoc from Hoc
where Hoc.MaMonHoc = '18' and Hoc.DiemKetThuc = (select max (Hoc.DiemKetThuc) as Diem_max from Hoc
													where Hoc.MaMonHoc = '18')
union
select Hoc.MaSV, Hoc.MaMonHoc from Hoc
where Hoc.MaMonHoc = '21' and Hoc.DiemKetThuc = (select max (Hoc.DiemKetThuc) as Diem_max from Hoc
													where Hoc.MaMonHoc = '21')

-- 15.Đưa ra danh sách những sinh viên chưa từng học môn nào
select SinhVien.MaSV
from SinhVien
except (
select SinhVien.MaSV
from Sinhvien inner join Hoc on Sinhvien.MaSV = Hoc.MaSV
)
-- 16. Hien thi thong tin cua SV co DiemKetThuc thap nhat / cao nhat
select *
from  Hoc left join SinhVien on SinhVien.MaSV = Hoc.MaSV
where DiemKetThuc in ( select top 3 DiemKetThuc from Hoc order by DiemKetThuc desc)
--
select *
from  Hoc left join SinhVien on SinhVien.MaSV = Hoc.MaSV
where DiemKetThuc in ( select top 3 DiemKetThuc from Hoc order by DiemKetThuc asc)

select * from KhoaHoc
select * from Lop
select * from MonHoc
select * from Hoc
select * from SinhVien
select * from Khoa

