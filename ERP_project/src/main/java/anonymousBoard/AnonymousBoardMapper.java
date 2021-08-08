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

import noticeBoard.NoticeComment;
import noticeBoard.NoticeView;
import service.EmplClass;
import service.Employee;

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
			+ "filename=#{filename} where id=#{id}")
	public boolean update(AnonymousBoard anonymouseBoard);
	@Update("update anonymous_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from anonymous_board where id=#{id}")
	public boolean delete(int id);
	@Select("select id from anonymous_board order by id desc limit 1")
	public int getLastIndex();
	@Select("select id from anonymous_board order by id asc limit 1")
	public int getFirstIndex();
	@Select("select id from anonymous_board where id=(select min(id) from anonymous_board where id>#{id})")
	public int getNextIndex(int id);
	@Select("select id from anonymous_board where id=(select max(id) from anonymous_board where id<#{id})")
	public int getBeforeIndex(int id);

	@Select("select count(*) from anonymous_view where board_id=#{boardId} and viewer_ip=#{viewerIp}")
	public String getOverlapCount(AnonymousView av);

	@Select("select count(viewer_ip) from anonymous_view where board_id=#{boardId}")
	public int getViewCount(int boardId);

	@Insert("insert anonymous_view values(0,#{boardId},#{viewerIp})")
	public void setAnonymousViewer(AnonymousView anonymousView);

	@Update("update anonymous_board set count = #{count} where id = #{boardId};")
	public void setAnonumousBoardCount(@Param("count") int count,@Param("boardId") int boardId);
	

	@Delete("delete from anonymous_comment where id=#{deleteNo}")
	public boolean deleteComment(String deleteNo);

	@Update("update anonymous_comment set comment=#{updateComment} where id=#{updateCommentId}")
	public boolean updateComment(@Param("updateComment") String updateComment,@Param("updateCommentId") String updateCommentId);

	@Select("select count(*) from anonymous_comment where board_id=#{boardId}")
	public int getCommentCount(int boardId);

	@Select("select * from anonymous_comment where board_id = #{boardId}")
	public List<AnonymousComment> getCommentList(int boardId);



	@Insert("insert into anonymous_comment values(0,#{boardId},#{comment},#{writerId},#{nickName},#{writeDate})")
	public boolean setComment(AnonymousComment ac);

	@Select("select name,department_id from employee where user_id=#{writer}")
	public Employee getWriter(int writer);
	
	@Select("select name from employee where user_id=#{writer}")
	public EmplClass getECWriter(int writer);
	
	@Select("select department_name from department where department_id=#{departmentId}")
	public String getDepartment(int departmentId);
	
	@Delete("delete from anonymous_comment where board_id=#{id}")
	public void deleteAllComment(int id);

	@Delete("delete from anonymous_view where board_id=#{id}")
	public void deleteAllView(int id);
	@Select("select * from anonymous_board order by id desc limit 10")
	public List<AnonymousBoard> getMainList();
	


	
}
