package com.uitmportfolio;

public class ProfileBean {
    
    private int id;
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String studyMode;
    private String hobbies;
    private String intro;

    public ProfileBean() {
    }

    public ProfileBean(int id, String name, String studentId, String program, String email, String studyMode, String hobbies, String intro) {
        this.id = id;
        this.name = name;
        this.studentId = studentId;
        this.program = program;
        this.email = email;
        this.studyMode = studyMode;
        this.hobbies = hobbies;
        this.intro = intro;
    }

    public ProfileBean(String name, String studentId, String program, String email, String studyMode, String hobbies, String intro) {
        this.name = name;
        this.studentId = studentId;
        this.program = program;
        this.email = email;
        this.studyMode = studyMode;
        this.hobbies = hobbies;
        this.intro = intro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }    

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }    

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }    

    public String getStudyMode() {
        return studyMode;
    }

    public void setStudyMode(String studyMode) {
        this.studyMode = studyMode;
    }    

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }    

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}