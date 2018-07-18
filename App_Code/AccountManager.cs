using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for AccountManager
/// </summary>
public class AccountManager
{
    public static string cs = ConfigurationManager.ConnectionStrings["NWConnectionString"].ConnectionString;
    public static String regerror_message = "";
    public AccountManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static Boolean IsUsernameValid(string username)
    {
        return Regex.IsMatch(username, @"^(?=.{5,15})");
    }

    public static Boolean IsPassValid(string Passwd)
    {
        return Regex.IsMatch(Passwd, @"^(?=.*[a-z])(?=.*\d).{8,15}$");
    }

    public static string encryption(String password)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        byte[] encrypt;
        UTF8Encoding encode = new UTF8Encoding();
        //encrypt the given password string into Encrypted data  
        encrypt = md5.ComputeHash(encode.GetBytes(password));
        StringBuilder encryptdata = new StringBuilder();
        //Create a new string by using the encrypted data  
        for (int i = 0; i < encrypt.Length; i++)
        {
            encryptdata.Append(encrypt[i].ToString());
        }
        return encryptdata.ToString();
    }

    public static void registerAccount(String username, String pass, String pass2)
    {
        if (IsUsernameValid(username))
        {
            if (IsPassValid(pass))
            {
                if ((pass == pass2))
                {
                    SqlConnection con = new SqlConnection(cs);
                    try
                    {
                        
                        //Get the encrypt the password by using the class  
                        string password = encryption(pass);

                    //Check whether the UseName and password are Empty  
                    if (username.Length > 0 && password.Length > 0)
                    {
                        //creating the connection string              
                        
                        String passwords = encryption(pass);
                        con.Open();
                        // Check whether the Username Found in the Existing DB  
                        String search = "SELECT * FROM dbo.accounts WHERE ([user] = '" + username + "');";
                        SqlCommand cmds = new SqlCommand(search, con);
                        SqlDataReader sqldrs = cmds.ExecuteReader();
                            if (sqldrs.Read())
                        {
                            String passed = (string)sqldrs["Password"];
                            setregerror_message("Username Already Taken");
                        }
                        else
                        {
                                con.Close();
                            try
                            {
                                    con.Open();
                                    SqlCommand command1 = con.CreateCommand();
                                    command1.CommandText = "INSERT INTO dbo.accounts([user], pass) VALUES (@username, @password)";
                                    command1.Parameters.AddWithValue("@username", username);
                                    command1.Parameters.AddWithValue("@password", passwords);
                                    command1.ExecuteNonQuery();
                                setregerror_message("");
                                //Response.Redirect("Default.aspx");
                            }
                            catch (Exception ex)
                            {
                                setregerror_message(ex.ToString());
                            }
                            con.Close();
                        }
                    }

                    else
                    {
                        String Message = "Username or Password is empty";
                        setregerror_message(Message.ToString());
                    }
                    
                    }
                    catch
                    {
                        con.Close();
                        setregerror_message("Invalid username or password");
                    }

                }
                else
                {
                    setregerror_message("Passwords are not the same!");
                }
            }
            else
            {
                setregerror_message("Password must contain at least 8-15 character, one uppercase and one number");
            }
        }
        else
        {
            setregerror_message("Username must contain at least 5-15 character");
        }
    }

    public static void setregerror_message(String regerror_message1)
    {
        regerror_message = regerror_message1;
    }

    public static string returnregerror()
    {
        return regerror_message;
    }


}