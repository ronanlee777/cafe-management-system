<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostSellingCategory.aspx.cs" Inherits="DBProj.MostSellingCategory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Selling Categories</title>
    <style>
        /* Styles similar to your existing pages */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .grid-view {
            margin: auto;
            width: 80%;
            padding: 20px;
            border-collapse: collapse;
        }

        .grid-view th, .grid-view td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .grid-view th {
            background-color: #f28e63;
            color: white;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2;
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
            margin-top: 20px;
        }
    </style>
</head>
<body>
     <form runat="server">
        <div class="navbar">
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
            <!-- Navbar content -->
        </div>
    <div class="centered-content">
        <h1>Top Selling Categories Based on Revenue</h1>
        <asp:GridView ID="GridViewTopSellingCategories" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Total Revenue" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </div>
         </form>
</body>
</html>
