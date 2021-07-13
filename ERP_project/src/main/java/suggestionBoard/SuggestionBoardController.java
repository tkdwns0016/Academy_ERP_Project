package suggestionBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import noticeBoard.NoticeBoard;

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
		return "suggestion/suggestion";
	}
	@GetMapping("/suggestionSearch")
	public String suggestionContent(Model model,int id) {
		SuggestionBoard result=ss.showContent(id);
		model.addAttribute("result", result);
		model.addAttribute("writer", ss.getWriter(result.getWriter()));
		return "suggestion/suggestionSearch";
	}
}
