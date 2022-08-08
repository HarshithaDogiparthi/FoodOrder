<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FoodOrder.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>My ASP.NET Application</title>
    <style>
        * {
            margin-top: 0px;
            padding: 0;
            text-decoration: none;
            list-style: none;
            font-family: Montserrat;
        }

        body {
            height: auto;
            width: 100%;
        }

        nav {
            width: 100%;
            height: 100px;
            background: #127dac;
            font-family: Montserrat;
        }

        label.logo {
            font-size: 40px;
            font-weight: bold;
            color: white;
            padding: 0 100px;
            line-height: 80px;
        }
        .login {
            color: white;
            border: 1px solid white;
        }
        .login:hover {
            color: white;
        }
        .card {
            width:500px;
            box-shadow: 0 3px 10px rgba(0 0 0 / 0.2);
            padding: 10px;
            margin-left: 500px;
            margin-top: 100px;
        }
        .card input {
            margin-top: 10px;
        }
        .row {
            width: 100%;
        }
        .column {
            width: 500px;
            position: absolute;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark indigo mb-4">
        <label class="logo navbar-brand">FOODIES</label>
        <div class="items collapse navbar-collapse" id="navbarSupportedContent">
            <asp:Button CssClass="btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" PostBackUrl="~/Index.aspx" Text="Home" />
            <%
                if(Session["login"].ToString() == "true")
                { 
            %>
                    <asp:Button CssClass="btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" PostBackUrl="~/Cart.aspx" Text="My Cart" />
            <%  }
                else
                {
            %>
                    <asp:Button CssClass="login btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" PostBackUrl="~/Login.aspx" Text="Login" />
            <%  }
            %>
            
        </div>
    </nav>
        <div class="card">
            <table>
                <tr>
                    <td><label style="font-weight: bold">Email Address</label></td>
                    <td><asp:TextBox CssClass="form-control"  ID="email" runat="server" Width="260px"></asp:TextBox></td>
                </tr> 
                <tr>
                    <td><label style="font-weight: bold">Password</label></td>
                    <td><asp:TextBox CssClass="form-control" ID="pass" runat="server" Width="260px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label style="font-weight: bold">Confirm Password</label></td>
                    <td><asp:TextBox CssClass="form-control" ID="rpass" runat="server" Width="260px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button CssClass="btn mt-3 text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" OnClick="Signup_btn" Text="Signup" /></td>
                </tr>      
                <tr>
                    <td class="pt-3">Already have an account <asp:LinkButton ID="LinkButton1" PostBackUrl="~/Login.aspx" runat="server">Login here..</asp:LinkButton></td>
                    
                </tr>  
            </table>
        </div>
    </form>
</body>
</html>
