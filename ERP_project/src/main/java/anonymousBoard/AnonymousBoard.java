package anonymousBoard;

import java.time.LocalDate;

public class AnonymousBoard {
	private int id;
	private String title;
	private String content;
	private int writer;
	private String nickName;
	private LocalDate writeDate;
	
	public AnonymousBoard(int id, String title, String content, int writer,String nickName, LocalDate writeDate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.nickName=nickName;
		this.writeDate = writeDate;
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

	public String getContent() {
		return content;
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
		return "AnonymouseBoard [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", nickName=" + nickName + ", writeDate=" + writeDate + "]";
	}




}