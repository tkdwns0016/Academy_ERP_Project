package attendance;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttendanceController {
	
	@Autowired
	AttendanceSevice as;
	
	
	@GetMapping("/attendance")
	public String attendace(Model model,String today,String dep_choice,String page) {
		if(today==null) {
			today = String.valueOf(LocalDate.now()); 
		}
		model.addAttribute("today", today);
		if(dep_choice==null || dep_choice.equals("--부서별 검색--")) {		
		model.addAttribute("attendanceList",as.getAttendanceList(model,today,page));
		}else {
		model.addAttribute("attendanceList",as.dep_getAttendanceList(model,today,dep_choice,page));
		}
		model.addAttribute("select", dep_choice);
		
		return "attendance/attendanceList";
	}
	
	@GetMapping("/select_atten_Empl")
	public String select_atten_Empl(Model model, String name, String workType,String page) {
	
		model.addAttribute("emplOneList",as.select_Atten_Empl(model,name,workType,page));
		
		return "attendance/attendance";
	}
	@GetMapping("/attendanceOnTime")
	public String OnTime(Model model,HttpSession session) {
		as.onTimeService(model,session);
		return "main/result";
	}
	@GetMapping("/attendanceOffTime")
	public String OffTime(Model model,HttpSession session) {
		as.offTimeService(model,session);
		return "main/result";
	}
}
