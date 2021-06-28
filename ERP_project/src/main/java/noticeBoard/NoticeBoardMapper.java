package noticeBoard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import anonymousBoard.AnonymousBoard;

@Mapper
public interface NoticeBoardMapper {
	
	@Select("select * from notice_board order by id desc")
	public List<NoticeBoard> selectList();
	
	@Select("select count(*) from notice_board")
	public int count();
	@Select("select * from notice_board order by id desc limit 5")
	public List<NoticeBoard> mainList();
	@Select("select * from notice_board where id=#{id}")
	public NoticeBoard select(int id);
	
	@Insert("insert into notice_board(title,content,writer,wirte_date) "
			+ "values(#{title},#{content},#{writer},#{writeDate})")
	public NoticeBoard insert(NoticeBoard noticeBoard);
	
	@Update("update notice_board set title=#{title},content=#{content},"
			+ "writer=#{writer},write_date=#{writeDate} where id=#{id}")
	public int update(NoticeBoard noticeBoard);
	@Update("update notice_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from notice_board where id=#{id}")
	public int delete(int id);
}
