using DBTHUVIEN.Data.Stored_Procedure;
using DBTHUVIEN.Data.Table;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DBTHUVIEN
{

    public partial class formMenu_Admin : Form
    {
        private Model1 con = new Model1();
        public formMenu_Admin()
        {
            InitializeComponent();
        }

        public void refreshDS()
        {

            var ds = con.Database.SqlQuery<viewDauSachAdmin>("EXEC usp_viewDauSachAdmin");
            bunifuDataGridView2.DataSource = ds.ToList();
          
        }

        public void refreshDG()
        {
            var dg = con.Database.SqlQuery<viewDocGiaAdmin>("EXEC usp_viewDocGiaAdmin");
            gridDocGia.DataSource = dg.ToList();
        }

        public void refreshMT()
        {
            var ctmt = con.Database.SqlQuery<ViewChiTietMuonTra>("EXEC usp_ViewChiTietMuonTra");
            gridCTMT.DataSource = ctmt.ToList();
        }

        public void refreshXLVP()
        {
            var xlvp = con.Database.SqlQuery<viewXuLyViPham>("EXEC usp_viewXuLyViPham");
            gridXuLyViPham.DataSource = xlvp.ToList();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            TenAdmin.Text = FormDangNhapAdmin.TenNV;
            refreshDS();
            refreshDG();
            refreshMT();
            refreshXLVP();
            refreshTRG();
        }


        private void BunifuImageButton1_Click(object sender, EventArgs e)
        {
            refreshETG();
            Application.Exit();
        }

        private void BtnMenuAdmin_Sach_Click(object sender, EventArgs e)
        {
            PageMenu_Admin.SetPage("Sách");
            refreshDS();
            refreshCuonSach();
        }

        private void BtnMenuAdmin_DocGia_Click(object sender, EventArgs e)
        {
            PageMenu_Admin.SetPage("Độc Giả");
            refreshDG();
            
        }

        private void BtnMenuAdmin_MuonSach_Click(object sender, EventArgs e)
        {
            PageMenu_Admin.SetPage("Mượn Trả Sách");
            refreshMT();
        }

        private void BtnMenuAdmin_XuLyViPham_Click(object sender, EventArgs e)
        {
            PageMenu_Admin.SetPage("Xử Lý Vi Phạm");
            refreshXLVP();
        }

        private void BtnMenuAdmin_ThongKe_Click(object sender, EventArgs e)
        {
            PageMenu_Admin.SetPage("Thống Kê");
            BtnMenuAdmin_ThongKe_TongSach_Click(sender, e);
        }

        private void BtnMenuAdmin_DangXuat_Click(object sender, EventArgs e)
        {
            refreshETG();
            this.Hide();
            Login obj = new Login();
            obj.Show();
        }

        private void refreshTRG()
        {
            con.Database.ExecuteSqlCommand("DISABLE TRIGGER ALL ON dbo.DauSach;");
            con.Database.ExecuteSqlCommand("DISABLE TRIGGER ALL ON dbo.ChiTietMuonTra;");
        }
        private void refreshETG()
        {
            con.Database.ExecuteSqlCommand("ENABLE TRIGGER ALL ON dbo.DauSach;");
            con.Database.ExecuteSqlCommand("ENABLE TRIGGER ALL ON dbo.ChiTietMuonTra;");
        }
        private void BtnMenuAdmin_ThongKe_TongSach_Click(object sender, EventArgs e)
        {
            pageThongKe.SetPage("Tổng sách");
            var ds = con.Database.SqlQuery<ThongKeDauSach>("EXEC usp_ThongKeDauSach");
            gridTongDS.DataSource = ds.ToList();
        }

        private void BtnMenuAdmin_ThongKe_TanSoMuon_Click(object sender, EventArgs e)
        {
            pageThongKe.SetPage("Tần số mượn");
        }

        private void BtnMenuAdmin_ThongKe_SachItMuon_Click(object sender, EventArgs e)
        {
            pageThongKe.SetPage("Sách ít mượn");
            var ds = con.Database.SqlQuery<ThongKeSachItMuon>("EXEC usp_ThongKeSachItMuon");
            gridThongKeSachItMuon.DataSource = ds.ToList();
        }

        private void BtnMenuAdmin_ThongKe_SachBiRach_Click(object sender, EventArgs e)
        {
            pageThongKe.SetPage("Sách bị rách");
            var ds = con.Database.SqlQuery<ThongKeSachMat>("EXEC usp_ThongKeSachMat");
            gridThongKeSachMat.DataSource = ds.ToList();
        }

        private void BtnMenuAdmin_ThongKe_QuaHanTra_Click(object sender, EventArgs e)
        {
            pageThongKe.SetPage("Quá hạn trả");
            var ds = con.Database.SqlQuery<ThongKeQuaHanTra>("EXEC usp_ThongKeQuaHanTra");
            gridThongKeQuaHan.DataSource = ds.ToList();
        }
        public void BunifuDataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = bunifuDataGridView2.CurrentRow.Index;
            viewDauSachAdmin.index = index;
            
            if (index >= 0)
            {
                int i = Convert.ToInt32(bunifuDataGridView2.Rows[index].Cells[0].Value);
                viewDauSachAdmin.mds = i;
                refreshCuonSach();
                viewCuonSachAdmin.index = -1;
            }
        }
        void refreshCuonSach()
        {
            var dsach = con.Database.SqlQuery<viewCuonSachAdmin>("EXEC usp_viewCuonSachAdmin @MaDS = " + viewDauSachAdmin.mds);
            bunifuDataGridView3.DataSource = dsach.ToList();
        }

        private void BunifuDataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //chọn index của đầu sách
            int indexCS = bunifuDataGridView3.CurrentRow.Index;
            viewCuonSachAdmin.index = indexCS;
            if(indexCS >= 0)
            {
                string i = bunifuDataGridView3.Rows[indexCS].Cells[0].Value.ToString();
                viewCuonSachAdmin.socabiet = i;
            }
        }

        private void BtnThem_Click(object sender, EventArgs e)
        {
            FormThem obj = new FormThem();
            obj.ShowDialog();
            refreshDS();
            refreshCuonSach();
            //bunifuDataGridView2.SelectedRows(DauSachAdmin.index);
        }

        private void BtnSua_Click(object sender, EventArgs e)
        {
            FormSua obj = new FormSua();
            obj.ShowDialog();
            refreshDS();

        }

        private void BtnXoa_Click(object sender, EventArgs e)
        {
            var SachDaChoMuon = con.CuonSach.SqlQuery("SELECT * FROM CUONSACH WHERE MADS = " + viewDauSachAdmin.mds + "AND TINHTRANG = 0").ToList();
            // xoá cuốn sách
            if (viewCuonSachAdmin.index >= 0)
            {
                var data = con.CuonSach.SqlQuery("SELECT * FROM CUONSACH WHERE SOCABIET = '" + viewCuonSachAdmin.socabiet + "'").ToList();
                if(data[0].TinhTrang == false)
                {
                    MessageBox.Show("Cuốn Sách Đang Được Mượn");
                }
                else
                {
                    con.Database.ExecuteSqlCommand("EXEC usp_CuonSach_Delete @SoCaBiet = '" + viewCuonSachAdmin.socabiet + "'");
                    MessageBox.Show("Xoá Cuốn Sách Thành công");
                    refreshCuonSach();
                }
                
            }
            else
            {
                
                if (SachDaChoMuon.Count()>0)
                {
                    MessageBox.Show("Sách Đang Được Cho Mượn Nên Không Thể Xoá!");

                }
                else
                {
                    con.Database.ExecuteSqlCommand(" EXEC usp_DauSach_Delete @MaDS = " + viewDauSachAdmin.mds);
                    MessageBox.Show("Xoá Cuốn Sách Thành công");
                    refreshDS();
                    refreshCuonSach();
                }               
            }
        }

        

        private void BtnMuonSach_Click(object sender, EventArgs e)
        {
            FormMuonSachAdmin obj = new FormMuonSachAdmin();
            obj.ShowDialog();
            refreshMT();
        }

        private void BtnTraSach_Click(object sender, EventArgs e)
        {
            FormTraSachAdmin obj = new FormTraSachAdmin();
            obj.ShowDialog();
            refreshMT();
        }

        

        private void GridXuLyViPham_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int indexXL = gridXuLyViPham.CurrentRow.Index;
            viewXuLyViPham.index = indexXL;
            if (indexXL >= 0)
            {
                int i = Convert.ToInt32(gridXuLyViPham.Rows[indexXL].Cells[0].Value);
                viewXuLyViPham.maxl = i;
            }
        }

        private void BtnThongKeTanSoMuon_Click(object sender, EventArgs e)
        {
            var dsach = con.Database.SqlQuery<ThongKeTanSoDauSachMuon>("EXEC usp_ThongKeTanSoDauSachMuon @NgayBatDau = ' " + date1.Value.ToString("yyyy/MM/dd") + "' , @NgayKetThuc = '" + Date2.Value.ToString("yyyy/MM/dd") + "'");
            gridThongKeTanSo.DataSource = dsach.ToList();
        }

        private void BtnTimKiem_Click(object sender, EventArgs e)
        {
            if(txtTimKiem.Text == "")
            {
                refreshDS();
            }
            else
            {
                var ds = con.Database.SqlQuery<viewDauSachAdmin>("EXEC usp_Find_DauSach @Key = N'" + txtTimKiem.Text +"'");
                bunifuDataGridView2.DataSource = ds.ToList();
            }
        }

        private void TxtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (txtTimKiem.Text == "")
            {
                refreshDS();
            }
            else
            {
                var ds = con.Database.SqlQuery<viewDauSachAdmin>("EXEC usp_Find_DauSach @Key = N'" + txtTimKiem.Text + "'");
                bunifuDataGridView2.DataSource = ds.ToList();
            }
        }

        private void TxtTimKiemDocGia_TextChanged(object sender, EventArgs e)
        {
            if (txtTimKiemDocGia.Text == "")
            {
                refreshDG();
            }
            else
            {
                var dg = con.Database.SqlQuery<viewDocGiaAdmin>("EXEC usp_Find_DocGia @Key = N'" + txtTimKiemDocGia.Text + "'");
                gridDocGia.DataSource = dg.ToList();
            }
        }

        private void TxtTimKiemMuonTra_TextChanged(object sender, EventArgs e)
        {
            if (txtTimKiemMuonTra.Text == "")
            {
                refreshMT();
            }
            else
            {
                var ctmt = con.Database.SqlQuery<ViewChiTietMuonTra>("EXEC usp_Find_MuonTra @Key = N'" + txtTimKiemMuonTra.Text + "'");
                gridCTMT.DataSource = ctmt.ToList();
            }
        }

        private void TxtTimKiemViPham_TextChanged(object sender, EventArgs e)
        {
            if(txtTimKiemViPham.Text == "")
            {
                refreshXLVP();
            }
            else
            {
                var xlvp = con.Database.SqlQuery<viewXuLyViPham>("EXEC usp_Find_XuLyViPham @Key = N'" + txtTimKiemViPham.Text + "'");
                gridXuLyViPham.DataSource = xlvp.ToList();
            }
        }

        private void BtnXoaDocGia_Click(object sender, EventArgs e)
        {
            var data = con.MuonTra.SqlQuery("SELECT MAMT, NGAYMUON, HANTRA, MANV, MADG FROM MuonTra WHERE MADG = '" + DocGia.madg + "'").ToList();
            if (data.Count == 0)
            {
                con.Database.ExecuteSqlCommand("EXEC usp_DocGia_Delete @MaDG = '" + DocGia.madg + "'");
                MessageBox.Show("Xoá Thành Công");
            }
            else if (data.Count > 0)
            {
                for (int i = 0; i < data.Count; i++)
                {
                    var data1 = con.ChiTietMuonTra.SqlQuery("SELECT MACTMT, MAMT,SOCABIET,TRANGTHAI,NGAYTRA FROM ChiTietMuonTra WHERE MAMT = " + data[i].MaMT).ToList();
                    for (int j = 0; j < data1.Count; j++)
                    {
                        if (data1[j].TrangThai == false)
                        {
                            MessageBox.Show("Độc giả đang mượn sách!");
                            i = data.Count - 1;
                            break;
                        }
                        if (i == data.Count - 1 && j == data1.Count - 1)
                        {
                            con.Database.ExecuteSqlCommand("EXEC usp_DocGia_Delete @MaDG = '" + DocGia.madg + "'");
                            MessageBox.Show("Xoá Thành Công");
                            break;
                        }
                    }
                    if (i == data.Count - 1)
                    {
                        break;
                    }

                }
            }
            refreshDG();
        }

        private void GridDocGia_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = gridDocGia.CurrentRow.Index;            
            if (index >= 0)
            {
                string i = gridDocGia.Rows[index].Cells[0].Value.ToString();
                DocGia.madg = i;
            }
        }

        private void BtnTimKiemDocGia_Click(object sender, EventArgs e)
        {
            var dg = con.Database.SqlQuery<viewDocGiaAdmin>("EXEC usp_Find_DocGia @Key = N'" + txtTimKiemDocGia.Text + "'");
            gridDocGia.DataSource = dg.ToList();
        }

        private void BunifuButton1_Click(object sender, EventArgs e)
        {
            FormThuTien obj = new FormThuTien();
            obj.Show();
            refreshXLVP();
        }

        private void bunifuDataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void bunifuDataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
