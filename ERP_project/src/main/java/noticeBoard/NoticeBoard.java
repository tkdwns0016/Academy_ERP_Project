package noticeBoard;

import java.time.LocalDate;

public class NoticeBoard {
	private int id;
	private int writer;
	private String title;
	private String content;
	private LocalDate date;
	private int count;
	
	public NoticeBoard(int id, int writer, String title, String content, LocalDate date,int count) {
		super();
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.date = date;
		this.count = count;
	}

	public NoticeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
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

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	
	@Override
	public String toString() {
		return "NoticeBoard [id=" + id + ", writer=" + writer + ", title=" + title + ", content=" + content + ", date="
				+ date + ", count=" + count + "]";
	}

	
	
}
