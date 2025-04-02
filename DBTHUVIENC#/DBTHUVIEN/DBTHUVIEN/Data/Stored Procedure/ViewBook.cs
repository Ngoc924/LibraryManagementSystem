using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBTHUVIEN.Data.Stored_Procedure
{
    class ViewBook
    {
        public int MADS { get; set; }
        public string TENDS { get; set; }
        public string TenTG { get; set; }
        public string TheLoaiSach { get; set; }
        public string TAP { get; set; }
        public Nullable<int> SOTRANG { get; set; }
        public Nullable<long> GIATIEN { get; set; }
        public string TENNXB { get; set; }
        public byte[] HINHANH { get; set; }
    }
}
