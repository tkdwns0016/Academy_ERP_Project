package position;

public class Position {
	private int positionId;
	private String position;
	
	public Position(int positionId, String position) {
		super();
		this.positionId = positionId;
		this.position = position;
	}

	public Position() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Position [positionId=" + positionId + ", position=" + position + "]";
	}
	
	
}
