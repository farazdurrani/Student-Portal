package manager;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.StudentAccountDAO;
import bean.EmergencyContact;
import bean.Student;
import bean.StudentCourse;

public class StudentAccountManager {
	
	StudentAccountDAO studentAccountDAO = new StudentAccountDAO();

	public int validateLogin(String usr, String pass, String ipAddress) throws SQLException {
		
		System.out.println("Validating username and passward entered...");
		
		int studentId = studentAccountDAO.validateLogin(usr, pass);
		
		if(studentId > 0){
			
			studentAccountDAO.updateLoginDetails(studentId, ipAddress);
		}
		
		return studentId;
	}

	public Student getStudentInfo(int studentId) throws SQLException {
		
		Student studentBean = studentAccountDAO.returnStudentInfoFromDB(studentId);

		return studentBean;
	}
	


	public ArrayList<StudentCourse> getCourses(int studentId) throws SQLException {
		
		return studentAccountDAO.returnCoursesFromDB(studentId);
	}

	public boolean checkIfAccountNameExist(String account) throws SQLException {
		
		return studentAccountDAO.checkIfAccountNameExistinDB(account);
	}

	public int insertStudentInfo(String ipAddress, Student s) throws SQLException {
		return studentAccountDAO.insertStudentInfoInDB(ipAddress, s);
	}


	public void insertCourses(Student student) throws SQLException {
		studentAccountDAO.insertCoursesInDB(student);
		
	}
}
