package noticeBoard;

public class NoticeView {
	private int boardId;
	private String viewerIp;

	public NoticeView(int boardId, String viewerIp) {
		super();
		this.boardId = boardId;
		this.viewerIp = viewerIp;
	}

	public NoticeView() {
		super();
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getViewerIp() {
		return viewerIp;
	}

	public void setViewerIp(String viewerIp) {
		this.viewerIp = viewerIp;
	}

	@Override
	public String toString() {
		return "NoticeView [boardId=" + boardId + ", viewerIp=" + viewerIp + "]";
	}

}