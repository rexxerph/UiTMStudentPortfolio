<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.uitmportfolio.ProfileBean" %>

<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student Profile</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>

    <div class="container">
        <div class="form-card">

            <div class="logo-area">
                <img src="images/OIP.png" alt="UiTM Logo" class="uitm-logo" onerror="this.style.display='none'">
            </div>

            <h1>Edit Student Profile</h1>
            <p class="subtitle">Update the selected student portfolio details</p>

            <% if (profile != null) { %>

            <form action="PortfolioServlet" method="post" onsubmit="return validateForm()">

                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= profile.getId() %>">

                <label>Full Name</label>
                <input type="text" name="name" id="name" value="<%= profile.getName() %>" required>

                <label>Student ID</label>
                <input type="text" name="studentId" id="studentId" value="<%= profile.getStudentId() %>" required>

                <label>Program</label>
                <input type="text" name="program" id="program" value="<%= profile.getProgram() %>" required>

                <label>UiTM Student Email</label>
                <input 
                    type="email" 
                    name="email" 
                    id="email"
                    value="<%= profile.getEmail() %>"
                    pattern="^[a-zA-Z0-9._%+-]+@student\.uitm\.edu\.my$"
                    title="Please enter a valid UiTM student email ending with @student.uitm.edu.my"
                    required>

                <label>Study Mode</label>
                <select name="studyMode" id="studyMode" required>
                    <option value="Full time" <%= profile.getStudyMode().equals("Full time") ? "selected" : "" %>>Full time</option>
                    <option value="Part time" <%= profile.getStudyMode().equals("Part time") ? "selected" : "" %>>Part time</option>
                </select>

                <label>Hobbies / Interests</label>
                <input type="text" name="hobbies" id="hobbies" value="<%= profile.getHobbies() %>" required>

                <label>Short Self-Introduction</label>
                <textarea 
                    name="intro" 
                    id="intro" 
                    rows="5" 
                    maxlength="250"
                    onkeyup="countCharacters()"
                    required><%= profile.getIntro() %></textarea>

                <p class="counter">
                    Characters: <span id="charCount">0</span>/250
                </p>

                <button type="submit">Update Profile</button>

            </form>

            <% } else { %>
                <p class="no-data">Profile not found.</p>
            <% } %>

            <a href="PortfolioServlet?action=view" class="back-button">Back to Profile List</a>

        </div>
    </div>

</body>
</html>