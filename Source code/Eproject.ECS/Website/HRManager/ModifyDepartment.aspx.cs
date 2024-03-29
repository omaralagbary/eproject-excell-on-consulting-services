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
using Eproject.ECS.Entities;

public partial class HRManager_ModifyDepartment : System.Web.UI.Page
{
    private DepartmentBusiness DB;
    private Guid departmentId;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlRed.Visible = false;
        pnlGreen.Visible = false;
        pnlYellow.Visible = false;
        pnlBlue.Visible = false;

        DB = new DepartmentBusiness();

        GetRouteData();
        if (!IsPostBack)
            loadData();
        else
        {
            String script = WebHelper.Instance.GetJqueryScript("App_Themes/js/jquery/custom_jquery.js");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "MessageWarning", script, true);
        }
    }
    private void GetRouteData()
    {
        String id = "";
        if (RouteCollectionExtensions.RouteData != null)
        {
            if (RouteCollectionExtensions.RouteData.Values["id"] != null)
            {
                id = RouteCollectionExtensions.RouteData.Values["id"] as String;
            }
        }

        if (!String.IsNullOrEmpty(id))
        {
            departmentId = new Guid(id);
        }
    }
    private void loadData()
    {
        try
        {
            Department department = DB.GetDepartment(departmentId);
            lblName.Text = department.Department_Name;
            txtModifyDescription.Text = department.Department_Description;
        }
        catch (Exception ex)
        {
            if (Session["return"] == null)
                Session.Add("return", "null");
            else
                Session["return"] = "null";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage");
        }
    }
    protected void lblRemove_Click(object sender, EventArgs e)
    {
        try
        {
            DB.RemoveDepartment(departmentId);
            if (Session["return"] == null)
                Session.Add("return", "remove");
            else
                Session["return"] = "remove";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage");
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {
            DB.UpdateDepartment(departmentId, lblName.Text, txtModifyDescription.Text.Trim(), false);
            if (Session["return"] == null)
                Session.Add("return", "modify");
            else
                Session["return"] = "modify";
            Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage/" + departmentId.ToString());
        }
        catch (Exception ex)
        {
            pnlRed.Visible = true;
            lblError.Text = ex.Message;
            hplnkRed.Text = "Close and continue";
            hplnkRed.NavigateUrl = "";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(WebHelper.Instance.GetURL() + "ManageSystem/Department/Manage");
    }
}
