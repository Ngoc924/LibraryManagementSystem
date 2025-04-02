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
    public partial class FormUser : Form
    {
        private Model1 con = new Model1();
        public FormUser()
        {
            InitializeComponent();
        }
        private void _Refresh()
        {
            gridControl_ViewBook.DataSource = con.Database.SqlQuery<ViewBook>("exec usp_ViewBook").ToList();
            layoutView1.Columns[0].Caption = "Mã đầu sách";
            layoutView1.Columns[1].Caption = "Đầu sách";
            layoutView1.Columns[2].Caption = "Tác giả";
            layoutView1.Columns[3].Caption = "Thể loại";
            layoutView1.Columns[4].Caption = "Tập";
            layoutView1.Columns[5].Caption = "Số trang";
            layoutView1.Columns[6].Caption = "Giá tiền";
            layoutView1.Columns[7].Caption = "Nhà xuất bản";
            layoutView1.Columns[8].Caption = "";
            layoutView1.CardCaptionFormat = "ĐẦU SÁCH";
            Find.Text = "";
        }

        private void BunifuFlatButton1_Click(object sender, EventArgs e)
        {
            PageMenu_User.SetPage("Sách");
        }

        private void BunifuFlatButton2_Click(object sender, EventArgs e)
        {
            PageMenu_User.SetPage("Thông tin độc giả");
           
        }

        private void BunifuFlatButton6_Click(object sender, EventArgs e)
        {
            PageMenu_User.SetPage("Lịch sử");
        }

        private void BunifuFlatButton7_Click(object sender, EventArgs e)
        {
            this.Hide();
            Login obj = new Login();
            obj.Show();
        }

        private void Find_TextChanged(object sender, EventArgs e)
        {
            if (Find.Text == "")
            {
                _Refresh();
            }
        }

        private void BunifuImageButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BunifuImageButton7_Click(object sender, EventArgs e)
        {
            gridControl_ViewBook.DataSource = con.Database.SqlQuery<ViewBook>("EXEC usp_Find_ViewBook @Key = N'" + Find.Text + "'").ToList();
        }

        private void FormUser_Load(object sender, EventArgs e)
        {
            
            var data = con.Database.SqlQuery<viewLichSuMuonTraUser>("EXEC usp_viewLichSuMuonTraUser @MaDG = '" + FormDangNhapUser.MaDG + "'").ToList();
            gridLichSuUser.DataSource = data;
            TenNguoiDung.Text = FormDangNhapUser.TenDG;
            _Refresh();
        }

        

        private void load_ttcn()
        {
            var dataDS = con.Database.SqlQuery<LAYTHONGTIN>("EXEC usp_LayThongTin @MaDG = '" + FormDangNhapUser.MaDG + "'").ToList();
            textma.Text = dataDS[0].MADG.ToString();
            textten.Text = dataDS[0].TENDG.ToString();
            dateTimePickerns.Text = dataDS[0].NGAYSINH.ToString();
            dateTimePickerdki.Text = dataDS[0].NGAYDK.ToString();
            dateTimePickerhethan.Text = dataDS[0].NGAYHH.ToString();
            textdonvi.Text = dataDS[0].DONVI.ToString();
            textsdt.Text = dataDS[0].SDT.ToString();
        }



        private void Bunifucanhan_Click(object sender, EventArgs e)
        {
            load_ttcn();
            bunifuPages1.SetPage("tabPage2");
            
        }

        private void BunifuButton1_Click(object sender, EventArgs e)
        {
            bunifuPages1.SetPage("tabPage1");
            var dataDS = con.Database.SqlQuery<LAYTHONGTIN>("EXEC usp_LayThongTin @MaDG = '" + FormDangNhapUser.MaDG + "'").ToList();
            textdn.Text = dataDS[0].TENDANGNHAP.ToString();
            //textmk.Text = dataDS[0].MATKHAU.ToString();

        }

        private void BunifuButtonluu_Click_1(object sender, EventArgs e)
        {
            con.Database.ExecuteSqlCommand("exec usp_ThongTinDocGia_Update @MaDG = '" + textma.Text + "', @TenDG ='" + textten.Text +
                "', @DonVi ='" + textdonvi.Text + "', @NgaySinh ='" + dateTimePickerns.Value.ToString("yyyy/MM/dd") + "',@SDT= '" + textsdt.Text + "', @NGayDK ='" + dateTimePickerdki.Value.ToString("yyyy/MM/dd")
                + "', @NgayHH= '" + dateTimePickerhethan.Value.ToString("yyyy/MM/dd") + "'");
            MessageBox.Show("Cập nhật thông tin thành công");

            load_ttcn();
        }

        private void BunifuButton3_Click_1(object sender, EventArgs e)
        {
            this.Hide();
        }

        public bool ktra()
        {
            if (MD5.CreateMD5(textmk.Text) != con.Database.SqlQuery<string>("SELECT MatKhau FROM dbo.DocGia WHERE MaDG = '" + FormDangNhapUser.MaDG + "'").FirstOrDefault().ToString())
            {
                MessageBox.Show("Nhập sai mật khẩu cũ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtmkmoi.Text) || MD5.CreateMD5(txtmkmoi.Text) == textmk.Text)
            {
                MessageBox.Show("Vui lòng nhập lại mật khẩu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtmkmoi.Focus();
                return false;
            }
            return true;
        }

        private void BunifuButton4luu_Click_1(object sender, EventArgs e)
        {
            if (ktra())
            {
                con.Database.ExecuteSqlCommand("exec usp_MatKhau_Update @MaDG = '" + FormDangNhapUser.MaDG + "', @MatKhau ='" + MD5.CreateMD5(txtmkmoi.Text) + "'");
                MessageBox.Show("Cập nhật thông tin thành công");
                var dataDS = con.Database.SqlQuery<LAYTHONGTIN>("EXEC usp_LayThongTin @MaDG = '" + FormDangNhapUser.MaDG + "'").ToList();
                textdn.Text = dataDS[0].TENDANGNHAP.ToString();
                textmk.Text = dataDS[0].MATKHAU.ToString();
            }
        }

        private void BunifuButtonhuy_Click_1(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
