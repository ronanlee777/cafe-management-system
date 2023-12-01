<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryHome.aspx.cs" Inherits="DBProj.InventoryHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #ff6a00;
            margin-top: 150px;
        }
        .navbar {
            background-color: #f28e63;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #d27657;
            color: black;
        }

        .button-container {
            margin-top: 50px;
        }

        .button-container button {
            background-color: #007bff;
            color: white;
            padding: 20px 40px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 10px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
           <a href="ManagerHome.aspx">Manager Home</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
            <a href="PaymentDetails.aspx">View Earnings</a>
             <a href="InventoryHome.aspx">Inventory</a>
             <a href="ReportsHomePage.aspx">Reports</a>  </div>

    <h1>Inventory Management</h1>

    <div class="button-container">
        <button onclick="window.location.href='ManageInventory.aspx'">Manage Inventory</button>
        <button onclick="window.location.href='OrderInventoryItem.aspx'">Order Inventory Item</button>
        <button onclick="window.location.href='ViewInventoryOrders.aspx'">View Inventory Orders</button>
        <button onclick="window.location.href='AddInventoryItem.aspx'">Add Inventory Item</button>
    </div>
</body>
</html>
