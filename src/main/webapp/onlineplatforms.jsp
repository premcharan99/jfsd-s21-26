<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="stdnavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Platforms</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #121212;
            color: #fff;
        }

        /* Container for the platforms */
        .platforms-container {
            margin-left: 270px; /* Adjust based on navbar width */
            padding: 30px;
            display: flex;
            gap: 30px;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Platform Card Styling */
        .platform-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            width: 300px;
            padding: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
            animation: fadeIn 0.8s ease;
        }

        .platform-card h3 {
            font-size: 24px;
            margin-bottom: 15px;
            text-align: center;
        }

        .platform-card p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .platform-card .platform-info {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Graph Canvas */
        .graph-container {
            width: 100%;
            height: 250px;
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
    <div class="platforms-container">
        <!-- CodeChef Card -->
        <div class="platform-card">
            <h3>CodeChef</h3>
            <div class="platform-info">
                <p><strong>Username:</strong> user_codechef</p>
                <p><strong>Rating:</strong> 1500</p>
                <p><strong>Recent Contests:</strong> Long Challenge, Cook-Off</p>
            </div>
            <div class="graph-container">
                <canvas id="codechefGraph"></canvas>
            </div>
        </div>

        <!-- LeetCode Card -->
        <div class="platform-card">
            <h3>LeetCode</h3>
            <div class="platform-info">
                <p><strong>Username:</strong> user_leetcode</p>
                <p><strong>Rating:</strong> 2200</p>
                <p><strong>Recent Contests:</strong> Weekly Contest, Biweekly Contest</p>
            </div>
            <div class="graph-container">
                <canvas id="leetcodeGraph"></canvas>
            </div>
        </div>

        <!-- CodeForces Card -->
        <div class="platform-card">
            <h3>CodeForces</h3>
            <div class="platform-info">
                <p><strong>Username:</strong> user_codeforces</p>
                <p><strong>Rating:</strong> 1800</p>
                <p><strong>Recent Contests:</strong> CodeForces Rounds</p>
            </div>
            <div class="graph-container">
                <canvas id="codeforcesGraph"></canvas>
            </div>
        </div>
    </div>

    <script>
        // Data for the line charts
        const codechefData = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'CodeChef Rating',
                data: [1400, 1450, 1500, 1550, 1500, 1550],
                fill: false,
                borderColor: 'rgba(255, 165, 0, 1)',
                tension: 0.1
            }]
        };

        const leetcodeData = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'LeetCode Rating',
                data: [2100, 2150, 2200, 2250, 2300, 2200],
                fill: false,
                borderColor: 'rgba(0, 204, 255, 1)',
                tension: 0.1
            }]
        };

        const codeforcesData = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'CodeForces Rating',
                data: [1700, 1750, 1800, 1850, 1800, 1850],
                fill: false,
                borderColor: 'rgba(255, 0, 0, 1)',
                tension: 0.1
            }]
        };

        // Creating the charts
        const ctxCodechef = document.getElementById('codechefGraph').getContext('2d');
        const ctxLeetcode = document.getElementById('leetcodeGraph').getContext('2d');
        const ctxCodeforces = document.getElementById('codeforcesGraph').getContext('2d');

        new Chart(ctxCodechef, {
            type: 'line',
            data: codechefData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        });

        new Chart(ctxLeetcode, {
            type: 'line',
            data: leetcodeData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        });

        new Chart(ctxCodeforces, {
            type: 'line',
            data: codeforcesData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
