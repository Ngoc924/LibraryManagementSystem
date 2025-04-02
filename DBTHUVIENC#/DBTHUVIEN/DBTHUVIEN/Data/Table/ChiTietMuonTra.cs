namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietMuonTra")]
    public partial class ChiTietMuonTra
    {
        [Key]
        public int MaCTMT { get; set; }

        public int? MaMT { get; set; }

        [StringLength(20)]
        public string SoCaBiet { get; set; }

        public bool TrangThai { get; set; }

        public DateTime? NgayTra { get; set; }

        public virtual CuonSach CuonSach { get; set; }

        public virtual MuonTra MuonTra { get; set; }
    }
}
