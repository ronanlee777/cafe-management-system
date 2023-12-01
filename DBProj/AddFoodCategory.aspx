<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFoodCategory.aspx.cs" Inherits="DBProj.AddFoodCategory" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Category Addition</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Updated to column layout */
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

        #leftSide {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            padding: 20px;
        }

        #rightSide {
            background-color: #f28e63;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
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

        input[type="text"],
        input[type="password"],
        input[type="email"] {
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

         #contentContainer {
            display: flex;
            height: inherit;
            flex-direction: row; /* Align children side by side */
        }

        #leftSide, #rightSide {
            flex-grow: 1; /* Allow both sides to grow equally */
            /* Other styling remains unchanged */
        }
    </style>
</head>

<body>
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
    </div>
    <div id="contentContainer">
    <div id="leftSide">
        <h1>Add Food Category</h1>
    </div>
    <div id="rightSide">
        <!-- Food Category Addition Form -->
        <form id="foodCategoryForm" class="form-container" runat="server">
            <div>
                <label for="categoryName">Food Category Name:</label>
                <input type="text" id="categoryName" runat="server" />
            </div>
            <div>
                <button type="button" id="saveButton" runat="server" onserverclick="SaveCategory_Click" onclientclick="onSaveClicked()">Save Category</button>
            </div>
        </form>
    </div>
    </div>
</body>
</html>

