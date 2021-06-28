package service;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import anonymousBoard.AnonymousBoard;
import anonymousBoard.AnonymousBoardService;
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
	public String postJoin(Employee employee,String address2, String birthDate1,String birthDate2) {
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		String classId=str.substring(2,4)+employee.getDepartmentId();
		int userId=es.selectUserId(employee.getDepartmentId());
		if(userId>0) {
			userId=userId+1;
		}else {
			userId=Integer.parseInt(classId+"0001");
		}
		employee.setAddress(employee.getAddress()+address2);
		employee.setBirthDate(birthDate1+birthDate2);
		employee.setUserId(userId);
		employee.setPassword(userId+"");
		employee.setHireDate(now);
		System.out.println(employee);
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
	

}
