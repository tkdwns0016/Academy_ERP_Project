package payment;

public class Account {

	private int id;
	private String accountName;
	private String accountCode;
	private int accountNumber;
	private String accountOwner;
	private String accountLocation;

	public Account(int id, String accountName, String accountCode, int accountNumber, String accountOwner,
			String accountLocation) {
		super();
		this.id = id;
		this.accountName = accountName;
		this.accountCode = accountCode;
		this.accountNumber = accountNumber;
		this.accountOwner = accountOwner;
		this.accountLocation = accountLocation;
	}

	public Account() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public int getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountOwner() {
		return accountOwner;
	}

	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}

	public String getAccountLocation() {
		return accountLocation;
	}

	public void setAccountLocation(String accountLocation) {
		this.accountLocation = accountLocation;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", accountName=" + accountName + ", accountCode=" + accountCode
				+ ", accountNumber=" + accountNumber + ", accountOwner=" + accountOwner + ", accountLocation="
				+ accountLocation + "]";
	}

}
