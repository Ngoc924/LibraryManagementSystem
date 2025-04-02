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
    public partial class Login : DevExpress.XtraEditors.XtraForm
    {
        public Login()
        {
            InitializeComponent();
        }

        private void BunifuImageButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BunifuFlatButton1_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormDangNhapUser dnUser = new FormDangNhapUser();
            dnUser.Show();
        }

        private void BunifuFlatButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
            FormDangNhapAdmin dnAdmin = new FormDangNhapAdmin();
            dnAdmin.Show();
        }
    }
}
