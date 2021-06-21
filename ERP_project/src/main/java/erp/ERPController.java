package erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/cont")
public class ERPController {

	@GetMapping("/login")
	public String goLogin() {
		return "login1";
	}
}
