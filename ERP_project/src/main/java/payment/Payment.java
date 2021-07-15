package payment;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Payment {
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
	private String division;
	private String detail;
	private String type;
	private String supplyPrice;
	private String VAT;
	private String ammountPrice;
	private String receipt;
	private String remark;
	private String paymentStatus;
	private String userId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;

	public Payment(int id, int paymentBoardId, LocalDate startDate, LocalDate endDate, String accountCompany,
			String writer, String writerDepartment, String approver, String division, String detail, String type,
			String supplyPrice, String vAT, String ammountPrice, String receipt, String remark, String paymentStatus,
			String userId, LocalDate writeDate) {
		super();
		this.id = id;
		this.paymentBoardId = paymentBoardId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.accountCompany = accountCompany;
		this.writer = writer;
		this.writerDepartment = writerDepartment;
		this.approver = approver;
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
	}

	public Payment() {
		super();
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", paymentBoardId=" + paymentBoardId + ", startDate=" + startDate + ", endDate="
				+ endDate + ", accountCompany=" + accountCompany + ", writer=" + writer + ", writerDepartment="
				+ writerDepartment + ", approver=" + approver + ", division=" + division + ", detail=" + detail
				+ ", type=" + type + ", supplyPrice=" + supplyPrice + ", VAT=" + VAT + ", ammountPrice=" + ammountPrice
				+ ", receipt=" + receipt + ", remark=" + remark + ", paymentStatus=" + paymentStatus + ", userId="
				+ userId + ", writeDate=" + writeDate + "]";
	}

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

}