package suggestionBoard;

import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import department.Department;
import service.EmplClass;
import service.Employee;
import service.ServiceClass;


@Service
public class SuggestionBoardService {
	@Autowired
	SuggestionBoardMapper sm;
	
	
	public void getService(String page,Model model){
		ServiceClass list;
		if(page!=null) {
			list=new ServiceClass(Integer.parseInt(page), 15, sm.count());
		
			list.setTablelist(sm.selectList(list.getFirstRow(),list.getPagePerCount()));
			
			model.addAttribute("list", list);
		}else {
			
			list=new ServiceClass(1, 15, sm.count());
			
			list.setTablelist(sm.selectList(list.getFirstRow(),list.getPagePerCount()));
			
			model.addAttribute("list", list);
		}
		
		List<String> writer= new ArrayList<String>();
		
		List<SuggestionBoard> sList = (List <SuggestionBoard>)list.getTablelist();
		
		for(int i=0;i<sList.size();i++) {
		
			Employee empl=sm.getWriter(sList.get(i).getWriter());
			
			Department dp =new Department(empl.getDepartmentId(),sm.getDepartment(empl.getDepartmentId()));
			
			writer.add("["+dp.getDepartmentName()+"] "+empl.getName());
		}
		
		model.addAttribute("writer", writer);
	}
	
	public SuggestionBoard showContent(int id) {
		
		SuggestionBoard sb=sm.select(id); 
		return sm.select(id);
	}
	public List<SuggestionBoard> mainList(HttpSession session){
		List<SuggestionBoard> list=sm.mainList();
		List<String> suggestionWriter= new ArrayList<String>(); 
		
		for(SuggestionBoard s:list) {
			Employee empl=sm.suggestionName(s.getWriter());
			Department dp=sm.suggestionDepart(empl.getDepartmentId());
			suggestionWriter.add("["+dp.getDepartmentName()+"] "+empl.getName());
		}
		session.setAttribute("suggestionWriter", suggestionWriter);
		return list;
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

	public void insert(Model model,SuggestionBoard suggestionBoard,List<MultipartFile> filename) {
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
			model.addAttribute("resultBoolean", result);
			model.addAttribute("resultType","작성");
	}

	public boolean update(SuggestionBoard suggestionBoard) {
		
		return sm.update(suggestionBoard);
	}

	public void suggestionSearchService(Model model, SuggestionComment comment, int id, String deleteNo,
			String updateCommentId, String updateComment, HttpServletRequest req, HttpSession session) {
		SuggestionView sv=null;
		try {
			sv = new SuggestionView(id,Inet4Address.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		if(sm.getOverlapCount(sv).equals("0")) {
			sm.setSuggestionViewer(sv);
			sm.setSuggestionBoardCount(sm.getViewCount(id), id);
		}
		SuggestionBoard result = sm.select(id);
		if(result.getFilename()!=null) {
			
		String[] fileStr=result.getFilename().split(",");
		
		List<String> file= new ArrayList<String>();
		for(String str: fileStr) {
			file.add(str);
		}
		
		model.addAttribute("file", file);
		}
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
		Employee empl=sm.getWriter(result.getWriter());
		EmplClass ec=sm.getECWriter(result.getWriter());
		Department dp =new Department(empl.getDepartmentId(),sm.getDepartment(empl.getDepartmentId()));
		ec.setDepartment(dp);
		model.addAttribute("beforeIndex", index.get("beforeIndex"));
		model.addAttribute("nextIndex", index.get("nextIndex"));
		model.addAttribute("result", result);
		model.addAttribute("writer", ec);
		if(comment.getComment()!=null) {
			Employee employee = (Employee) session.getAttribute("empl");
			
			SuggestionComment sc = new SuggestionComment(0,comment.getBoardId(), comment.getComment(), employee.getUserId() , employee.getName(),sm.getDepartment(employee.getDepartmentId()),LocalDateTime.parse(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"))));
			 model.addAttribute("comment", sm.setComment(sc));
			 model.addAttribute("resultType", "작성");
			 model.addAttribute("id",id);
			}
		if(deleteNo!=null) {
			 model.addAttribute("comment", sm.deleteComment(deleteNo));
			 model.addAttribute("resultType", "삭제");
			 model.addAttribute("id",id);
			}
		if(updateCommentId!=null) {
			 model.addAttribute("comment", sm.updateComment(updateComment,updateCommentId));
			 model.addAttribute("resultType", "수정");
			 model.addAttribute("id",id);
		}
		
		model.addAttribute("commentCount", sm.getCommentCount(id));
		model.addAttribute("suggestionComment", sm.getCommentList(id));	
		model.addAttribute("result", result);
	}
	
	public void deleteSuggestion(Model model, int id) {
		
		if(sm.getCommentCount(id)!=0) {
			sm.deleteAllComment(id);
		}
		if(sm.getViewCount(id)!=0) {
			sm.deleteAllView(id);
		}
		String deleteFolder = "D:/files/suggestionBoard/"+id;
		File file = new File(deleteFolder);
		if(file.exists()) {
			File[] fileList=file.listFiles();
			for(int i = 0; i<fileList.length;i++) {
				fileList[i].delete();
			}
				file.delete();
		}
		model.addAttribute("resultBoolean",sm.delete(id));
		model.addAttribute("resultType","삭제");
	}

	public void suggestionModifyView(int id, Model model) {
		SuggestionBoard result = sm.select(id);
				
		if(!(result.getFilename()==null||result.getFilename().equals(""))) {
				
				String[] fileStr=result.getFilename().split(",");
						
				List<String> file= new ArrayList<String>();
				
				for(String str: fileStr) {
							file.add(str);
				}
			model.addAttribute("file", file);
		}
				
			model.addAttribute("suggestion", result);
				
	}

	public void suggestionModifyService(
			Model model,int id ,SuggestionBoard suggestionBoard,List<MultipartFile>filename1) {
	
		String fileName="";
		
		suggestionBoard.setId(id);
		
		String uploadFolder="D:/files/suggestionBoard/"+suggestionBoard.getId();
		
		File folder = new File(uploadFolder);
		
		if(!filename1.get(0).getOriginalFilename().equals("")) {
		
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			for(MultipartFile m:filename1) {
				
				File fileList= new File(uploadFolder,m.getOriginalFilename());
			
				try {
				
					m.transferTo(fileList);
				
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		
			
			for( MultipartFile m:filename1) {
				fileName+=m.getOriginalFilename()+",";
			}
		}
		if(!(suggestionBoard.getFilename()==null||suggestionBoard.getFilename().equals(""))) {
			suggestionBoard.setFilename(suggestionBoard.getFilename()+","+fileName);
			
		}else {
			suggestionBoard.setFilename(fileName);
		}
	
	
		folder = new File(uploadFolder);
		if(folder.exists()) {
			if(!suggestionBoard.getFilename().equals("")) {
		
				String[] str=suggestionBoard.getFilename().split(",");
				File[] fileList=folder.listFiles();
				List<String> list= new ArrayList<String>();
			
				for(int i =0; i<str.length;i++) {
					list.add(str[i]);
				}
				
				for(int i=0; i<fileList.length;i++) {
					if(!list.contains(fileList[i].getName())) {
						fileList[i].delete();
					}
				}

			}else {
			
					File[] fileList=folder.listFiles();
					for(int i=0; i<fileList.length;i++) {
						fileList[i].delete();
					
					}
					folder.delete();
				
					
						
				}
			}
			model.addAttribute("resultBoolean",sm.update(suggestionBoard));
			model.addAttribute("resultType", "수정");
		
	}
	
}
