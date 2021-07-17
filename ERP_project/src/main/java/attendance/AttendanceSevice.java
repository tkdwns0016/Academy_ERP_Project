package attendance;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
}
