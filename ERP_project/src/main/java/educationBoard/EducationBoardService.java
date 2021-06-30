package educationBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EducationBoardService {
@Autowired
EducationBoardMepper em;

	public List<EducationBoard> getList(){
		return em.selectList();
	}

}
