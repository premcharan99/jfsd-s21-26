<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
  
    <h4>
        <c:out value="${message}"></c:out>
    </h4>
  
    <div class="form-container">
        <form method="post" action="checkstdlogin">
            <table>
            
    <h3><u>Student Login</u></h3>
                <tr>
                    <td><label for="semail">Enter Email ID</label></td>
                    <td><input type="email" id="semail" name="semail" required/></td>
                </tr>
                <tr>
                    <td><label for="spwd">Enter Password</label></td>
                    <td><input type="password" id="spwd" name="spwd" required/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
