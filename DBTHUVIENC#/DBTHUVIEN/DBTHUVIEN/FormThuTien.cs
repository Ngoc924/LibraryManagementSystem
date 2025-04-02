using DBTHUVIEN.Data.Stored_Procedure;
using DBTHUVIEN.Data.Table;
using DevExpress.DocumentServices.ServiceModel.DataContracts;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Reporting.WinForms;
using System.Windows.Forms;
using ReportParameter = Microsoft.Reporting.WinForms.ReportParameter;

namespace DBTHUVIEN
{
    public partial class FormThuTien : Form
    {
        Model1 con = new Model1();
        public FormThuTien()
        {
            InitializeComponent();
        }

        private void FormThuTien_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
        }

        private void BtnThem_Click(object sender, EventArgs e)
        {
            INHOADON hoadon = con.Database.SqlQuery<INHOADON>("EXEC usp_InHoaDon @MaDG = '" + txtma.Text + "'").FirstOrDefault();
            //ReportParameter rpt1 = new ReportParameter("DG", txtma.Text);
            //this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt1 });
            ReportParameter rpt2 = new ReportParameter("TENDG", hoadon.TENDG);
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt2 });
            ReportParameter rpt3 = new ReportParameter("SDT", hoadon.SDT);
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt3 });
            ReportParameter rpt4 = new ReportParameter("NGAYSINH", hoadon.NGAYSINH.ToShortDateString());
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt4 });
            ReportParameter rpt5 = new ReportParameter("DONVI", hoadon.DONVI);
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt5 });
            ReportParameter rpt6 = new ReportParameter("SOTIEN", hoadon.SOTIEN.ToString());
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { rpt6 });
            DateTime now = DateTime.Now;
            ReportParameter Ngay = new ReportParameter("NGAY", now.Day.ToString());
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { Ngay });
            ReportParameter Thang = new ReportParameter("THANG", now.Month.ToString());
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { Thang });
            ReportParameter Nam = new ReportParameter("NAM", now.Year.ToString());
            this.reportViewer1.LocalReport.SetParameters(new ReportParameter[] { Nam });
            this.reportViewer1.RefreshReport();
        }

        private void BunifuFlatButton1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
