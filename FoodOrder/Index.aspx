<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FoodOrder.WebForm1" %>

<!DOCTYPE html>
<html>
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
        .home {
            color: white;
            border: 1px solid white;
        }
        .home:hover {
            color: white;
        }
        .cards {
            margin-top: 20px;
            border-radius: 10px;
            width: 250px;   
            box-shadow: 0 0 10px gray;
        }
        .row {
            width: 100%;
        }
        .column {
            width: 400px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-auto-rows: auto;
            grid-gap: 1rem;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark indigo mb-4">
        <label class="logo navbar-brand">FOODIES</label>
        <div class="items collapse navbar-collapse" id="navbarSupportedContent">
            <div class="md-form my-0">
                <asp:TextBox ID="search" class="form-control"  placeholder="Search" aria-label="Search" runat="server" Width="260px"></asp:TextBox>
            </div>
            <button class="btn text-white btn-outline-white btn-md my-0 ml-sm-2" onclick="Search_click" type="submit">Search</button>
            <button href="#" class="btn home btn-outline-white btn-md my-0 ml-sm-2" type="submit">Home</button>
            <%
                if(Session["login"].ToString() == "true")
                { 
            %>
                    <asp:Button CssClass="btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" PostBackUrl="~/Cart.aspx" Text="My Cart" />
                    <asp:Button CssClass="login btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" OnClick="Logout" PostBackUrl="~/Index.aspx" Text="Logout" />
            <%  }
                else
                {
            %>
                    <asp:Button CssClass="btn bg-transparent text-white btn-outline-white btn-md my-0 ml-sm-2" runat="server" BackColor="#0099FF" PostBackUrl="~/Login.aspx" Text="Login" />
            <%  }
            %>
            
        </div>
    </nav>
    <div class="grid row">
        <div class="column" style="margin-left: 220px;>
            <asp:DataList ID="DataList1" runat="server" RepeatColumn="3" CellPadding="2">
                <ItemTemplate>
                    <div class="cards card">
                        <img class="card-image-top" src="<%#Eval("ProductImage") %>" alt="Card image cap" style="border-top-left-radius: 10px;border-top-right-radius: 10px; height: 150px">
                          <div class="card-body">
                            <h5 class="card-title"><%#Eval("ProductName") %></h5>
                            <p class="card-tex">Price: Rs.<%#Eval("ProductPrice") %></p>
                            <button class="btn btn-primary" OnClick="btn_click">Add to Cart</button>
                          </div>
                    </div>
                </ItemTemplate>       
            </asp:DataList>
        </div>
    </div>
    </form>
</body>
</html>
