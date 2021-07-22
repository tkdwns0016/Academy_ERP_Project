package payment;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Payment {

	private int paymentBoardId;
	private String title;
	private String writer;
	private String approver;
	private String payment;
	private String paymentStatus;
	private int userId;
	private String writeDate;
	private String startDate;
	private String endDate;

	public int getPaymentBoardId() {
		return paymentBoardId;
	}

	public void setPaymentBoardId(int paymentBoardId) {
		this.paymentBoardId = paymentBoardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Payment(int paymentBoardId, String title, String writer, String approver, String payment,
			String paymentStatus, int userId, String writeDate, String startDate, String endDate) {
		super();
		this.paymentBoardId = paymentBoardId;
		this.title = title;
		this.writer = writer;
		this.approver = approver;
		this.payment = payment;
		this.paymentStatus = paymentStatus;
		this.userId = userId;
		this.writeDate = writeDate;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Payment() {
		super();
	}

	@Override
	public String toString() {
		return "Payment [paymentBoardId=" + paymentBoardId + ", title=" + title + ", writer=" + writer + ", approver="
				+ approver + ", payment=" + payment + ", paymentStatus=" + paymentStatus + ", userId=" + userId
				+ ", writeDate=" + writeDate + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
