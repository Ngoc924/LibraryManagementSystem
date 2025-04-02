
namespace DBTHUVIEN
{
    partial class FormDangNhapUser
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormDangNhapUser));
            this.panel1 = new System.Windows.Forms.Panel();
            this.bunifuImageButton1 = new Bunifu.UI.WinForms.BunifuImageButton();
            this.label1 = new System.Windows.Forms.Label();
            this.lbDangKy = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtMatKhauUser = new Bunifu.Framework.UI.BunifuMaterialTextbox();
            this.bt_DangNhapUser = new Bunifu.Framework.UI.BunifuFlatButton();
            this.txt_TenDangNhapUser = new Bunifu.Framework.UI.BunifuMaterialTextbox();
            this.bunifuImageButton2 = new Bunifu.UI.WinForms.BunifuImageButton();
            this.cb_HienThiMK = new System.Windows.Forms.CheckBox();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Black;
            this.panel1.Controls.Add(this.bunifuImageButton1);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(2, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(328, 41);
            this.panel1.TabIndex = 19;
            // 
            // bunifuImageButton1
            // 
            this.bunifuImageButton1.ActiveImage = null;
            this.bunifuImageButton1.AllowAnimations = true;
            this.bunifuImageButton1.AllowBuffering = false;
            this.bunifuImageButton1.AllowToggling = false;
            this.bunifuImageButton1.AllowZooming = true;
            this.bunifuImageButton1.AllowZoomingOnFocus = false;
            this.bunifuImageButton1.BackColor = System.Drawing.Color.Black;
            this.bunifuImageButton1.DialogResult = System.Windows.Forms.DialogResult.None;
            this.bunifuImageButton1.ErrorImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton1.ErrorImage")));
            this.bunifuImageButton1.FadeWhenInactive = false;
            this.bunifuImageButton1.Flip = Bunifu.UI.WinForms.BunifuImageButton.FlipOrientation.Normal;
            this.bunifuImageButton1.Image = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton1.Image")));
            this.bunifuImageButton1.ImageActive = null;
            this.bunifuImageButton1.ImageLocation = null;
            this.bunifuImageButton1.ImageMargin = 0;
            this.bunifuImageButton1.ImageSize = new System.Drawing.Size(27, 24);
            this.bunifuImageButton1.ImageZoomSize = new System.Drawing.Size(28, 25);
            this.bunifuImageButton1.InitialImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton1.InitialImage")));
            this.bunifuImageButton1.Location = new System.Drawing.Point(293, 8);
            this.bunifuImageButton1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.bunifuImageButton1.Name = "bunifuImageButton1";
            this.bunifuImageButton1.Rotation = 0;
            this.bunifuImageButton1.ShowActiveImage = true;
            this.bunifuImageButton1.ShowCursorChanges = true;
            this.bunifuImageButton1.ShowImageBorders = true;
            this.bunifuImageButton1.ShowSizeMarkers = false;
            this.bunifuImageButton1.Size = new System.Drawing.Size(28, 25);
            this.bunifuImageButton1.TabIndex = 1;
            this.bunifuImageButton1.ToolTipText = "";
            this.bunifuImageButton1.WaitOnLoad = false;
            this.bunifuImageButton1.Zoom = 0;
            this.bunifuImageButton1.ZoomSpeed = 10;
            this.bunifuImageButton1.Click += new System.EventHandler(this.BunifuImageButton1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(9, 10);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 23);
            this.label1.TabIndex = 0;
            this.label1.Text = "USER";
            // 
            // lbDangKy
            // 
            this.lbDangKy.AutoSize = true;
            this.lbDangKy.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDangKy.ForeColor = System.Drawing.Color.Black;
            this.lbDangKy.Location = new System.Drawing.Point(118, 398);
            this.lbDangKy.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lbDangKy.Name = "lbDangKy";
            this.lbDangKy.Size = new System.Drawing.Size(85, 23);
            this.lbDangKy.TabIndex = 25;
            this.lbDangKy.Text = "ĐĂNG KÝ";
            this.lbDangKy.Click += new System.EventHandler(this.LbDangKy_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Sitka Small", 10F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.Gray;
            this.label2.Location = new System.Drawing.Point(89, 377);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(152, 20);
            this.label2.TabIndex = 20;
            this.label2.Text = "Chưa có tài khoản?";
            // 
            // txtMatKhauUser
            // 
            this.txtMatKhauUser.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMatKhauUser.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMatKhauUser.ForeColor = System.Drawing.Color.Black;
            this.txtMatKhauUser.HintForeColor = System.Drawing.Color.Gray;
            this.txtMatKhauUser.HintText = "Mật Khẩu";
            this.txtMatKhauUser.isPassword = false;
            this.txtMatKhauUser.LineFocusedColor = System.Drawing.Color.Black;
            this.txtMatKhauUser.LineIdleColor = System.Drawing.Color.Black;
            this.txtMatKhauUser.LineMouseHoverColor = System.Drawing.Color.Black;
            this.txtMatKhauUser.LineThickness = 4;
            this.txtMatKhauUser.Location = new System.Drawing.Point(70, 240);
            this.txtMatKhauUser.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtMatKhauUser.Name = "txtMatKhauUser";
            this.txtMatKhauUser.Size = new System.Drawing.Size(200, 34);
            this.txtMatKhauUser.TabIndex = 24;
            this.txtMatKhauUser.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtMatKhauUser.OnValueChanged += new System.EventHandler(this.TxtMatKhauUser_OnValueChanged);
            // 
            // bt_DangNhapUser
            // 
            this.bt_DangNhapUser.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.bt_DangNhapUser.BackColor = System.Drawing.Color.Black;
            this.bt_DangNhapUser.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bt_DangNhapUser.BorderRadius = 0;
            this.bt_DangNhapUser.ButtonText = "Đăng Nhập";
            this.bt_DangNhapUser.Cursor = System.Windows.Forms.Cursors.Hand;
            this.bt_DangNhapUser.DisabledColor = System.Drawing.Color.Gray;
            this.bt_DangNhapUser.Font = new System.Drawing.Font("Sitka Small", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bt_DangNhapUser.Iconcolor = System.Drawing.Color.Transparent;
            this.bt_DangNhapUser.Iconimage = null;
            this.bt_DangNhapUser.Iconimage_right = null;
            this.bt_DangNhapUser.Iconimage_right_Selected = null;
            this.bt_DangNhapUser.Iconimage_Selected = null;
            this.bt_DangNhapUser.IconMarginLeft = 0;
            this.bt_DangNhapUser.IconMarginRight = 0;
            this.bt_DangNhapUser.IconRightVisible = true;
            this.bt_DangNhapUser.IconRightZoom = 0D;
            this.bt_DangNhapUser.IconVisible = true;
            this.bt_DangNhapUser.IconZoom = 90D;
            this.bt_DangNhapUser.IsTab = false;
            this.bt_DangNhapUser.Location = new System.Drawing.Point(94, 322);
            this.bt_DangNhapUser.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_DangNhapUser.Name = "bt_DangNhapUser";
            this.bt_DangNhapUser.Normalcolor = System.Drawing.Color.Black;
            this.bt_DangNhapUser.OnHovercolor = System.Drawing.Color.Black;
            this.bt_DangNhapUser.OnHoverTextColor = System.Drawing.Color.White;
            this.bt_DangNhapUser.selected = false;
            this.bt_DangNhapUser.Size = new System.Drawing.Size(138, 43);
            this.bt_DangNhapUser.TabIndex = 23;
            this.bt_DangNhapUser.Text = "Đăng Nhập";
            this.bt_DangNhapUser.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.bt_DangNhapUser.Textcolor = System.Drawing.Color.White;
            this.bt_DangNhapUser.TextFont = new System.Drawing.Font("Sitka Small", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bt_DangNhapUser.Click += new System.EventHandler(this.Bt_DangNhapUser_Click);
            // 
            // txt_TenDangNhapUser
            // 
            this.txt_TenDangNhapUser.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txt_TenDangNhapUser.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_TenDangNhapUser.ForeColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapUser.HintForeColor = System.Drawing.Color.Gray;
            this.txt_TenDangNhapUser.HintText = "Tên Đăng Nhập";
            this.txt_TenDangNhapUser.isPassword = false;
            this.txt_TenDangNhapUser.LineFocusedColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapUser.LineIdleColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapUser.LineMouseHoverColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapUser.LineThickness = 4;
            this.txt_TenDangNhapUser.Location = new System.Drawing.Point(70, 198);
            this.txt_TenDangNhapUser.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_TenDangNhapUser.Name = "txt_TenDangNhapUser";
            this.txt_TenDangNhapUser.Size = new System.Drawing.Size(200, 34);
            this.txt_TenDangNhapUser.TabIndex = 22;
            this.txt_TenDangNhapUser.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            // 
            // bunifuImageButton2
            // 
            this.bunifuImageButton2.ActiveImage = null;
            this.bunifuImageButton2.AllowAnimations = true;
            this.bunifuImageButton2.AllowBuffering = false;
            this.bunifuImageButton2.AllowToggling = false;
            this.bunifuImageButton2.AllowZooming = true;
            this.bunifuImageButton2.AllowZoomingOnFocus = false;
            this.bunifuImageButton2.BackColor = System.Drawing.Color.Transparent;
            this.bunifuImageButton2.DialogResult = System.Windows.Forms.DialogResult.None;
            this.bunifuImageButton2.ErrorImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton2.ErrorImage")));
            this.bunifuImageButton2.FadeWhenInactive = false;
            this.bunifuImageButton2.Flip = Bunifu.UI.WinForms.BunifuImageButton.FlipOrientation.Normal;
            this.bunifuImageButton2.Image = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton2.Image")));
            this.bunifuImageButton2.ImageActive = null;
            this.bunifuImageButton2.ImageLocation = null;
            this.bunifuImageButton2.ImageMargin = 0;
            this.bunifuImageButton2.ImageSize = new System.Drawing.Size(139, 122);
            this.bunifuImageButton2.ImageZoomSize = new System.Drawing.Size(140, 123);
            this.bunifuImageButton2.InitialImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton2.InitialImage")));
            this.bunifuImageButton2.Location = new System.Drawing.Point(94, 59);
            this.bunifuImageButton2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.bunifuImageButton2.Name = "bunifuImageButton2";
            this.bunifuImageButton2.Rotation = 0;
            this.bunifuImageButton2.ShowActiveImage = true;
            this.bunifuImageButton2.ShowCursorChanges = true;
            this.bunifuImageButton2.ShowImageBorders = true;
            this.bunifuImageButton2.ShowSizeMarkers = false;
            this.bunifuImageButton2.Size = new System.Drawing.Size(140, 123);
            this.bunifuImageButton2.TabIndex = 21;
            this.bunifuImageButton2.ToolTipText = "";
            this.bunifuImageButton2.WaitOnLoad = false;
            this.bunifuImageButton2.Zoom = 0;
            this.bunifuImageButton2.ZoomSpeed = 10;
            // 
            // cb_HienThiMK
            // 
            this.cb_HienThiMK.AutoSize = true;
            this.cb_HienThiMK.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cb_HienThiMK.Location = new System.Drawing.Point(70, 283);
            this.cb_HienThiMK.Name = "cb_HienThiMK";
            this.cb_HienThiMK.Size = new System.Drawing.Size(138, 22);
            this.cb_HienThiMK.TabIndex = 26;
            this.cb_HienThiMK.Text = "Hiển thị mật khẩu";
            this.cb_HienThiMK.UseVisualStyleBackColor = true;
            this.cb_HienThiMK.CheckedChanged += new System.EventHandler(this.cb_HienThiMK_CheckedChanged);
            // 
            // FormDangNhapUser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(328, 457);
            this.Controls.Add(this.cb_HienThiMK);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.lbDangKy);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtMatKhauUser);
            this.Controls.Add(this.bt_DangNhapUser);
            this.Controls.Add(this.txt_TenDangNhapUser);
            this.Controls.Add(this.bunifuImageButton2);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "FormDangNhapUser";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormDangNhapUser";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private Bunifu.UI.WinForms.BunifuImageButton bunifuImageButton1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lbDangKy;
        private System.Windows.Forms.Label label2;
        private Bunifu.Framework.UI.BunifuMaterialTextbox txtMatKhauUser;
        private Bunifu.Framework.UI.BunifuFlatButton bt_DangNhapUser;
        private Bunifu.Framework.UI.BunifuMaterialTextbox txt_TenDangNhapUser;
        private Bunifu.UI.WinForms.BunifuImageButton bunifuImageButton2;
        private System.Windows.Forms.CheckBox cb_HienThiMK;
    }
}