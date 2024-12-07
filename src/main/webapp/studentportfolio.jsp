<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="stdnavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Portfolio</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            font-family: 'Arial', sans-serif;
            color: #fff;
            background-color: #121212;
        }

       

        /* Portfolio Container */
        .portfolio-container {
            margin-left: 270px; /* Adjust for navbar width */
            width: calc(100% - 270px);
            padding: 30px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            overflow-y: auto;
        }

        .portfolio-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .portfolio-header h2 {
            font-size: 32px;
            text-shadow: 0px 0px 10px rgba(255, 255, 255, 0.5);
        }

        .edit-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        /* Section Styling */
        .section {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1s ease;
        }

        .section h3 {
            margin-bottom: 10px;
            font-size: 24px;
            text-shadow: 0px 0px 5px rgba(255, 255, 255, 0.3);
        }

        .section p {
            margin: 0;
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid rgba(255, 255, 255, 0.8);
            overflow: hidden;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Skills Section */
        .skills-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .skills-list span {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Projects Section */
        .project-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .project-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s ease;
        }

        .project-item:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .project-item a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .project-item a:hover {
            color: #0056b3;
        }

        /* Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <div class="portfolio-container">
        <div class="portfolio-header">
            <h2>Student Portfolio</h2>
            <button class="edit-btn">Edit</button>
        </div>

        <!-- Profile Section -->
        <div class="section profile-header">
            <div class="profile-image">
                <img src="path/to/default/profile/image.jpg" alt="Student Image">
            </div>
            <div>
                <h3>PREM</h3>
                <p>Aspiring software developer with expertise in Java, Spring Boot, and modern web technologies.</p>
            </div>
        </div>

        <!-- Skills Section -->
        <div class="section">
            <h3>Skills</h3>
            <div class="skills-list">
                <span>Java</span>
                <span>Spring Boot</span>
                <span>JavaScript</span>
                <span>React</span>
                <span>SQL</span>
                <span>Team Leadership</span>
            </div>
        </div>

        <!-- Projects Section -->
        <div class="section">
            <h3>Projects</h3>
            <div class="project-list">
                <div class="project-item">
                    <span>Student Management System</span>
                    <a href="https://github.com/username/project1" target="_blank">View on GitHub</a>
                </div>
                <div class="project-item">
                    <span>E-Commerce Website</span>
                    <a href="https://github.com/username/project2" target="_blank">View on GitHub</a>
                </div>
            </div>
        </div>

        <!-- Extra Skills Section -->
        <div class="section">
            <h3>Extra Skills</h3>
            <p>Public speaking, mentoring, event organization, and graphic design.</p>
        </div>
    </div>
</body>
</html>
