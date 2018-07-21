﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    static SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["NWConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx",false);
            }
        }
        catch
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Redirect("Login.aspx",false);
        }
    }

    [WebMethod]
    public static string LoadData()
    {
        
        SqlDataAdapter da = new SqlDataAdapter("SELECT OrderID,ShipName,ShipAddress,ShipCountry FROM dbo.Orders", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return JsonConvert.SerializeObject(ds.Tables[0]);
    }


    [WebMethod]
    public int EditOrders(Orders orders)
    {

        cn.Open();
        SqlCommand command1 = cn.CreateCommand();
        command1.CommandText = "INSERT INTO dbo.Orders(ShipName, ShipAddress, ShipCountry) VALUES (@ShipName, @ShipAddress, @ShipCountry)";
        command1.Parameters.AddWithValue("@ShipName", orders.ShipName);
        command1.Parameters.AddWithValue("@ShipAddress", orders.ShipAddress);
        command1.Parameters.AddWithValue("@ShipCountry", orders.ShipCountry);

        return command1.ExecuteNonQuery();
    }

    [WebMethod]
    public static string test1()
    {
        return "skata";
    }
}