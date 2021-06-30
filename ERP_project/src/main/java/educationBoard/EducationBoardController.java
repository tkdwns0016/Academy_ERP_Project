package educationBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EducationBoardController {
	@Autowired
	EducationBoardService eds;
	
	@GetMapping("/educationBoard")
	public String test(int departmentId) {
		if(departmentId==10) {
			
		}else if(departmentId==20) {
			
		}else if(departmentId==30) {
			
		}else if(departmentId==40){
			
		}else {
			return "main";
		}
		
		return "educationBoard";
	}
	@GetMapping("/list")
	public @ResponseBody List<EducationBoard> getList() {
		
		return eds.getList();
	}
}
