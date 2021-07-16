package service;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import anonymousBoard.AnonymousBoard;
import anonymousBoard.AnonymousBoardService;
import department.DepartmentService;
import educationBoard.EducationBoard;
import educationBoard.EducationBoardService;
import noticeBoard.NoticeBoard;
import noticeBoard.NoticeService;
import position.PositionService;
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
	ImageService is;
	@Autowired
	DepartmentService ds;
	@Autowired
	PositionService ps;
	
	@GetMapping("/myInfo")
	public String myInfo(Model model, HttpSession session) {
		model.addAttribute("empl", session.getAttribute("empl")); 
		return "myInfo";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/login";
	}
	@GetMapping("/login")
	public String loginCheck() {
		return "login/login"; 
	}
	@PostMapping("/login")
	public String login(Model model ,HttpSession session, int userId, String password) {
		if(es.login(userId, password)!=null) {
			Employee emp=es.login(userId, password);
			session.setAttribute("empl",emp);
			session.setAttribute("department", ds.getDepart(emp.getDepartmentId()));
			session.setAttribute("position", ps.getPosiont(emp.getPositionId()));
			session.setAttribute("suggestion",ss.mainList());
			session.setAttribute("notice", ns.mainList());
			
			return "main/main";
		}else {
			model.addAttribute("result", true);
			return "login/login";
		}
	}
	@GetMapping("/noticeList")
	@ResponseBody
	public List<NoticeBoard> mainList(){
		return ns.mainList();
	}
	@GetMapping("/suggestionList")
	@ResponseBody
	public List<SuggestionBoard> mainList2(){
		return ss.mainList();
	}
	
	@GetMapping("/join")
	public String join(Model model) {
		return "joinForm/joinForm";
	}
	@PostMapping("/join")
	public String postJoin(Model model, Employee employee,String birthDate1,String birthDate2,MultipartFile imgName) {
	
		boolean result= es.insertEmployee(employee,birthDate1,birthDate2,imgName);
		model.addAttribute("result", result);
		return "joinForm/joinForm";
	}
	@GetMapping("/popup")
	public String popup() {
		return "login/popup";
	}
	@GetMapping("/main")
	public String main(Model model) {
		return "main/main";
	}
	@PostMapping("/myInfo")
	public String updateEmpl(Model model, Employee employee,MultipartFile uploadFile,String birthDate1,String birthDate2,HttpSession session) {
		if(uploadFile.getOriginalFilename().equals("")) {
			Employee empl=(Employee)session.getAttribute("empl");
			employee.setImgName(empl.getImgName());
			employee.setId(empl.getId());
			boolean result=es.noImgUpdateEmpl(employee, birthDate1, birthDate2);
			model.addAttribute("result", result);
		}else {
			
			boolean result=es.updateEmpl(employee,birthDate1,birthDate2,uploadFile);
			model.addAttribute("result", result);
		}
		return "myInfo";
	}     
	@GetMapping("/emplList")
	public String test(Model model,String page) {
		if(page!=null) {
			model.addAttribute("emplList",es.employeeService(page));
		}else {
			model.addAttribute("emplList",es.employeeService("1"));
		}
		return "emplListNew";
	}
	@PostMapping("/emplList")
	public String test1(Model model,String searchOption,String search,String page) {
		ServiceClass sc = es.search("1",searchOption , search);
		if(sc!=null) {
			if(page!=null) {
				model.addAttribute("searchList", es.search(page,searchOption , search));
			}else {
				model.addAttribute("searchList", sc);
			}
		}else {
			boolean result=true;
			if(page!=null) {
				model.addAttribute("emplList",es.employeeService(page));
			}else {
				model.addAttribute("emplList",es.employeeService("1"));
			}
			model.addAttribute("result",result);
		}
		return "emplListNew";
	}	
	@GetMapping("/emplInfo")
	public String emplInfo(Model model,int userId) {
		model.addAttribute("resultEmpl", es.selectWithUserId(userId)); 
		
		return "emplInfo";
	}
	@PostMapping("/emplInfo")
	public String emplUpdate(Model model,Employee emp) {
		
		model.addAttribute("resultUpdate",es.update(emp));
		
		return "emplInfo";
	}
}
