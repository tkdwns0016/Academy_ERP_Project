package service;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import anonymousBoard.AnonymousBoard;
import anonymousBoard.AnonymousBoardService;
import educationBoard.EducationBoard;
import educationBoard.EducationBoardService;
import noticeBoard.NoticeService;
import suggestionBoard.SuggestionBoard;
import suggestionBoard.SuggestionBoardService;




@Controller
public class ERPController {
	@Autowired
	EmployeeService es;
	@Autowired
	NoticeService ns;
	@Autowired
	SuggestionBoardService ss;
	@Autowired
	EducationBoardService eds;
	
	
	@GetMapping("/myInfo")
	public String myInfo(Model model) {
		
		return "myInfo";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	@GetMapping("/login")
	public String loginCheck() {
		return "login"; 
	}
	@PostMapping("/login")
	public String login(Model model ,HttpSession session, int userId, String password) {
		if(es.login(userId, password)!=null) {
			session.setAttribute("empl",es.login(userId, password));
			Employee em=es.login(userId, password);
			return "main";
				
			
		}else {
			model.addAttribute("result", true);
			return "login";
		}
		
	
	}

	@GetMapping("/join")
	public String join(Model model) {
		return "joinForm";
	}
	@PostMapping("/join")
	public String postJoin(Employee employee,String birthDate1,String birthDate2) {
		String userId3 = "";
		int userId4;
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		String classId=str.substring(2,4)+employee.getDepartmentId();
//		int userId=es.selectUserId(employee.getDepartmentId());
		System.out.println("부서아이디값:"+employee.getDepartmentId());
//		System.out.println("유저아이디:"+userId);
		int userId2=0;
		
		/* 유저 아이디 */
		userId3=classId+"0000";
		
		employee.setUserId(userId3);
		
		System.out.println(employee.getUserId());
		employee.setBirthDate(birthDate1+birthDate2);
		
		
		employee.setPassword(userId3+"");
		employee.setHireDate(now);
		
		employee.setManager("권한");
		employee.setStatus("1");
		
		/* 나이 구하는 로직 및 setAge*/
		int year1=LocalDate.now().getYear();
		int year2 = 0;
		if(birthDate2.substring(0, 1).equals("1")||birthDate2.substring(0, 1).equals("2")) {
		year2 = 1900+Integer.parseInt(birthDate1.substring(0, 2));
		}else if(birthDate2.substring(0, 1).equals("3")||birthDate2.substring(0, 1).equals("4")) {
			year2 = 2000+Integer.parseInt(birthDate1.substring(0, 2));
		}
		int myYear=(year1-year2)+1;
		employee.setAge(myYear);
		System.out.println(myYear);
		System.out.println(employee);
		
		es.insertEmployee(employee);
		return "list";
	}
	@GetMapping("/popup")
	public String popup() {
		return "popup";
	}
	@GetMapping("/main")
	public String main(Model model) {
		model.addAttribute("suggestion",ss.mainList());
		model.addAttribute("notice", ns.mainList());
		return "main";
	}
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	@GetMapping("/list")
	public @ResponseBody List<EducationBoard> getList() {
		
		return eds.getList();
	}
}
