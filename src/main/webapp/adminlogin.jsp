<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    
    <div class="form-container">
        <form method="post" action="checkadminlogin"> <!-- Action points to the admin login handler -->
            <table>
            <h3 style="text-align: center;"><u>Admin Login</u></h3>
                <tr>
                    <td><label for="ausername">Enter Username</label></td>
                    <td><input type="text" id="ausername" name="ausername" required/></td>
                </tr>
                <tr>
                    <td><label for="apwd">Enter Password</label></td>
                    <td><input type="password" id="apwd" name="apwd" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
