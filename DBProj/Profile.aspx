<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DBProj.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
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

        /* GridView styling */
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

           .user-profile {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .user-profile p {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .user-profile label {
            font-weight: bold;
            color: #0066cc;
            margin-left: 5px;
        }

    </style>
</head>
<body>
    <form runat="server">
             <div class="navbar">
        <div class="menu">
            <a href="CustomerHomePage.aspx">Home</a>
        <a href="PlaceOrders.aspx">Place Order</a>
        <a href="MyOrders.aspx">My Orders</a>
        <a href="Profile.aspx">Profile</a>
        
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>
         <div class="centered-content">
            <h1 style="margin-bottom: 100px; margin-top: 20px">User Profile</h1>
             <div class="user-profile">
        <p>User ID: <asp:Label ID="lblUserId" runat="server"></asp:Label></p>
        <p>Username: <asp:Label ID="lblUsername" runat="server"></asp:Label></p>
        <p>Password: <asp:Label ID="lblPassword" runat="server"></asp:Label></p>
        <p>Loyalty Points: <asp:Label ID="lblLoyaltyPoints" runat="server"></asp:Label></p>
    </div>
        </div>
    </form>
</body>
</html>
