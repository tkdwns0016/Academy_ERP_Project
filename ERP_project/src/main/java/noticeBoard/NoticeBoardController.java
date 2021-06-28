package noticeBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeBoardController {
	@Autowired
	NoticeService ns;
	
	@GetMapping("/notice")
	public String notice(Model model,String page) {
			 if(page!=null) {
				 model.addAttribute("list",ns.getService(page));
			 }else {
				 model.addAttribute("list", ns.getService("1"));
			 }
		return "notice";
	}
	
	@GetMapping("/noticeContent")
	public String noticeContent(Model model,int id) {
		 model.addAttribute("notice", ns.showContent(id));
			return "noticeContent";
	}
}
