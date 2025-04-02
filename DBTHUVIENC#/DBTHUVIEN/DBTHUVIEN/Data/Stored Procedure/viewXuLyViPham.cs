using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBTHUVIEN.Data.Stored_Procedure
{
    using System;
    class viewXuLyViPham
    {
        public int MAXL { get; set; }
        public string TENDG { get; set; }
        public string TENDS { get; set; }
        public long TIENPHAT { get; set; }
        public string LYDO { get; set; }
        public string TINHTRANG { get; set; }
        public Nullable<int> MANV { get; set; }
        public string SOCABIET { get; set; }
        public string MADG { get; set; }
        public static int maxl;
        public static int index;
    }
}
