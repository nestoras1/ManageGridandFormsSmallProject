<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <%--<div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>--%>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <%--<input id="login-username" type="text" class="form-control" name="username" value="" placeholder="Username">  --%> 
                                        <asp:TextBox ID="text_username" class="form-control" runat="server" placeholder="Username"></asp:TextBox>

                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <%--<input id="login-password" type="password" class="form-control" name="password" placeholder="Password">--%>
                                        <asp:TextBox ID="text_password" class="form-control"  runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    </div>
                                    
                            <%--<div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>--%>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">

                                      <asp:Button ID="bt_login" CssClass="btn btn-success" runat="server" Text="Login" OnClick="bt_login_Click" />
                                      <%--<a id="btn-login" href="#" class="btn btn-success">Login  </a>--%>
                                        <asp:Label ID="label_wrong_user_pass" runat="server" Text=""  Font-Size="16" ForeColor="Red"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%; margin-top:10px;" >
                                            Don't have an account! 
                                        <a href="Register.aspx">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     

                        </div>                     
                    </div>  
        </div>
        
    </div>
    



    </form>
</body>
</html>
