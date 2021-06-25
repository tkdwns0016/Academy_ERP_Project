package educationBoard;

import java.time.LocalDateTime;

public class EducationBoard {
	private int id;
	private String title;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private String momo;
	private int departmentId;
	
	public EducationBoard(int id, String title, LocalDateTime startDate, LocalDateTime endDate, String momo,
			int departmentId) {
		super();
		this.id = id;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.momo = momo;
		this.departmentId = departmentId;
	}
	public EducationBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public LocalDateTime getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}
	public LocalDateTime getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}
	public String getMomo() {
		return momo;
	}
	public void setMomo(String momo) {
		this.momo = momo;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	@Override
	public String toString() {
		return "EducationBoard [id=" + id + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", momo=" + momo + ", departmentId=" + departmentId + "]";
	}
	
	
}
