<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student std = (Student) session.getAttribute("student");
if(std == null) {
    response.sendRedirect("studentsessionexpired.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="contactus.css">
    <style>
        /* General Styles */
        body {
            font-family: "Poppins", sans-serif;
            overflow-y: auto;
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #ffffff, #f3f3f3);
            color: #333;
        }

        h1, h2 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 2.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 20px;
        }

        h2 {
            font-size: 1.8rem;
        }

        p {
            line-height: 1.6;
            color: #ffffff;
            margin: 10px 0;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
            font-size: 1rem;
        }

        ul li strong {
            color: #ffffff;
        }

        /* Container for all sections */
        .container {
            max-height: 90vh; /* Adjust height of the content container */
    overflow-y: auto; /* Enable scrolling within the container if needed */
    padding: 20px;
    box-sizing: border-box;
        }

        /* Section Styles */
        section {
          
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            text-align: center;
        }

        section h2 {
            margin-bottom: 10px;
        }

        /* Contact Form Styles */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }

        form input, form textarea, form button {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input:focus, form textarea:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        form textarea {
            resize: none;
        }

        form button {
            background: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        form button:hover {
            background: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <%@include file="stdnavbar.jsp" %>
    <div class="container">
        <h1>Contact Us</h1>
        <!-- Student Support Section -->
        <section>
            <h2>Student Support</h2>
            <p>If you are a student and need help with any academic or administrative issue, you can contact the following support team:</p>
            <ul>
                <li><strong>Student Support Email:</strong> studentsupport@klf.com</li>
                <li><strong>Phone:</strong> +123 456 7890 (Available Monday to Friday, 9:00 AM to 6:00 PM)</li>
                <li><strong>Office Address:</strong> KL University Campus, Vijayawada, India</li>
            </ul>
        </section>

        <!-- Teacher Contact Section -->
        <section>
            <h2>Teacher Contact Information</h2>
            <p>If you wish to contact your teacher, please use the following details. Each department has its own set of teachers, and you can reach out to them directly:</p>
            <ul>
                <li><strong>Professor John Doe (Math Department):</strong> johndoe@klf.com</li>
                <li><strong>Professor Jane Smith (Computer Science Department):</strong> janesmith@klf.com</li>
                <li><strong>Professor Mark Lee (Physics Department):</strong> marklee@klf.com</li>
            </ul>
            <p><strong>Office Hours:</strong> Monday to Friday, 10:00 AM to 12:00 PM</p>
        </section>

        <!-- General Feedback and Contact Form Section -->
        <section>
            <h2>General Feedback and Queries</h2>
            <p>If you have any general feedback or queries regarding the campus, courses, or facilities, feel free to get in touch with us via the contact form below:</p>
            <form action="submitContactForm" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </section>
    </div>
</body>
</html>
