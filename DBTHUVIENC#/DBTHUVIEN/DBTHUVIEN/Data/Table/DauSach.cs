namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DauSach")]
    public partial class DauSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DauSach()
        {
            CuonSach = new HashSet<CuonSach>();
        }

        [Key]
        public int MaDS { get; set; }

        [Required]
        [StringLength(50)]
        public string TenDS { get; set; }

        [StringLength(30)]
        public string NgonNgu { get; set; }

        [StringLength(15)]
        public string Tap { get; set; }

        public int? LanTaiBan { get; set; }

        [StringLength(30)]
        public string DichGia { get; set; }

        public string MoTa { get; set; }

        public byte[] HinhAnh { get; set; }

        public int? SoTrang { get; set; }

        public int? NamXuatBan { get; set; }

        public long? GiaTien { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayNhap { get; set; }

        public int? MaNXB { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CuonSach> CuonSach { get; set; }

        public virtual NhaXuatBan NhaXuatBan { get; set; }
    }
}
