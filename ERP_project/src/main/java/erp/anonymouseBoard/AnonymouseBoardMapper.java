package erp.anonymouseBoard;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AnonymouseBoardMapper {
	@Select("select * from anonymouse_bord")
	public List<AnonymouseBoard> selectList();
	
	@Select("select count(*) from anonymouse_bord")
	public int count();
	
	@Select("select * from anonymouse_bord where id=#{id}")
	public AnonymouseBoard select(int id);

	@Insert("insert into anonymouse_bord(title,content,writer,wirte_date) "
			+ "values(#{title},#{content},#{writer},#{writeDate})")
	public AnonymouseBoard insert(AnonymouseBoard anonimouseBoard);
	
	@Update("update anonymouse_bord set title=#{title},content=#{content},"
			+ "writer=#{writer},write_date=#{writeDate} where id=#{id}")
	public int update(AnonymouseBoard anonymouseBoard);
	
	@Delete("delete from anonymouse_bord where id=#{id}")
	public int delete(int id);
}
