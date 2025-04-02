using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBTHUVIEN.Data.Stored_Procedure
{
    class ViewChiTietMuonTra
    {
        public Nullable<int> MAMT { get; set; }
        public Nullable<int> MANV { get; set; }
        public string MADG { get; set; }
        public string socabiet { get; set; }
        public System.DateTime NGAYMUON { get; set; }
        public Nullable<System.DateTime> NGAYTRA { get; set; }
        public System.DateTime HANTRA { get; set; }
        public bool TRANGTHAI { get; set; }
    }
}
