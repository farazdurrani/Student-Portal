<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" charset="utf-8" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
	<script>
		function validateAccount(x){
			if(document.getElementById(x).value.length > 0){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validatePassword(x){
			if(document.getElementById(x).value.length > 0){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		function checkPass()
	{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(pass1.value == pass2.value && pass1.value.length > 0 ) {
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
		return true;
    }else{
        if(pass1.value.length > 0){
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
		
		} else{}
		return false;
    }
}  
	
		function validateName(x){
			// Validation rule
			var re = /^[a-zA-Z]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateEmail(x){ 
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(re.test(document.getElementById(x).value)){
        document.getElementById(x).style.background ='#ccffcc';
        document.getElementById(x + 'Error').style.display = "none";
        return true;
		}else{
        //document.getElementById('email').style.background ='#e35152';
        return false;
		}
		}
		
		function validateAddress(x){
			// Validation rule
			var re = /^[A-Za-z0-9 -]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		function validateCity(x){
			// Validation rule
			var re = /^[A-Za-z ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateState(x){
			if(document.getElementById(x).selectedIndex !== 0){
				document.getElementById(x).style.background ='#ccffcc';
				document.getElementById(x + 'Error').style.display = "none";
				return true;
		    }else{
				//document.getElementById(x).style.background ='#e35152';
				return false;	
			}
		}
		
		function validateZip(x){
			// Validation rule
			var re = /^[0-9 ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateEZip(x){
			// Validation rule
			var re = /^[0-9 ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value) || document.getElementById('ezip').value.length == 0) {
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateECity(x){
			// Validation rule
			var re = /^[A-Za-z ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value) || (document.getElementById(x).value.length == 0)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateEAddress(x){
			// Validation rule
			var re = /^[A-Za-z0-9 -]+$/;
			// Check input
			if(re.test(document.getElementById(x).value) || (document.getElementById(x).value.length == 0)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		}
		
		function validateDOB(x){
			if(document.getElementById(x).value != 0){
				document.getElementById(x).style.background ='#ccffcc';
				document.getElementById(x + 'Error').style.display = "none";
				return true;
		    }else{
				document.getElementById(x).style.background ='#e35152';
				return false;	
			}
		}
		/* function validateRadio(x){
			if(document.getElementById(x).checked){
				document.getElementById('genderError').style.display = "none";
				return true;
			}else{
				return false;
			}
		} */
		
/* 		function validateCountry(x){
			// Validation rule
			var re = /^[A-Za-z ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		} */
/* 		function validateCity2(x){
			// Validation rule
			var re = /^[A-Za-z ]+$/;
			// Check input
			if(re.test(document.getElementById(x).value)){
				// Style green
				document.getElementById(x).style.background ='#ccffcc';
				// Hide error prompt
				document.getElementById(x + 'Error').style.display = "none";
				return true;
			}else{
				// Style red
				//document.getElementById(x).style.background ='#e35152';
				// Show error prompt
				//document.getElementById(x + 'Error').style.display = "block";
				return false;	
			}
		} */
		
		function validateSelect(x){
			if(document.getElementById(x).selectedIndex !== 0){
			document.getElementById(x).style.background ='#ccffcc';
			document.getElementById(x + 'Error').style.display = "none";
			return true;
			}else{
			document.getElementById(x).style.background ='#e35152';
			return false; 
			}
		}
		
		
		  function validatePhoneNumber(x)  
			{  
			var re = /^\d{10}$/;  
			if (re.test(document.getElementById(x).value))
            {  
			document.getElementById(x).style.background ='#ccffcc';
			document.getElementById(x + 'Error').style.display = "none";
			return true;  
            }  
			else  
            {  
            //alert("message");  
            return false;  
            }  
			}  
			
		function validateForm(){
			// Set error catcher
			var error = 0;
			if(!validateAccount('account')){
			document.getElementById('account').style.background ='#e35152';
			document.getElementById('accountError').style.display = "block";
			error++;
			}
			if(!validatePassword('pass1')){
			document.getElementById('pass1').style.background ='#e35152';
			document.getElementById('pass1Error').style.display = "block";
			error++;
			}
			if(!checkPass()){
			document.getElementById('pass2').style.background ='#e35152';
			document.getElementById('pass2Error').style.display = "block";
			error++;
			}
			if(!validatePassword('pass2')){
			document.getElementById('pass2').style.background ='#e35152';
			document.getElementById('pass2Error').style.display = "block";
			error++;
			}
			// Check name
			if(!validateName('firstname')){
			document.getElementById('firstname').style.background ='#e35152';
			document.getElementById('firstnameError').style.display = "block";
			error++;
			}
			if(!validateName('lastname')){
				document.getElementById('lastname').style.background ='#e35152';
				document.getElementById('lastnameError').style.display = "block";
				error++;
			}
			if(!validateEmail('email')){
			document.getElementById('email').style.background ='#e35152';
			document.getElementById('emailError').style.display = "block";
			error++;
			}
			if(!validatePhoneNumber('phone')){
				document.getElementById('phone').style.background ='#e35152';
				document.getElementById('phoneError').style.display = "block";
				error++;
			}
			if(!validateAddress('address')){
				document.getElementById('address').style.background ='#e35152';
				document.getElementById('addressError').style.display = "block";
				error++;
			}
			if(!validateCity('city')){
				document.getElementById('city').style.background ='#e35152';
				document.getElementById('cityError').style.display = "block";
				error++;
			}
			if(!validateState('state')){
				document.getElementById('state').style.background ='#e35152';
				document.getElementById('stateError').style.display = "block";
				error++;
			}
			if(!validateZip('zip')){
				document.getElementById('zip').style.background ='#e35152';
				document.getElementById('zipError').style.display = "block";
				error++;
			}
			if(!validateDOB('month_start')){
				document.getElementById('month_start').style.background ='#e35152';
				document.getElementById('month_startError').style.display = "block";
				error++;
			}
			if(!validateDOB('day_start')){
				document.getElementById('day_start').style.background ='#e35152';
				document.getElementById('day_startError').style.display = "block";
				error++;
			}
			if(!validateDOB('year_start')){
				document.getElementById('year_start').style.background ='#e35152';
				document.getElementById('year_startError').style.display = "block";
				error++;
			}
			/* if(validateRadio('female')){
 
			}else if(validateRadio('male')){
         
			}else{
				document.getElementById('genderError').style.display = "block";
				error++;
			} */
			
		/* 	if(!validateCity('city2')){
				document.getElementById('city2').style.background ='#e35152';
				document.getElementById('city2Error').style.display = "block";
				error++;
			} */
			
/* 			if(!validateCountry('country')){
				document.getElementById('country').style.background ='#e35152';
				document.getElementById('countryError').style.display = "block";
				error++;
			} */
			if(!validateSelect('major')){
				document.getElementById('majorError').style.display = "block";
				error++;
			}
			if(!validateName('efirstname')){
			document.getElementById('efirstname').style.background ='#e35152';
			document.getElementById('efirstnameError').style.display = "block";
			error++;
			}
			if(!validateName('elastname')){
				document.getElementById('elastname').style.background ='#e35152';
				document.getElementById('elastnameError').style.display = "block";
				error++;
			}
			
			if(!validatePhoneNumber('ephone')){
				document.getElementById('ephone').style.background ='#e35152';
				document.getElementById('ephoneError').style.display = "block";
				error++;
			}
			
			/* 
			
			
			if(!validateState('estate')){
				document.getElementById('estate').style.background ='#e35152';
				document.getElementById('estateError').style.display = "block";
				error++;
			}
			*/
			if(!validateEAddress('eaddress')){
				document.getElementById('eaddress').style.background ='#e35152';
				document.getElementById('eaddressError').style.display = "block";
				error++;
			}
			if(!validateECity('ecity')){
				document.getElementById('ecity').style.background ='#e35152';
				document.getElementById('ecityError').style.display = "block";
				error++;
			}
			if(!validateEZip('ezip')) {
				document.getElementById('ezip').style.background ='#e35152';
				document.getElementById('ezipError').style.display = "block";
				error++;
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
	
	<p align="center"><b><u>Class Registration Form</u></b></p>	
	<form action="studentregistration" method="POST" onsubmit="return validateForm()">
	
	
		<br /> <br />
		<b>Account Information:</b> 
		<br /> <br />	
		<fieldset>
			<label for="account">User Name</label>
			<input type="text" name="account" id="account" onblur="validateAccount('account')" />
			<span id="accountError" style="display: none;">You cannot leave User Name empty. </span>
		</fieldset>
		
		<fieldset>
			<label for="pass1">Password</label>
			<input name="pass1" id="pass1" onblur="validatePassword('pass1')"  type="password"/>
			<span id="pass1Error" style="display: none;">You cannot leave password field empty. </span>
		</fieldset>
		
		<fieldset>
			<label for="pass2">Confirm Password</label>
			<input name="pass2" id="pass2" onkeyup="checkPass(); return false;" type="password" />
			<span id="confirmMessage" class="confirmMessage"></span>
			<span id="pass2Error" style="display: none;">You cannot leave password field empty. </span>
		</fieldset>
	
	
		<br /> <br />
		<b>Personal Info:</b> 
		<br /> <br />	
		<fieldset>
			<label for="name">First Name</label>
			<input type="text" name="firstname" id="firstname" onblur="validateName('firstname')" />
			<span id="firstnameError" style="display: none;">Please fill First Name correctly. You can only use alphabetic characters, hyphens and apostrophes</span>
		</fieldset>
		
		<fieldset>
			<label for="name">Last Name</label>
			<input type="text" name="lastname" id="lastname" onblur="validateName('lastname')" />
			<span id="lastnameError" style="display: none;">Please fill Last Name correctly.You can only use alphabetic characters, hyphens and apostrophes</span>
		</fieldset>
		
		<fieldset>
			<label for="email">Email</label>
			<input type="text" name="email" id="email" onblur="validateEmail('email')" />
			<span id="emailError" style="display: none;">Please fill Email correctly.</span>
		</fieldset>
		<fieldset>
			<label for="phone">Phone Number</label>
			<input type="text" name="phone" id="phone" onblur="validatePhoneNumber('phone')" />
			<span id="phoneError" style="display: none;">Please fill Phone Number correctly.It can only be 10 digits and it must be in this format: 1234567890 or XXXXXXXXXX. No + or - signs.</span>
		</fieldset>
		
		<br /> <br /> 
		<b>Home Address:</b> 
		<br /> <br /> 		
		<fieldset>
			<label for="address">Address</label>
			<input type="text" name="address" id="address" onblur="validateAddress('address')" />
			<span id="addressError" style="display: none;">Please fill Street Address correctly.You can only use alphabetic characters, numbers and hyphens</span>
		</fieldset>
		
		<fieldset>
			<label for="city">City</label>
			<input type="text" name="city" id="city" onblur="validateCity('city')" />
			<span id="cityError" style="display: none;">Please fill City correctly.You can only use alphabetic characters</span>
		</fieldset>
		
		<fieldset>
			<label for="state">State</label>
			<select name="state" id=state onblur="validateState('state')">
			<option value="-1">Select one...</option>
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">District of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
			</select>
			<span class="validateError" id="stateError" style="display: none;">You must select State</span>
		</fieldset>	
		
		<fieldset>
			<label for="zip">Zip</label>
			<input type="text" name="zip" id="zip" onblur="validateZip('zip')" />
			<span id="zipError" style="display: none;">Please fill Zip correctly.You can only use numbers</span>
		</fieldset>
		
		<fieldset class="date"> 
		<legend> Date of Birth </legend>
		<label for="month_start">Month</label>
		<select id="month_start" name="month_start" onblur="validateDOB('month_start')">
	<option value="0"> </option>	  
    <option value="1">January</option>      
    <option value="2">February</option>      
    <option value="3">March</option>      
    <option value="4">April</option>      
    <option value="5">May</option>      
    <option value="6">June</option>      
    <option value="7">July</option>      
    <option value="8">August</option>      
    <option value="9">September</option>      
    <option value="10">October</option>      
    <option value="11">November</option>      
    <option value="12">December</option>    
  </select>
	<span class="month_startError" id="month_startError" style="display: none;">You must select Month</span>    -
  <label for="day_start">Day</label>
  <select id="day_start" name="day_start" onblur="validateDOB('day_start')">
	<option value="0"></option>
    <option value="1">1</option>      
    <option value="2">2</option>      
    <option value="3">3</option>      
    <option value="4">4</option>      
    <option value="5">5</option>      
    <option value="6">6</option>      
    <option value="7">7</option>      
    <option value="8">8</option>      
    <option value="9">9</option>      
    <option value="10">10</option>      
    <option value="11">11</option>      
    <option value="12">12</option>      
    <option value="13">13</option>      
    <option value="14">14</option>      
    <option value="15">15</option>      
    <option value="16">16</option>      
    <option value="17">17</option>      
    <option value="18">18</option>      
    <option value="19">19</option>      
    <option value="20">20</option>      
    <option value="21">21</option>      
    <option value="22">22</option>      
    <option value="23">23</option>      
    <option value="24">24</option>      
    <option value="25">25</option>      
    <option value="26">26</option>      
    <option value="27">27</option>      
    <option value="28">28</option>      
    <option value="29">29</option>      
    <option value="30">30</option>      
    <option value="31">31</option>      
  </select>
	<span class="day_startError" id="day_startError" style="display: none;">You must select Day</span>  -
  <label for="year_start">Year</label>
  <select id="year_start" name="year_start"  onblur="validateDOB('year_start')">
	<option value="0"></option>
	<option value="1994">1994</option>
	<option value="1995">1995</option>
	<option value="1996">1996</option> 
	<option value="1997">1997</option> 
	<option value="1998">1998</option> 
	<option value="1999">1999</option> 
	<option value="2000">2000</option> 
	<option value="2001">2001</option> 
	<option value="2002">2002</option> 
	<option value="2003">2003</option> 
	<option value="2004">2004</option> 
	<option value="2005">2005</option> 
	<option value="2006">2006</option> 
	<option value="2007">2007</option> 
	<option value="2008">2008</option> 	
    <option value="2009">2009</option>      
    <option value="2010">2010</option>      
    <option value="2011">2011</option>      
    <option value="2012">2012</option>      
    <option value="2013">2013</option>      
    <option value="2014">2014</option>      
    <option value="2015">2015</option>      
    <option value="2016">2016</option>      
    <option value="2017">2017</option>      
    <option value="2018">2018</option>      
  </select>
  <span class="year_startError" id="year_startError" style="display: none;">You must select Year</span>
  </fieldset> 



	<fieldset>
      <label for="major">Major</label>
      <select name="major" id="major" onblur="validateSelect('major')">
        <option value="0">Please Select One </option>
        <option value="CS">Computer Science</option>
		<option value="ENGL">English</option>
        <option value="MATHS">Mathametics</option>
        <option value="GENED">General Education</option>
      </select>
      <span class="validateError" id="majorError" style="display: none;">You must select your Major</span>
    </fieldset> 
<!-- 	<fieldset>
      <label for="gender">Male or Female?</label>
      <ul>
        <li>
          <input type="radio" name="gender" id="female" value="female" onblur="validateRadio(id)" />
          <label for="left">Female</label>
        </li>
        <li>
          <input type="radio" name="gender" id="male" value="male" onblur="validateRadio(id)" />
          <label for="right">Male</label>
        </li>
      </ul>
      <span class="validateError" id="genderError" style="display: none;">Please select your gender?</span>
    </fieldset> -->
<!-- 		<b>Place of Birth:</b> 
		
		<fieldset>
			<label for="city2">City</label>
			<input type="text" name="city2" id="city2" onblur="validateCity2('city2')" />
			<span id="city2Error" style="display: none;">Please fill City correctly.You can only use alphabetic characters</span>
		</fieldset>
		
		<fieldset>
			<label for="country">Country</label>
			<input type="text" name="country" id="country" onblur="validateCountry('country')" />
			<span id="countryError" style="display: none;">Please fill Country field correctly.You can only use alphabetic characters</span>
		</fieldset> -->
		

	
	<b>Emergency Contact Information:</b> 
	
	<fieldset>
			<label for="ename">First Name</label>
			<input type="text" name="efirstname" id="efirstname" onblur="validateName('efirstname')" />
			<span id="efirstnameError" style="display: none;">Please fill First Name correctly. You can only use alphabetic characters, hyphens and apostrophes</span>
		</fieldset>
		
		<fieldset>
			<label for="ename">Last Name</label>
			<input type="text" name="elastname" id="elastname" onblur="validateName('elastname')" />
			<span id="elastnameError" style="display: none;">Please fill Last Name correctly.You can only use alphabetic characters, hyphens and apostrophes</span>
		</fieldset>
		<fieldset>
			<label for="ephone">Phone</label>
			<input type="text" name="ephone" id="ephone" onblur="validatePhoneNumber('ephone')" />
			<span id="ephoneError" style="display: none;">Please fill Phone Number correctly.It can only be 10 digits and it must be in this format: 1234567890 or XXXXXXXXXX. No + or - signs.</span>
		</fieldset>	
		<fieldset>
			<label for="eaddress">Address</label>
			<input type="text" name="eaddress" id="eaddress" onblur="validateEAddress('eaddress')" />
			<span id="eaddressError" style="display: none;">Please fill Street Address correctly.You can only use alphabetic characters, numbers and hyphens. Or you can leave it empty</span>
		</fieldset>
		
		<fieldset>
			<label for="ecity">City</label>
			<input type="text" name="ecity" id="ecity" onblur="validateECity('ecity')" />
			<span id="ecityError" style="display: none;">Please fill City correctly.You can only use alphabetic characters. Or you can leave it empty</span>
		</fieldset>
		
		<fieldset>
			<label for="estate">State</label>
			<select name="estate" id=estate onblur="validateState('estate')">
			<option value="-1">Select one...</option>
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">District of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
			</select>
			<span class="validateError" id="estateError" style="display: none;">You must select State</span>
		</fieldset>	
		
		<fieldset>
			<label for="ezip">Zip</label>
			<input type="text" name="ezip" id="ezip" onblur="validateEZip('ezip')" />
			<span id="ezipError" style="display: none;">Please fill Zip correctly.You can only use numbers. Or leave completely blank</span>
		</fieldset>
		
		
		<fieldset>
			<input type="submit" id="submit" name="submit" value="Submit" />
		</fieldset>		
	</form>
</body>

</html>