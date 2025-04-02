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
    public partial class FormDangNhapAdmin : Form
    {
        public static int MaNV;
        public static string TenNV;
        private Model1 con = new Model1();
        public FormDangNhapAdmin()
        {
            InitializeComponent();
        }

        private void BunifuImageButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Bt_DangNhapAdmin_Click(object sender, EventArgs e)
        {
            string pass = MD5.CreateMD5(txt_MatKhauAdmin.Text);
            List<TaiKhoanAdmin> taikhoan = con.Database.SqlQuery<TaiKhoanAdmin>("SELECT TENDANGNHAP, MATKHAU, MANV, HOTEN FROM dbo.NhanVien").ToList();
            foreach (TaiKhoanAdmin i in taikhoan)
            {
                if (i.TENDANGNHAP == txt_TenDangNhapAdmin.Text && i.MATKHAU == pass)
                {
                    MaNV = i.MANV;
                    TenNV = i.HOTEN;
                    this.Hide();
                    formMenu_Admin _admin = new formMenu_Admin();
                    _admin.Show();
                    return;
                }
            }
            MessageBox.Show("Unsuccessfully!");
        }

        private void Txt_MatKhauAdmin_OnValueChanged(object sender, EventArgs e)
        {
            txt_MatKhauAdmin.isPassword = true;
            cb_HienThiMK.Checked = false;
        }

        private void cb_HienThiMK_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_HienThiMK.Checked) txt_MatKhauAdmin.isPassword = false;
            else txt_MatKhauAdmin.isPassword = true;
        }
    }
}
