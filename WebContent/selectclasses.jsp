<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Classes</title>
<script>	

	function KeepCount() {

		var NewCount = 0

		if (document.forms[0].english.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].up.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].ewc.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].math180.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].math181.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].cs440.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].cs401.checked)
		{NewCount = NewCount + 1}

		if (document.forms[0].cs385.checked)
		{NewCount = NewCount + 1}
		
		if (document.forms[0].cs301.checked)
		{NewCount = NewCount + 1}
		
		if (document.forms[0].cs441.checked)
		{NewCount = NewCount + 1}
		
		if (document.forms[0].mcs425.checked)
		{NewCount = NewCount + 1}
		
		if (NewCount > 4)
		{
		document.getElementById('toomanyselectionsError').style.display = "block";
		document.getElementById('toomanyselectionsError').style.background ='#e35152';
		document.forms[0].english.checked = false;  
		document.forms[0].up.checked = false;  
		document.forms[0].ewc.checked = false;  
		document.forms[0].math180.checked = false;  
		document.forms[0].math181.checked = false;  
		document.forms[0].cs440.checked = false;  
		document.forms[0].cs401.checked = false;  
		document.forms[0].cs385.checked = false; 
		document.forms[0].cs301.checked = false; 
		document.forms[0].cs441.checked = false; 
		document.forms[0].mcs425.checked = false; 

		return false;
		}
		if(NewCount == 1){
			document.getElementById('toomanyselectionsError').style.display = "none";
			document.getElementById('notmanyselectionsError').style.display = "none";
		}
		}
		
		function validateForm(){
			// Set error catcher
			var error = 0;
			// Check name

			 if(document.forms[0].english.checked == false && document.forms[0].up.checked == false && document.forms[0].ewc.checked == false  
						&& document.forms[0].math180.checked == false && document.forms[0].math181.checked == false && document.forms[0].cs440.checked == false  
						&& document.forms[0].cs401.checked == false && document.forms[0].cs385.checked == false && document.forms[0].cs301.checked == false && document.forms[0].cs441.checked == false 
						&& document.forms[0].mcs425.checked == false){
							document.getElementById('notmanyselectionsError').style.background = '#e35152';
							document.getElementById('notmanyselectionsError').style.display = "block";
							//alert("You must select at least 1 subject to register for this semester. Also fix other issues with the form if there are any.");
							//document.forms[0].zip.focus() ;
							error++;
							return false;
			} 

			// Don't submit form if there are errors
			if(error > 0){
				return false;
			}
			
			
		}			
	</script>
</head>
<body>

	<%
		Student student =(Student) request.getSession().getAttribute("student");
	%>
	<p>Welcome, <%=student.getFirstName()%> <%=student.getLastName()%></p>
	<p>Student ID, <%=student.getStudent_id()%></p>
	<p align="center">
	<form action="selectclasses" method="POST" onsubmit="return validateForm()">
				
		<b>Select the class you like to register for this semester:</b>
		
		<br />
		<br />
		<fieldset>
		<table style="width: 20%" >
			<tr>
				<td><input type="checkbox" name="english" value="ENG 161" onclick="KeepCount()" />English 161 <br /></td>
				<td align="right"><div id="div1" style="display:none">$300</div></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="up" value="UP 101" onclick=" KeepCount()" /> Understanding The Past 101 <br /></td>
				<td align="right"><div id="div2" style="display:none">$250</div></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="ewc" value="EWC 105" onclick="  KeepCount()" /> Exploring World Cultures 105 <br /></td>
				<td align="right"><div id="div3" style="display:none">$200</div></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="math180" value="MATH 180" onclick="  KeepCount()" /> Calculus I <br /></td>
				<td align="right"><div id="div4" style="display:none">$275</div></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="math181" value="MATH 181" onclick="  KeepCount()" /> Calculus II <br /></td>
				<td align="right"><div id="div5" style="display:none">$275</div></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="cs440" value="CS 440" onclick=" KeepCount(); " /> Software Engineering I <br /></td>
				<td align="right"><div id="div6" style="display:none">$290</div></td>
				
			</tr>

			<tr>
				<td><input type="checkbox" name="cs401" value="CS 401" onclick=" KeepCount()" /> Computer Algorithm I <br /></td>
				<td align="right"><div id="div7" style="display:none">$190</div></td>
			</tr>		
			<tr>
				<td><input type="checkbox" name="cs385" value="CS 385" onclick=" KeepCount()" /> Operating Systems Design<br /></td>
				<td align="right"><div id="div8" style="display:none">$310</div></td>
			</tr>		
			<tr>
				<td><input type="checkbox" name="cs301" value="CS 301" onclick=" KeepCount()" /> Lanuages and Automata<br /></td>
				<td align="right"><div id="div9" style="display:none">$310</div></td>
			</tr>	
			<tr>
				<td><input type="checkbox" name="cs441" value="CS 441" onclick=" KeepCount()" /> Artificial Intelligence I<br /></td>
				<td align="right"><div id="div10" style="display:none">$310</div></td>
			</tr>	
			<tr>
				<td><input type="checkbox" name="mcs425" value="MCS 425" onclick=" KeepCount()" /> Codes and Crytography<br /></td>
				<td align="right"><div id="div11" style="display:none">$310</div></td>
			</tr>	
		</table>
		<span class="validateError" id="toomanyselectionsError" style="display: none;">You can only select upto four courses this semester. Try again.</span>
		<span class="validateError" id="notmanyselectionsError" style="display: none;">You must select at least one course to register. Try again.</span>
		</fieldset>
		
		<fieldset>
			<input type="submit" id="submit" name="submit" value="Submit" />
		</fieldset>		
	</form>
	

</body>
</html>