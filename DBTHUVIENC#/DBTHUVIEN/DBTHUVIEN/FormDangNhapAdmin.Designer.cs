
namespace DBTHUVIEN
{
    partial class FormDangNhapAdmin
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormDangNhapAdmin));
            this.panel1 = new System.Windows.Forms.Panel();
            this.bunifuImageButton1 = new Bunifu.UI.WinForms.BunifuImageButton();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_MatKhauAdmin = new Bunifu.Framework.UI.BunifuMaterialTextbox();
            this.bt_DangNhapAdmin = new Bunifu.Framework.UI.BunifuFlatButton();
            this.txt_TenDangNhapAdmin = new Bunifu.Framework.UI.BunifuMaterialTextbox();
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
            this.panel1.Location = new System.Drawing.Point(2, 1);
            this.panel1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(322, 43);
            this.panel1.TabIndex = 20;
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
            this.bunifuImageButton1.ImageSize = new System.Drawing.Size(33, 34);
            this.bunifuImageButton1.ImageZoomSize = new System.Drawing.Size(34, 35);
            this.bunifuImageButton1.InitialImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton1.InitialImage")));
            this.bunifuImageButton1.Location = new System.Drawing.Point(286, 6);
            this.bunifuImageButton1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.bunifuImageButton1.Name = "bunifuImageButton1";
            this.bunifuImageButton1.Rotation = 0;
            this.bunifuImageButton1.ShowActiveImage = true;
            this.bunifuImageButton1.ShowCursorChanges = true;
            this.bunifuImageButton1.ShowImageBorders = true;
            this.bunifuImageButton1.ShowSizeMarkers = false;
            this.bunifuImageButton1.Size = new System.Drawing.Size(34, 35);
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
            this.label1.Size = new System.Drawing.Size(67, 23);
            this.label1.TabIndex = 0;
            this.label1.Text = "ADMIN";
            // 
            // txt_MatKhauAdmin
            // 
            this.txt_MatKhauAdmin.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txt_MatKhauAdmin.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_MatKhauAdmin.ForeColor = System.Drawing.Color.Black;
            this.txt_MatKhauAdmin.HintForeColor = System.Drawing.Color.Gray;
            this.txt_MatKhauAdmin.HintText = "Mật Khẩu";
            this.txt_MatKhauAdmin.isPassword = false;
            this.txt_MatKhauAdmin.LineFocusedColor = System.Drawing.Color.Black;
            this.txt_MatKhauAdmin.LineIdleColor = System.Drawing.Color.Black;
            this.txt_MatKhauAdmin.LineMouseHoverColor = System.Drawing.Color.Black;
            this.txt_MatKhauAdmin.LineThickness = 4;
            this.txt_MatKhauAdmin.Location = new System.Drawing.Point(64, 275);
            this.txt_MatKhauAdmin.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_MatKhauAdmin.Name = "txt_MatKhauAdmin";
            this.txt_MatKhauAdmin.Size = new System.Drawing.Size(200, 34);
            this.txt_MatKhauAdmin.TabIndex = 24;
            this.txt_MatKhauAdmin.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txt_MatKhauAdmin.OnValueChanged += new System.EventHandler(this.Txt_MatKhauAdmin_OnValueChanged);
            // 
            // bt_DangNhapAdmin
            // 
            this.bt_DangNhapAdmin.Activecolor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(139)))), ((int)(((byte)(87)))));
            this.bt_DangNhapAdmin.BackColor = System.Drawing.Color.Black;
            this.bt_DangNhapAdmin.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bt_DangNhapAdmin.BorderRadius = 0;
            this.bt_DangNhapAdmin.ButtonText = "Đăng Nhập";
            this.bt_DangNhapAdmin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.bt_DangNhapAdmin.DisabledColor = System.Drawing.Color.Gray;
            this.bt_DangNhapAdmin.Font = new System.Drawing.Font("Sitka Small", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bt_DangNhapAdmin.Iconcolor = System.Drawing.Color.Transparent;
            this.bt_DangNhapAdmin.Iconimage = null;
            this.bt_DangNhapAdmin.Iconimage_right = null;
            this.bt_DangNhapAdmin.Iconimage_right_Selected = null;
            this.bt_DangNhapAdmin.Iconimage_Selected = null;
            this.bt_DangNhapAdmin.IconMarginLeft = 0;
            this.bt_DangNhapAdmin.IconMarginRight = 0;
            this.bt_DangNhapAdmin.IconRightVisible = true;
            this.bt_DangNhapAdmin.IconRightZoom = 0D;
            this.bt_DangNhapAdmin.IconVisible = true;
            this.bt_DangNhapAdmin.IconZoom = 90D;
            this.bt_DangNhapAdmin.IsTab = false;
            this.bt_DangNhapAdmin.Location = new System.Drawing.Point(91, 353);
            this.bt_DangNhapAdmin.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_DangNhapAdmin.Name = "bt_DangNhapAdmin";
            this.bt_DangNhapAdmin.Normalcolor = System.Drawing.Color.Black;
            this.bt_DangNhapAdmin.OnHovercolor = System.Drawing.Color.Black;
            this.bt_DangNhapAdmin.OnHoverTextColor = System.Drawing.Color.White;
            this.bt_DangNhapAdmin.selected = false;
            this.bt_DangNhapAdmin.Size = new System.Drawing.Size(138, 43);
            this.bt_DangNhapAdmin.TabIndex = 23;
            this.bt_DangNhapAdmin.Text = "Đăng Nhập";
            this.bt_DangNhapAdmin.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.bt_DangNhapAdmin.Textcolor = System.Drawing.Color.White;
            this.bt_DangNhapAdmin.TextFont = new System.Drawing.Font("Sitka Small", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bt_DangNhapAdmin.Click += new System.EventHandler(this.Bt_DangNhapAdmin_Click);
            // 
            // txt_TenDangNhapAdmin
            // 
            this.txt_TenDangNhapAdmin.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txt_TenDangNhapAdmin.Font = new System.Drawing.Font("Sitka Small", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_TenDangNhapAdmin.ForeColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapAdmin.HintForeColor = System.Drawing.Color.Gray;
            this.txt_TenDangNhapAdmin.HintText = "Tên Đăng Nhập";
            this.txt_TenDangNhapAdmin.isPassword = false;
            this.txt_TenDangNhapAdmin.LineFocusedColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapAdmin.LineIdleColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapAdmin.LineMouseHoverColor = System.Drawing.Color.Black;
            this.txt_TenDangNhapAdmin.LineThickness = 4;
            this.txt_TenDangNhapAdmin.Location = new System.Drawing.Point(64, 232);
            this.txt_TenDangNhapAdmin.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txt_TenDangNhapAdmin.Name = "txt_TenDangNhapAdmin";
            this.txt_TenDangNhapAdmin.Size = new System.Drawing.Size(200, 34);
            this.txt_TenDangNhapAdmin.TabIndex = 22;
            this.txt_TenDangNhapAdmin.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
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
            this.bunifuImageButton2.ImageSize = new System.Drawing.Size(158, 168);
            this.bunifuImageButton2.ImageZoomSize = new System.Drawing.Size(159, 169);
            this.bunifuImageButton2.InitialImage = ((System.Drawing.Image)(resources.GetObject("bunifuImageButton2.InitialImage")));
            this.bunifuImageButton2.Location = new System.Drawing.Point(86, 58);
            this.bunifuImageButton2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.bunifuImageButton2.Name = "bunifuImageButton2";
            this.bunifuImageButton2.Rotation = 0;
            this.bunifuImageButton2.ShowActiveImage = true;
            this.bunifuImageButton2.ShowCursorChanges = true;
            this.bunifuImageButton2.ShowImageBorders = true;
            this.bunifuImageButton2.ShowSizeMarkers = false;
            this.bunifuImageButton2.Size = new System.Drawing.Size(159, 169);
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
            this.cb_HienThiMK.Location = new System.Drawing.Point(64, 315);
            this.cb_HienThiMK.Name = "cb_HienThiMK";
            this.cb_HienThiMK.Size = new System.Drawing.Size(138, 22);
            this.cb_HienThiMK.TabIndex = 27;
            this.cb_HienThiMK.Text = "Hiển thị mật khẩu";
            this.cb_HienThiMK.UseVisualStyleBackColor = true;
            this.cb_HienThiMK.CheckedChanged += new System.EventHandler(this.cb_HienThiMK_CheckedChanged);
            // 
            // FormDangNhapAdmin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(325, 450);
            this.Controls.Add(this.cb_HienThiMK);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.txt_MatKhauAdmin);
            this.Controls.Add(this.bt_DangNhapAdmin);
            this.Controls.Add(this.txt_TenDangNhapAdmin);
            this.Controls.Add(this.bunifuImageButton2);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "FormDangNhapAdmin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormDangNhapAdmin";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private Bunifu.UI.WinForms.BunifuImageButton bunifuImageButton1;
        private System.Windows.Forms.Label label1;
        private Bunifu.Framework.UI.BunifuMaterialTextbox txt_MatKhauAdmin;
        private Bunifu.Framework.UI.BunifuFlatButton bt_DangNhapAdmin;
        private Bunifu.Framework.UI.BunifuMaterialTextbox txt_TenDangNhapAdmin;
        private Bunifu.UI.WinForms.BunifuImageButton bunifuImageButton2;
        private System.Windows.Forms.CheckBox cb_HienThiMK;
    }
}