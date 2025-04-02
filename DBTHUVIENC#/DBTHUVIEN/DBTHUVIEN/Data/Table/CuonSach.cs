namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CuonSach")]
    public partial class CuonSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CuonSach()
        {
            ChiTietMuonTra = new HashSet<ChiTietMuonTra>();
            XuLyViPham = new HashSet<XuLyViPham>();
        }

        [Key]
        [StringLength(20)]
        public string SoCaBiet { get; set; }

        [Required]
        [StringLength(30)]
        public string ViTriSach { get; set; }

        public bool? TinhTrang { get; set; }

        public int? MaDS { get; set; }

        public virtual DauSach DauSach { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietMuonTra> ChiTietMuonTra { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XuLyViPham> XuLyViPham { get; set; }
    }
}
