package attendance;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import department.Department;
import service.Employee;
import service.ServiceClass;

@Service
public class AttendanceSevice {

	@Autowired
	AttendanceMapper am;

	public List<Attendance> getAttendanceList(Model model,String today,String page) {
		if(page==null) {
			page="1";
		}
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),3 , am.getDayByCount(LocalDate.parse(today)));
		List<Attendance> attendanceList = new ArrayList<Attendance>();
		attendanceList = am.selectList(LocalDate.parse(today),sc.getFirstRow(),sc.getPagePerCount());
		model.addAttribute("paging",sc);
		return attendanceList;
	}

	public List<Attendance> dep_getAttendanceList(Model model,String today, String dep_choice,String page) {
		if(page==null) {
			page="1";
		}
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),3 , am.getDepByCount(LocalDate.parse(today),dep_choice));
		List<Attendance> attendanceList = new ArrayList<Attendance>();
		attendanceList = am.dep_selectList(LocalDate.parse(today), dep_choice,sc.getFirstRow(),sc.getPagePerCount());
		model.addAttribute("paging", sc);
		return attendanceList;
	}

	public List<Attendance> select_Atten_Empl(Model model, String name, String workType,String page) {
		if(page==null) {
			page="1";
		}
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),3 , am.getCount_Atten_Empl(name,workType));
		System.out.println(sc);
		model.addAttribute("paging", sc);
		return am.select_Atten_Empl(name, workType,sc.getFirstRow(),sc.getPagePerCount());
	}

	public void onTimeService(Model model,HttpSession session) {
		boolean result;
		Employee empl=(Employee)session.getAttribute("empl");
		String department=(String)session.getAttribute("department");
		String position=(String)session.getAttribute("position");
		if(am.isEmpty(empl.getUserId(),LocalDate.now())==null) {
			LocalTime nt=LocalTime.now();
			System.out.println("test"+nt);
			result=am.setOnTime(empl.getName(),department,position,empl.getWorkType(),LocalTime.now(),LocalDate.now(),empl.getUserId());
			model.addAttribute("TimeResult",result);
			model.addAttribute("ResultType", "출근");
		}else {
			model.addAttribute("reject", "이미 출근 처리가 되었습니다.");
		}
		
	}

	public void offTimeService(Model model, HttpSession session) {
		boolean result;
		Employee empl=(Employee)session.getAttribute("empl");
		if(am.isEmpty(empl.getUserId(),LocalDate.now())==null) {
			model.addAttribute("reject","출근 처리가 되지 않았습니다.");
		}else {
			LocalTime workStart=am.isEmpty(empl.getUserId(),LocalDate.now()).getWorkStart();
			LocalTime nowTime=LocalTime.now();
			LocalTime workingTime;
			String hour="";
			String mn="";
			String sc="";
			if( workStart.getHour()>13||nowTime.getHour()<13) {
				
				long seconds= workStart.until(nowTime, ChronoUnit.SECONDS);
				if(seconds/3600<10) {
					hour="0"+seconds/3600;
				}
				if(seconds%3600/60<10) {
					mn ="0"+seconds%3600/60;
				}
				if(seconds%3600%60<10) {
					sc="0"+seconds%3600%60;
				}
				workingTime=LocalTime.parse(hour+":"+mn+":"+sc);
			}else {
				long seconds= workStart.until(nowTime, ChronoUnit.SECONDS);
				if(seconds/3600<10) {
					hour="0"+seconds/3600;
				}
				if(seconds%3600/60<10) {
					mn ="0"+seconds%3600/60;
				}
				if(seconds%3600%60<10) {
					sc="0"+seconds%3600%60;
				}
				workingTime=LocalTime.parse(hour+":"+mn+":"+sc);
			}
			
			System.out.println(workingTime);
			result=am.setOffTime(empl.getUserId(),LocalDate.now(),nowTime,workingTime);
			model.addAttribute("TimeResult",result);
			model.addAttribute("ResultType", "퇴근");
		}
		
	}
}
