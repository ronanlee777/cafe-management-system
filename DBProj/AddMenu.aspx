<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMenu.aspx.cs" Inherits="DBProj.AddMenu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        #leftSide {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
        }

        #rightSide {
            flex: 1;
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
    </style>
</head>


    <script type="text/javascript">
    function onSaveClicked() {
        // Clear the form fields here if needed
        alert('Category Added');
    }
    </script>
<body>
     <div id="leftSide">
        <h1>Add Menu Item</h1>
    </div>
    <div id="rightSide">
        <!-- Menu Item Addition Form -->
        <form id="menuItemForm" class="form-container" runat="server">
            <div>
                <label for="ddlCategories">Category:</label>
                <asp:DropDownList ID="ddlCategories" runat="server"></asp:DropDownList>
            </div>
            <div>
                <label for="itemName">Item Name:</label>
                <input type="text" id="itemName" runat="server" />
            </div>
            <div>
                <label for="itemDescription">Description:</label>
                <input type="text" id="itemDescription" runat="server" />
            </div>
            <div>
                <label for="itemPrice">Price:</label>
                <input type="text" id="itemPrice" runat="server" />
            </div>
            <div>
                <label for="itemNutritionalInfo">Nutritional Info:</label>
                <input type="text" id="itemNutritionalInfo" runat="server" />
            </div>
            <div>
                <button type="button" id="saveButton" runat="server" onserverclick="SaveMenuItem_Click">Save Menu Item</button>
            </div>
        </form>
    </div>
</body>
</html>

