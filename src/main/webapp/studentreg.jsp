<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <script>
        function validateForm() {
            // Validate Name
            var name = document.getElementById("sname").value;
            if (name == "") {
                alert("Name must be filled out");
                return false;
            }

            // Validate Gender
            var gender = document.querySelector('input[name="sgender"]:checked');
            if (!gender) {
                alert("Please select a gender");
                return false;
            }

            // Validate Date of Birth
            var dob = document.getElementById("sdob").value;
            if (dob == "") {
                alert("Date of birth must be filled out");
                return false;
            }

            // Validate Department
            var dept = document.getElementById("sdept").value;
            if (dept == "") {
                alert("Please select a department");
                return false;
            }

            // Validate Year
            var year = document.getElementById("syear").value;
            if (year == "") {
                alert("Please select a year");
                return false;
            }

            // Validate Location
            var location = document.getElementById("slocation").value;
            if (location == "") {
                alert("Location must be filled out");
                return false;
            }

            // Validate Email
            var email = document.getElementById("semail").value;
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (email == "" || !emailPattern.test(email)) {
                alert("Please enter a valid email");
                return false;
            }

            // Validate Password
            var password = document.getElementById("spwd").value;
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;
            if (password == "" || !passwordPattern.test(password)) {
                alert("Password must be at least 6 characters long, contain at least one number and one special character");
                return false;
            }

            // Validate Contact
            var contact = document.getElementById("scontact").value;
            var contactPattern = /^[0-9]{10}$/;
            if (contact == "" || !contactPattern.test(contact)) {
                alert("Contact must be a valid 10-digit number");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <div class="form-container">
        <form method="post" action="insertstd" onsubmit="return validateForm()"> <!-- Added validation on form submit -->
            <table>
                <h3 style="text-align: center; color : red;"><u>Student Registration</u></h3>
           
                <tr>
                    <td><label for="sname">Enter Name</label></td>
                    <td><input type="text" id="sname" name="sname" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="sgender" value="MALE" required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="sgender" value="FEMALE" required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="sgender" value="OTHERS" required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="sdob">Enter Date of Birth</label></td>
                    <td><input type="date" id="sdob" name="sdob" required/></td>
                </tr>
                <tr>
                    <td><label for="sdept">Select Department</label></td>
                    <td>
                        <select id="sdept" name="sdept" required>
                            <option value="">---Select---</option>
                            <option value="COMPUTER SCIENCE">Computer Science</option>
                            <option value="ELECTRONICS">Electronics</option>
                            <option value="MECHANICAL">Mechanical</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="syear">Select Year</label></td>
                    <td>
                        <select id="syear" name="syear" required>
                            <option value="">---Select Year---</option>
                            <option value="1">First Year</option>
                            <option value="2">Second Year</option>
                            <option value="3">Third Year</option>
                            <option value="4">Final Year</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="slocation">Enter Location</label></td>
                    <td><input type="text" id="slocation" name="slocation" required/></td>
                </tr>
                <tr>
                    <td><label for="semail">Enter Email ID</label></td>
                    <td><input type="email" id="semail" name="semail" required/></td>
                </tr>
                <tr>
                    <td><label for="spwd">Enter Password</label></td>
                    <td><input type="password" id="spwd" name="spwd" required/></td>
                </tr>
                <tr>
                    <td><label for="scontact">Enter Contact</label></td>
                    <td><input type="number" id="scontact" name="scontact" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
