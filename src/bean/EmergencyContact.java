package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class EmergencyContact {
	private String firstName;
	private String lastName;
	private String phone;
	private String address;
	private String city;
	private String state;
	private int zip;
	private int emergencyContactID;

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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	
	public Timestamp getCreate_dttm() {
		return create_dttm;
	}
	public void setCreate_dttm(Timestamp create_dttm) {
		this.create_dttm = create_dttm;
	}
	public Timestamp getUpdate_dttm() {
		return update_dttm;
	}
	public void setUpdate_dttm(Timestamp update_dttm) {
		this.update_dttm = update_dttm;
	}
	/**
	 * @return the emergencyContactID
	 */
	public int getEmergencyContactID() {
		return emergencyContactID;
	}
	/**
	 * @param emergencyContactID the emergencyContactID to set
	 */
	public void setEmergencyContactID(int emergencyContactID) {
		this.emergencyContactID = emergencyContactID;
	}
	private Timestamp create_dttm;
	private Timestamp update_dttm;
	
}
