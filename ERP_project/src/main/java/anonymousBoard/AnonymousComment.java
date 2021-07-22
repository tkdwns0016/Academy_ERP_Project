package anonymousBoard;

import java.time.LocalDateTime;

public class AnonymousComment {
	private int id;
	private int boardId;
	private String comment;
	private int writerId;
	private String nickName;
	private LocalDateTime writeDate;

	public AnonymousComment(int id, int boardId, String comment, int writerId, String nickName,
			 LocalDateTime writeDate) {
		super();
		this.id = id;
		this.boardId = boardId;
		this.comment = comment;
		this.writerId = writerId;
		this.nickName = nickName;
		this.writeDate = writeDate;
	}

	public AnonymousComment() {
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "AnonymousComment [id=" + id + ", boardId=" + boardId + ", comment=" + comment + ", writerId=" + writerId
				+ ", nickName=" + nickName + ", writeDate="
				+ writeDate + "]";
	}



}