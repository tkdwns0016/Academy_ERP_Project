package attendance;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Attendance {
	private int id;
	private int userId;
	private LocalDateTime onTime;
	private LocalDateTime offTime;
	private LocalDate date;
	
	public Attendance(int id, int userId, LocalDateTime onTime, LocalDateTime offTime, LocalDate date) {
		super();
		this.id = id;
		this.userId = userId;
		this.onTime = onTime;
		this.offTime = offTime;
		this.date = date;
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public LocalDateTime getOnTime() {
		return onTime;
	}
	public void setOnTime(LocalDateTime onTime) {
		this.onTime = onTime;
	}
	public LocalDateTime getOffTime() {
		return offTime;
	}
	public void setOffTime(LocalDateTime offTime) {
		this.offTime = offTime;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", userId=" + userId + ", onTime=" + onTime + ", offTime=" + offTime + ", date="
				+ date + "]";
	}

	
	
}
