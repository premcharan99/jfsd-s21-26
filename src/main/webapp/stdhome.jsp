<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student std = (Student) session.getAttribute("student");
if (std == null) {
    response.sendRedirect("studentsessionexpired.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Da shboard</title>
    <link rel="stylesheet" type="text/css" href="studentdashboard.css">
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(to bottom right, #000000, #333333);
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

        .banner .progress-bar-container {
            margin-top: 30px;
            background: rgba(255, 255, 255, 0.2);
            height: 10px;
            width: 70%;
            border-radius: 5px;
            overflow: hidden;
            position: relative;
        }

        .banner .progress-bar {
            height: 100%;
            background: linear-gradient(to right, #00bcd4, #007bff);
            width: 75%; /* Adjust this percentage dynamically based on profile completion */
            animation: grow 1.5s ease-in-out;
        }

        @keyframes grow {
            from {
                width: 0;
            }
            to {
                width: 75%;
            }
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

        /* New Square Card for Graphs */
        .graph-card {
            width: 500px; /* double the width of other boxes */
            height: 300px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 20px;
            color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            justify-content: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            position: relative;
            margin-top:30px;
        }

        .graph-card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.7);
        }

        .graph-card canvas {
            width: 100%;
            height: 100%;
        }
        /* New Rectangle Box below Graphs for Suggestions and How it Works */
.info-card {
    width: 500px; /* Same width as the graph boxes */
    height: 150px; /* Adjust height as needed */
    background: rgba(255, 255, 255, 0.2);
    border-radius: 10px;
    padding: 20px;
    color: #ffffff;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    justify-content: center;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    position: relative;
}

.info-card:hover {
    transform: translateY(-10px);
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.7);
}

.info-card h3 {
    margin-bottom: 10px;
    font-size: 1.5em;
}

.info-card p {
    font-size: 1em;
    line-height: 1.5;
}

/* Ensure the layout has gaps between rows */
.dashboard-container .card + .card {
    margin-top: 30px; /* Space between graph boxes and new info cards */
}
        

    </style>
</head>
<body>
    <%@include file="stdnavbar.jsp" %>

    <div class="content">
        <!-- Top Banner -->
        <div class="banner">
            <div class="profile-img">
                <img src="images/student.png" alt="Student Profile">
            </div>
            <div class="profile-details">
                <h1><%= std.getName() %></h1>
                <div class="progress-bar-container">
                    <div class="progress-bar"></div>
                </div>
            </div>
        </div>

        <!-- Dashboard Container -->
        <div class="dashboard-container">
            <h2>Welcome, <%= std.getName() %>!</h2>
            <div class="card">
                <div class="card-item">
                    <h3>Your Profile</h3>
                    <p>View and update your personal details</p>
                </div>
                <div class="card-item">
                    <h3>Courses</h3>
                    <p>View your enrolled courses and progress</p>
                </div>
                <div class="card-item">
                    <h3>Exams</h3>
                    <p>Check your upcoming exams and results</p>
                </div>
                <div class="card-item">
                    <h3>Notifications</h3>
                    <p>Stay updated with the latest announcements</p>
                </div>
            </div>

            <!-- New Graph Cards -->
            <div class="card">
                <!-- Bar Graph Card (Attendance) -->
                <div class="graph-card">
                    <h3>Attendance</h3>
                    <canvas id="attendanceChart"></canvas>
                </div>

                <!-- Line Chart Card (Milestone Completion) -->
                <div class="graph-card">
                    <h3>Milestone Completion</h3>
                    <canvas id="milestoneChart"></canvas>
                </div>
            </div>
        </div>
        <!-- Suggestions and How it works -->
    <div class="card">
        <div class="info-card">
            <h3>Suggestions</h3>
            <p>Here are some suggestions for your improvement...</p>
        </div>
        <div class="info-card">
            <h3>How it Works</h3>
            <p>Learn more about how our system helps you succeed...</p>
        </div>
    </div>
    </div>

    <!-- Include Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // Attendance Bar Chart
        const ctx1 = document.getElementById('attendanceChart').getContext('2d');
        const attendanceChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                datasets: [{
                    label: 'Attendance',
                    data: [85, 90, 80, 70, 95],
                    backgroundColor: '#00bcd4',
                    borderColor: '#007bff',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Milestone Completion Line Chart
        const ctx2 = document.getElementById('milestoneChart').getContext('2d');
        const milestoneChart = new Chart(ctx2, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5'],
                datasets: [{
                    label: 'Milestone Completion',
                    data: [20, 40, 60, 80, 100],
                    backgroundColor: 'rgba(0, 188, 212, 0.2)',
                    borderColor: '#00bcd4',
                    borderWidth: 2,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</body>
</html>
