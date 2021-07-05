package educationBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EducationBoardController {
	@Autowired
	EducationBoardService eds;
	
	@GetMapping("/educationBoard")
	public String educationBoard(Model model, int departmentId) {
		model.addAttribute("departmentId",departmentId);
		
		return "education/educationBoard";
	}
	@GetMapping("/mainlist")
	public @ResponseBody List<EducationBoard> getMainList() {
		
		return eds.getList();
	}
	@GetMapping("/list")
	public @ResponseBody List<EducationBoard> getList(int departmentId) {
		
		return eds.getBoardWithDepatmentId(departmentId);
	}
	@PostMapping("/educationBoard")
	public String CRUD(Model model, EducationBoard educationBoard,String button) {
		System.out.println(button);
		System.out.println(educationBoard);
		model.addAttribute("departmentId",educationBoard.getDepartmentId());
		return "education/educationBoard";
	}
}
