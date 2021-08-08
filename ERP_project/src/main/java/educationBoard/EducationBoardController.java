package educationBoard;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.Employee;

@Controller
public class EducationBoardController {
	@Autowired
	EducationBoardService eds;
	
	@GetMapping("/educationBoard")
	public String educationBoard(Model model, int departmentId) {
		model.addAttribute("departmentId",departmentId);
		if(departmentId==10) {
			model.addAttribute("edu", "경영팀 교육 일정");
		}
		if(departmentId==20) {
			model.addAttribute("edu", "개발팀 교육 일정");
		}
		if(departmentId==30) {
			model.addAttribute("edu", "인사팀 교육 일정");
		}
		if(departmentId==40) {
			model.addAttribute("edu", "영업팀 교육 일정");
		}
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
	public String CRUD(Model model, EducationBoard educationBoard,String button,HttpSession session) {
		
		eds.getCRUDEdu(educationBoard, button,(Employee)session.getAttribute("empl"),model);
		
		return "education/result";
	}
	
	@GetMapping("/test")
	public String test() {
	
		return "test";
	
	}
	
	
}
