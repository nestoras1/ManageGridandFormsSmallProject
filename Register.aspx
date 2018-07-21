<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

    <div class="container"> 
        <div id="loginform" class="form-horizontal" role="form"></div>
            <div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="Login.aspx">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <div id="signupform" class="form-horizontal" role="form">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Username</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="regusertb" class="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                        <%--<input type="text" class="form-control" name="email" placeholder="Email Address">--%>
                                    </div>
                                </div>
                                    
                                <%--<div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Last Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lastname" placeholder="Last Name">
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <%--<input type="password" class="form-control" name="passwd" placeholder="Password">--%>
                                        <asp:TextBox ID="regpasstb" class="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Confim Password</label>
                                    <div class="col-md-9">
                                        <%--<input type="password" class="form-control" name="passwd" placeholder="Password">--%>
                                        <asp:TextBox ID="regpass2tb" class="form-control" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label for="icode" class="col-md-3 control-label">Invitation Code</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="icode" placeholder="">
                                    </div>
                                </div>--%>

                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <%--<button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>--%>
                                        <asp:Button ID="bt_register" class="btn btn-info" runat="server" Text="Create" OnClick="bt_register_Click"/>
                                        <asp:Label ID="regerror_message_lb" runat="server" Text="" Font-Size="15" ForeColor="Red"></asp:Label> 
                                    </div>
                                </div>
                                
                                <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">
                                    
                                    <%--<div class="col-md-offset-3 col-md-9">
                                        <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button>
                                    </div> --%>                                          
                                        
                                </div>
                                
                                
                                
                            </div>
                         </div>
                    </div>

               
               
                
         </div> 
       </div> 

    </form>
</body>
</html>
