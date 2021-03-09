<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CURD_DB.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 597px;
            height: 432px;
            border: 2px solid #1e1e1e;
            margin-left:50px;
            margin-top:60px;
        }

        .auto-style3 {
            width: 123px;
            text-align: center;
        }

        .auto-style11 {
            text-align: center;
            width: 266px;
        }

        #GridView1 {
            float: right;
            margin-top: -420px;
            margin-right: 160px;
        }
        h1 {
            font-family:Berlin Sans FB Demi;
            text-shadow: 2px 2px #778899;
            margin-top: 50px;
        }
        table {
            box-shadow: 4px 4px rgb(62, 58, 58);
           
        }
        body {
           background-color: #f3f4f7;
background-image: linear-gradient(315deg, #f3f4f7 0%, #caccd1 74%);

        }
        #btnView, #btnInsert, #btnUpdate, #btnDelete{
            background-color:#669999;
            color:#1e1e1e;
        }
        #btnView:hover, #btnInsert:hover, #btnUpdate:hover, #btnDelete:hover {
            background-color:#1e1e1e;
            color:#669999;
            text-shadow: 1px 1px rgb(193, 184, 184);
        }
        .auto-style12 {
            width: 123px;
            text-align: center;
            height: 99px;
        }
        .auto-style13 {
            height: 99px;
        }
        .auto-style14 {
            text-align: center;
            width: 266px;
            height: 99px;
        }
        .auto-style15 {
            width: 123px;
            height: 60px;
            text-align: center;
        }
        .auto-style16 {
            height: 60px;
        }
        .auto-style17 {
            height: 60px;
            width: 266px;
            text-align: center;
        }
        .auto-style18 {
            width: 123px;
            text-align: center;
            height: 88px;
        }
        .auto-style19 {
            height: 88px;
        }
        .auto-style20 {
            text-align: center;
            width: 266px;
            height: 88px;
        }
        .auto-style21 {
            width: 123px;
            height: 63px;
            text-align: center;
        }
        .auto-style22 {
            height: 63px;
        }
        .auto-style23 {
            height: 63px;
            width: 266px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h1 style="font-family: 'Berlin Sans FB Demi'; letter-spacing: 3px; text-align: center;">CURD OPERATION IN ASP.NET</h1>

        </div>
        <div>
        <table cellspacing="4" class="auto-style1" style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif; font-size: 19px; font-weight: bolder; color: #1e1e1e">
            <tr>
                <td class="auto-style15">ID</td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtId" runat="server" Height="24px" Style="margin-right: 18px" TextMode="Number" Width="192px" Font-Names="Trebuchet MS" ForeColor="#1E1E1E"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Button ID="btnView" runat="server" Height="39px" Style="text-align: center" Text="VIEW" Width="128px" OnClick="btnView_Click"  Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">NAME</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtName" runat="server" Height="24px" Style="margin-right: 18px" Width="192px" Font-Names="Trebuchet MS" ForeColor="#1E1E1E"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Button ID="btnInsert" runat="server" Height="39px" Style="text-align: center" Text="INSERT" Width="128px" OnClick="btnInsert_Click"  Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">GENDER</td>
                <td class="auto-style13">
                    <asp:RadioButtonList ID="rblGender" runat="server" Height="24px" RepeatDirection="Horizontal" Width="192px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style14">
                    <asp:Button ID="btnUpdate" runat="server" Height="39px" Style="text-align: center" Text="UPDATE" Width="128px" OnClick="btnUpdate_Click"  Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td class="auto-style18">AGE</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtAge" runat="server" Height="24px" Style="margin-right: 18px" TextMode="Number" Width="192px" Font-Names="Trebuchet MS" ForeColor="#1E1E1E"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    <asp:Button ID="btnDelete" runat="server" Height="39px" Style="text-align: center" Text="DELETE" Width="128px" OnClick="btnDelete_Click"  Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td class="auto-style21">EMAIL-ID</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtEmail" runat="server" Height="24px" Style="margin-right: 18px" Width="192px" Font-Names="Trebuchet MS" ForeColor="#1E1E1E"></asp:TextBox>
                </td>
                <td class="auto-style23"></td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderStyle="Inset" BorderWidth="3px" CellPadding="2" ForeColor="Black" GridLines="None" Height="270px" Width="633px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
            </div>
    </form>
</body>
</html>
