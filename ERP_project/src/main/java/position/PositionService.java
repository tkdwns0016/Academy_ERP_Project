package position;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PositionService {
	@Autowired
	PositionMapper pm;
	
	public Object getPosiont(int positionId) {
		// TODO Auto-generated method stub
		return pm.getName(positionId);
	}

}
