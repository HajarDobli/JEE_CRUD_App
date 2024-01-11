package net.javaguides.usermanagement.model;

import java.util.Date;

public class our_employees {
    private int employeeId;
    private String firstName;
    private String lastName;
    private Date dateOfBirth;
    private String gender;
    private String address;
    private String contactNumber;
    private String email;
    private String jobTitle;
    private String department;
    private Date dateOfJoining;
    private double salary;
    private String status;
    
    
    
  //constructor  
    
	public our_employees(int employeeId, String firstName, String lastName, Date dateOfBirth, String gender,
			String address, String contactNumber, String email, String jobTitle, String department, Date dateOfJoining,
			double salary, String status) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
		this.email = email;
		this.jobTitle = jobTitle;
		this.department = department;
		this.dateOfJoining = dateOfJoining;
		this.salary = salary;
		this.status = status;
	}
	
	// constructor without id

	
	
	

	
	
	
	
	public our_employees(String firstName, String lastName, Date dateOfBirth, String gender, String address,
			String contactNumber, String email, String jobTitle, String department, Date dateOfJoining, double salary,
			 String status) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
		this.email = email;
		this.jobTitle = jobTitle;
		this.department = department;
		this.dateOfJoining = dateOfJoining;
		this.salary = salary;
		this.status = status;
	}

	// getters and setters 
	
	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Date getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    
    

}
