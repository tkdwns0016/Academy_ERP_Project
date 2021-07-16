package anonymousBoard;

public class AnonymousView {
	private int boardId;
	private String viewerIp;

	public AnonymousView(int boardId, String viewerIp) {
		super();
		this.boardId = boardId;
		this.viewerIp = viewerIp;
	}

	public AnonymousView() {
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
		return "AnonymousView [boardId=" + boardId + ", viewerIp=" + viewerIp + "]";
	}


}