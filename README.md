\# UiTM Student E-Portfolio Profile Management System



\## Project Information



\*\*Course:\*\* CSC584 Enterprise Programming

\*\*Project Title:\*\* Enhanced UiTM Student E-Portfolio Profile Management System

\*\*Student Name:\*\* NUR SARAH SOFIA BINTI ABDUL HARIS

\*\*Student ID:\*\* 2021498504

\*\*Group:\*\* NBCS2404A



\## Project Description



This project is an enhanced version of the UiTM Student E-Portfolio Generator developed for CSC584 Enterprise Programming. The system allows users to create, view, search, edit, and delete student profile records.



The enhanced system integrates Java Servlet, JSP, JavaBean, JDBC, and Apache Derby database to manage student profile data more effectively. The user interface maintains the UiTM-inspired purple, orange, and yellow gradient background with a clean white card layout.



\## Development Tools



\* NetBeans IDE 8.2

\* Java Web Application

\* Java Servlet

\* JSP

\* JavaBean

\* JDBC

\* Apache Derby Database

\* HTML

\* CSS

\* JavaScript



\## Database Information



\*\*Database Name:\*\* student\_profiles

\*\*Table Name:\*\* profiles



The `profiles` table stores student profile details such as:



\* Profile ID

\* Full Name

\* Student ID

\* Program

\* UiTM Student Email

\* Study Mode

\* Hobbies / Interests

\* Short Self-Introduction



\## Main Features



1\. \*\*Create Profile\*\*

&#x20;  Users can enter student details through the main form and save the profile into the database.



2\. \*\*View All Profiles\*\*

&#x20;  All saved profiles can be viewed in a table format.



3\. \*\*Search Profile\*\*

&#x20;  Users can search profiles by student name or student ID.



4\. \*\*Edit Profile\*\*

&#x20;  Existing profile details can be updated.



5\. \*\*Delete Profile\*\*

&#x20;  Users can delete selected profile records from the database.



6\. \*\*Duplicate Validation\*\*

&#x20;  The system prevents users from registering the same full name or student ID more than once.



7\. \*\*UiTM Email Validation\*\*

&#x20;  The system validates that the email address follows the UiTM student email format.



\## Important Project Folders



The final enhanced NetBeans project files are located in the following folders:



\* `src` - contains Java source files such as Servlet, JavaBean, and database connection class.

\* `web` - contains HTML, JSP, CSS, JavaScript, and image files.

\* `nbproject` - contains NetBeans project configuration files.



\## Main Files



\* `index.html` - main form page

\* `ProfileBean.java` - JavaBean class for student profile data

\* `DBConnection.java` - database connection class

\* `PortfolioServlet.java` - main controller servlet for CRUD operations

\* `profile.jsp` - displays the submitted profile after saving

\* `viewProfiles.jsp` - displays all saved profiles in table format

\* `editProfile.jsp` - allows profile editing

\* `style.css` - styling for the web application

\* `script.js` - form validation and character counter



\## How to Run the Project



1\. Download or clone this repository.

2\. Open the project using NetBeans IDE 8.2.

3\. Start Apache Derby / Java DB server.

4\. Create a database named `student\_profiles`.

5\. Create the `profiles` table in the database.

6\. Run the project using the configured web server.

7\. Open the system through the browser using localhost.



\## SQL Table Creation



```sql

CREATE TABLE profiles (

&#x20;   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),

&#x20;   name VARCHAR(100) NOT NULL,

&#x20;   student\_id VARCHAR(30) NOT NULL,

&#x20;   program VARCHAR(100) NOT NULL,

&#x20;   email VARCHAR(100) NOT NULL,

&#x20;   study\_mode VARCHAR(30) NOT NULL,

&#x20;   hobbies VARCHAR(150) NOT NULL,

&#x20;   intro VARCHAR(250) NOT NULL

);

```



\## Final Note



This repository contains the enhanced CSC584 individual assignment project. The system has been upgraded from a basic e-portfolio generator into a complete profile management system with database integration, CRUD functions, search feature, and duplicate validation.



