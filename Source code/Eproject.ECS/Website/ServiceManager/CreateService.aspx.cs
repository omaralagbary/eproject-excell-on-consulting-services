﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Eproject.ECS.Bll;

public partial class ServiceManager_CreateService : System.Web.UI.Page
{
    private ServiceBusiness SB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        SB = new ServiceBusiness();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                System.Drawing.Image image;
                if (fileuploadImage.HasFile)
                {
                    image = System.Drawing.Image.FromStream(fileuploadImage.PostedFile.InputStream);
                }
                else
                {
                    String filePath = WebHelper.Instance.GetWebsitePath() + "App_Themes/images/other/no_image.png";
                    image = System.Drawing.Image.FromFile(filePath);
                }
                String data = WebHelper.Instance.ImageToBase64(image, System.Drawing.Imaging.ImageFormat.Png);
                SB.CreateService(Guid.NewGuid(), txtName.Text.Trim(), txtDescription.Text.Trim(), txtCharge.Text.Trim(), data);

                pnlGreen.Visible = true;
                lblSuccess.Text = "Create new a service successfully.";
                Reset();
            }
            catch (Exception ex)
            {
                pnlRed.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }

    private void Reset()
    {
        txtName.Text = "";
        txtDescription.Text = "";
        txtCharge.Text = "";
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
}
