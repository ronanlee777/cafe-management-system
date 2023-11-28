<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrders.aspx.cs" Inherits="DBProj.PlaceOrders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
    <!-- Include your existing styles here -->
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
            <h1>Place Your Order</h1>
              <div class="search-container">
                <input type="text" id="txtSearch" onkeyup="searchItems()" placeholder="Search for items..." />
            </div>
            <asp:GridView ID="GridViewMenuItems" runat="server" CssClass="grid-view" AutoGenerateColumns="False" OnRowCommand="GridViewMenuItems_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Item" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenItemId" runat="server" Value='<%# Eval("ItemId") %>' />

                            <asp:TextBox ID="txtQuantity" runat="server" Text="0" Width="40" />
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="AddToOrder" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="RemoveFromOrder" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblTotal" runat="server" Text="Total: 0.00"></asp:Label>
            <asp:HiddenField ID="hiddenTotal" runat="server" Value="0" />
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />

        </div>
    </form>
     <!-- JavaScript for search functionality -->
        <script type="text/javascript">
            function searchItems() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("txtSearch");
                filter = input.value.toUpperCase();
                table = document.getElementById("<%=GridViewMenuItems.ClientID %>");
                tr = table.getElementsByTagName("tr");

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0]; // Assumes Name is the first column
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
</body>
</html>
