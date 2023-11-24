<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="DBProj.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <style>
        /* Add your CSS here */
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
            background-color: #007bff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h1 {
            color: #007bff;
        }

        #registrationForm {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        #registrationForm div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #007bff;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box; /* Makes sure padding doesn't affect overall width */
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
    </style>
</head>

<body>
    <div id="leftSide">
        <h1>Registration</h1>
    </div>
    <div id="rightSide">
        <form id="registrationForm" runat="server">
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" runat="server" />
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" runat="server" />
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" runat="server" />
            </div>
            <div>
                <button type="submit" runat="server" onserverclick="Submit_Click">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
