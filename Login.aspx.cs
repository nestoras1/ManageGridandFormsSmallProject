using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {

        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void bt_login_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["NWConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        DataTable dt1 = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter();

        try
        {
            SqlCommand cmd = new SqlCommand("SELECT Id, [user] FROM dbo.accounts WHERE [user]=@UserName AND pass=@password;", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@UserName", text_username.Text);
            cmd.Parameters.AddWithValue("@Password", AccountManager.encryption(text_password.Text));
            da.SelectCommand = cmd;
            da.Fill(dt1);
            Session["id"] = dt1.Rows[0][0].ToString();
            Session["user"] = dt1.Rows[0][1].ToString();
            con.Close();
            Response.Redirect("Default.aspx");
        }
        catch
        {
            text_username.Text = "";
            text_password.Text = "";
            con.Close();
            label_wrong_user_pass.Text = "Invalid username or password";
        }
    }

}