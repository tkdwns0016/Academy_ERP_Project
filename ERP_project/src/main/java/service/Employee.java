package service;

import java.time.LocalDate;

public class Employee {
	private int id;
	private int age;
	private String name;
	private String userId;
	private String password;
	private String addressId;
	private String address1;
	private String address2;
	private String phone;
	private String email;
	private LocalDate hireDate;
	private String birthDate;
	private String sex;
	private int departmentId;
	private String imgName;
	private int positionId;
	private long salary;
	private String manager; 
	private String status;
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public int getPositionId() {
		return positionId;
	}
	public void setPositionId(int positionId) {
		this.positionId = positionId;
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
	
	
	
	public Employee() {
		super();
	}
	
	public Employee(int id, int age, String name, String userId, String password, String addressId, String address1,
			String address2, String phone, String email, LocalDate hireDate, String birthDate, String sex,
			int departmentId, String imgName, int positionId, long salary, String manager, String status) {
		super();
		this.id = id;
		this.age = age;
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
		this.departmentId = departmentId;
		this.imgName = imgName;
		this.positionId = positionId;
		this.salary = salary;
		this.manager = manager;
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", age=" + age + ", name=" + name + ", userId=" + userId + ", password="
				+ password + ", addressId=" + addressId + ", address1=" + address1 + ", address2=" + address2
				+ ", phone=" + phone + ", email=" + email + ", hireDate=" + hireDate + ", birthDate=" + birthDate
				+ ", sex=" + sex + ", departmentId=" + departmentId + ", imgName=" + imgName + ", positionId="
				+ positionId + ", salary=" + salary + ", manager=" + manager + ", status=" + status + "]";
	}
	
	
	

	
}