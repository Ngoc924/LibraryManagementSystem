using DBTHUVIEN.Data.Stored_Procedure;
using DBTHUVIEN.Data.Table;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DBTHUVIEN
{
    public partial class FormMuonSachAdmin : Form
    {
        Model1 con = new Model1();
        string manv = FormDangNhapAdmin.MaNV.ToString();
        public FormMuonSachAdmin()
        {
            InitializeComponent();
        }

        private void FormMuonSachAdmin_Load(object sender, EventArgs e)
        {
            //load TenDG
            var dataTenDG = con.DocGia.SqlQuery("SELECT MADG,TENDG,DONVI,NGAYSINH,SDT,NGAYDK,NGAYHH,TENDANGNHAP,MATKHAU FROM dbo.DocGia");
            cmbTenDG.DataSource = dataTenDG.ToList();
            cmbTenDG.DisplayMember = "TenDG";
            cmbTenDG.ValueMember = "MaDG";
            cmbTenDG.Text = "";

            var dataTenDS = con.DauSach.SqlQuery("SELECT MADS,TENDS,NGONNGU,TAP,LANTAIBAN,DICHGIA,MOTA,HINHANH,SOTRANG,NAMXUATBAN,GIATIEN,NGAYNHAP,MANXB FROM dbo.DauSach");
            cmbTenDS1.DataSource = dataTenDS.ToList();
            cmbTenDS1.DisplayMember = "TenDS";
            cmbTenDS1.ValueMember = "MaDS";
            cmbTenDS1.Text = "";
            cmbTenDS2.DataSource = dataTenDS.ToList();
            cmbTenDS2.DisplayMember = "TenDS";
            cmbTenDS2.ValueMember = "MaDS";
            cmbTenDS2.Text = "";
            cmbTenDS3.DataSource = dataTenDS.ToList();
            cmbTenDS3.DisplayMember = "TenDS";
            cmbTenDS3.ValueMember = "MaDS";
            cmbTenDS3.Text = "";


            //MessageBox.Show(cmbTenDS1.SelectedValue.ToString());



        }

        private void BunifuImageButton2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BtnHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BtnThem_Click(object sender, EventArgs e)
        {
            
            // Them Muon Tra
            con.Database.ExecuteSqlCommand("EXEC usp_MuonTra_Insert @NgayMuon = '" + dateNgayMuon.Value.ToString("yyyy-MM-dd") +
                "', @HanTra = '" + dateHanTra.Value.ToString("yyyy-MM-dd")+ "', @Manv = " + manv + ", @MaDG = '" + cmbTenDG.SelectedValue.ToString()+"'");
            // Lay Ma Muon Tra
            var dataMuonTra = con.Database.SqlQuery<LayMaMT>("EXEC usp_LayMaMuonTra @MaDG ='" + cmbTenDG.SelectedValue.ToString() + "', @NgayMuon ='" + dateNgayMuon.Value.ToString("yyyy-MM-dd")+"'").ToList();
            string Mamt = dataMuonTra[0].MAMT.ToString();

            //them chi tiet muon tra
            con.Database.ExecuteSqlCommand("EXEC usp_ChiTietMuonTra_Insert @MaMt =" + Mamt + ", @SoCaBiet = '"+cmbSoCB1.Text +"'");

            if (cmbTenDS2.Enabled == true)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_ChiTietMuonTra_Insert @MaMt =" + Mamt + ", @SoCaBiet = '" + cmbSoCB2.Text + "'");
            }
            if (cmbTenDS3.Enabled == true)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_ChiTietMuonTra_Insert @MaMt =" + Mamt + ", @SoCaBiet = '" + cmbSoCB3.Text + "'");
            }

            MessageBox.Show("Thêm thành công !");
            this.Hide();
        }
        int count = 0;
        private void BtnThemDS_Click(object sender, EventArgs e)
        {
            count++;
            switch (count)
            {
                case 1:
                    {
                        cmbTenDS2.Enabled = true;
                        cmbSoCB2.Enabled = true;
                        break;
                    }
                case 2:
                    {
                        cmbTenDS3.Enabled = true;
                        cmbSoCB3.Enabled = true;
                        break;
                    }
            }

        }


        private void CmbTenDS1_Click(object sender, EventArgs e)
        {
            //load SoCB
            //var dataSoCB = con.Database.SqlQuery<SachCon>("EXEC SachCon @Mads = " + cmbTenDS1.ValueMember.ToString());
            //cmbSoCB1.DataSource = dataSoCB.ToList();
            //cmbSoCB1.DisplayMember = "SOCABIET";
            //cmbSoCB1.ValueMember = "MADS";
            //cmbSoCB1.Text = "";
            //MessageBox.Show(cmbTenDS1.SelectedValue.ToString());
        }

        private void CmbSoCB1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void CmbTenDS1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTenDS1.SelectedValue.ToString() != "System.Data.Entity.DynamicProxies.DauSach_AF1322B8B6236F2BDA2E65711C849D6961A2D0BAC594D106B1BD163A6F4CD5A7")
            {
                //load SoCB
                //MessageBox.Show(cmbTenDS1.ValueMember.ToString());
                var dataSoCB = con.Database.SqlQuery<SachCon>("EXEC usp_SachCon @MaDS = " + cmbTenDS1.SelectedValue.ToString());
                cmbSoCB1.DataSource = dataSoCB.ToList();
                if (dataSoCB.ToList().Count == 0)
                {
                    MessageBox.Show("Sách đã hết!");
                }
                else
                {
                    cmbSoCB1.DisplayMember = "SOCABIET";
                    cmbSoCB1.ValueMember = "MADS";
                    cmbSoCB1.Enabled = true;
                    cmbSoCB1.Text = "";
                }

            }
        }

        private void CmbTenDS2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTenDS2.SelectedValue.ToString() != "System.Data.Entity.DynamicProxies.DauSach_AF1322B8B6236F2BDA2E65711C849D6961A2D0BAC594D106B1BD163A6F4CD5A7")
            {
                //load SoCB
                //MessageBox.Show(cmbTenDS1.ValueMember.ToString());
                var dataSoCB = con.Database.SqlQuery<SachCon>("EXEC usp_SachCon @MaDS = " + cmbTenDS2.SelectedValue.ToString());
                cmbSoCB2.DataSource = dataSoCB.ToList();
                if (dataSoCB.ToList().Count == 0)
                {
                    MessageBox.Show("Sách đã hết!");
                }
                else
                {
                    cmbSoCB2.DisplayMember = "SoCaBiet";
                    cmbSoCB2.ValueMember = "MaDS";
                    cmbSoCB2.Enabled = true;
                    cmbSoCB2.Text = "";
                }

            }
        }

        private void CmbTenDS3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTenDS3.SelectedValue.ToString() != "System.Data.Entity.DynamicProxies.DauSach_AF1322B8B6236F2BDA2E65711C849D6961A2D0BAC594D106B1BD163A6F4CD5A7")
            {
                //load SoCB
                //MessageBox.Show(cmbTenDS1.ValueMember.ToString());
                var dataSoCB = con.Database.SqlQuery<SachCon>("EXEC usp_SachCon @MaDS = " + cmbTenDS3.SelectedValue.ToString());
                cmbSoCB3.DataSource = dataSoCB.ToList();
                if (dataSoCB.ToList().Count == 0)
                {
                    MessageBox.Show("Sách đã hết!");
                }
                else
                {
                    cmbSoCB3.DisplayMember = "SoCaBiet";
                    cmbSoCB3.ValueMember = "MaDS";
                    cmbSoCB3.Enabled = true;
                    cmbSoCB3.Text = "";
                }
            }
        }
    }
}
