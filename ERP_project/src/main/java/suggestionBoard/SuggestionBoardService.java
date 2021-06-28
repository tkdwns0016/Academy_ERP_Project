package suggestionBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.ServiceClass;


@Service
public class SuggestionBoardService {
	@Autowired
	SuggestionBoardMapper sm;
	
	
	public ServiceClass getService(String page){
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), sm.selectList(), 20, sm.count());
		return sc;
	}
	
	public SuggestionBoard showContent(int id) {
		
		SuggestionBoard sb=sm.select(id); 
		sm.countPlus(sb.getCount()+1,id);
		return sm.select(id);
	}
	public List<SuggestionBoard> mainList(){
		return sm.mainList();
	}
}
