package service;

import java.time.LocalDate;


import org.springframework.format.annotation.DateTimeFormat;

import department.Department;
import position.Position;

public class EmplClass {
	private int id;
	private String name;
	private int userId;
	private String password;
	private String addressId;
	private String address1;
	private String address2;
	private String phone;
	private String email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate hireDate;
	private String birthDate;
	private String sex;
	private Department department;
	private String imgName;
	private Position position;
	private long salary;
	private String manager; 
	private String status;

	public EmplClass(int id, String name, int userId, String password, String addressId, String address1,
			String address2, String phone, String email, LocalDate hireDate, String birthDate, String sex,
			Department department, String imgName, Position position, long salary, String manager, String status) {
		super();
		this.id = id;
		this.name = name;
		this.userId = userId;
		this.password = password;
		this.addressId = addressId;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.email = email;
		this.hireDate = hireDate;
		this.birthDate = birthDate;
		this.sex = sex;
		this.department = department;
		this.imgName = imgName;
		this.position = position;
		this.salary = salary;
		this.manager = manager;
		this.status = status;
	}
	public EmplClass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
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
	public LocalDate getHireDate() {
		return hireDate;
	}
	public void setHireDate(LocalDate hireDate) {
		this.hireDate = hireDate;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public long getSalary() {
		return salary;
	}
	public void setSalary(long salary) {
		this.salary = salary;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EmplClass [id=" + id + ", name=" + name + ", userId=" + userId + ", password=" + password
				+ ", addressId=" + addressId + ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone
				+ ", email=" + email + ", hireDate=" + hireDate + ", birthDate=" + birthDate + ", sex=" + sex
				+ ", department=" + department + ", imgName=" + imgName + ", position=" + position + ", salary="
				+ salary + ", manager=" + manager + ", status=" + status + "]";
	}
	
	
}
