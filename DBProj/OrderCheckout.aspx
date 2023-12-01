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
            background-color: #f05656;
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
            background-color: #f05656;/* Header background color */
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

  
     .custom-button {
        background-color: #f05656;
        color: white;
        border-radius: 10px;
        padding: 10px 20px;
        font-size: 16px;
        transition: background-color 0.3s ease; 

       
    }

    .custom-button:hover {
        background-color: #d43f3f; 
       
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
        <a href="RateService.aspx">Rate Service</a>
        
        </div>
        <div class="sign-out">
            <a href="LoginPage.aspx" style="float:right; background-color: red; padding: 10px 15px; border-radius: 4px; color: white; text-decoration: none;">Sign Out</a>
        </div>
    </div>
        <div class="centered-content">
            <h1>Order Checkout</h1>
            <h2> <asp:Label ID="lblUsername" runat="server"></asp:Label></h2>
            <asp:GridView ID="GridViewOrderDetails" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Item" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price: $0.00"></asp:Label>
            <br />
            <!-- Place Order Button -->
<asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClientClick="placeOrderAndRedirect(); return false;" CssClass="custom-button" />

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
