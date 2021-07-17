package anonymousBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import noticeBoard.NoticeBoard;
import noticeBoard.NoticeComment;
import suggestionBoard.SuggestionBoard;
import suggestionBoard.SuggestionComment;

@Controller
public class AnonymousBoardController {

	@Autowired
	AnonymousBoardService as;
	
	 @GetMapping("/anonymous")
	 public String anonymous(Model model,String page) {
		 if(page!=null) {
			 model.addAttribute("list",as.getService(page));
		 }else {
			 model.addAttribute("list", as.getService("1"));
		 }
		 return "anonymous/anonymous";
	 }
	 @GetMapping("/anonymousSearch")
		public String anonymousContent(Model model, AnonymousComment comment, int id, String deleteNo,String updateCommentId,String updateComment , HttpServletRequest req,
				HttpSession session) {
		 
		 as.anonymousSearchService(model,comment,id,deleteNo,updateCommentId,updateComment,req,session);
		 if(model.getAttribute("comment")!=null) {
			 return "anonymous/result";
		 }
		 	return "anonymous/anonymousSearch";
		}
	 
	 @GetMapping("/anonymousWriter")
	 	public String annoymousWriter() {
		 
		 return "anonymous/anonymousWriter";
	 }
	 @PostMapping("/anonymousWriter")
		public String postAnonymousWriter(Model model, AnonymousBoard anonymous, List<MultipartFile> filename, int writer) {
			as.anonymousWriteService(model,anonymous,filename,writer);

			return "anonymous/anonymousWriter";

		}
	 @GetMapping("/anonymousfileDownload")
		public String fileDownload(Model model, int id, String filename) {

			
			model.addAttribute("id", id);
			model.addAttribute("filename", filename);
			
			
			return "file/anonymousfileDownload";
		}
	 @PostMapping("/deleteAnonymous")
	 public String delete(Model model, int id) {
		 boolean result=as.deleteAnonymous(id);
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
			return "anonymous/result";
	 }
	 @PostMapping("/anonymousModify")
	 public String updateModify(Model model,int id) {
		 AnonymousBoard result = as.showContent(id);
			if(result.getFilename()!=null) {
				
				if(!result.getFilename().equals("")) {
				
					String[] fileStr=result.getFilename().split(",");
			
					List<String> file= new ArrayList<String>();
					for(String str: fileStr) {
							file.add(str);
					}
			
					model.addAttribute("file", file);
				}
			}
			model.addAttribute("anonymous", result);
		 return "anonymous/anonymousModify";
	 }
	 @PostMapping("anonymousModify1")
	 public String updateResult(Model model, AnonymousBoard board, int id,List<MultipartFile>filename1) {
		 String fileName="";
			String uploadFolder="D:/files/anonymousBoard/"+board.getId();
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
			if(board.getFilename()!=null) {
				board.setFilename(board.getFilename()+","+fileName);
				
			}else {
				board.setFilename(fileName);
			}
		
		
			folder = new File(uploadFolder);
			if(folder.exists()) {
				if(board.getFilename()!=null) {
					
				if(!board.getFilename().equals("")) {
			
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
				
			}
			
			boolean result=as.update(board);
			model.addAttribute("resultBoolean", result);
			model.addAttribute("resultType", "수정");
		 
		 return "anonymous/result";
	 }
	 @GetMapping("/anonymousFiledownload")
	 public String anonyFile(Model model, int id, String filename) {
			model.addAttribute("id", id);
			model.addAttribute("filename", filename);
		 
		 return "file/anonymousfileDownload";
	 }
	 
}
