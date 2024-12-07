<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Status</title>
    <style>
        /* Search Bar Styling (Positioning it in the top-right corner) */
        .search-bar {
            position: fixed;
            top: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            z-index: 1000; /* Ensure it's on top of other content */
        }

        .search-bar input {
            padding: 8px 12px;
            font-size: 16px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-bar button {
            padding: 8px 12px;
            background-color: #00bcd4;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            font-weight: bold;
        }

        .search-bar button:hover {
            background-color: #007c8c;
        }

        /* Table Styling */
        .glass-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #f8f8f8;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .glass-table th, .glass-table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .glass-table th {
            background-color: #444;
            color: white;
        }

        .status-button {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            margin-right: 5px;
        }

        .status-button:hover {
            background-color: darkred;
        }
    </style>
    <script>
        // Function to filter students based on search input
        function searchStudent() {
            let searchInput = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll(".student-row");
            
            rows.forEach(row => {
                let studentName = row.querySelector(".student-name").innerText.toLowerCase();
                let studentId = row.querySelector(".student-id").innerText.toLowerCase();
                if (studentName.includes(searchInput) || studentId.includes(searchInput)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
</head>
<body>
    <%@ include file="teachernavbar.jsp" %>

    <!-- Search Bar Section -->
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search by ID or Name..." oninput="searchStudent()">
        <button onclick="searchStudent()">Search</button>
    </div>

    <!-- Student Table Section -->
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
            <tr class="student-row">
                <td class="student-id"><c:out value="${std.id}"/></td>
                <td class="student-name"><c:out value="${std.name}"/></td>
                <td><c:out value="${std.gender}"/></td>
                <td><c:out value="${std.dateofbirth}"/></td>
                <td><c:out value="${std.department}"/></td>
                <td><c:out value="${std.year}"/></td>
                <td><c:out value="${std.location}"/></td>
                <td><c:out value="${std.email}"/></td>
                <td><c:out value="${std.contact}"/></td>
                <td><c:out value="${std.status}"/></td>
                <td>
                    <a href='<c:url value="updatestatus?id=${std.id}&status=Accepted"></c:url>' class="status-button">Accept</a>
                    <a href='<c:url value="updatestatus?id=${std.id}&status=Rejected"></c:url>' class="status-button">Reject</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
