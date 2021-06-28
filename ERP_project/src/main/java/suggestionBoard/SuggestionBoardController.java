package suggestionBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SuggestionBoardController {

	@Autowired
	SuggestionBoardService ss;
	
	@GetMapping("/suggestion")
	public String suggestion(Model model,String page) {
		if(page!=null) {
			model.addAttribute("list", ss.getService(page));
		}else {
			model.addAttribute("list", ss.getService("1"));
		}
		return "suggestion";
	}
	@GetMapping("/suggestionContent")
	public String suggestionContent(Model model,int id) {
		model.addAttribute("suggestionBoard", ss.showContent(id));
		
		return "suggestionContent";
	}
}
