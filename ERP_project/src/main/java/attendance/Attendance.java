package attendance;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;

public class Attendance {
	private int id;
	private String name;
	private String department;
	private String position;
	private String workType;
	@DateTimeFormat(pattern = "HH:mm:dd")
	private LocalTime workStart;
	@DateTimeFormat(pattern = "HH:mm:dd")
	private LocalTime workEnd;
	@DateTimeFormat(pattern = "HH:mm:dd")
	private LocalTime workingTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate workDate;
	private int userId;
	
	public Attendance(int id, String name, String department, String position, String workType, LocalTime workStart,
			LocalTime workEnd, LocalTime workingTime, LocalDate workDate,int userId) {
		super();
		this.id = id;
		this.name = name;
		this.department = department;
		this.position = position;
		this.workType = workType;
		this.workStart = workStart;
		this.workEnd = workEnd;
		this.workingTime = workingTime;
		this.workDate = workDate;
		this.userId = userId;
	}
	public Attendance() {
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public LocalTime getWorkStart() {
		return workStart;
	}
	public void setWorkStart(LocalTime workStart) {
		this.workStart = workStart;
	}
	public LocalTime getWorkEnd() {
		return workEnd;
	}
	public void setWorkEnd(LocalTime workEnd) {
		this.workEnd = workEnd;
	}
	public LocalTime getWorkingTime() {
		return workingTime;
	}
	public void setWorkingTime(LocalTime workingTime) {
		this.workingTime = workingTime;
	}
	public LocalDate getWorkDate() {
		return workDate;
	}
	public void setWorkDate(LocalDate workDate) {
		this.workDate = workDate;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", name=" + name + ", department=" + department + ", position=" + position
				+ ", workType=" + workType + ", workStart=" + workStart + ", workEnd=" + workEnd + ", workingTime="
				+ workingTime + ", workDate=" + workDate + ", userId=" + userId + "]";
	}
	
	
	
		
}
