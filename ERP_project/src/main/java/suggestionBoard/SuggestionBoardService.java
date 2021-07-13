package suggestionBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import department.Department;
import service.EmplClass;
import service.Employee;
import service.ServiceClass;


@Service
public class SuggestionBoardService {
	@Autowired
	SuggestionBoardMapper sm;
	
	
	public ServiceClass getService(String page){
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), 20, sm.count());
		sc.setTablelist(sm.selectList(sc.getFirstRow(),20));
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

	public EmplClass getWriter(int writer) {
		Map<String, String> writerMap= new HashMap<String, String>();
		Employee empl=sm.getWriter(writer);
		EmplClass ec=sm.getECWriter(writer);
		Department dp =new Department(empl.getDepartmentId(),sm.getDepartment(empl.getDepartmentId()));
		ec.setDepartment(dp);
		
		return ec;
	}
}
