<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.uitmportfolio.ProfileBean" %>

<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>UiTM Student Portfolio Result</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .save-message {
            margin-top: 15px;
            margin-bottom: 18px;
            color: #333;
            font-size: 14px;
        }

        .small-profile-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
            margin-bottom: 22px;
        }

        .short-btn {
            display: inline-block;
            padding: 10px 22px;
            border-radius: 8px;
            color: white !important;
            text-decoration: none !important;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
        }

        .edit-short-btn {
            background-color: #6f1d77;
        }

        .edit-short-btn:hover {
            background-color: #1b1464;
        }

        .delete-short-btn {
            background-color: #b00020;
        }

        .delete-short-btn:hover {
            background-color: #8c0019;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="portfolio-card">

            <div class="portfolio-header">

                <div class="logo-area">
                    <img src="images/OIP.png" alt="UiTM Logo" class="uitm-logo" onerror="this.style.display='none'">
                </div>

                <div class="icon">🎓</div>

                <h1>UiTM Student E-Portfolio</h1>
                <p>Your student portfolio has been generated successfully.</p>

            </div>

            <% if (message != null) { %>
                <p class="save-message"><%= message %></p>
            <% } %>

            <% if (profile != null) { %>

                <div class="info-section">

                    <div class="info-row">
                        <span class="info-label">Profile ID</span>
                        <span class="info-value"><%= profile.getId() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Full Name</span>
                        <span class="info-value"><%= profile.getName() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Student ID</span>
                        <span class="info-value"><%= profile.getStudentId() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Program</span>
                        <span class="info-value"><%= profile.getProgram() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">UiTM Student Email</span>
                        <span class="info-value"><%= profile.getEmail() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Study Mode</span>
                        <span class="info-value"><%= profile.getStudyMode() %></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Hobbies / Interests</span>
                        <span class="info-value"><%= profile.getHobbies() %></span>
                    </div>

                    <div class="intro-box">
                        <h3>Short Self-Introduction</h3>
                        <p><%= profile.getIntro() %></p>
                    </div>

                </div>

                <div class="small-profile-buttons">
                    <a href="PortfolioServlet?action=edit&id=<%= profile.getId() %>" class="short-btn edit-short-btn">
                        Edit Profile
                    </a>

                    <a href="PortfolioServlet?action=delete&id=<%= profile.getId() %>" 
                       class="short-btn delete-short-btn"
                       onclick="return confirm('Are you sure you want to delete this profile?')">
                        Delete Profile
                    </a>
                </div>

            <% } else { %>

                <p class="no-data">No profile data available.</p>

            <% } %>

            <a href="index.html" class="back-button">Back to Form</a>

            <a href="PortfolioServlet?action=view" class="back-button secondary-button">
                View All Profiles
            </a>

        </div>
    </div>

</body>
</html>