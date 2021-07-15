package suggestionBoard;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class SuggestionBoard {
	private int id;
	private String title;
	private int writer;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;
	private int count;
	private String password;
	private String filename;
	
	public SuggestionBoard(int id, String title, int writer, String content, LocalDate writeDate, int count,
			String password,String filename) {
		super();
		this.id = id;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
		this.count = count;
		this.password = password;
		this.filename = filename;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "SuggestionBoard [id=" + id + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", writeDate=" + writeDate + ", count=" + count + ", password=" + password + ", filename=" + filename
				+ "]";
	}
	
	
}
