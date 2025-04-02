using Bunifu.UI.WinForms;
using DBTHUVIEN.Data.Stored_Procedure;
using DBTHUVIEN.Data.Table;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DBTHUVIEN
{
    
    public partial class FormThem : Form
    {
        Model1 con = new Model1();
        string MaTG1 = "";
        string MaTG2 = "";
        string MaTG3 = "";
        string MaTL1 = "";
        string MaTL2 = "";
        public FormThem()
        {
            InitializeComponent();
        }
       
        private void BtnThemDauSach_Click(object sender, EventArgs e)
        {
            pageThemSachAdmin.SetPage("Đầu Sách");
        }

        private void BtnThemCuonSach_Click(object sender, EventArgs e)
        {
            pageThemSachAdmin.SetPage("Cuốn Sách");
        }

        private void BunifuImageButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void FormThem_Load(object sender, EventArgs e)
        {
            var datanxb = con.NhaXuatBan.SqlQuery("SELECT MANXB,TENNXB,DIACHI,SDT,EMAIL FROM NhaXuatBan");
            cmbNXB.DataSource = datanxb.ToList();
            cmbNXB.DisplayMember = "TENNXB";
            cmbNXB.ValueMember = "MANXB";
            cmbNXB.Text = "";

            var datatl = con.TheLoai.SqlQuery("SELECT TENTL,MATL FROM TheLoai");
            cmbTheLoai.DataSource = datatl.ToList();
            cmbTheLoai.DisplayMember = "TENTL";
            cmbTheLoai.ValueMember = "MATL";
            cmbTheLoai.Text = "";

            var datatg = con.TacGia.SqlQuery("SELECT MATG,TENTG,QUOCTICH FROM TacGia");
            cmbTacGia1.DataSource = datatg.ToList();
            cmbTacGia1.DisplayMember = "TENTG";
            cmbTacGia1.ValueMember = "MATG";
            cmbTacGia1.Text ="";

        }


        string MaNXB;
        private void CmbNXB_SelectedIndexChanged(object sender, EventArgs e)
        {

            //MessageBox.Show(cmbNXB.Text);
            if (cmbNXB.Text == "Khác")
            {
                MaNXB = "0";
                grbNXB.Visible = true;
            }
            else
            {
                MaNXB = cmbNXB.SelectedValue.ToString();
                grbNXB.Visible = false;
            }
            

        }
        
        private void CmbTacGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTacGia1.Text != "Khác" && cmbTacGia1.Text != "")
            {
                bunifuImageButton6.Enabled = true;
                MaTG1 = cmbTacGia1.SelectedValue.ToString();
                grbTacGia.Visible = false;
            }

            if (cmbTacGia1.Text == "Khác")
            {
                grbTacGia.Visible = true;
                txtViTriTG.Text = "1";

            }
            
        }
        
        private void CmbTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            MaTL1 = cmbTheLoai.SelectedValue.ToString();
        }
        private void CmbTheLoai2_SelectedIndexChanged(object sender, EventArgs e)
        {
            MaTL2 = cmbTheLoai2.SelectedValue.ToString();
        }
        private void BtnThemTheLoai_Click(object sender, EventArgs e)
        {
            btnThemTheLoai.Visible = false;
            cmbTheLoai2.Visible = true;
            var datatl = con.TheLoai.SqlQuery("SELECT MATL,TENTL FROM TheLoai");
            cmbTheLoai2.DataSource = datatl.ToList();
            cmbTheLoai2.DisplayMember = "TENTL";
            cmbTheLoai2.ValueMember = "MATL";
            cmbTheLoai2.Text = "";
        }
        private void BtnLuuNXB_Click(object sender, EventArgs e)
        {

            con.Database.ExecuteSqlCommand("exec usp_NXB_Insert @Ten = " + this.txtTenNXB.Text + ", @DiaChi =" + this.txtDiaChi.Text + ", @SDT =" + this.txtSDT.Text + ", @Email =" + this.txtEmail.Text);
            var datanxb = con.NhaXuatBan.SqlQuery("SELECT MANXB,TENNXB,DIACHI,SDT,EMAIL FROM NhaXuatBan");
            cmbNXB.DataSource = datanxb.ToList();
            cmbNXB.DisplayMember = "TENNXB";
            cmbNXB.ValueMember = "MANXB";
            cmbNXB.Refresh();
            MessageBox.Show("Thêm Nhà Xuất Bản Thành Công!");
            cmbNXB.SelectedIndex = cmbNXB.Items.Count - 1;
            grbNXB.Visible = false;
            
        }

        private void BtnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void BtnLuuTacGia_Click(object sender, EventArgs e)
        {
            if (cmbTacGia1.Text == "Khác")
            {
                con.Database.ExecuteSqlCommand("EXEC usp_TacGia_Insert @Ten = N'" + txtTenTG.Text + "', @QuocTich ='" + txtQuocTich.Text + "'");
                var datatg = con.TacGia.SqlQuery("SELECT MATG,TENTG,QUOCTICH FROM TacGia");
                cmbTacGia1.DataSource = datatg.ToList();
                cmbTacGia1.DisplayMember = "TENTG";
                cmbTacGia1.ValueMember = "MATG";
                cmbTacGia1.SelectedIndex = cmbTacGia1.Items.Count - 1;
                grbTacGia.Visible = false;
                bunifuImageButton6.Enabled = true;
            } else if (cmbTacGia2.Text == "Khác")
            {
                con.Database.ExecuteSqlCommand("EXEC usp_TacGia_Insert @Ten = N'" + txtTenTG.Text + "', @QuocTich ='" + txtQuocTich.Text + "'");
                var datatg = con.TacGia.SqlQuery("SELECT MATG,TENTG,QUOCTICH FROM TacGia");
                cmbTacGia2.DataSource = datatg.ToList();
                cmbTacGia2.DisplayMember = "TENTG";
                cmbTacGia2.ValueMember = "MATG";
                cmbTacGia2.SelectedIndex = cmbTacGia2.Items.Count - 1;
                grbTacGia.Visible = false;
                bunifuImageButton6.Enabled = true;
            }
            else if (cmbTacGia3.Text == "Khác")
            {
                con.Database.ExecuteSqlCommand("EXEC usp_TacGia_Insert @Ten = N'" + txtTenTG.Text + "', @QuocTich = '" + txtQuocTich.Text + "'");
                var datatg = con.TacGia.SqlQuery("SELECT MATG,TENTG,QUOCTICH FROM TacGia");
                cmbTacGia3.DataSource = datatg.ToList();
                cmbTacGia3.DisplayMember = "TENTG";
                cmbTacGia3.ValueMember = "MATG";
                cmbTacGia3.SelectedIndex = cmbTacGia3.Items.Count - 1;
                grbTacGia.Visible = false;
                bunifuImageButton6.Enabled = true;
            }

        }

        string path = "";
        private void BtnPath_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Pictures files (*.jpg, *.jpeg, *.jpe, *.jfif, *.png)|*.jpg; *.jpeg; *.jpe; *.jfif; *.png|All files (*.*)|*.*";
            //openFile.FilterIndex = 1;
            openFile.RestoreDirectory = false;
            if (openFile.ShowDialog() == DialogResult.OK)
            {
                path = openFile.FileName;
                bunifuPictureBox1.ImageLocation = path;
                txtHinhAnh.Text = openFile.FileName;
            }
        }
        private void BtnThem_Click(object sender, EventArgs e)
        {
            // Thêm Đầu Sách
            if (txtGiaTien.Text == "")
            {
                txtGiaTien.Text = "NULL";
            }
            con.Database.ExecuteSqlCommand("EXEC usp_DauSach_Insert @TenDS = N'" + txtTenDS.Text + 
                "', @NgonNgu = '" + txtNgonNgu.Text + "', @Tap = N'" + txtTap.Text + 
                "', @LanTaiBan = " + Convert.ToInt32(txtLanTaiBan.Text) + ", @DichGia = N'" + txtDichGia.Text + 
                "', @MoTa = N'" + txtMoTa.Text + "', @SoTrang = " + Convert.ToInt32(txtSoTrang.Text) + 
                ", @NamXuatBan = " + Convert.ToInt32(txtNamXB.Text) + ", @GiaTien = " + txtGiaTien.Text + 
                ", @NgayNhap = '" + dateNgayNhap.Value.ToString("yyyy/MM/dd") + "', @MaNXB = " + Convert.ToInt32(MaNXB) + ", @Link = '" + txtHinhAnh.Text +"'");

            //Lấy Mã Đầu Sách
            var MaDS = con.Database.SqlQuery<LayMaDScs>("EXEC usp_LayMaDS @TenDS = N'" + txtTenDS.Text+ "',@SoTrang =" + Convert.ToInt32(txtSoTrang.Text)).ToList();
            string Mads= MaDS[0].MADS.ToString();

            // Thêm thể loại đầu sách
            con.Database.ExecuteSqlCommand("EXEC usp_TheLoaiDauSach_Insert @MaDS = " + Convert.ToInt32(Mads) + ",@MaTL = " + Convert.ToInt32(MaTL1));
            if(cmbTheLoai2.Visible == true)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_TheLoaiDauSach_Insert @MaDS = " + Convert.ToInt32(Mads) + ",@MaTL = " + Convert.ToInt32(MaTL2));
            }

            // Thêm Sáng tác
            con.Database.ExecuteSqlCommand(" EXEC usp_SangTac_Insert @MaDS =" + Mads + ", @MaTG =" + MaTG1 + ", @ViTri =" + 1);
            if (cmbTacGia2.Visible == true)
            {
                con.Database.ExecuteSqlCommand(" EXEC usp_SangTac_Insert @MaDS =" + Mads + ", @MaTG =" + MaTG2 + ", @ViTri =" + 2);
            }
            if (cmbTacGia3.Visible==true )
            {
                con.Database.ExecuteSqlCommand(" EXEC usp_SangTac_Insert @MaDS =" + Mads + ", @MaTG =" + MaTG3 + ", @ViTri =" + 2);
            }
            BtnThemCuonSach_Click(sender,e);
            cmbTenDS.Text = txtTenDS.Text;


        }
        int countThemTacGia = 0;
        private void BunifuImageButton6_Click(object sender, EventArgs e)
        {
            countThemTacGia++;
            var datatg = con.TacGia.SqlQuery("SELECT MATG,TENTG,QUOCTICH FROM TacGia");
            switch (countThemTacGia)
            {
                case 1:
                    {
                        cmbTacGia2.Visible = true;
                        cmbTacGia2.DataSource = datatg.ToList();
                        cmbTacGia2.DisplayMember = "TENTG";
                        cmbTacGia2.ValueMember = "MATG";
                        cmbTacGia2.Text = "";
                        bunifuImageButton6.Enabled = false;
                        bunifuImageButton6.Top += 25;
                        break;
                    }
                case 2:
                    {
                        cmbTacGia3.Visible = true;
                        cmbTacGia3.DataSource = datatg.ToList();
                        cmbTacGia3.DisplayMember = "TENTG";
                        cmbTacGia3.ValueMember = "MATG";
                        cmbTacGia3.Text = "";
                        bunifuImageButton6.Visible = false;
                        break;
                    }

            }
        }

        private void CmbTacGia2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTacGia2.Text != "Khác" && cmbTacGia2.Text != "")
            {
                bunifuImageButton6.Enabled = true;
                MaTG2 = cmbTacGia2.SelectedValue.ToString();
                grbTacGia.Visible = false;
            }

            if (cmbTacGia2.Text == "Khác")
            {
                grbTacGia.Visible = true;
                txtViTriTG.Text = "2";
                
            }
        }

        private void CmbTacGia3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTacGia3.Text != "Khác" && cmbTacGia3.Text != "")
            {
                bunifuImageButton6.Enabled = true;
                MaTG3 = cmbTacGia3.SelectedValue.ToString();
                grbTacGia.Visible = false;
            }
            if (cmbTacGia3.Text == "Khác")
            {
                grbTacGia.Visible = true;
                txtViTriTG.Text = "2";

            }

        }

        private void CmbTenDS_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMaDSCS.Text = cmbTenDS.SelectedValue.ToString();
        }

        private void PageThemSachAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            var dataDS = con.Database.SqlQuery<viewDauSachAdmin>("SELECT MADS, TENDS FROM DauSach");
            cmbTenDS.DataSource = dataDS.ToList();
            cmbTenDS.DisplayMember = "TENDS";
            cmbTenDS.ValueMember = "MADS";
            cmbTenDS.Text = " ";
            txtMaDSCS.Text = " ";
            txtMaDSCS.Enabled = false;
        }

        private void BtnThemCS_Click(object sender, EventArgs e)
        {
            con.Database.ExecuteSqlCommand(" EXEC usp_CuonSach_Insert @SoCaBiet = " + txtSCB.Text + ", @Vitrisach = N'"+
                txtViTriCuonSach.Text+"', @Mads = " + txtMaDSCS.Text);
            MessageBox.Show("Thêm Cuốn Sách Thành Công!");

        }

        private void BtnHuyCS_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        
    }
}
