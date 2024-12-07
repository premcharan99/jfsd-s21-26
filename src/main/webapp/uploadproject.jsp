<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Project</title>
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

        .upload-page {
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

        /* Left Section: Upload Project Form */
        .upload-form-container {
            flex: 2;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
        }

        .upload-form-container h3 {
            font-size: 36px;
            margin-bottom: 20px;
            text-shadow: 0px 0px 8px rgba(255, 255, 255, 0.5);
        }

        .upload-form-container .form-group {
            margin-bottom: 15px;
        }

        .upload-form-container .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .upload-form-container .form-group input,
        .upload-form-container .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 16px;
        }

        .upload-form-container textarea {
            resize: none;
        }

        .upload-form-container .btn-upload {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .upload-form-container .btn-upload:hover {
            background-color: #0056b3;
        }

        /* Right Section: Image Upload Preview */
        .upload-preview-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #1a1a1a;
            padding: 20px;
        }

        .preview-image {
            width: 250px;
            height: 250px;
            border-radius: 10px;
            overflow: hidden;
            border: 5px solid rgba(255, 255, 255, 0.8);
            box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2);
            margin-bottom: 15px;
        }

        .preview-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .upload-image-btn {
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
    <div class="upload-page">
        <!-- Left Section: Upload Project Form -->
        <div class="upload-form-container">
            <h3>Upload Your Project</h3>
            <form action="uploadProjectServlet" method="post" enctype="multipart/form-data">
                <!-- Project File -->
                <div class="form-group">
                    <label for="projectFile">Project File:</label>
                    <input type="file" id="projectFile" name="projectFile" required>
                </div>

                <!-- Mentor Name -->
                <div class="form-group">
                    <label for="mentorName">Mentor Name:</label>
                    <input type="text" id="mentorName" name="mentorName" placeholder="Enter mentor name" required>
                </div>

                <!-- Project Description -->
                <div class="form-group">
                    <label for="projectDescription">Project Description:</label>
                    <textarea id="projectDescription" name="projectDescription" rows="4" placeholder="Enter project description" required></textarea>
                </div>

                <!-- Skills -->
                <div class="form-group">
                    <label for="skills">Skills:</label>
                    <input type="text" id="skills" name="skills" placeholder="Enter skills used in the project" required>
                </div>

                <!-- Team Members -->
                <div class="form-group">
                    <label for="teamMembers">Team Members and Roles:</label>
                    <textarea id="teamMembers" name="teamMembers" rows="3" placeholder="Enter team members and their roles" required></textarea>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn-upload">Upload Project</button>
            </form>
        </div>

        <!-- Right Section: Image Upload Preview -->
        <div class="upload-preview-container">
            <div class="preview-image">
                <img src="path/to/default/preview.jpg" alt="Preview Image" id="previewImage">
            </div>
           
        </div>
    </div>

    <script>
        // Function to preview uploaded image
        document.getElementById('projectFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview folder   Ensure it was zipped').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
