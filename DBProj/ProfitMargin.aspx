<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfitMargin.aspx.cs" Inherits="DBProj.ProfitMargin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profit Margin Analysis</title>
    <!-- Add any required CSS styling here -->
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

        .navbar button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .navbar button:hover {
            background-color: #0056b3;
        }

        .centered-content {
            text-align: center;
            margin: 20px;
        }

             /* GridView Table Styling */
        .grid-view {
            margin: auto;
            width: auto;
            padding: 20px;
            border-collapse: collapse; /* Collapses border spacing */
        }

        .grid-view th {
            background-color: #f28e63; /* Header background color */
            color: white; /* Header text color */
            padding: 10px; /* Header padding */
        }

        .grid-view td {
            padding: 10px; /* Cell padding */
            border: 1px solid #ddd; /* Cell border */
        }

        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2; /* Zebra-striping for rows */
        }

        .grid-view tr:hover {
            background-color: #ddd; /* Hover effect for rows */
        }

        .search-container {
            margin-bottom: 20px;
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
            <a href="AddMenu.aspx">Add Menu Item</a>
            <a href="AddFoodCategory.aspx">Add Category</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
            <a href="PaymentDetails.aspx">View Earnings</a>
             <a href="InventoryHome.aspx">Inventory Home</a>
            <a href="ReportsHomePage.aspx">Reports Home</a>

        </div>
         <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>
    <form runat="server">
         <div class="centered-content">
            <h1>Total Profits</h1>

        <asp:GridView ID="GridViewProfitMargins" runat="server" AutoGenerateColumns="False">
             <Columns>
                <asp:BoundField DataField="ItemId" HeaderText="Item ID" />
                <asp:BoundField DataField="MenuItem" HeaderText="Menu Item" />
                <asp:BoundField DataField="TotalSalesRevenue" HeaderText="Total Sales Revenue" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalInventoryCost" HeaderText="Total Inventory Cost" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalProfit" HeaderText="Total Profit" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
          <asp:Label ID="lblTotalProfit" runat="server" CssClass="total-profit-label"></asp:Label>

        </div>
    </form>
</body>
</html>
