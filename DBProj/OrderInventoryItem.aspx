<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderInventoryItem.aspx.cs" Inherits="DBProj.OrderInventoryItem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Inventory Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
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

        #contentContainer {
            display: flex;
            height: inherit;
            flex-direction: row;
        }

        #leftSide, #rightSide {
            flex-grow: 1;
            padding: 20px;
        }

        #leftSide {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
        }

        #rightSide {
            background-color: #f28e63;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #f28e63;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-bottom: 20px;
        }

        .form-container div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #f28e63;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #0056b3;
        }

        #saveButton {
            background-color: #f28e63;
            color: white;
        }

        #saveButton:hover {
            background-color: #d27657;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="menu">
            <a href="AddMenu.aspx">Add Menu Item</a>
            <a href="AddFoodCategory.aspx">Add Category</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
            <a href="OrderInventoryItem.aspx">Order Inventory Item</a>
            <a href="PaymentDetails.aspx">View Earnings</a>
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>
    <div id="contentContainer">
        <div id="leftSide">
            <h1>Order Inventory Item</h1>
        </div>
        <div id="rightSide">
            <form id="orderInventoryItemForm" class="form-container" runat="server">
                <div>
                    <label for="ddlInventoryItems">Select Item:</label>
                    <asp:DropDownList ID="ddlInventoryItems" runat="server"></asp:DropDownList>
                </div>
                <div>
                    <label for="quantityOrdered">Quantity Ordered:</label>
                    <input type="number" id="quantityOrdered" runat="server" />
                </div>
                <div>
                    <label for="price">Price:</label>
                    <input type="number" id="price" runat="server" />
                </div>
                <div>
                    <button type="button" id="saveButton" runat="server" onserverclick="OrderInventoryItem_Click">Order Item</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
