<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your account info</title>
</head>
<body>


	<%
    	if(null!=request.getAttribute("errorMessage"))
    	{
    %>
    		<br/><br/><font size="8" color="red">
    <%
    		out.println(request.getAttribute("errorMessage"));
    %>
    		</font><br/><br/>
    <%
    	}
	%>
	
	
	
	Please enter the details below:
	<br />
	<br />
	<form action="studentlogin" method="POST">
		Username: <input type="text" name="username"> <br /> <br />
		Password: <input type="password" name="password" /> <br /> <br /> 
		
		<input type="submit" value="Submit" />
	</form>
</body>
</html>