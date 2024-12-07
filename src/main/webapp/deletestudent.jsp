<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <style>
        .delete-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            margin-right: 5px; /* Space between buttons */
        }

        .delete-button:hover {
            background-color: darkred; /* Darker shade on hover */
        }
    </style>
    <script>
        function confirmDelete(studentName) {
            const message = `Are you sure you want to delete the student: ${studentName}?`;
            if (confirm(message)) {
                alert(`Student: ${studentName} has been deleted.`);
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
    <%@include file="teachernavbar.jsp" %>
     <!-- Search Bar Section -->
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search by ID or Name..." oninput="searchStudent()">
        <button onclick="searchStudent()">Search</button>
    </div>
  
    <table class="glass-table">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>GENDER</th>
            <th>DATE OF BIRTH</th>
            <th>DEPARTMENT</th>
            <th>YEAR</th>
            <th>LOCATION</th>
            <th>EMAIL</th>
            <th>CONTACT</th>
            <th>STATUS</th>
            <th>ACTION</th>
        </tr>
        <c:forEach items="${studentList}" var="std">
            <tr>
                <td><c:out value="${std.id}"/></td>
                <td><c:out value="${std.name}"/></td>
                <td><c:out value="${std.gender}"/></td>
                <td><c:out value="${std.dateofbirth}"/></td>
                <td><c:out value="${std.department}"/></td>
                <td><c:out value="${std.year}"/></td>
                <td><c:out value="${std.location}"/></td>
                <td><c:out value="${std.email}"/></td>
                <td><c:out value="${std.contact}"/></td>
                <td><c:out value="${std.status}"/></td>
                <td>
                    <a href='<c:url value="delete?id=${std.id}"/>' 
                       class="delete-button" 
                       onclick="return confirmDelete('${std.name}');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
