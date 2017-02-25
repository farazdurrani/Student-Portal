<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="bean.Student"%>
<%@ page import="bean.student_course" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Account</title>

</head>
<body>


	
	<%
		Student student =(Student) request.getSession().getAttribute("student");
		ArrayList<student_course> course = (ArrayList<student_course>)request.getSession().getAttribute("courses");
		
	%>
	
	<p>Welcome, <%=student.getFirstName()%> <%=student.getLastName()%></p>
	<p> Phone Number: <%=student.getPhone()%> Email: <%=student.getEmail()%> Address: <%=student.getAddress()%> City: <%=student.getCity()%> State: <%=student.getState()%> Zip: <%=student.getZip()%></p>
	<p>Registration Date: <%=student.getReg_date()%> Graduation Date: <%=student.getGrad_date()%> GPA:  <%=student.getGpa()%> Major: <%=student.getMajor()%></p>
	<p> Date of Birth <%=student.getDOB()%> Major: <%=student.getMajor()%> create_dttm: <%=student.getCreate_dttm()%> update_dttm <%=student.getUpdate_dttm()%> </p>
 	<p>Classes you registered for:</p>
 	<TABLE BORDER 1>
 	<%
    for ( int i = 0; i < course.size(); i++ ) {
        %>
        <TR>
        <TD><%= course.get(i).getCourseID() %></TD>
        </TR>
        <%
    }
	%>
	</TABLE>
<form action="LogoutServlet" method="GET">
			<br></br>
			<input type="submit" value="Click here to logout" />
			
</form> 
</body>
</html>