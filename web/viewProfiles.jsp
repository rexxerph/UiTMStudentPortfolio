<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.uitmportfolio.ProfileBean" %>

<%
    ArrayList<ProfileBean> profileList = (ArrayList<ProfileBean>) request.getAttribute("profileList");
    String keyword = (String) request.getAttribute("keyword");

    if (keyword == null) {
        keyword = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View All Profiles</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .view-table-card {
            width: 1100px;
            max-width: 95vw;
        }

        .table-header {
            text-align: center;
            margin-bottom: 22px;
        }

        .table-header h1 {
            color: #1b1464;
            margin-bottom: 8px;
        }

        .table-header p {
            color: #555;
            margin-top: 0;
        }

        .search-box {
            margin-bottom: 20px;
        }

        .search-box input {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 7px;
            margin-bottom: 10px;
        }

        .search-box button {
            width: 100%;
            background-color: #1b1464;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .search-box button:hover {
            background-color: #6f1d77;
        }

        .search-result-text {
            text-align: center;
            color: #555;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .search-result-text a {
            color: #6f1d77;
            font-weight: bold;
            text-decoration: none;
            margin-left: 8px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            margin-top: 15px;
        }

        .profile-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            min-width: 950px;
        }

        .profile-table th {
            background-color: #1b1464;
            color: white;
            padding: 12px 10px;
            text-align: left;
            white-space: nowrap;
        }

        .profile-table td {
            padding: 11px 10px;
            border-bottom: 1px solid #ddd;
            vertical-align: top;
        }

        .profile-table tr:nth-child(even) {
            background-color: #f7f3ff;
        }

        .profile-table tr:hover {
            background-color: #fff8d9;
        }

        .intro-cell {
            max-width: 220px;
            word-wrap: break-word;
        }

        .action-cell {
            white-space: nowrap;
        }

        .table-action-btn {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 6px;
            color: white !important;
            text-decoration: none !important;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .edit-table-btn {
            background-color: #6f1d77;
        }

        .delete-table-btn {
            background-color: #b00020;
        }

        .no-record {
            text-align: center;
            color: #555;
            padding: 25px;
        }

        .bottom-buttons {
            margin-top: 24px;
        }

        .add-new-btn {
            display: block;
            width: 100%;
            background-color: #1b1464;
            color: white !important;
            text-align: center;
            padding: 13px;
            border-radius: 8px;
            text-decoration: none !important;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .add-new-btn:hover {
            background-color: #30228f;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="portfolio-card view-table-card">

        <div class="table-header">
            <div class="logo-area">
                <img src="images/OIP.png" alt="UiTM Logo" class="uitm-logo" onerror="this.style.display='none'">
            </div>

            <h1>Profile Management System</h1>
            <p>View, search, edit and delete student profiles.</p>
        </div>

        <form action="PortfolioServlet" method="get" class="search-box">
            <input type="hidden" name="action" value="search">

            <input 
                type="text" 
                name="keyword" 
                placeholder="Search by name or student ID"
                value="<%= keyword %>">

            <button type="submit">Search</button>
        </form>

        <% if (!keyword.equals("")) { %>
            <p class="search-result-text">
                Search result for: <strong><%= keyword %></strong>
                <a href="PortfolioServlet?action=view">Show all profiles</a>
            </p>
        <% } %>

        <div class="table-wrapper">
            <table class="profile-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Student ID</th>
                        <th>Program</th>
                        <th>Email</th>
                        <th>Study Mode</th>
                        <th>Hobbies</th>
                        <th>Introduction</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <% if (profileList != null && profileList.size() > 0) { %>

                        <% for (ProfileBean profile : profileList) { %>
                            <tr>
                                <td><%= profile.getId() %></td>
                                <td><%= profile.getName() %></td>
                                <td><%= profile.getStudentId() %></td>
                                <td><%= profile.getProgram() %></td>
                                <td><%= profile.getEmail() %></td>
                                <td><%= profile.getStudyMode() %></td>
                                <td><%= profile.getHobbies() %></td>
                                <td class="intro-cell"><%= profile.getIntro() %></td>
                                <td class="action-cell">
                                    <a href="PortfolioServlet?action=edit&id=<%= profile.getId() %>" 
                                       class="table-action-btn edit-table-btn">
                                        Edit
                                    </a>

                                    <a href="PortfolioServlet?action=delete&id=<%= profile.getId() %>" 
                                       class="table-action-btn delete-table-btn"
                                       onclick="return confirm('Are you sure you want to delete this profile?')">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        <% } %>

                    <% } else { %>
                        <tr>
                            <td colspan="9" class="no-record">No profile records found.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="bottom-buttons">
            <a href="index.html" class="add-new-btn">+ Add New Profile</a>
            <a href="index.html" class="back-button">Back to Form</a>
        </div>

    </div>
</div>

</body>
</html>