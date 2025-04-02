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
    public partial class FormSua : Form
    {
        formMenu_Admin fm = new formMenu_Admin();
        Model1 con = new Model1();
        int maDS = viewDauSachAdmin.mds;
        int maTG1 = 0;
        int maTG2 = 0;
        int maTG3 = 0;
        int maTL1 = 0;
        int maTL2 = 0;
        int maTL3 = 0;
        public FormSua()
        {
            InitializeComponent();
            
        }
        private void BunifuImageButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void FormSua_Load(object sender, EventArgs e)
        {
            var dataDS = con.DauSach.SqlQuery("SELECT ds.MADS, ds.TENDS,ds.NGONNGU,ds.TAP,ds.LANTAIBAN,ds.DICHGIA,ds.MOTA, ds.HINHANH, ds.SOTRANG, ds.NAMXUATBAN, ds.GIATIEN, ds.NGAYNHAP, ds.MANXB FROM dbo.DauSach ds WHERE ds.MADS =" + maDS).ToList();
            //dataGridView1.DataSource = dataDS;
            txtTenDS.PlaceholderText = dataDS[0].TenDS.ToString();
            txtNgonNgu.PlaceholderText = dataDS[0].NgonNgu.ToString();
            if (dataDS[0].Tap == null)
            {
                txtTap.PlaceholderText = "";
            }
            else
            {
                txtTap.PlaceholderText = dataDS[0].Tap.ToString();
            }
            if (dataDS[0].LanTaiBan == null)
            {
                txtLanTaiBan.PlaceholderText = "";
            }
            else
            {
                txtLanTaiBan.PlaceholderText = dataDS[0].LanTaiBan.ToString();
            }
            if(dataDS[0].DichGia == null) {
                txtDichGia.PlaceholderText = "";
            }
            else
            {
                txtDichGia.PlaceholderText = dataDS[0].DichGia;
            }
            //hinh anh
            MemoryStream ms = new MemoryStream((byte[])(dataDS[0].HinhAnh));
            bunifuPictureBox1.Image = Image.FromStream(ms);
            txtSoTrang.PlaceholderText = dataDS[0].SoTrang.ToString();
            txtNamXB.PlaceholderText = dataDS[0].NamXuatBan.ToString();
            if (dataDS[0].GiaTien == null)
            {
                txtGiaTien.PlaceholderText = "";
            }
            else
            {
                txtGiaTien.PlaceholderText = dataDS[0].GiaTien.ToString();
            }
            dateNgayNhap.Text = dataDS[0].NgayNhap.ToString();
            if (dataDS[0].MoTa == null)
            {
                txtMoTa.PlaceholderText = "";
            }
            else
            {
                txtMoTa.PlaceholderText = dataDS[0].MoTa.ToString();
            }

            // load nxb
            var datanxb = con.NhaXuatBan.SqlQuery("SELECT MANXB,TENNXB,DIACHI,SDT,EMAIL FROM NhaXuatBan");
            cmbNXB.DataSource = datanxb.ToList();
            cmbNXB.DisplayMember = "TENNXB";
            cmbNXB.ValueMember = "MANXB";
            var tennxb = con.NhaXuatBan.SqlQuery("SELECT  MANXB,TENNXB,DIACHI,SDT,EMAIL FROM dbo.NhaXuatBan WHERE MANXB =" + dataDS[0].MaNXB).ToList();
            cmbNXB.Text = tennxb[0].TenNXB.ToString();

            // load The Loai
            var datatl = con.TheLoai.SqlQuery("SELECT MATL,TENTL FROM TheLoai");
            cmbTheLoai1.DataSource = datatl.ToList();
            cmbTheLoai1.DisplayMember = "TENTL";
            cmbTheLoai1.ValueMember = "MATL";
            cmbTheLoai2.DataSource = datatl.ToList();
            cmbTheLoai2.DisplayMember = "TENTL";
            cmbTheLoai2.ValueMember = "MATL";
            cmbTheLoai3.DataSource = datatl.ToList();
            cmbTheLoai3.DisplayMember = "TENTL";
            cmbTheLoai3.ValueMember = "MATL";
            var tenTl = con.Database.SqlQuery<viewTheLoaiDS>("EXEC usp_viewTheLoaiDS @MaDS = " + maDS).ToList();
            int j = tenTl.Count();
            switch (j)
            {
                case 1:
                    {
                        cmbTheLoai1.Text = tenTl[0].TENTL.ToString();
                        maTL1 = Convert.ToInt32(cmbTheLoai1.SelectedValue.ToString());
                        break;
                    }
                case 2:
                    {
                        cmbTheLoai2.Visible = true;
                        cmbTheLoai1.Text = tenTl[0].TENTL.ToString();
                        cmbTheLoai2.Text = tenTl[1].TENTL.ToString();
                        maTL1 = Convert.ToInt32(cmbTheLoai1.SelectedValue.ToString());
                        maTL2 = Convert.ToInt32(cmbTheLoai2.SelectedValue.ToString());
                        break;
                    }
                case 3:
                    {
                        cmbTheLoai2.Visible = true;
                        cmbTheLoai3.Visible = true;
                        cmbTheLoai1.Text = tenTl[0].TENTL.ToString();
                        cmbTheLoai2.Text = tenTl[1].TENTL.ToString();
                        cmbTheLoai3.Text = tenTl[2].TENTL.ToString();
                        maTL1 = Convert.ToInt32(cmbTheLoai1.SelectedValue.ToString());
                        maTL2 = Convert.ToInt32(cmbTheLoai2.SelectedValue.ToString());
                        maTL3 = Convert.ToInt32(cmbTheLoai3.SelectedValue.ToString());
                        break;
                    }
            }

            // load tac gia
            var datatg = con.TacGia.SqlQuery("SELECT * FROM dbo.TACGIA");
            cmbTacGia1.DataSource = datatg.ToList();
            cmbTacGia1.DisplayMember = "TENTG";
            cmbTacGia1.ValueMember = "MATG";
            cmbTacGia2.DataSource = datatg.ToList();
            cmbTacGia2.DisplayMember = "TENTG";
            cmbTacGia2.ValueMember = "MATG";
            cmbTacGia3.DataSource = datatg.ToList();
            cmbTacGia3.DisplayMember = "TENTG";
            cmbTacGia3.ValueMember = "MATG";
            var tenTg = con.Database.SqlQuery<viewTacGiaSangTac>("EXEC usp_viewTacGiaSangTac @MaDS = " + maDS).ToList();
            int i = tenTg.Count();
            switch (i)
            {
                case 1:
                    {
                        cmbTacGia1.Text = tenTg[0].TENTG.ToString();
                        maTG1 = Convert.ToInt32(cmbTacGia1.SelectedValue.ToString());
                        break;
                    }
                case 2:
                    {
                        cmbTacGia2.Visible = true;
                        cmbTacGia1.Text = tenTg[0].TENTG.ToString();
                        cmbTacGia2.Text = tenTg[1].TENTG.ToString();
                        maTG1 = Convert.ToInt32(cmbTacGia1.SelectedValue.ToString());
                        maTG2 = Convert.ToInt32(cmbTacGia2.SelectedValue.ToString());
                        break;
                    }
                case 3:
                    {
                        cmbTacGia2.Visible = true;
                        cmbTacGia3.Visible = true;
                        cmbTacGia1.Text = tenTg[0].TENTG.ToString();
                        cmbTacGia2.Text = tenTg[1].TENTG.ToString();
                        cmbTacGia3.Text = tenTg[2].TENTG.ToString();
                        maTG1 = Convert.ToInt32(cmbTacGia1.SelectedValue.ToString());
                        maTG2 = Convert.ToInt32(cmbTacGia2.SelectedValue.ToString());
                        maTG3 = Convert.ToInt32(cmbTacGia3.SelectedValue.ToString());
                        break;
                    }
            }
        }

        private void BtnThem_Click(object sender, EventArgs e)
        {
            if (txtTenDS.Text == "")
            {

               string tends = txtTenDS.PlaceholderText;
                txtTenDS.Text =  " ";
                txtTenDS.Text = txtTenDS.Text.Replace(" ", tends);
                //txtTenDS.Refresh();
                //MessageBox.Show(txtTenDS.Text);
            }
            if (txtNgonNgu.Text == "")
            {
                txtNgonNgu.Text = " ";
                txtNgonNgu.Text = txtNgonNgu.Text.Replace(" ", txtNgonNgu.PlaceholderText);
            }
            if (txtTap.Text == "")
            {
                txtTap.Text = " ";
                txtTap.Text = txtTap.Text.Replace(" ",txtTap.PlaceholderText);
            }
            if (txtLanTaiBan.Text == "")
            {
                txtLanTaiBan.Text = " ";
                txtLanTaiBan.Text = txtLanTaiBan.Text.Replace(" ",txtLanTaiBan.PlaceholderText);
            }
            if (txtDichGia.Text == "")
            {  
                txtDichGia.Text = " ";
                txtDichGia.Text = txtDichGia.Text.Replace(" ", txtDichGia.PlaceholderText);
            }
            if (txtSoTrang.Text == "")
            {
                txtSoTrang.Text = " ";
                txtSoTrang.Text = txtSoTrang.Text.Replace(" ", txtSoTrang.PlaceholderText);
            }
            if (txtNamXB.Text == "")
            {
                txtNamXB.Text = " ";
                txtNamXB.Text = txtNamXB.Text.Replace(" ", txtNamXB.PlaceholderText);
            }
            if (txtGiaTien.Text == "")
            {
                txtGiaTien.Text = " ";
                txtGiaTien.Text = txtGiaTien.Text.Replace(" ", txtGiaTien.PlaceholderText);
            }
            if(txtGiaTien.Text == "")
            {
                txtGiaTien.Text = "NULL";
            }
            if (txtMoTa.Text == "")
            {
                txtMoTa.Text = " ";
                txtMoTa.Text = txtMoTa.Text.Replace(" ", txtMoTa.PlaceholderText);
            }            
            con.Database.ExecuteSqlCommand("EXEC usp_DauSach_Update @MaDS =" + maDS + ", @TenDS = N'" + txtTenDS.Text +
            "',  @NgonNgu = N'" + txtNgonNgu.Text + "', @Tap = N'" + txtTap.Text + "', @LanTaiBan = " + Convert.ToInt32(txtLanTaiBan.Text) +
            ", @DichGia = N'" + txtDichGia.Text + "', @MoTa = N'" + txtMoTa.Text + "', @SoTrang = " + Convert.ToInt32(txtSoTrang.Text) + ", @NamXuatBan = " +
            Convert.ToInt32(txtNamXB.Text) + ", @GiaTien = " + txtGiaTien.Text + ", @NgayNhap = '" + dateNgayNhap.Value.ToString("yyyy-MM-dd") +
            "', @MaNXB = " + cmbNXB.SelectedValue.ToString() + ", @Link = N'" + txtHinhAnh.Text + "'");
            
            con.Database.ExecuteSqlCommand("EXEC usp_TheLoaiDauSach_Update @MaDS = " + maDS
                    + ", @MaTL =" + maTL1 + ", @MaTL1 =" + cmbTheLoai1.SelectedValue.ToString());
            if(cmbTheLoai2.Visible == true )
            {
                //sua the loai 2
                con.Database.ExecuteSqlCommand("EXEC usp_TheLoaiDauSach_Update @MaDS = " + maDS
                    + ", @MaTL =" + maTL2 + ", @MaTL1 =" + cmbTheLoai2.SelectedValue.ToString());
            }
            if(cmbTheLoai3.Visible == true)
            {
                //sua the loai 3
                con.Database.ExecuteSqlCommand("EXEC usp_TheLoaiDauSach_Update @MaDS = " + maDS
                    + ", @MaTL =" + maTL3 + ", @MaTL1 =" + cmbTheLoai3.SelectedValue.ToString());
            }

            con.Database.ExecuteSqlCommand("EXEC usp_SangTac_Update @MaDS = " + maDS
                    + ", @MaTG =" + maTG1 + ", @MaTG1 =" + cmbTacGia1.SelectedValue.ToString());
            if(cmbTacGia2.Visible == true)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_SangTac_Update @MaDS = " + maDS
                    + ", @MaTG =" + maTG2 + ", @MaTG1 =" + cmbTacGia2.SelectedValue.ToString());
            }
            if (cmbTacGia3.Visible == true)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_SangTac_Update @MaDS = " + maDS
                    + ", @MaTG =" + maTG3 + ", @MaTG1 =" + cmbTacGia3.SelectedValue.ToString());
            }


            MessageBox.Show("Đã Sửa!");
            this.Hide();
            

            //obj.bunifuDataGridView2.Rows[DauSachAdmin.index].Selected = true;
        }

        private void BtnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void BtnSuaAnh_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Pictures files (*.jpg, *.jpeg, *.jpe, *.jfif, *.png)|*.jpg; *.jpeg; *.jpe; *.jfif; *.png|All files (*.*)|*.*";
            //openFile.FilterIndex = 1;
            openFile.RestoreDirectory = false;
            if (openFile.ShowDialog() == DialogResult.OK)
            {
                // bunifuPictureBox1.ImageLocation = openFile.FileName;
                // bunifuPictureBox1.Text = openFile.FileName;
                // txtHinhAnh.Text = openFile.FileName;
            }
            
        }

        
    }
}
