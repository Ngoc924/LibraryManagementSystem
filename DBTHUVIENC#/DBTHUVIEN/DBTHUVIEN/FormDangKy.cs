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
    public partial class FormDangKy : Form
    {
        private Model1 con = new Model1();
        public FormDangKy()
        {
            InitializeComponent();
        }

        private void FormDangKy_Load(object sender, EventArgs e)
        {

        }

        private void BunifuImageButton3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BtnDK_DangKy_Click(object sender, EventArgs e)
        {
            if (txt_MaDG.Text == "" || txt_TenDG.Text == "" || txt_DonVi.Text == "" || txt_SDT.Text == "" ||
    txt_TenDangNhap.Text == "" || txt_MatKhau.Text == "")
            {
                MessageBox.Show("Không hợp lệ!");
                return;
            }
            if (NgayDangKy.Value.Year > (NgayHetHan.Value.Year - 5))
            {
                MessageBox.Show("Ngày đăng ký, Ngày hết hạn không hợp lệ!");
                return;
            }
            con.Database.ExecuteSqlCommand("EXEC usp_DocGia_Insert '" + txt_MaDG.Text + "', N'" + txt_TenDG.Text + "', '" + txt_DonVi.Text +
                "', '" + NgaySinh.Value.ToString("yyyy-MM-dd") + "','" + txt_SDT.Text + "','" + NgayDangKy.Value.ToString("yyyy-MM-dd") +
                "','" + NgayHetHan.Value.ToString("yyyy-MM-dd") + "','" + txt_TenDangNhap.Text + "','" + MD5.CreateMD5(txt_MatKhau.Text) + "';");
            MessageBox.Show("Đăng ký thành công!");
            this.Hide();
            FormDangNhapUser _dangnhapuser = new FormDangNhapUser();
            _dangnhapuser.Show();
        }

        private void LbDK_DangNhap_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormDangNhapUser _dangnhapuser = new FormDangNhapUser();
            _dangnhapuser.Show();
        }

        private void Txt_MatKhau_OnValueChanged(object sender, EventArgs e)
        {
            txt_MatKhau.isPassword = true;
            cb_HienThiMK.Checked = false;
        }

        private void cb_HienThiMK_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_HienThiMK.Checked) txt_MatKhau.isPassword = false;
            else txt_MatKhau.isPassword = true;
        }
    }
}
