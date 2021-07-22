package noticeBoard;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import anonymousBoard.AnonymousBoard;
import department.Department;
import service.EmplClass;
import service.Employee;
import service.ServiceClass;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardMapper nm;

	public ServiceClass getService(String page,Model model) {
		ServiceClass sc;
		if (page != null) {
			sc = new ServiceClass(Integer.parseInt(page), 15, nm.count());
			model.addAttribute("list", sc);
		} else {
			sc = new ServiceClass(1, 15, nm.count());
			sc.setTablelist(nm.selectList(sc.getFirstRow(),15)); 
			model.addAttribute("list", sc);
		}
		List<String> writer= new ArrayList<String>();
		List<NoticeBoard> nList = (List <NoticeBoard>)sc.getTablelist();
		for(int i=0;i<nList.size();i++) {
			Employee employee=nm.getWriter(nList.get(i).getWriter());
			writer.add("["+nm.getDepartment(employee.getDepartmentId())+"] "+employee.getName());
		}
		
		model.addAttribute("writer", writer);
	
		return sc; 
	}

	public NoticeBoard showContent(int id) {
		NoticeBoard nb = nm.select(id);
		nm.countPlus(nb.getCount() + 1, id);
		return nb;
	}

	public List<NoticeBoard> mainList(HttpSession session) {
		List<NoticeBoard> list=nm.mainList();
		List<String> writer= new ArrayList<String>();
		for(NoticeBoard n:list) {
			Employee empl=nm.noticeName(n.getWriter());
			Department dp=nm.noticeDepart(empl.getDepartmentId());
			writer.add("["+dp.getDepartmentName()+"] "+empl.getName());
		}
		session.setAttribute("noticeWriter", writer);
		return list;
	}

	public void selectOne(int id,Model model) {
		NoticeBoard result = nm.select(id);
		model.addAttribute("result", result);
	}
	
	public int noticeWriter(NoticeBoard noticeBoard) {

		noticeBoard.setWriteDate(LocalDate.now());
		nm.insert(noticeBoard);
		return noticeBoard.getId();
	}

	public void deleteNotice(int id,Model model) {
		
		boolean result;
		
		if(nm.getCommentCount(id)!=0) {

			nm.deleteAllComment(id);
		
		}
		if(nm.getViewCount(id)!=0) {
			nm.deleteViewAll(id);
		}
		result = nm.delete(id);
	
		
		String deleteFolder = "D:/files/noticeBoard/"+id;
	
		File file = new File(deleteFolder);
	
		if(file.exists()) {
			File[] fileList=file.listFiles();
		for(int i = 0; i<fileList.length;i++) {
			fileList[i].delete();
		}
			file.delete();
			
	}
	
		model.addAttribute("resultBoolean", result);
		model.addAttribute("resultType", "삭제");
	}

	public boolean updateNotice(NoticeBoard board) {
		return nm.update(board);
	}


	public int getLastIndex() {
		return nm.getLastIndex()+1;
		
	}
	public int getNextIndex(int id) {
		return nm.getNextIndex(id);
	}
	public int getBeforeIndex(int id) {
		return nm.getBeforeIndex(id);
	}
	public Map<String, Integer> getIndexInfo(int id) {
		Map<String, Integer> index = new HashMap<String, Integer>();
		
		if(nm.getFirstIndex()==id) {
			index.put("beforeIndex",id);
		}else {
			index.put("beforeIndex",nm.getBeforeIndex(id));
		}
		if(nm.getLastIndex()==id) {
			index.put("nextIndex",id);
		}else {
			index.put("nextIndex", nm.getNextIndex(id));
		}
		return index;
	}

	public void noticeWriteService(Model model, NoticeBoard noticeBoard, List<MultipartFile> filename) {
		String imgName= "";
	
		boolean result;
		
		if(!filename.get(0).getOriginalFilename().equals("")) {
			
			for(MultipartFile fileList : filename) {
				
				imgName+=fileList.getOriginalFilename()+",";
			}
		
		noticeBoard.setFilename(imgName);
		
		noticeBoard.setWriteDate(LocalDate.now());
		
		result= nm.insert(noticeBoard);
		
		String uploadFolder = "D:/files/noticeBoard/"+noticeBoard.getId();
		
		File folder = new File(uploadFolder);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				System.out.println("폴더 생성 실패");
			}
		}
		
		for(MultipartFile fileList : filename) {
			
			File uploadFile = new File(uploadFolder, fileList.getOriginalFilename());
	
			
		try {
			fileList.transferTo(uploadFile);
		
		}catch (Exception e){
		
			e.printStackTrace();
		}
		
		}
		}else {
			noticeBoard.setWriteDate(LocalDate.now());
			result= nm.insert(noticeBoard);
		}
		model.addAttribute("resultBoolean", result);
		model.addAttribute("resultType", "작성");
		
	}
	
	public void NoticeComment(HttpSession session, NoticeComment noticeComment) {
		
	}
	
	public List<NoticeComment> getCommentList(int id){
		return nm.getCommentList(id);
	}
	
	public int getCommentCount(int id) {
		return nm.getCommentCount(id);
	}

	public void deleteComment(String deleteNo) {
	
	}

	public void updateNoticeComment(String updateComment, String updateCommentId) {
		if(updateCommentId!=null) {
			 nm.updateComment(updateComment,updateCommentId);
		}
	}

	public void NoticeView(int boardId, HttpServletRequest req) {
		NoticeView nv = new NoticeView(boardId,req.getRemoteAddr());
		if(nm.getOverlapCount(nv).equals("0")) {
			nm.setNoticeViewer(nv);
			nm.setNoticeBoardCount(nm.getViewCount(boardId), boardId);
		}
	}

	public void noticeSearchService(Model model, noticeBoard.NoticeComment comment, int id, String deleteNo,
			String updateCommentId, String updateComment, HttpServletRequest req, HttpSession session) {
		NoticeView nv = new NoticeView(id,req.getRemoteAddr());
		if(nm.getOverlapCount(nv).equals("0")) {
			nm.setNoticeViewer(nv);
			nm.setNoticeBoardCount(nm.getViewCount(id), id);
		}
		NoticeBoard result = nm.select(id);
		if(!(result.getFilename()==null || result.getFilename().equals(""))) {
			
		String[] fileStr=result.getFilename().split(",");
		
		List<String> file= new ArrayList<String>();
		for(String str: fileStr) {
			file.add(str);
		}
		
		model.addAttribute("file", file);
		}
		Map<String, Integer> index = new HashMap<String, Integer>();
		
		if(nm.getFirstIndex()==id) {
			index.put("beforeIndex",id);
		}else {
			index.put("beforeIndex",nm.getBeforeIndex(id));
		}
		if(nm.getLastIndex()==id) {
			index.put("nextIndex",id);
		}else {
			index.put("nextIndex", nm.getNextIndex(id));
		}
		Employee empl=nm.getWriter(result.getWriter());
		EmplClass ec=nm.getECWriter(result.getWriter());
		Department dp =new Department(empl.getDepartmentId(),nm.getDepartment(empl.getDepartmentId()));
		ec.setDepartment(dp);
		model.addAttribute("beforeIndex", index.get("beforeIndex"));
		model.addAttribute("nextIndex", index.get("nextIndex"));
		model.addAttribute("result", result);
		model.addAttribute("writer", ec);
		if(comment.getComment()!=null) {
			Employee employee = (Employee) session.getAttribute("empl");
			
			NoticeComment nc = new NoticeComment(0,comment.getBoardId(), comment.getComment(), employee.getUserId() , employee.getName(),nm.getDepartment(employee.getDepartmentId()),LocalDateTime.parse(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"))));
			boolean insertComment= nm.setComment(nc);
			model.addAttribute("comment", insertComment);
			model.addAttribute("resultType", "작성");
			model.addAttribute("id",id);
			}
		if(deleteNo!=null) {
				boolean deleteComment=nm.deleteComment(deleteNo);
				model.addAttribute("comment",deleteComment);
				model.addAttribute("resultType", "삭제");
				model.addAttribute("id",id);
			}
		if(updateCommentId!=null) {
			 boolean updateCom=nm.updateComment(updateComment,updateCommentId);
			 model.addAttribute("comment",updateCom);
				model.addAttribute("resultType", "수정");
				model.addAttribute("id",id);
		}
		
		model.addAttribute("commentCount", nm.getCommentCount(id));
		model.addAttribute("noticeComment", nm.getCommentList(id));
		
	}

	public void selectNoticeModifyService(int id, Model model) {
		NoticeBoard result = nm.select(id);
			if(!(result.getFilename()==null||result.getFilename().equals(""))) {
						
				String[] fileStr=result.getFilename().split(",");
					
				List<String> file= new ArrayList<String>();
				
				for(String str: fileStr) {
						file.add(str);
				}
					
				model.addAttribute("file", file);
			
			}
			
			model.addAttribute("notice", result);
					
	}

	public void updateNoticeService(NoticeBoard board, Model model, int id, List<MultipartFile> filename1) {
		String fileName="";
		
		String uploadFolder="D:/files/noticeBoard/"+board.getId();
		System.out.println(uploadFolder);
		File folder = new File(uploadFolder);
		
		if(!filename1.get(0).getOriginalFilename().equals("")) {
		
			if(!folder.exists()) {
				folder.mkdir();
			System.out.println("test");
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
		
		if(board.getFilename()!=null) {
		
			board.setFilename(board.getFilename()+","+fileName);
			
		}else {
			board.setFilename(fileName);
		}
	
		
		if(folder.exists()) {
			if(!(board.getFilename()==null||board.getFilename().equals(""))) {
		
				String[] str=board.getFilename().split(",");
				
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
			
		model.addAttribute("resultBoolean", nm.update(board));
		model.addAttribute("resultType", "수정");
		
	}

}
