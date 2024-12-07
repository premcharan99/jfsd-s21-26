<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="stdnavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Feedback</title>
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

        /* Feedback Page Container */
        .feedback-container {
            margin-left: 270px; /* Navbar width */
            padding: 30px;
            width: calc(100% - 270px);
            overflow-y: auto;
        }

        .feedback-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .feedback-header h2 {
            font-size: 32px;
            text-shadow: 0px 0px 10px rgba(255, 255, 255, 0.5);
        }

        /* Feedback Section */
        .feedback-section {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1s ease;
        }

        .feedback-section h3 {
            font-size: 24px;
            margin-bottom: 10px;
            text-shadow: 0px 0px 5px rgba(255, 255, 255, 0.3);
        }

        .feedback-section p {
            font-size: 16px;
            margin-bottom: 15px;
            color: rgba(255, 255, 255, 0.8);
        }

        /* Star Rating */
        .star-rating {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .star-rating span {
            color: rgba(255, 255, 255, 0.8);
            font-size: 16px;
            margin-right: 10px;
        }

        .star {
            font-size: 24px;
            color: #ccc;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .star.active {
            color: #FFD700;
            transform: scale(1.2);
        }

        .star:hover {
            cursor: pointer;
            color: #FFD700;
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
    <div class="feedback-container">
        <div class="feedback-header">
            <h2>Student Feedback</h2>
        </div>

        <!-- Feedback 1 -->
        <div class="feedback-section">
            <h3>Teacher: John Smith</h3>
            <p>"The lectures are engaging and the teacher is always willing to clarify doubts."</p>
            <div class="star-rating">
                <span>Rating:</span>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star">★</i>
            </div>
        </div>

        <!-- Feedback 2 -->
        <div class="feedback-section">
            <h3>Teacher: Jane Doe</h3>
            <p>"Great teaching methods but could improve time management during the class."</p>
            <div class="star-rating">
                <span>Rating:</span>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star">★</i>
                <i class="star">★</i>
            </div>
        </div>

        <!-- Feedback 3 -->
        <div class="feedback-section">
            <h3>Teacher: Mark Wilson</h3>
            <p>"The teacher provides excellent resources and is very approachable."</p>
            <div class="star-rating">
                <span>Rating:</span>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
                <i class="star active">★</i>
            </div>
        </div>
    </div>

    <script>
        // Star rating animation on hover
        const stars = document.querySelectorAll('.star');
        stars.forEach((star, index) => {
            star.addEventListener('mouseenter', () => {
                stars.forEach((s, i) => {
                    if (i <= index) {
                        s.classList.add('active');
                    } else {
                        s.classList.remove('active');
                    }
                });
            });

            star.addEventListener('mouseleave', () => {
                stars.forEach((s) => s.classList.remove('active'));
            });
        });
    </script>
</body>
</html>
