namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DocGia")]
    public partial class DocGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DocGia()
        {
            MuonTra = new HashSet<MuonTra>();
        }

        [Key]
        [StringLength(15)]
        public string MaDG { get; set; }

        [Required]
        [StringLength(50)]
        public string TenDG { get; set; }

        [Required]
        [StringLength(30)]
        public string DonVi { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgaySinh { get; set; }

        [Required]
        [StringLength(15)]
        public string SDT { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDK { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayHH { get; set; }

        [Required]
        [StringLength(30)]
        public string TenDangNhap { get; set; }

        [Required]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MuonTra> MuonTra { get; set; }
        public static string madg;
    }
}
