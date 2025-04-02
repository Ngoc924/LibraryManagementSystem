using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DBTHUVIEN.Data.Table
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<CuonSach> CuonSach { get; set; }
        public virtual DbSet<ChiTietMuonTra> ChiTietMuonTra { get; set; }
        public virtual DbSet<DauSach> DauSach { get; set; }
        public virtual DbSet<DocGia> DocGia { get; set; }
        public virtual DbSet<MuonTra> MuonTra { get; set; }
        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<NhaXuatBan> NhaXuatBan { get; set; }
        public virtual DbSet<TacGia> TacGia { get; set; }
        public virtual DbSet<TheLoai> TheLoai { get; set; }
        public virtual DbSet<XuLyViPham> XuLyViPham { get; set; }
        public virtual DbSet<View_CTMT> View_CTMT { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CuonSach>()
                .Property(e => e.SoCaBiet)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietMuonTra>()
                .Property(e => e.SoCaBiet)
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.MaDG)
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<MuonTra>()
                .Property(e => e.MaDG)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<NhaXuatBan>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<NhaXuatBan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<XuLyViPham>()
                .Property(e => e.SoCaBiet)
                .IsUnicode(false);

            modelBuilder.Entity<View_CTMT>()
                .Property(e => e.MaDG)
                .IsUnicode(false);

            modelBuilder.Entity<View_CTMT>()
                .Property(e => e.SoCaBiet)
                .IsUnicode(false);
        }
    }
}
