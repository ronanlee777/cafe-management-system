<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderCheckout.aspx.cs" Inherits="DBProj.OrderCheckout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Checkout</title>
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

             /* GridView Table Styling */
        .grid-view {
            margin: auto;
            width: auto;
            padding: 20px;
            border-collapse: collapse; /* Collapses border spacing */
        }

        .grid-view th {
            background-color: #f28e63; /* Header background color */
            color: white; /* Header text color */
            padding: 10px; /* Header padding */
        }

        .grid-view td {
            padding: 10px; /* Cell padding */
            border: 1px solid #ddd; /* Cell border */
        }

        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2; /* Zebra-striping for rows */
        }

        .grid-view tr:hover {
            background-color: #ddd; /* Hover effect for rows */
        }

        .search-container {
            margin-bottom: 20px;
        }

        #saveButton {
            background-color: #f28e63;
            color: white;
            margin-top:40px;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #saveButton:hover {
            background-color: #d27657;
        }

        #lblTotal {
            margin-top: 50px;
            font-size: 30px; /* Increased font size for better visibility */
            color: red; /* Set the color for better visibility, you can adjust as needed */
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="navbar">
        <div class="menu">
            <a href="AddMenuItem.aspx">Add Menu Item</a>
            <a href="AddCategory.aspx">Add Category</a>
            <a href="ManageMenu.aspx">Manage Menu</a>
        </div>
        <div class="sign-out">
            <button onclick="signOut()">Sign Out</button>
        </div>
    </div>
        <div class="centered-content">
            <h1>Order Checkout</h1>
            <h2>Welcome, <asp:Label ID="lblUsername" runat="server"></asp:Label></h2>
            <asp:GridView ID="GridViewOrderDetails" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Item" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price: $0.00"></asp:Label>
            <!-- Place Order Button -->
<asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClientClick="placeOrderAndRedirect(); return false;" />

<script type="text/javascript">
    function placeOrderAndRedirect() {
        console.log('Redirect function called'); // Debugging line
        alert('Order Placed');
        window.location.href = 'CustomerHomePage.aspx'; // Redirect to CustomerHomePage
    }
</script>

        </div>
    </form>
</body>
</html>
