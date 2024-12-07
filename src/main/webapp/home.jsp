<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - Student Portfolio Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .w3-main {
            margin: 40px;
        }

        .section-header h1 {
            text-align: center;
            color: #ffffff;
            animation: fadeInUp 1s;
        }

        .container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap; /* Allows wrapping if the screen size is small */
            gap: 30px; /* Increased gap for more space between containers */
            margin-top: 40px;
        }

        .container-item {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0px 8px 32px rgba(255, 255, 255, 0.3);
            padding: 30px;
            width: 22%; /* Each container takes 22% of the width */
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* Align items to the top */
            text-align: center;
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
            height: 250px; /* Increased height of the containers */
        }

        .container-item h3 {
            font-size: 26px;
            margin-bottom: 15px;
            color: #00bcd4;
            margin-top: 0; /* Ensure the title is at the top */
        }

        .container-item p {
            font-size: 18px;
            color: #ddd;
            margin-bottom: 15px;
            flex-grow: 1; /* Ensure the paragraph takes available space */
        }

        /* Fade In Animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container-item {
                width: 48%; /* 2 items per row on small screens */
            }
        }

        @media (max-width: 480px) {
            .container-item {
                width: 100%; /* 1 item per row on very small screens */
            }
        }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>

    <div class="w3-main">
        <!-- Welcome Section -->
        <div class="w3-container section-header" id="features">
            <h1>Welcome to Student Portfolio Management</h1>
        </div>

        <!-- Containers Section -->
        <div class="container">
            <!-- Container 1 -->
            <div class="container-item">
                <h3>My Profile</h3>
                <p>Manage and update your personal information and profile details.</p>
            </div>

            <!-- Container 2 -->
            <div class="container-item">
                <h3>My Projects</h3>
                <p>Upload and showcase your academic and personal projects.</p>
            </div>

            <!-- Container 3 -->
            <div class="container-item">
                <h3>My Skills</h3>
                <p>Add, update, and display your technical and soft skills.</p>
            </div>

            <!-- Container 4 -->
            <div class="container-item">
                <h3>My Status</h3>
                <p>Track and manage your academic and professional progress.</p>
            </div>
        </div>
    </div>

</body>
</html>
