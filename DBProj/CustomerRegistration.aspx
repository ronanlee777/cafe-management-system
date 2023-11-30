<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="DBProj.CustomerRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Registration</title>
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: white;
        }

        #rightSide {
            flex: 1;
            background-color: #f794c4; /* Adjusting the theme color */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #f794c4; /* Adjusting the heading color */
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
            color: #f794c4;
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
            background-color: #f794c4;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #e668a7;
        }

    </style>
</head>
<body>
      <div id="leftSide">
            <img src="images/picture.png" style="width: 40%; max-width: 250px; height: auto; margin-right: 20px;" />

        <h1>CampusBites</h1>
    </div>
    <div id="rightSide">
        <!-- Login Form -->
        <h1 style="color: aliceblue">Registeration Form</h1>
     
        <form id="customerRegistrationForm" class="form-container" runat="server">
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" runat="server" />
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" runat="server" />
            </div>
            <div>
                <button type="button" id="saveButton" runat="server" onserverclick="RegisterCustomer_Click">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
