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
	@Select("select * from education_board where department_id=#{departmentId}")
	public List<EducationBoard> selectEducation(int departmentId);
	
	@Insert("insert into education_board(title,start_date,end_date,memo,department_id,writer) "
			+ "values(#{title},#{startDate},#{endDate},#{memo},#{departmentId},#{writer})")
	public int insert(EducationBoard educationBoard);
	
	@Update("update education_board set title=#{title},"
			+ "start_date=#{startDate},end_date=#{endDate},memo=#{memo},"
			+ "department_id=#{departmentId} where id=#{id}")
	public int update(EducationBoard educationBoard);
	
	@Delete("delete from education_board where id=#{id}")
	public int delete(int id);
}
