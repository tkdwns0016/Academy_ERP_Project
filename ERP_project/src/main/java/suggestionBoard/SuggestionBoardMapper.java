package suggestionBoard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import anonymousBoard.AnonymousBoard;

@Mapper
public interface SuggestionBoardMapper {
	@Select("select * from suggestion_board order by id desc")
	public List<SuggestionBoard> selectList();
	@Select("select * from suggestion_board order by id desc limit 5")
	public List<SuggestionBoard> mainList();
	
	@Select("select count(*) from suggestion_board")
	public int count();
	
	@Select("select * from suggestion_board where id=#{id}")
	public SuggestionBoard select(int id);

	@Insert("insert into suggestion_board(title,writer,content,wirte_date) "
			+ "values(#{title},#{writer},#{content},#{writeDate})")
	public int insert(SuggestionBoard suggestionBoard);
	
	@Update("update suggestion_board set title=#{title},writer=#{writer}, content=#{content},"
			+ "write_date=#{writeDate} where id=#{id}")
	public int update(SuggestionBoard suggestionBoard);
	@Update("update suggestion_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from suggestion_board where id=#{id}")
	public int delete(int id);
}
