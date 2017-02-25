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
    		<br/><br/><font size="4" color="red">
    <%
    		out.println(request.getAttribute("errorMessage"));
    %>
    		</font><br/><br/>
    <%
    	}
	%>
	
	<br />
	<br />
<input type="submit" value="Click here to go back to registeration page" Onclick="window.location.href='register.jsp'"/>
</body>
</html>