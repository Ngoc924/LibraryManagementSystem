using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBTHUVIEN.Data.Stored_Procedure
{
    class viewLichSuMuonTraUser
    {
        public string MADG { get; set; }
        public string TENDG { get; set; }
        public string TENDS { get; set; }
        public string SOCABIET { get; set; }
        public Nullable<System.DateTime> NGAYMUON { get; set; }
        public Nullable<System.DateTime> NGAYTRA { get; set; }
    }
}
