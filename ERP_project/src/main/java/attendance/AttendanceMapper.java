package attendance;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


@Mapper
public interface AttendanceMapper {
	@Select("select * from attendance")
	public List<Attendance> selectList();
	
	@Select("select count(*) from attendance")
	public int count();
	
	@Select("select * from attendance where id=#{id}")
	public Attendance select(int id);
	
	@Insert("insert into attendance(user_id,on_time,off_time,date) "
			+ "values(#{userId},#{onTime},#{offTime},#{date})")
	public Attendance insert(Attendance attendance);
	
	@Update("update attendance set user_id=#{userId},"
			+ "on_time=#{onTime},off_time=#{offTime},date=#{date} where id=#{id}")
	public int update(Attendance attendance);
	
	@Delete("delete from attendance where id=#{id}")
	public int delete(int id);
}
