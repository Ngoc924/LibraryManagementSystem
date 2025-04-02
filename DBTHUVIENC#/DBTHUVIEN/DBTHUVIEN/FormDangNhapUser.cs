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
    public partial class FormDangNhapUser : Form
    {
        public static string MaDG;
        public static string TenDG;
        private Model1 con = new Model1();
        public FormDangNhapUser()
        {
            InitializeComponent();
        }

        private void Bt_DangNhapUser_Click(object sender, EventArgs e)
        {
            string pass = MD5.CreateMD5(txtMatKhauUser.Text);
            List<TaiKhoanUser> taikhoan = con.Database.SqlQuery<TaiKhoanUser>("SELECT TENDANGNHAP, MATKHAU, MADG, TENDG FROM dbo.DocGia").ToList();
            foreach (TaiKhoanUser i in taikhoan)
            {
                if (i.TENDANGNHAP == txt_TenDangNhapUser.Text && i.MATKHAU == pass)
                {
                    MaDG = i.MADG;
                    TenDG = i.TENDG;
                    this.Hide();
                    FormUser _user = new FormUser();
                    _user.Show();
                    return;
                }
            }
            MessageBox.Show("Unsuccessfully!");
        }

        private void BunifuImageButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void LbDangKy_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormDangKy dangky = new FormDangKy();
            dangky.Show();
        }

        private void TxtMatKhauUser_OnValueChanged(object sender, EventArgs e)
        {
            txtMatKhauUser.isPassword = true;
            cb_HienThiMK.Checked = false;
        }

        private void cb_HienThiMK_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_HienThiMK.Checked) txtMatKhauUser.isPassword = false;
            else txtMatKhauUser.isPassword = true;
        }
    }
}
