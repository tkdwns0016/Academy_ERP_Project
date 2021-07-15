package anonymousBoard;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AnonymousBoardMapper {
	@Select("select * from anonymous_board order by id desc limit #{firstRow},#{pagePerCount}")
	public List<AnonymousBoard> selectList(@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	
	@Select("select count(*) from anonymous_board")
	public int count();
	
	@Select("select * from anonymous_board where id=#{id}")
	public AnonymousBoard select(int id);
	
	@Insert("insert into anonymous_board "
			+ "values(0,#{title},#{content},#{writer},#{nickName},#{writeDate},0,#{password},#{filename})")
	@Options(useGeneratedKeys = true, keyProperty  = "id") 
	public boolean insert(AnonymousBoard anonimouseBoard);
	
	@Update("update anonymous_board set title=#{title},content=#{content},"
			+ "writer=#{writer},write_date=#{writeDate} where id=#{id}")
	public int update(AnonymousBoard anonymouseBoard);
	@Update("update anonymous_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from anonymous_board where id=#{id}")
	public int delete(int id);
	@Select("select id from anonymous_board order by id desc limit 1")
	public int getLastIndex();
	@Select("select id from anonymous_board order by id asc limit 1")
	public int getFirstIndex();
	@Select("select id from anonymous_board where id=(select min(id) from anonymous_board where id>#{id})")
	public int getNextIndex(int id);
	@Select("select id from anonymous_board where id=(select max(id) from anonymous_board where id<#{id})")
	public int getBeforeIndex(int id);
	
}
