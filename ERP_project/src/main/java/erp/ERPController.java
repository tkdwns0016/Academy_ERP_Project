package erp;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class ERPController {
@Autowired
EmployeeService es;
		
	@GetMapping("/join")
	public String join() {
		
		
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
		return "/list";
	}
	
}
