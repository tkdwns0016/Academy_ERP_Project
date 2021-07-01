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
		return "login";
	}
	@GetMapping("/login")
	public String loginCheck() {
		return "login"; 
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
			return "main";
		}else {
			model.addAttribute("result", true);
			return "login";
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
		return "joinForm";
	}
	@PostMapping("/join")
	public String postJoin(Employee employee,String birthDate1,String birthDate2,MultipartFile imgName) {
		String userId = "";
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		String classId=str.substring(2,4)+employee.getDepartmentId();
//		int userId=es.selectUserId(employee.getDepartmentId());
//		System.out.println("유저아이디:"+userId);
		
		/* 유저 아이디 */
		userId=classId+"0000";
		int IdCount=es.userIdCount(employee.getDepartmentId());
		IdCount+=1;
		int userId2= Integer.parseInt(userId)+IdCount;
		employee.setUserId(userId2);
		
		employee.setBirthDate(birthDate1+birthDate2);
		
		employee.setPassword(userId2+"");
		employee.setHireDate(now);
		
		employee.setManager("비권한");
		employee.setStatus("근무");
		if(imgName.getOriginalFilename().equals("")) {
			employee.setImgName("normalImg.jpg");
		}else {
			
			boolean result=is.saveUploadedFile(imgName, userId2);
			if(result) {
				String extension = imgName.getOriginalFilename().substring(imgName.getOriginalFilename().lastIndexOf("."));
				employee.setImgName(userId2+extension);
			}else {
				employee.setImgName("normalImg.jpg");
			}
		}
	
		es.insertEmployee(employee);
		return "list";
	}
	@GetMapping("/popup")
	public String popup() {
		return "popup";
	}
	@GetMapping("/main")
	public String main(Model model) {
		return "main";
	}
	
	
}
