package erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ERPController {

		
	@GetMapping("/join")
	public String join() {
		
		
		return "EmpForm";
	}
}
