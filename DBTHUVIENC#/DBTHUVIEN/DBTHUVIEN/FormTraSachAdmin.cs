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
    public partial class FormTraSachAdmin : Form
    {
        Model1 con = new Model1();
        string Manv = FormDangNhapAdmin.MaNV.ToString();
        public FormTraSachAdmin()
        {
            InitializeComponent();
        }


        private void BtnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        int TinhTrang = 0;

        private void BtnThem_Click(object sender, EventArgs e)
        {
            //MessageBox.Show(Convert.ToString(TinhTrang));
            
            con.Database.ExecuteSqlCommand("EXEC usp_TraSach @SoCaBiet = '" + txtSCB.Text+"', @MANV ="+ FormDangNhapAdmin.MaNV+ ", @TinhTrang = " + TinhTrang);
            MessageBox.Show("Trả Sách Thành Công!");
        }

        private void CmbTinhTrang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTinhTrang.Text == "Bình Thường")
            {
                TinhTrang = 0;
            }
            else if (cmbTinhTrang.Text == "Hư Hỏng/ Mất - Đã Đền")
            {
                TinhTrang = 1;
            }
            else if (cmbTinhTrang.Text == "Hư Hỏng/ Mất - Không Đền Được")
            {
                TinhTrang = 2;
            }
        }

        private void BunifuImageButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
