<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RateService.aspx.cs" Inherits="DBProj.RateService" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rate Our Service</title>
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
            margin: 20px;
        }

        label {
            font-weight: bold;
            color: #0066cc;
            margin-right: 10px;
        }

        .user-inputs p {
            margin-bottom: 20px;
        }

        .user-inputs textarea, .user-inputs select {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
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

            <!-- Add other navigation links as needed -->
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>

    <div class="centered-content">
        <h1>Rate Our Service</h1>
        <div class="user-inputs">
            <form id="formRateService" runat="server">
                <p>
                    <label for="ddlRating">Rating (1-5):</label>
                    <asp:DropDownList ID="ddlRating" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <label for="txtComments">Comments:</label><br />
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SubmitRating" />
                </p>
            </form>
        </div>
    </div>
</body>
</html>
