package anonymousBoard;

import java.time.LocalDate;

public class AnonymousBoard {
	private int id;
	private String title;
	private String content;
	private int writer;
	private String nickName;
	private LocalDate writeDate;
	private String password;
	private int count;
	private String filename;
	
	public AnonymousBoard(int id, String title, String content, int writer,String nickName, LocalDate writeDate,String password,int count,String filename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.nickName=nickName;
		this.writeDate = writeDate;
		this.password=password;
		this.count = count;
		this.filename = filename;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public AnonymousBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getContent() {
		return content;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "AnonymousBoard [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", nickName=" + nickName + ", writeDate=" + writeDate + ", password=" + password + ", count=" + count
				+ ", filename=" + filename + "]";
	}


	



}
