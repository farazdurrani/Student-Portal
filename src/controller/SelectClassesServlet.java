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

import manager.StudentAccountManager;
import bean.Student;
import bean.StudentCourse;

/**
 * Servlet implementation class selectclasses
 */
@WebServlet("/selectclasses")
public class SelectClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int studentID =Integer.parseInt(request.getParameter("studentid"));
		
		Student student =(Student) request.getSession().getAttribute("student");
		
		StudentAccountManager studentAccountManager = new StudentAccountManager();
		
		String selectedCourses[] = {request.getParameter("english"),request.getParameter("up"), request.getParameter("ewc"), request.getParameter("math180"), 
				request.getParameter("math181"),request.getParameter("cs440"),request.getParameter("cs401"),request.getParameter("cs385"), request.getParameter("cs301"),
				request.getParameter("cs441"), request.getParameter("mcs425")};
		
		ArrayList<String> list = this.getRidOfNulls(selectedCourses);
		
		ArrayList<StudentCourse> sclist = new ArrayList<StudentCourse>();
		
		StudentCourse sc = null;
		for(int i = 0; i < list.size(); i++){
		sc = new StudentCourse();
		sc.setStudent_id(student.getStudent_id());
		sc.setCourseID((String)list.get(i));
		sc.setSemesterID("SP 12"); // setting some arbitrary semester	
		sclist.add(sc);		
		}
		student.setSc(sclist);
		System.out.println("Here this is new changes: " + student.getUsername() + " " + student.getStudent_id() + " " + student.getSc().get(0).getCourseID());
		
		
		
		try {
			studentAccountManager.insertCourses(student);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		System.out.println("Classes you chose are valid");	
		
		request.getSession().setAttribute("courses", sc);
		
		RequestDispatcher rd = request
				.getRequestDispatcher("/classeshavebeenselected.jsp");
		rd.forward(request, response);
		
		
	}
	private ArrayList<String> getRidOfNulls(String[] s) {
		ArrayList<String> list = new ArrayList<String>();
		for (int i = 0; i < s.length; i++){
			if(s[i]!=null){
				list.add(s[i]);
			}				
		}
		return list;
		
	}

}
