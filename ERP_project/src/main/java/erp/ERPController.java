package erp;

import java.text.DateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;








@Controller
public class ERPController {
	private static final Logger logger = LoggerFactory.getLogger(ERPController.class);
	@Autowired
EmployeeService es;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@GetMapping("/join")
	public String join(Model model) {
		
		
		return "join";
	}
	@PostMapping("/join")
	public String postJoin(Employee employee,String address2, String birthDate1,String birthDate2) {
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		String classId=str.substring(2,4)+employee.getDepartmentId();
		String userId=es.selectUserId(employee.getDepartmentId());
		if(userId!=null) {
			userId=classId+(Integer.parseInt(userId)+1);
		}else {
			userId=classId+"0001";
		}
		employee.setAddress(employee.getAddress()+address2);
		employee.setBirthDate(birthDate1+birthDate2);
		employee.setUserId(userId);
		employee.setPassword(userId);
		employee.setHireDate(now);
		System.out.println(employee);
		return "list";
	}
	
	@GetMapping("/test")
	public String main() {
		
		
		return "main";
	}
	

	
}
