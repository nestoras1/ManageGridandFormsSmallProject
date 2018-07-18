using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void bt_register_Click(object sender, EventArgs e)
    {
        AccountManager.registerAccount(regusertb.Text.Trim(), regpasstb.Text.Trim(), regpass2tb.Text.Trim());
        regerror_message_lb.Text = AccountManager.returnregerror();
        if (regerror_message_lb.Text == "")
        {
            Response.Redirect("Default.aspx");
        }
        regpasstb.Text = "";
        regpass2tb.Text = "";
    }
}