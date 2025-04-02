namespace DBTHUVIEN.Data.Table
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class View_CTMT
    {
        public int? MaMT { get; set; }

        public int? MANV { get; set; }

        [StringLength(15)]
        public string MaDG { get; set; }

        [StringLength(20)]
        public string SoCaBiet { get; set; }

        [Key]
        [Column(Order = 0)]
        public DateTime NgayMuon { get; set; }

        public DateTime? NgayTra { get; set; }

        [Key]
        [Column(Order = 1, TypeName = "date")]
        public DateTime HanTra { get; set; }

        [Key]
        [Column(Order = 2)]
        public bool TrangThai { get; set; }
    }
}
