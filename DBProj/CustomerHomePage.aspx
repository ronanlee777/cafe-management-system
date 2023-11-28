<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerHomePage.aspx.cs" Inherits="DBProj.CustomerHomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Home</title>
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
            background-color: #f28e63; /* Updated color for consistency */
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
            background-color: #d27657; /* Updated hover color for consistency */
            color: black;
        }

        .button-container {
            margin-top: 50px;
        }

        .button-container button {
            background-color: #007bff; /* Updated button color for consistency */
            color: white;
            padding: 20px 40px; /* Increased padding for bigger buttons */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px; /* Increased font size for bigger buttons */
            margin: 10px; /* Added margin for better spacing */
            cursor: pointer;
            border: none; /* Removed border for a cleaner look */
            border-radius: 5px; /* Added border-radius for rounded corners */
        }

        .button-container button:hover {
            background-color: #0056b3; /* Updated hover color for consistency */
        }
    </style>
</head>
<body>
     <div class="navbar">
        <div class="menu">
           <a href="CustomerHomePage.aspx">Home</a>
        <a href="PlaceOrders.aspx">Place Order</a>
        <a href="MyOrders.aspx">My Orders</a>
        <a href="Profile.aspx">Profile</a>
        <a href="RateService.aspx">Rate Service</a>
        
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>

    <h1>Welcome <asp:Label ID="lblCustomerName" runat="server"></asp:Label></h1>

    <div class="button-container">

        <button onclick="window.location.href='PlaceOrders.aspx'">Place Order</button>
        <button onclick="window.location.href='MyOrders.aspx'">My Orders</button>
        <button onclick="window.location.href='Profile.aspx'">Profile</button>
    </div>
</body>
</html>
