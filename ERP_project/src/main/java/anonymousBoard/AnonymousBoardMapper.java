package anonymousBoard;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AnonymousBoardMapper {
	@Select("select * from anonymous_board order by id desc")
	public List<AnonymousBoard> selectList();
	
	@Select("select count(*) from anonymous_board")
	public int count();
	
	@Select("select * from anonymous_board where id=#{id}")
	public AnonymousBoard select(int id);
	
	@Insert("insert into anonymous_board(title,content,writer,wirte_date) "
			+ "values(#{title},#{content},#{writer},#{writeDate})")
	public AnonymousBoard insert(AnonymousBoard anonimouseBoard);
	
	@Update("update anonymous_board set title=#{title},content=#{content},"
			+ "writer=#{writer},write_date=#{writeDate} where id=#{id}")
	public int update(AnonymousBoard anonymouseBoard);
	@Update("update anonymous_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from anonymous_board where id=#{id}")
	public int delete(int id);
}
