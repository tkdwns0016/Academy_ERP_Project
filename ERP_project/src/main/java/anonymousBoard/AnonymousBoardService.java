package anonymousBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ServiceClass;
import suggestionBoard.SuggestionBoard;

@Service
public class AnonymousBoardService {
	@Autowired
	AnonymousBoardMapper am;
	
	public ServiceClass getService(String page){
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), am.selectList(), 20, am.count());
		return sc;
	}
	public AnonymousBoard showContent(int id) {
		AnonymousBoard ab=am.select(id);
		am.countPlus(ab.getCount()+1,id);
		return ab;
	}
}
