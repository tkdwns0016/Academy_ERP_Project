package suggestionBoard;

public class SuggestionView {
	private int boardId;
	private String viewerIp;

	public SuggestionView(int boardId, String viewerIp) {
		super();
		this.boardId = boardId;
		this.viewerIp = viewerIp;
	}

	public SuggestionView() {
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
		return "SuggestionView [boardId=" + boardId + ", viewerIp=" + viewerIp + "]";
	}

}