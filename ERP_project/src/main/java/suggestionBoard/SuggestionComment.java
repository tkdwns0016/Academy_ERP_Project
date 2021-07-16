package suggestionBoard;

import java.time.LocalDateTime;

public class SuggestionComment {
	private int id;
	private int boardId;
	private String comment;
	private int writerId;
	private String writerName;
	private String writerDepartmentName;
	private LocalDateTime writeDate;

	public SuggestionComment(int id, int boardId, String comment, int writerId, String writerName,
			String writerDepartmentName, LocalDateTime writeDate) {
		super();
		this.id = id;
		this.boardId = boardId;
		this.comment = comment;
		this.writerId = writerId;
		this.writerName = writerName;
		this.writerDepartmentName = writerDepartmentName;
		this.writeDate = writeDate;
	}

	public SuggestionComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getWriterDepartmentName() {
		return writerDepartmentName;
	}

	public void setWriterDepartmentName(String writerDepartmentName) {
		this.writerDepartmentName = writerDepartmentName;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "SuggestionComment [id=" + id + ", boardId=" + boardId + ", comment=" + comment + ", writerId="
				+ writerId + ", writerName=" + writerName + ", writerDepartmentName=" + writerDepartmentName
				+ ", writeDate=" + writeDate + "]";
	}



}