package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.StudentAccountManager;
import bean.EmergencyContact;
import bean.Student;



/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet(name = "studentregistration", urlPatterns = { "/studentregistration" })
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		StudentAccountManager studentAccountManager = new StudentAccountManager();

	
		
		Student s = new Student();
		EmergencyContact  ec = new EmergencyContact();
		System.out.println("Student Registration servlet do post method called...");
		
		s.setUsername(request.getParameter("account"));
		
		/*
		 * First checking if this username is already taken or not.
		 * if it's taken, go back to register page with the error and register again
		 * if not, then select classes. 
		 */
		
		try {
			if(studentAccountManager.checkIfAccountNameExist(s.getUsername())){
			request.setAttribute("errorMessage", "The username: " + s.getUsername() + " is already taken. Please register again.");
			RequestDispatcher rd1 = request
					.getRequestDispatcher("/register.jsp");
			rd1.forward(request, response);
			} else {
			s.setPassword(request.getParameter("pass1"));
			String ipAddress = request.getHeader("X-FORWARDED-FOR");  
			if (ipAddress == null) {  
			ipAddress = request.getRemoteAddr();  
			}
			s.setFirstName(request.getParameter("firstname"));
			s.setLastName(request.getParameter("lastname"));
			s.setEmail(request.getParameter("email"));
			s.setPhone(request.getParameter("phone"));
			s.setAddress(request.getParameter("address"));
			s.setCity(request.getParameter("city"));
			s.setState(request.getParameter("state"));
			String zip = request.getParameter("zip");
			s.setZip(Integer.parseInt(zip));

			try {
				s.setDOB(s.getOldDate(request.getParameter("month_start"), request.getParameter("day_start"), request.getParameter("year_start")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			s.setMajor(request.getParameter("major"));
			
			//setting emergency contact infor below:
			
			ec.setFirstName(request.getParameter("efirstname"));
			ec.setLastName(request.getParameter("elastname"));
			ec.setPhone(request.getParameter("ephone"));
			ec.setAddress(request.getParameter("eaddress"));
			ec.setCity(request.getParameter("ecity"));
			ec.setState(request.getParameter("estate"));
			String eZip = request.getParameter("ezip");
			if(eZip!=""){ ec.setZip(Integer.parseInt(eZip)); }
			else{ ec.setZip(0); }
			ArrayList<EmergencyContact> eclist = new ArrayList<EmergencyContact>();
			eclist.add(ec);
			s.setEc(eclist);
				
			System.out.println("All data filled on registration page is valid. Now populating database");				
				try {
					s.setStudent_id(studentAccountManager.insertStudentInfo(ipAddress, s));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(s.getStudent_id() > 0){

					request.getSession().setAttribute("student", s);
					
					RequestDispatcher rd = request
							.getRequestDispatcher("/selectclasses.jsp");
					rd.forward(request, response);
					
				}else{
					
					request.setAttribute("errorMessage", "Something went wrong. Try again");
					
					RequestDispatcher rd = request
							.getRequestDispatcher("/register.jsp");
					rd.forward(request, response);
				}
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		} //end of doPost




}
