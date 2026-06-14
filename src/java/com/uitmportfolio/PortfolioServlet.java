package com.uitmportfolio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PortfolioServlet")
public class PortfolioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null || action.trim().equals("")) {
            action = "view";
        }

        try {
            if (action.equals("view")) {
                viewProfiles(request, response);
            } else if (action.equals("search")) {
                searchProfiles(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteProfile(request, response);
            } else {
                viewProfiles(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null || action.trim().equals("")) {
            action = "insert";
        }

        try {
            if (action.equals("insert")) {
                insertProfile(request, response);
            } else if (action.equals("update")) {
                updateProfile(request, response);
            } else {
                response.sendRedirect("index.html");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void insertProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String studyMode = request.getParameter("studyMode");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        if (name != null) {
            name = name.trim();
        }

        if (studentId != null) {
            studentId = studentId.trim();
        }

        if (isDuplicateProfile(name, studentId)) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('This name or Student ID already exists. Please use different profile details.');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
            return;
        }

        ProfileBean profile = new ProfileBean(name, studentId, program, email, studyMode, hobbies, intro);

        String sql = "INSERT INTO profiles (name, student_id, program, email, study_mode, hobbies, intro) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentId());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getStudyMode());
            ps.setString(6, profile.getHobbies());
            ps.setString(7, profile.getIntro());

            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();

            if (generatedKeys.next()) {
                profile.setId(generatedKeys.getInt(1));
            }
        }

        request.setAttribute("profile", profile);
        request.setAttribute("message", "Profile has been saved successfully into the database.");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    private void viewProfiles(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        ArrayList<ProfileBean> profileList = new ArrayList<ProfileBean>();

        String sql = "SELECT * FROM profiles ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProfileBean profile = new ProfileBean();

                profile.setId(rs.getInt("id"));
                profile.setName(rs.getString("name"));
                profile.setStudentId(rs.getString("student_id"));
                profile.setProgram(rs.getString("program"));
                profile.setEmail(rs.getString("email"));
                profile.setStudyMode(rs.getString("study_mode"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntro(rs.getString("intro"));

                profileList.add(profile);
            }
        }

        request.setAttribute("profileList", profileList);
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }

    private void searchProfiles(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        ArrayList<ProfileBean> profileList = new ArrayList<ProfileBean>();

        String keyword = request.getParameter("keyword");

        if (keyword == null) {
            keyword = "";
        }

        String sql = "SELECT * FROM profiles WHERE LOWER(name) LIKE LOWER(?) OR LOWER(student_id) LIKE LOWER(?) ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProfileBean profile = new ProfileBean();

                profile.setId(rs.getInt("id"));
                profile.setName(rs.getString("name"));
                profile.setStudentId(rs.getString("student_id"));
                profile.setProgram(rs.getString("program"));
                profile.setEmail(rs.getString("email"));
                profile.setStudyMode(rs.getString("study_mode"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntro(rs.getString("intro"));

                profileList.add(profile);
            }
        }

        request.setAttribute("profileList", profileList);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ProfileBean profile = null;

        String sql = "SELECT * FROM profiles WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                profile = new ProfileBean();

                profile.setId(rs.getInt("id"));
                profile.setName(rs.getString("name"));
                profile.setStudentId(rs.getString("student_id"));
                profile.setProgram(rs.getString("program"));
                profile.setEmail(rs.getString("email"));
                profile.setStudyMode(rs.getString("study_mode"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntro(rs.getString("intro"));
            }
        }

        request.setAttribute("profile", profile);
        request.getRequestDispatcher("editProfile.jsp").forward(request, response);
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String studyMode = request.getParameter("studyMode");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        if (name != null) {
            name = name.trim();
        }

        if (studentId != null) {
            studentId = studentId.trim();
        }

        if (isDuplicateProfileForUpdate(id, name, studentId)) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('This name or Student ID already exists in another profile. Please use different details.');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
            return;
        }

        String sql = "UPDATE profiles SET name = ?, student_id = ?, program = ?, email = ?, study_mode = ?, hobbies = ?, intro = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, studyMode);
            ps.setString(6, hobbies);
            ps.setString(7, intro);
            ps.setInt(8, id);

            ps.executeUpdate();
        }

        response.sendRedirect("PortfolioServlet?action=view");
    }

    private void deleteProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM profiles WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }

        response.sendRedirect("PortfolioServlet?action=view");
    }

    private boolean isDuplicateProfile(String name, String studentId) throws SQLException {

        String sql = "SELECT COUNT(*) FROM profiles WHERE LOWER(name) = LOWER(?) OR student_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }

    private boolean isDuplicateProfileForUpdate(int id, String name, String studentId) throws SQLException {

        String sql = "SELECT COUNT(*) FROM profiles WHERE (LOWER(name) = LOWER(?) OR student_id = ?) AND id <> ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setInt(3, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }
}