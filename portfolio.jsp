<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>UiTM Student Portfolio Result</title>
    <link rel="stylesheet" href="css/style.css">
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

            <div class="info-section">

                <div class="info-row">
                    <span class="info-label">Full Name</span>
                    <span class="info-value"><%= request.getAttribute("name") %></span>
                </div>

                <div class="info-row">
                    <span class="info-label">Student ID</span>
                    <span class="info-value"><%= request.getAttribute("studentId") %></span>
                </div>

                <div class="info-row">
                    <span class="info-label">Program</span>
                    <span class="info-value"><%= request.getAttribute("program") %></span>
                </div>

                <div class="info-row">
                    <span class="info-label">UiTM Student Email</span>
                    <span class="info-value"><%= request.getAttribute("email") %></span>
                </div>

                <div class="info-row">
                    <span class="info-label">Study Mode</span>
                    <span class="info-value"><%= request.getAttribute("studyMode") %></span>
                </div>

                <div class="info-row">
                    <span class="info-label">Hobbies / Interests</span>
                    <span class="info-value"><%= request.getAttribute("hobbies") %></span>
                </div>

                <div class="intro-box">
                    <h3>Short Self-Introduction</h3>
                    <p><%= request.getAttribute("intro") %></p>
                </div>

            </div>

            <a href="index.html" class="back-button">Back to Form</a>

        </div>
    </div>

</body>
</html>
