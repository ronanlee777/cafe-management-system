<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReviews.aspx.cs" Inherits="DBProj.CustomerReviews" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Reviews</title>
    <style>
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

        .button-container {
            text-align: center;
            margin: 20px 0;
        }

        .button-container button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }

        .centered-content {
            text-align: center;
            margin-top: 20px;
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
        
            <!-- Navbar content -->
        </div>
    </div>
    
    <form runat="server">
            <div class="centered-content">
         <h1>Customer Reviews</h1>
        <div class="button-container">
     <asp:Button ID="btnSortAsc" runat="server" Text="Sort Ascending" OnClick="btnSortAsc_Click" style="background-color: blue; color: white; padding: 10px 20px; border: none; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;" />
<asp:Button ID="btnSortDesc" runat="server" Text="Sort Descending" OnClick="btnSortDesc_Click" style="background-color: blue; color: white; padding: 10px 20px; border: none; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;" />
</div>
    
         

            <asp:GridView ID="GridViewCustomerReviews" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                    <asp:BoundField DataField="CustomerRating" HeaderText="Rating" />
                    <asp:BoundField DataField="Comments" HeaderText="Comments" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
