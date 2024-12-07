<!DOCTYPE html>
<html>
<head>
    <title>Teacher Login</title>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <div class="form-container">
        <form method="post" action="checkteacherlogin"> <!-- Updated action to checkteacherlogin -->
            <table>
                <h3 style="text-align: center;"><u>Teacher Login</u></h3>
            
                <tr>
                    <td><label for="tusername">Enter Username</label></td> <!-- Changed id/name to tusername -->
                    <td><input type="text" id="tusername" name="tusername" required/></td>
                </tr>
                <tr>
                    <td><label for="tpwd">Enter Password</label></td> <!-- Changed id/name to tpwd -->
                    <td><input type="password" id="tpwd" name="tpwd" required/></td>
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
