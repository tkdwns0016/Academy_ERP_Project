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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;

	public Payment(int paymentBoardId, String title, String writer, String approver, String payment,
			String paymentStatus, int userId, LocalDate writeDate) {
		super();
		this.paymentBoardId = paymentBoardId;
		this.title = title;
		this.writer = writer;
		this.approver = approver;
		this.payment = payment;
		this.paymentStatus = paymentStatus;
		this.userId = userId;
		this.writeDate = writeDate;
	}

	public Payment() {
		super();
	}

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

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Payment [paymentBoardId=" + paymentBoardId + ", title=" + title + ", writer=" + writer + ", approver="
				+ approver + ", payment=" + payment + ", paymentStatus=" + paymentStatus + ", userId=" + userId
				+ ", writeDate=" + writeDate + "]";
	}

}
