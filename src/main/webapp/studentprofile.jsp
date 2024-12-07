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
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #121212;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }

        .profile-page {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            width: 90%;
            max-width: 1200px;
            height: 80%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            animation: fadeIn 0.8s ease-in-out;
        }

        /* Left Section: Profile Image */
        .profile-image-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #1a1a1a;
            padding: 20px;
        }

        .profile-image {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid rgba(255, 255, 255, 0.8);
            box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2);
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .upload-image-btn {
            margin-top: 15px;
            background-color: #fff;
            color: #121212;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .upload-image-btn:hover {
            background-color: #2f2f2f;
            color: #fff;
        }

        /* Right Section: Profile Details */
        .profile-details-container {
            flex: 2;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
        }

        .profile-details-container h3 {
            font-size: 36px;
            margin-bottom: 20px;
            text-shadow: 0px 0px 8px rgba(255, 255, 255, 0.5);
        }

        .profile-details-container .info-item {
            margin: 15px 0;
            font-size: 18px;
            color: rgba(255, 255, 255, 0.9);
        }

        /* Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: scale(0.9);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <%@include file="stdnavbar.jsp" %>

    <div class="profile-page">
        <!-- Left Section: Profile Image -->
        <div class="profile-image-container">
            <div class="profile-image">
                <img src="path/to/default/profile/image.jpg" alt="Profile Picture" id="profilePicture">
            </div>
            <button class="upload-image-btn" onclick="document.getElementById('imageUpload').click()">Upload Image</button>
            <input type="file" id="imageUpload" accept="image/*" style="display: none;" onchange="previewImage(event)">
        </div>

        <!-- Right Section: Profile Details -->
        <div class="profile-details-container">
            <h3>Hello, <%= std.getName() %>!</h3>
            <div class="info-item"><b>ID:</b> <%= std.getId() %></div>
            <div class="info-item"><b>Gender:</b> <%= std.getGender() %></div>
            <div class="info-item"><b>Date of Birth:</b> <%= std.getDateofbirth() %></div>
            <div class="info-item"><b>Department:</b> <%= std.getDepartment() %></div>
            <div class="info-item"><b>Year:</b> <%= std.getYear() %></div>
            <div class="info-item"><b>Location:</b> <%= std.getLocation() %></div>
            <div class="info-item"><b>Email:</b> <%= std.getEmail() %></div>
            <div class="info-item"><b>Contact:</b> <%= std.getContact() %></div>
        </div>
    </div>

    <script>
        // Function to preview uploaded image
        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profilePicture').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
</body>
</html>
