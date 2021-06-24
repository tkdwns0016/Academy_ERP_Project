package erp.suggetionBoard;

import java.time.LocalDate;

public class SuggestionBoard {
	private int id;
	private String title;
	private int writer;
	private String content;
	private LocalDate writeDate;
	
	public SuggestionBoard(int id, String title, int writer, String content, LocalDate writeDate) {
		super();
		this.id = id;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}

	public SuggestionBoard() {
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

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "SuggestionBoard [id=" + id + ", title=" + title + ", writer=" + writer 
				+ ", content=" + content + ", writeDate=" + writeDate + "]";
	}
	
	

}
