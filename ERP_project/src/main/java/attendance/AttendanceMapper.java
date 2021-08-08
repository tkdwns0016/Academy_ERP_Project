package attendance;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import service.Employee;


@Mapper
public interface AttendanceMapper {
	/* select AttendanceList by date */
	@Select("select * from attendance where work_date = #{workDate} limit #{first},#{pagePerCount}")
	public List<Attendance> selectList(@Param("workDate") LocalDate workDate,@Param("first") int first,@Param("pagePerCount")int pagePerCount);
	
	/* count for pagenation by date */
	@Select("select count(*) from attendance where work_date = #{workDate}")
	public int getDayByCount(LocalDate workDate);
	
	
	/* select AttendanceList by date & department */
	@Select("select * from attendance where work_date = #{workDate} and department = #{department} limit #{first},#{pagePerCount}")
	public List<Attendance> dep_selectList(@Param("workDate") LocalDate workDate,@Param("department") String department,@Param("first") int first,@Param("pagePerCount")int pagePerCount);
	
	/* count for pagenation by date & department */
	@Select("select count(*) from attendance where work_date = #{workDate} and department = #{dep_choice}")
	public int getDepByCount(@Param("workDate") LocalDate workDate,@Param("dep_choice") String dep_choice);
	
	
	/* attendanceList for one man */
	@Select("select * from attendance where name=#{name} and work_type=#{workType} limit #{first},#{pagePerCount}")
	public List<Attendance> select_Atten_Empl(@Param("name") String name,@Param("workType") String workType,@Param("first") int first,@Param("pagePerCount")int pagePerCount);

	/* count for pagenation of attendanceList by name & workType */
	@Select("select count(*) from attendance where name=#{name} and work_type=#{workType}")
	public int getCount_Atten_Empl(@Param("name") String name,@Param("workType") String workType);
	@Insert("insert into attendance(name,department,position,work_type,work_start,work_date,user_id) values("
			+ "#{name},#{department},#{position},#{workType},#{workStart},#{workDate},#{userId})")
	public boolean setOnTime(@Param("name")String name, 
			@Param("department")String department, 
			@Param("position")String position,@Param("workType") String workType, @Param("workStart")LocalTime workStart,
			@Param("workDate")LocalDate workDate,@Param("userId")int userId);
	@Select("select * from attendance where user_id=#{userId} and work_date=#{workDate}")
	public Attendance isEmpty(@Param("userId")int userId,@Param("workDate")LocalDate workDate);
	@Update("update attendance set work_end=#{workEnd},working_time=#{workingTime} where user_id=#{userId} and work_date=#{workDate}")
	public boolean setOffTime(@Param("userId")int userId,@Param("workDate")LocalDate workDate, @Param("workEnd")LocalTime workEnd, @Param("workingTime")LocalTime workingTime);
}
