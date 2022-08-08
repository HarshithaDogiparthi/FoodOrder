<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="FoodOrder.AddProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 286px;
        }
        .auto-style3 {
            width: 151px;
        }
        .auto-style7 {
            width: 241px;
            height: 40px;
            margin-left: 440px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style7">Add Products</h1>
            <br />

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">ProductName</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">ProductImage</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="260px"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">ProductPrice</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td> 
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" BackColor="#0099FF" OnClick="Button1_Click" Text="Insert" Width="101px" />
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="TextBox3" runat="server" Width="260px"></asp:TextBox>
        </div>
        <asp:Image ID="Image1" runat="server" ImageUrl="Images/dosa.jpeg" ></asp:Image>
    </form>
</body>
</html>
