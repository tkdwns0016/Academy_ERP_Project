package welfare;

import java.time.LocalDate;

public class Welfare {
	private int id;
	private int userId;
	private int departmentId;
	private String name;
	private int positionId;
	private String option;
	private LocalDate startDate;
	private LocalDate endDate;
	private String content;
	private String phone;
	private String status;
	
	public Welfare(int id, int userId, int departmentId, String name, int positionId, String option,
			LocalDate startDate, LocalDate endDate, String content, String phone, String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.departmentId = departmentId;
		this.name = name;
		this.positionId = positionId;
		this.option = option;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.phone = phone;
		this.status = status;
	}

	public Welfare() {
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

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Welfare [id=" + id + ", userId=" + userId + ", departmentId=" + departmentId + ", name=" + name
				+ ", positionId=" + positionId + ", option=" + option + ", startDate=" + startDate + ", endDate="
				+ endDate + ", content=" + content + ", phone=" + phone + ", status=" + status + "]";
	}
	
	
}
