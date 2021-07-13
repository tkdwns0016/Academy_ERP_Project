package anonymousBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	 @GetMapping("/anonymousContent")
		public String anonymousContent(Model model,int id) {
		 AnonymousBoard result=as.showContent(id);
		 model.addAttribute("result", result);
		 model.addAttribute("writer", result.getNickName());
			return "anonymous/anonymousSearch";
		}
}
