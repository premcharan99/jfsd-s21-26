 <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(to bottom right, #111111, #444444);
            color: white;
            height: 100vh;
            display: flex;
        }

        /* Left Vertical Navbar */
        .navbar {
            width: 200px;
            height: 100vh;
            background: rgba(255, 255, 255, 0.1);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.5);
        }

        .navbar a {
            text-decoration: none;
            color: white;
            margin: 15px 0;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #00bcd4;
        }

        /* Top Banner */
        .banner {
            flex: 1;
            height: 150px;
            background: rgba(255, 255, 255, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .banner .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid rgba(255, 255, 255, 0.5);
            margin-right: 20px;
        }

        .banner .profile-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .banner .profile-details {
            flex: 1;
        }

        .banner .profile-details h1 {
            margin: 0;
            font-size: 24px;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
        }

        /* Dashboard Container */
        .dashboard-container {
            flex: 4;
            padding: 20px;
        }

        .dashboard-container h2 {
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .card {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card-item {
            width: 250px;
            height: 150px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 10px;
            color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card-item:hover {
            transform: translateY(-10px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.7);
        }

        .card-item h3 {
            margin-bottom: 10px;
            font-size: 1.5em;
        }

        .card-item p {
            font-size: 1em;
        }

        /* Search Bar */
        .search-bar {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            padding: 10px;
            display: flex;
            align-items: center;
            transition: transform 0.3s ease-in-out;
        }

        .search-bar input {
            border: none;
            padding: 8px 12px;
            background: transparent;
            color: white;
            font-size: 14px;
            outline: none;
            width: 200px;
            transition: width 0.3s ease-in-out;
        }

        .search-bar input:focus {
            width: 250px;
        }

        .search-bar button {
            border: none;
            background: #00bcd4;
            color: white;
            padding: 8px 12px;
            cursor: pointer;
            margin-left: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #007c8c;
        }

        /* Table Styling */
        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            animation: fadeIn 1s ease;
        }

        .student-table th, .student-table td {
            padding: 12px;
            text-align: center;
            color: #ffffff;
        }

        .student-table th {
            background-color: #444444;
        }

        .student-table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .student-table tr:hover {
            background-color: rgba(0, 188, 212, 0.3);
        }

        /* Loading Animation */
        .loading {
            color: #00bcd4;
            font-size: 18px;
            font-weight: bold;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
            100% {
                opacity: 1;
            }
        }

        .error {
            color: red;
        }

    </style>
    <script>
        // Function to show student details
        function showStudentDetails(studentId) {
            document.getElementById("studentDetails").innerHTML = "<p class='loading'>Loading student details...</p>";
            fetch('getStudentDetails?id=' + studentId)
                .then(response => response.text())
                .then(data => {
                    document.getElementById("studentDetails").innerHTML = data;
                })
                .catch(error => {
                    console.error('Error fetching student details:', error);
                    document.getElementById("studentDetails").innerHTML = "<p class='error'>Error loading student details.</p>";
                });
        }

        // Function to handle search
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

    <div class="content">
        <!-- Top Banner -->
        <div class="banner">
            <div class="profile-img">
                <img src="images/teacher.png" alt="Teacher Profile">
            </div>
            <div class="profile-details">
                <h1>Welcome, Teacher!</h1>
            </div>
        </div>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search by ID or Name..." oninput="searchStudent()">
            <button onclick="searchStudent()">Search</button>
        </div>

        <!-- Dashboard Container -->
        <div class="dashboard-container">
            <h2>Teacher Dashboard</h2>
            <div class="card">
                <div class="card-item">
                    <h3>Student List</h3>
                    <p>View and manage students</p>
                </div>
                <div class="card-item">
                    <h3>Courses</h3>
                    <p>Manage your courses</p>
                </div>
                <div class="card-item">
                    <h3>Exams</h3>
                    <p>Create and manage exams</p>
                </div>
                <div class="card-item">
                    <h3>Reports</h3>
                    <p>View reports and analytics</p>
                </div>
            </div>

            <!-- Student Table Section -->
            <div class="student-table">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${studentList}" var="std">
                            <tr class="student-row">
                                <td class="student-id"><c:out value="${std.id}"/></td>
                                <td class="student-name"><c:out value="${std.name}"/></td>
                                <td>
                                    <button class="view-button" onclick="showStudentDetails('${std.id}')">View</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Student Details Section -->
            <div class="student-details" id="studentDetails">
                <p>Select a student to view their profile.</p>
            </div>
        </div>
    </div>
</body>
</html>
