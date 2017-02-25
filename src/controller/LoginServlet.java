package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.StudentCourse;
import manager.StudentAccountManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/studentlogin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Student login servelt do post method called...");
		
		String usr = request.getParameter("username");
		String pass = request.getParameter("password");
		String ipAddress = request.getHeader("X-FORWARDED-FOR");  
		if (ipAddress == null) {  
		ipAddress = request.getRemoteAddr();  
		}
		
		StudentAccountManager studentAccountManager = new StudentAccountManager();
		
		int studentId = 0;
		try {
			studentId = studentAccountManager.validateLogin(usr, pass, ipAddress);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		if(studentId > 0){
			
			System.out.println("Login is valid, now populating the student bean");			
			
			Student studentBean = null;
			try {
				studentBean = studentAccountManager.getStudentInfo(studentId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ArrayList<StudentCourse> sclist = new ArrayList<StudentCourse>(); 
			try {
				sclist = studentAccountManager.getCourses(studentId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("placing studentbean and courses in the session object...");			
			
			request.getSession().setAttribute("student", studentBean);
			request.getSession().setAttribute("courses", sclist);
			RequestDispatcher rd = request
					.getRequestDispatcher("/youraccount.jsp");
			rd.forward(request, response);
			
		}else{
			
			request.setAttribute("errorMessage", "Invalid username or password");
			
			RequestDispatcher rd = request
					.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
	}

}
