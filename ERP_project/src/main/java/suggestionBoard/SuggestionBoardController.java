package suggestionBoard;

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
import service.ServiceClass;

@Controller
public class SuggestionBoardController {

	@Autowired
	SuggestionBoardService ss;
	
	@GetMapping("/suggestion")
	public String suggestion(Model model,String page) {
		ss.getService(page,model);
		
		return "suggestion/suggestion";
	}
	
	@GetMapping("/suggestionSearch")
	public String suggestionContent(
			Model model, SuggestionComment comment, int id, String deleteNo,
			String updateCommentId,String updateComment , HttpServletRequest req,
			HttpSession session) {
		
		ss.suggestionSearchService(model,comment,id,deleteNo,updateCommentId,updateComment,req,session);
		
		if(model.getAttribute("comment")!=null) {
			return "suggestion/result";
		}
		
		return "suggestion/suggestionSearch"; 
	}
	
	@PostMapping("suggestionModify")
	public String suggestionModify(Model model, int id) {
		
		ss.suggestionModifyView(id,model);
		
		return "suggestion/suggestionModify";
	}
	
	@PostMapping("/suggestionModify1")
	public String suggestionModify1(Model model,int id ,SuggestionBoard suggestionBoard,List<MultipartFile>filename1) {
		
		ss.suggestionModifyService(model,id,suggestionBoard,filename1);
		
		return "suggestion/result";
		
	}

	@GetMapping("/suggestionWriter")
	public String suggestionWriter() {
		
		return "suggestion/suggestionWriter";
	}
	
	@PostMapping("/suggestionWriter")
	public String postWriter(Model model,SuggestionBoard suggestionBoard,List<MultipartFile> filename) {
		
		ss.insert(model,suggestionBoard,filename);
		
		return "suggestion/result";
	}
	
	@PostMapping("/deleteSuggestion")
	public String deleteSuggestion(Model model,int id) {
		
		ss.deleteSuggestion(model,id);
		
		return "suggestion/result";
	}
	
	@GetMapping("/suggestionFiledownload")
	public String fileDownload(Model model, int id, String filename) {

		
		model.addAttribute("id", id);
		model.addAttribute("filename", filename);
		
		
		return "file/suggestionFiledownload";
	}
}
