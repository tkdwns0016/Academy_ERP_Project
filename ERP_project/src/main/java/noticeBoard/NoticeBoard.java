package noticeBoard;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeBoard {
	private int id;
	private int writer;
	private String title;
	private String content;
	private String password;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;
	private int count;
	private String filename;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "NoticeBoard [id=" + id + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", password=" + password + ", writeDate=" + writeDate + ", count=" + count + ", filename=" + filename
				+ "]";
	}

	public NoticeBoard(int id, int writer, String title, String content, String password, LocalDate writeDate,
			int count, String filename) {
		super();
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.password = password;
		this.writeDate = writeDate;
		this.count = count;
		this.filename = filename;
	}

	public NoticeBoard() {
		super();
	}

}
