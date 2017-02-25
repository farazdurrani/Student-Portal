package bean;

public class StudentCourse {
	private int student_id;
	private String courseID;
	private char grade;
	private String semesterID;
	

	public String getCourseID() {
		return courseID;
	}
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public String getSemesterID() {
		return semesterID;
	}
	public void setSemesterID(String semesterID) {
		this.semesterID = semesterID;
	}
	/**
	 * @return the student_id
	 */
	public int getStudent_id() {
		return student_id;
	}
	/**
	 * @param student_id the student_id to set
	 */
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
}
