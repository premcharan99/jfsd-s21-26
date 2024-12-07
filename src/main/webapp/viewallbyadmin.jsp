<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Students</title>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
     <!-- Search Bar Section -->
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search by ID or Name..." oninput="searchStudent()">
        <button onclick="searchStudent()">Search</button>
    </div>
    
    Total Students: <c:out value="${count}"></c:out>
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
                
            </tr>
        </c:forEach>
    </table>
</body>
</html>
