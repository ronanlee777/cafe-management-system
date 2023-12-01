<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerOrderDetails.aspx.cs" Inherits="DBProj.CustomerOrderDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Order Details</title>
    <!-- Existing styles here -->
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
            <h1>Customer Order Details</h1>
            <asp:GridView ID="GridViewOrders" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                    <asp:BoundField DataField="Username" HeaderText="Customer Name" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="MenuItem" HeaderText="Item" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="TotalItemCost" HeaderText="Total Item Cost" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Order Amount" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
