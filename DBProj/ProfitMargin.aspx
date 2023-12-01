<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfitMargin.aspx.cs" Inherits="DBProj.ProfitMargin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profit Margin Analysis</title>
    <style>
            body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #f28e63;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }

        .navbar .menu {
            margin-left: 20px;
        }

        .navbar .menu a {
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            display: inline-block;
        }

        .navbar .menu a:hover {
            background-color: #d27657;
            color: black;
        }

        .navbar .sign-out {
            margin-right: 20px;
        }

        .centered-content {
                       text-align: center;
            margin: 20px;
        }

        .grid-view {
            margin: auto;
            width: auto;
            padding: 20px;
            border-collapse: collapse;
        }

        .grid-view th {
            background-color: #f28e63;
            color: white;
            padding: 10px;
        }

        .grid-view td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .grid-view tr:hover {
            background-color: #ddd;
        }

        .total-profit-label-margin {
        margin-top: 40px; 
    }

        #saveButton {
            background-color: #f28e63;
            color: white;
            margin-top:40px;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #saveButton:hover {
            background-color: #d27657;
        }
    </style>
</head>
<body>
                  <div class="navbar">
        <!-- Navbar content -->
            <div class="menu">
               <a href="ManagerHome.aspx">Manager Home</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
            <a href="PaymentDetails.aspx">View Earnings</a>
             <a href="InventoryHome.aspx">Inventory</a>
             <a href="ReportsHomePage.aspx">Reports</a>

        </div>
         <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>
    <form runat="server">
         <div class="centered-content">
            <h1>Total Profits</h1>

<asp:GridView ID="GridViewProfitMargins" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
             <Columns>
                <asp:BoundField DataField="ItemId" HeaderText="Item ID" />
                <asp:BoundField DataField="MenuItem" HeaderText="Menu Item" />
                <asp:BoundField DataField="TotalSalesRevenue" HeaderText="Total Sales Revenue" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalInventoryCost" HeaderText="Total Inventory Cost" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalProfit" HeaderText="Total Profit" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
            <br > </br>
<asp:Label ID="lblTotalProfit" runat="server" CssClass="total-profit-label" style="margin-top: 100px;"></asp:Label>

        </div>
    </form>
</body>
</html>
