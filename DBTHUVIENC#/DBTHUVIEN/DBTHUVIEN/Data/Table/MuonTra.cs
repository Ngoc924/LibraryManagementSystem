namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MuonTra")]
    public partial class MuonTra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MuonTra()
        {
            ChiTietMuonTra = new HashSet<ChiTietMuonTra>();
            XuLyViPham = new HashSet<XuLyViPham>();
        }

        [Key]
        public int MaMT { get; set; }

        public DateTime NgayMuon { get; set; }

        [Column(TypeName = "date")]
        public DateTime HanTra { get; set; }

        public int? MaNV { get; set; }

        [StringLength(15)]
        public string MaDG { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietMuonTra> ChiTietMuonTra { get; set; }

        public virtual DocGia DocGia { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XuLyViPham> XuLyViPham { get; set; }
    }
}
