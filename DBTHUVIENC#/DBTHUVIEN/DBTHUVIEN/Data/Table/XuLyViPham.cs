namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("XuLyViPham")]
    public partial class XuLyViPham
    {
        [Key]
        public int MaXL { get; set; }

        public long TienPhat { get; set; }

        [Required]
        [StringLength(50)]
        public string LyDo { get; set; }

        [StringLength(50)]
        public string TinhTrang { get; set; }

        public int? MaNV { get; set; }

        public int? MaMT { get; set; }

        [StringLength(20)]
        public string SoCaBiet { get; set; }

        public virtual CuonSach CuonSach { get; set; }

        public virtual MuonTra MuonTra { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
