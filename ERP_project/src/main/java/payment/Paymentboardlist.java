package payment;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Paymentboardlist {
	private int id;
	private int paymentBoardId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;
	private String accountCompany;
	private String writer;
	private String writerDepartment;
	private String approver;
	private int approverUserId;
	private String division;
	private String detail;
	private String type;
	private String supplyPrice;
	private String VAT;
	private String ammountPrice;
	private String receipt;
	private String remark;
	private String paymentStatus;
	private int userId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;
	private String title;
	private Long allAmmountPrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate approverDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPaymentBoardId() {
		return paymentBoardId;
	}

	public void setPaymentBoardId(int paymentBoardId) {
		this.paymentBoardId = paymentBoardId;
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

	public String getAccountCompany() {
		return accountCompany;
	}

	public void setAccountCompany(String accountCompany) {
		this.accountCompany = accountCompany;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterDepartment() {
		return writerDepartment;
	}

	public void setWriterDepartment(String writerDepartment) {
		this.writerDepartment = writerDepartment;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public int getApproverUserId() {
		return approverUserId;
	}

	public void setApproverUserId(int approverUserId) {
		this.approverUserId = approverUserId;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(String supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public String getVAT() {
		return VAT;
	}

	public void setVAT(String vAT) {
		VAT = vAT;
	}

	public String getAmmountPrice() {
		return ammountPrice;
	}

	public void setAmmountPrice(String ammountPrice) {
		this.ammountPrice = ammountPrice;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getAllAmmountPrice() {
		return allAmmountPrice;
	}

	public void setAllAmmountPrice(Long allAmmountPrice) {
		this.allAmmountPrice = allAmmountPrice;
	}

	public LocalDate getApproverDate() {
		return approverDate;
	}

	public void setApproverDate(LocalDate approverDate) {
		this.approverDate = approverDate;
	}

	

	public Paymentboardlist(int id, int paymentBoardId, LocalDate startDate, LocalDate endDate, String accountCompany,
			String writer, String writerDepartment, String approver, int approverUserId, String division, String detail,
			String type, String supplyPrice, String vAT, String ammountPrice, String receipt, String remark,
			String paymentStatus, int userId, LocalDate writeDate, String title, Long allAmmountPrice,
			LocalDate approverDate) {
		super();
		this.id = id;
		this.paymentBoardId = paymentBoardId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.accountCompany = accountCompany;
		this.writer = writer;
		this.writerDepartment = writerDepartment;
		this.approver = approver;
		this.approverUserId = approverUserId;
		this.division = division;
		this.detail = detail;
		this.type = type;
		this.supplyPrice = supplyPrice;
		VAT = vAT;
		this.ammountPrice = ammountPrice;
		this.receipt = receipt;
		this.remark = remark;
		this.paymentStatus = paymentStatus;
		this.userId = userId;
		this.writeDate = writeDate;
		this.title = title;
		this.allAmmountPrice = allAmmountPrice;
		this.approverDate = approverDate;
	}

	
	public Paymentboardlist() {
		super();
	}

	@Override
	public String toString() {
		return "Paymentboardlist [id=" + id + ", paymentBoardId=" + paymentBoardId + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", accountCompany=" + accountCompany + ", writer=" + writer
				+ ", writerDepartment=" + writerDepartment + ", approver=" + approver + ", approverUserId="
				+ approverUserId + ", division=" + division + ", detail=" + detail + ", type=" + type + ", supplyPrice="
				+ supplyPrice + ", VAT=" + VAT + ", ammountPrice=" + ammountPrice + ", receipt=" + receipt + ", remark="
				+ remark + ", paymentStatus=" + paymentStatus + ", userId=" + userId + ", writeDate=" + writeDate
				+ ", title=" + title + ", allAmmountPrice=" + allAmmountPrice + ", approverDate=" + approverDate + "]";
	}

}