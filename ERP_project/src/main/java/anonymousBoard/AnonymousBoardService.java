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
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), 20, am.count());
		sc.setTablelist(am.selectList(sc.getFirstRow(),20));
		return sc;
	}
	public AnonymousBoard showContent(int id) {
		AnonymousBoard ab=am.select(id);
		return ab;
	}
}
