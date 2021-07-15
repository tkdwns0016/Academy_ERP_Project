package anonymousBoard;

import java.io.File;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import service.ServiceClass;
import suggestionBoard.SuggestionBoard;

@Service
public class AnonymousBoardService {
	@Autowired
	AnonymousBoardMapper am;
	
	public ServiceClass getService(String page){
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), 15, am.count());
		sc.setTablelist(am.selectList(sc.getFirstRow(),15));
		return sc;
	}
	public AnonymousBoard showContent(int id) {
		AnonymousBoard ab=am.select(id);
		return ab;
	}
	public Map<String, Integer> getIndexInfo(int id) {
		Map<String, Integer> index = new HashMap<String, Integer>();
		
		if(am.getFirstIndex()==id) {
			index.put("beforeIndex",id);
		}else {
			index.put("beforeIndex",am.getBeforeIndex(id));
		}
		if(am.getLastIndex()==id) {
			index.put("nextIndex",id);
		}else {
			index.put("nextIndex", am.getNextIndex(id));
		}
		return index;
	}
	public int getLastIndex() {
		return am.getLastIndex()+1;
	}
	public boolean anonymousWriter(AnonymousBoard anonymous) {
		anonymous.setWriteDate(LocalDate.now());
		return am.insert(anonymous);
	}
	public void anonymousWriteService(Model model, AnonymousBoard anonymous, List<MultipartFile> filename,int writer) {
		String imgName= "";
		if(!filename.get(0).getOriginalFilename().equals("")) {
			
			for(MultipartFile fileList : filename) {
				
				imgName+=fileList.getOriginalFilename()+",";
			}
		anonymous.setFilename(imgName);
		anonymous.setWriteDate(LocalDate.now());
		anonymous.setWriter(writer);
		am.insert(anonymous);
		String uploadFolder = "D:/files/anonymousBoard/"+anonymous.getId();
		File folder = new File(uploadFolder);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				System.out.println("폴더 못만들어 이바보야");
			}
		}
		
		for(MultipartFile fileList : filename) {
			System.out.println(fileList.getOriginalFilename());
			
			File uploadFile = new File(uploadFolder, fileList.getOriginalFilename());
	
			
		try {
			fileList.transferTo(uploadFile);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		}
		}else {
			anonymous.setWriteDate(LocalDate.now());
			anonymous.setWriter(writer);
			am.insert(anonymous);
		}
		
	}
	
		
	

	
}
