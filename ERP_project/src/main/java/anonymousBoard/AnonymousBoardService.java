package anonymousBoard;

import java.io.File;
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

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import department.Department;
import noticeBoard.NoticeBoard;
import noticeBoard.NoticeComment;
import noticeBoard.NoticeView;
import service.EmplClass;
import service.Employee;
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
				System.out.println("폴더 생성 불가 ");
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
	public void anonymousSearchService(Model model, AnonymousComment comment, int id, String deleteNo,String updateCommentId,String updateComment , HttpServletRequest req,
			HttpSession session) {
		AnonymousView av=null;
		try {
			av = new AnonymousView(id,Inet4Address.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		if(am.getOverlapCount(av).equals("0")) {
			am.setAnonymousViewer(av);
			am.setAnonumousBoardCount(am.getViewCount(id), id);
		}
		AnonymousBoard result = am.select(id);
		if(result.getFilename()!=null) {
			
		String[] fileStr=result.getFilename().split(",");
		
		List<String> file= new ArrayList<String>();
		for(String str: fileStr) {
			file.add(str);
		}
		
		model.addAttribute("file", file);
		}
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
		model.addAttribute("beforeIndex", index.get("beforeIndex"));
		model.addAttribute("nextIndex", index.get("nextIndex"));
		model.addAttribute("result", result);
		if(comment.getComment()!=null) {
			Employee employee = (Employee) session.getAttribute("empl");
			
			AnonymousComment ac = new AnonymousComment(0,comment.getBoardId(), comment.getComment(), employee.getUserId() , employee.getName(),am.getDepartment(employee.getDepartmentId()),LocalDateTime.parse(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"))));
			 model.addAttribute("comment", am.setComment(ac));
			 model.addAttribute("resultType", "작성");
			 model.addAttribute("id",id);
			}
		if(deleteNo!=null) {
			 model.addAttribute("comment", am.deleteComment(deleteNo));
			 model.addAttribute("resultType", "삭제");
			 model.addAttribute("id",id);
			}
		if(updateCommentId!=null) {
			 model.addAttribute("comment", am.updateComment(updateComment,updateCommentId));
			 model.addAttribute("resultType", "수정");
			 model.addAttribute("id",id);
		}
		
		model.addAttribute("commentCount", am.getCommentCount(id));
		model.addAttribute("anonymousComment", am.getCommentList(id));	
		model.addAttribute("result", result);
		model.addAttribute("writer", result.getNickName());
	}
	public boolean deleteAnonymous(int id) {
		
		return am.delete(id);
	}
	public boolean update(AnonymousBoard board) {
	
		return am.update(board);
	}
		
}
	
		
	

	

