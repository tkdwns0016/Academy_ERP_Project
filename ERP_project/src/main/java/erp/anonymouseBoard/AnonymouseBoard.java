package erp.anonymouseBoard;

import java.time.LocalDate;

public class AnonymouseBoard {
	private int id;
	private String title;
	private String content;
	private int writer;
	private LocalDate writeDate;
	
	public AnonymouseBoard(int id, String title, String content, int writer, LocalDate writeDate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}

	public AnonymouseBoard() {
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
				 + ", writeDate=" + writeDate + "]";
	}



}
