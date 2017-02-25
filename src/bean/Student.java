package bean;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Student {
	private int student_id;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String address;
	private String city;
	private String state;
	private int zip;
	private Date reg_date;
	private Date grad_date;
	private int gpa;
	private String major;
	private Date DOB;
	private Date create_dttm;
	private Date update_dttm;
	private ArrayList<EmergencyContact> ec;
	private ArrayList<StudentCourse> sc;	

	
	public ArrayList<EmergencyContact> getEc() {
		return ec;
	}

	public void setEc(ArrayList<EmergencyContact> ec) {
		this.ec = ec;
	}

	public java.sql.Date getOldDate(String string, String string2, String string3) throws ParseException {
		String dateString = string2+"-"+string+"-"+string3;
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
		java.util.Date date = sdf.parse(dateString);
		java.sql.Date sqlDate = new Date(date.getTime());
		return sqlDate;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(password.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			if (hashtext.length() > 26)
				hashtext = hashtext.substring(0, 25);
			this.password = hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		
	}

	public int getGpa() {
		return gpa;
	}
	public void setGpa(int gpa) {
		this.gpa = gpa;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public java.sql.Date getCreate_dttm() {
		return create_dttm;
	}
	public void setCreate_dttm(java.sql.Date date) {
		this.create_dttm = date;
	}
	public java.sql.Date getUpdate_dttm() {
		return update_dttm;
	}
	public void setUpdate_dttm(java.sql.Date update_dttm) {
		this.update_dttm = update_dttm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getGrad_date() {
		return grad_date;
	}
	public void setGrad_date(Date grad_date) {
		this.grad_date = grad_date;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


	public ArrayList<StudentCourse> getSc() {
		return sc;
	}

	public void setSc(ArrayList<StudentCourse> sc) {
		this.sc = sc;
	}


	
}
