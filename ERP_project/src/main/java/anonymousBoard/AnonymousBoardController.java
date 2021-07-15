package anonymousBoard;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import noticeBoard.NoticeBoard;

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
		public String anonymousContent(Model model,int id) {
		 AnonymousBoard result=as.showContent(id);
		 if(result.getFilename()!=null) {
				
				String[] fileStr=result.getFilename().split(",");
				
				List<String> file= new ArrayList<String>();
				for(String str: fileStr) {
					file.add(str);
				}
				model.addAttribute("file", file);
			}
			model.addAttribute("beforeIndex", as.getIndexInfo(id).get("beforeIndex"));
			model.addAttribute("nextIndex", as.getIndexInfo(id).get("nextIndex"));
			model.addAttribute("result", result);
			model.addAttribute("writer", result.getNickName());
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
}
