package educationBoard;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import attendance.Attendance;

public interface EducationBoardMepper {
	@Select("select * from education_board")
	public List<EducationBoard> selectList();
	
	@Select("select count(*) from education_board")
	public int count();
	
	@Select("select * from education_board where id=#{id}")
	public EducationBoard select(int id);
	
	@Insert("insert into education_board(title,start_date,end_date,memo,department_id) "
			+ "values(#{title},#{startDate},#{endDate},#{momo},#{departmentId})")
	public EducationBoard insert(EducationBoard educationBoard);
	
	@Update("update education_board set title=#{title},"
			+ "startDate=#{startDate},endDate=#{endDate},memo=#{momo},"
			+ "departmentId=#{departmentId} where id=#{id}")
	public int update(EducationBoard educationBoard);
	
	@Delete("delete from education_board where id=#{id}")
	public int delete(int id);
}
