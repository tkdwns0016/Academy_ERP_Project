package suggestionBoard;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import noticeBoard.NoticeBoard;
import service.ServiceClass;

@Controller
public class SuggestionBoardController {

	@Autowired
	SuggestionBoardService ss;
	
	@GetMapping("/suggestion")
	public String suggestion(Model model,String page) {
		ServiceClass list;
		if(page!=null) {
			list=ss.getService(page);
			model.addAttribute("list", list);
		}else {
			list=ss.getService("1");
			model.addAttribute("list", list);
		}
		List<String> writer= new ArrayList<String>();
		List<SuggestionBoard> sList = (List <SuggestionBoard>)list.getTablelist();
		for(int i=0;i<sList.size();i++) {
			writer.add("["+ss.getWriter(sList.get(i).getWriter()).getDepartment().getDepartmentName()+"] "+ss.getWriter(sList.get(i).getWriter()).getName());
		}
		model.addAttribute("writer", writer);
		return "suggestion/suggestion";
	}
	@GetMapping("/suggestionSearch")
	public String suggestionContent(Model model,int id) {
		SuggestionBoard result=ss.showContent(id);
		if(result.getFilename()!=null) {
			
			String[] fileStr=result.getFilename().split(",");
			
			List<String> file= new ArrayList<String>();
			for(String str: fileStr) {
				file.add(str);
			}
			model.addAttribute("file", file);
		}
		model.addAttribute("beforeIndex", ss.getIndexInfo(id).get("beforeIndex"));
		model.addAttribute("nextIndex", ss.getIndexInfo(id).get("nextIndex"));
		model.addAttribute("result", result);
		model.addAttribute("writer", ss.getWriter(result.getWriter()));
		
		
		return "suggestion/suggestionSearch";
	}
	

	@GetMapping("/suggestionWriter")
	public String suggestionWriter() {
		return "suggestion/suggestionWriter";
	}
}
