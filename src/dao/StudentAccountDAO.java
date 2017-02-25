/*
 * Author @faraz
 * Implemented:
 * reads DB
 * inserts DB
 * encrypts password
 * takes registration data
 * then takes picked-classes data
 * then sends to same old youraccount.jsp page that displays some account info and classes picked, only after a person logs in. 
 */

package dao;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.EmergencyContact;
import bean.Student;
import bean.StudentCourse;

public class StudentAccountDAO {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";

	// Database credentials
	static final String DB_USER = "student_portal";
	static final String DB_PASS = "student";

	int student_id_from_seq;
	int emergency_id_from_seq;

	public int validateLogin(String usr, String password) throws SQLException {

		int student_id = 0;
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = this.createDBConnection();
			// STEP 3: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String pass = this.createMD5(password); // DECRYPTING
			String sql = "SELECT STUDENT_ID FROM STUDENT_AUTH WHERE USERNAME = '"
					+ usr + "' AND PASSWORD = '" + pass + "'";

			System.out.println("Executing query - " + sql);

			ResultSet rs = stmt.executeQuery(sql);

			System.out.println("Extracting data from result set...");
			// STEP 4: Extract data from result set
			while (rs.next()) {
				// Retrieve by column name
				student_id = rs.getInt("STUDENT_ID");

				// Display values
				System.out.println("student_id: " + student_id);
			}

		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (stmt != null) {	stmt.close();}
			if (conn != null) {	conn.close();}
		} 
		return student_id;

	}

	public Student returnStudentInfoFromDB(int studentId) throws SQLException {

		Student studentBean = new Student();
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = this.createDBConnection();
			stmt = conn.createStatement();
			
			String sql = "SELECT student_id, first_name, last_name, phone, email, address, city, state, zip,"
					+ " reg_date, grad_date, gpa, major, DOB, create_dttm, update_dttm FROM STUDENT WHERE student_id = "
					+ studentId;
			
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				// Retrieve by column name
				studentBean.setStudent_id(rs.getInt("student_id"));
				studentBean.setFirstName(rs.getNString("first_name")); // =
				// rs.getInt("STUDENT_ID");
				studentBean.setLastName(rs.getNString("last_name"));
				studentBean.setPhone(rs.getNString("phone"));
				studentBean.setEmail(rs.getNString("email"));
				studentBean.setAddress(rs.getNString("address"));
				studentBean.setCity(rs.getNString("city"));
				studentBean.setState(rs.getNString("state"));
				studentBean.setZip(rs.getInt("zip"));
				studentBean.setReg_date(rs.getDate("reg_date"));
				studentBean.setGrad_date(rs.getDate("Grad_date"));
				studentBean.setGpa(rs.getInt("gpa"));
				studentBean.setMajor(rs.getNString("major"));
				studentBean.setDOB(rs.getDate("DOB"));
				studentBean.setState(rs.getNString("state"));
				studentBean.setCreate_dttm(rs.getDate("create_dttm"));
				studentBean.setUpdate_dttm(rs.getDate("update_dttm"));

			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (stmt != null) {	stmt.close();}
			if (conn != null) {	conn.close();}
		}
		return studentBean;
	}

	public void updateLoginDetails(int studentId, String ip) throws SQLException {

		Connection conn = null;
		Statement stmt = null;

		try {
			conn = this.createDBConnection();
			conn.setAutoCommit(false);
			String sql = "UPDATE student_auth SET LAST_LOGIN_DTTM = ?, IP_ADDRESS = ? where STUDENT_ID = ?";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setTimestamp(1, createCurrentTimeStamp());
			preparedStatement.setString(2, ip);
			preparedStatement.setInt(3, studentId);

			preparedStatement.executeUpdate();
			preparedStatement.close();
			conn.commit();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			if(conn!=null) {conn.rollback();}
		} finally {
			if (stmt != null) {	stmt.close();}
			if (conn != null) {	conn.close();}
		}

	}



	public int insertStudentInfoInDB(String ipAddress, Student s) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement preparedStatement = null;

		try {

			conn = this.createDBConnection();
			conn.setAutoCommit(false);
			
			String sql = "select STUDENT_ID_SEQ.nextval from DUAL";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){student_id_from_seq = rs.getInt(1);}
			String emer_id = "select EMERGENCY_ID_SEQ.nextval from DUAL";
			PreparedStatement ps2 = conn.prepareStatement(emer_id);
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()){emergency_id_from_seq = rs2.getInt(1);}
			ps.close();
			ps2.close();
			
			sql = "INSERT INTO student_auth (STUDENT_ID,USERNAME,PASSWORD,LAST_LOGIN_DTTM,CREATE_DTTM,UPDATE_DTTM,IP_ADDRESS) values (?,?,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, student_id_from_seq);
				preparedStatement.setString(2, s.getUsername());
				preparedStatement.setString(3, s.getPassword());
				preparedStatement.setTimestamp(4, createCurrentTimeStamp());
				preparedStatement.setTimestamp(5, createCurrentTimeStamp());
				preparedStatement.setTimestamp(6, createCurrentTimeStamp());
				preparedStatement.setString(7, ipAddress);				
				preparedStatement.executeUpdate();
				System.out.println("Record is inserted into student auth table!");
				sql = "Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,PHONE,EMAIL,ADDRESS,CITY,STATE,ZIP,REG_DATE,GRAD_DATE,GPA,MAJOR,DOB,CREATE_DTTM,UPDATE_DTTM) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(sql); //WHY NO CLOSE? CUZ FOR THAT I WILL HAVE TO TRY { AGAIN AND AGAIN..
				preparedStatement.setInt(1, student_id_from_seq );
				preparedStatement.setString(2, s.getFirstName());
				preparedStatement.setString(3, s.getLastName());
				preparedStatement.setString(4, s.getPhone());
				preparedStatement.setString(5, s.getEmail());
				preparedStatement.setString(6, s.getAddress()); //address
				preparedStatement.setString(7, s.getCity()); //city
				preparedStatement.setString(8, s.getState()); //state				
				preparedStatement.setInt(9, s.getZip()); //zip
				preparedStatement.setDate(10, this.createCurrentDate()); //taken from  http://www.mkyong.com/jdbc/how-to-insert-date-value-in-preparedstatement/
				preparedStatement.setNull(11,java.sql.Types.DATE); // taken from http://stackoverflow.com/questions/8927930/how-to-insert-null-value-into-datetime-column-in-sql-with-java
				preparedStatement.setNull(12, java.sql.Types.INTEGER);
				preparedStatement.setString(13, s.getMajor()); //MAJOR. NEED TO MAKE ONE IN REGISTRATION PAGE THEN READ IT OFF THEN SEND IT HERE IN ARRAY
				preparedStatement.setDate(14, s.getDOB()); //DOB				
				preparedStatement.setTimestamp(15, createCurrentTimeStamp());
				preparedStatement.setTimestamp(16, createCurrentTimeStamp());
				preparedStatement.executeUpdate();
				System.out.println("Record is inserted into student table!");	
				sql = "insert into emergency_contact (emr_contact_id, first_name,last_name,address,city,state,zip,phone,student_id,create_dttm,update_dttm) values(?,?,?,?,?,?,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, emergency_id_from_seq); //Arbitratry ID for emergency contact ID
				preparedStatement.setString(2, s.getEc().get(0).getFirstName());//Student's getfirstname used here
				preparedStatement.setString(3, s.getEc().get(0).getLastName());//Student's getlastname used here
				preparedStatement.setString(4, s.getEc().get(0).getAddress());//eAddress
				preparedStatement.setString(5, s.getEc().get(0).getCity());//eCity
				if(!s.getEc().get(0).getState().equalsIgnoreCase("-1"))
					preparedStatement.setString(6, s.getEc().get(0).getState());//eState 
				else
					preparedStatement.setNull(6, java.sql.Types.VARCHAR);
				if(s.getEc().get(0).getZip()!=0)
					preparedStatement.setInt(7, s.getEc().get(0).getZip()); //eZip
				else
					preparedStatement.setNull(7, java.sql.Types.INTEGER);
				preparedStatement.setLong(8, Long.parseLong(s.getEc().get(0).getPhone())); //ePhone Student's getphone used here
				preparedStatement.setInt(9, student_id_from_seq); 
				preparedStatement.setTimestamp(10, createCurrentTimeStamp());
				preparedStatement.setTimestamp(11, createCurrentTimeStamp());
				preparedStatement.executeUpdate();
				conn.commit();
				System.out.println("Record is inserted into emergency_contact table!");

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				if(conn!=null) {conn.rollback();}
			} finally {
				if (preparedStatement != null) {	preparedStatement.close();}
				if (conn != null) {	conn.close();}
			}
			return student_id_from_seq;

		}

		private Connection createDBConnection() {
			Connection dbConnection = null;
			try {
				Class.forName(JDBC_DRIVER);
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			}
			try {
				dbConnection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
				return dbConnection;
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			return dbConnection;
		}

	

		private java.sql.Date createCurrentDate() {
			java.util.Date today = new java.util.Date();
			return new java.sql.Date(today.getTime());
		}

		private java.sql.Timestamp createCurrentTimeStamp() {

			java.util.Date today = new java.util.Date();
			return new java.sql.Timestamp(today.getTime());

		}

		public String createMD5(String input) {
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] messageDigest = md.digest(input.getBytes());
				BigInteger number = new BigInteger(1, messageDigest);
				String hashtext = number.toString(16);
				if (hashtext.length() > 26)
					hashtext = hashtext.substring(0, 25);
				return hashtext;
			} catch (NoSuchAlgorithmException e) {
				throw new RuntimeException(e);
			}
		}


		public ArrayList<StudentCourse> returnCoursesFromDB(int studentId) throws SQLException {
			ArrayList<StudentCourse> sclist = new ArrayList<StudentCourse>(); 
			StudentCourse courses = null;
			Connection conn = null;
			Statement stmt = null;

			try {
				conn = this.createDBConnection();
				stmt = conn.createStatement();

				String sql = "SELECT * FROM StudentCourse WHERE student_id = "	+ studentId;
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					courses = new StudentCourse();
					courses.setCourseID(rs.getNString("course_id"));
					courses.setGrade('-');
					courses.setSemesterID(rs.getNString("semester_id"));
					sclist.add(courses);
				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				if (stmt != null) {	stmt.close();}
				if (conn != null) {	conn.close();}
			}
			return sclist;
		}

		public boolean checkIfAccountNameExistinDB(String account) throws SQLException {
			Connection conn = null;
			PreparedStatement ps = null;
			int search = 0;
			boolean alpha = false;
			String sql = "SELECT STUDENT_ID FROM STUDENT_AUTH where USERNAME = ?";
			try {
				conn = this.createDBConnection();
				ps = conn.prepareStatement(sql);
				ps.setNString(1, account);
				System.out.println("Executing query - " + sql);
				ResultSet rs = ps.executeQuery();
				System.out.println("Extracting USERNAME from result set...");
				// STEP 4: Extract data from result set
				while (rs.next()) {
					search = rs.getInt("student_id");
					if(search>0)
						alpha = true;
				}
				System.out.println("I HAVE FOUND THIS USERNAME: " + search);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				if (ps != null) {ps.close();}
				if (conn != null) {conn.close();}
			}
			return alpha;
		}

		public void insertCoursesInDB(Student s) throws SQLException {
			ArrayList<StudentCourse> sclist = s.getSc();
			
			
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			try {
				conn = this.createDBConnection();
				conn.setAutoCommit(false);
				for (int i = 0; i < sclist.size(); i++) {
					String sql = "INSERT INTO StudentCourse (STUDENT_ID,COURSE_ID,GRADE,SEMESTER_ID) values (?,?,?,?)";
					preparedStatement = conn.prepareStatement(sql);
					preparedStatement.setInt(1, sclist.get(i).getStudent_id());
					preparedStatement.setString(2, sclist.get(i).getCourseID());
					// System.out.println("sc[i].getCourseID() " +
					// sc[i].getCourseID() );
					preparedStatement.setNull(3, java.sql.Types.CHAR);
					preparedStatement.setString(4, sclist.get(i).getSemesterID());
					preparedStatement.executeUpdate();	
					conn.commit();
				}// end of for
				System.out.println("Record is inserted into StudentCourse table!");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				if(conn!=null) {conn.rollback();}
			} finally {
				if (preparedStatement != null) {preparedStatement.close();}
				if (conn != null) {conn.close();}
			}

			
		}//end of insertcourseindb


	
		
		/*private java.sql.Date getOldDate(String string, String string2,
		String string3) throws ParseException {
	String dateString = string2 + "-" + string + "-" + string3;
	SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	java.util.Date date = sdf.parse(dateString);
	java.sql.Date sqlDate = new Date(date.getTime());
	return sqlDate;
}*/
	
	}
