package suggestionBoard;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public Map<String, Integer> getIndexInfo(int id) {
		Map<String, Integer> index = new HashMap<String, Integer>();
		
		if(sm.getFirstIndex()==id) {
			index.put("beforeIndex",id);
		}else {
			index.put("beforeIndex",sm.getBeforeIndex(id));
		}
		if(sm.getLastIndex()==id) {
			index.put("nextIndex",id);
		}else {
			index.put("nextIndex", sm.getNextIndex(id));
		}
		return index;
	}

	public boolean insert(SuggestionBoard suggestionBoard,List<MultipartFile> filename) {
		boolean result;
		suggestionBoard.setWriteDate(LocalDate.now());
		if(!filename.get(0).getOriginalFilename().equals("")) {
			String imgName="";
			for(MultipartFile m:filename) {
				imgName+=m.getOriginalFilename()+",";
			}
			suggestionBoard.setFilename(imgName);
			result= sm.insert(suggestionBoard);
			String uploadFolder="D:/files/suggestion/"+suggestionBoard.getId();
			File folder = new File(uploadFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			for(MultipartFile m:filename) {
			
				File fileList = new File(uploadFolder,m.getOriginalFilename());
				try {
					m.transferTo(fileList);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
		}else {
			result= sm.insert(suggestionBoard);
		}
		return result;
	}

	public boolean update(SuggestionBoard suggestionBoard) {
		
		return sm.update(suggestionBoard);
	}
	
}
