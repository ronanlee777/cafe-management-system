<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsHomePage.aspx.cs" Inherits="DBProj.ReportsHomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports Home</title>
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
            margin-top: 50px;
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
            margin-top: 30px;
        }

        .button-container button {
            background-color: #007bff;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
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

    <h1>Reports Dashboard</h1>

    <div class="button-container">
        <button onclick="window.location.href='PaymentDetails.aspx'">Payment Details</button>
        <button onclick="window.location.href='MostSellingCategory.aspx'">Most Selling Category</button>
        <button onclick="window.location.href='MostSellingItems.aspx'">Most Selling Items</button>
        <button onclick="window.location.href='CustomerOrderDetails.aspx'">Customer Order Details</button>
        <button onclick="window.location.href='CustomerReviews.aspx'">Customer Reviews</button>
        <button onclick="window.location.href='ProfitMargin.aspx'">Profit Margin Analysis</button>
    </div>
</body>
</html>
