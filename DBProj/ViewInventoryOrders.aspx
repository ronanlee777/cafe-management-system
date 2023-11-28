<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInventoryOrders.aspx.cs" Inherits="DBProj.ViewInventoryOrders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Inventory Orders</title>
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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="menu">
            <a href="AddMenu.aspx">Add Menu Item</a>
            <a href="AddFoodCategory.aspx">Add Category</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
            <a href="ViewInventoryOrders.aspx">View Inventory Orders</a>
            <a href="PaymentDetails.aspx">View Earnings</a>
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>

    <div class="centered-content">
        <h1>Inventory Orders</h1>

        <form id="form1" runat="server">
            <asp:GridView ID="GridViewInventoryOrders" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" />
                    <asp:BoundField DataField="ItemID" HeaderText="Item ID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Item Name" ReadOnly="True" />
                    <asp:BoundField DataField="QuantityOrdered" HeaderText="Quantity Ordered" ReadOnly="True" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
