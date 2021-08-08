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
	
		 as.getService(page,model);
		 
		 return "anonymous/anonymous";
	 }
	 
	 @GetMapping("/anonymousSearch")
		public String anonymousContent(Model model, AnonymousComment comment, int id,
				String deleteNo,String updateCommentId,String updateComment , HttpServletRequest req,
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
		public String postAnonymousWriter(
				Model model, AnonymousBoard anonymous, List<MultipartFile> filename, int writer) {
		 
			as.anonymousWriteService(model,anonymous,filename,writer);

			return "anonymous/result";

		}
	 
	 @GetMapping("/anonymousfileDownload")
		public String fileDownload(Model model, int id, String filename) {
			model.addAttribute("id", id);
			model.addAttribute("filename", filename);
		
			return "file/anonymousfileDownload";
		}
	 
	 @PostMapping("/deleteAnonymous")
	 public String delete(Model model, int id) {
		 
		 as.deleteAnonymous(id,model);
		 
		 return "anonymous/result";
	 }
	 
	 
	 @PostMapping("/anonymousModify")
	 public String updateModify(Model model,int id) {
	 
		 as.showContent(id,model);
		
		 return "anonymous/anonymousModify";
	 }
	 
	 @PostMapping("anonymousModify1")
	 public String updateResult(Model model, AnonymousBoard board, int id,List<MultipartFile>filename1) {
		
		as.getAnonymousModifyService(model,board,id,filename1);
		
		return "anonymous/result";
	 }
	 @GetMapping("/anonymousFiledownload")
	 public String anonyFile(Model model, int id, String filename) {
			
		 	model.addAttribute("id", id);
			model.addAttribute("filename", filename);
		 
		 return "file/anonymousfileDownload";
	 }
	 
}
