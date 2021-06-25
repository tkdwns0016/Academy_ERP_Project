package anonymousBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnonymousBoardService {
	@Autowired
	AnonymousBoardMapper am;
	
	public List<AnonymousBoard> getList(){
		return am.selectList();
	}
}
