package suggestionBoard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import anonymousBoard.AnonymousBoard;
import department.Department;
import noticeBoard.NoticeComment;
import noticeBoard.NoticeView;
import service.EmplClass;
import service.Employee;

@Mapper
public interface SuggestionBoardMapper {
	@Select("select * from suggestion_board order by id desc limit #{firstRow},#{pagePerCount}")
	public List<SuggestionBoard> selectList(@Param("firstRow")int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from suggestion_board order by id desc limit 10")
	public List<SuggestionBoard> mainList();
	@Select("select * from department where department_id=#{departmentId}")
	public Department suggestionDepart(int departmentId);
	@Select("select name,department_id from employee where user_id=#{userId}")
	public Employee suggestionName(int userId);
	
	
	@Select("select count(*) from suggestion_board")
	public int count();
	
	@Select("select * from suggestion_board where id=#{id}")
	public SuggestionBoard select(int id);

	@Insert("insert into suggestion_board(title,writer,content,write_date,count,password,filename) "
			+ "values(#{title},#{writer},#{content},#{writeDate},0,#{password},#{filename})")
	@Options(useGeneratedKeys = true,keyProperty = "id")
	public boolean insert(SuggestionBoard suggestionBoard);
	
	@Update("update suggestion_board set title=#{title}, content=#{content},"
			+ "filename=#{filename} where id=#{id}")
	public boolean update(SuggestionBoard suggestionBoard);
	@Update("update suggestion_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	@Delete("delete from suggestion_board where id=#{id}")
	public boolean delete(int id);
	@Select("select name,department_id from employee where user_id=#{writer}")
	public Employee getWriter(int writer);
	@Select("select name from employee where user_id=#{writer}")
	public EmplClass getECWriter(int writer);
	@Select("select department_name from department where department_id=#{departmentId}")
	public String getDepartment(int departmentId);
	@Select("select id from suggestion_board order by id desc limit 1")
	public int getLastIndex();
	@Select("select id from suggestion_board order by id asc limit 1")
	public int getFirstIndex();
	@Select("select id from suggestion_board where id=(select min(id) from suggestion_board where id>#{id})")
	public int getNextIndex(int id);
	@Select("select id from suggestion_board where id=(select max(id) from suggestion_board where id<#{id})")
	public int getBeforeIndex(int id);
	
	@Insert("insert into suggestion_comment values(0,#{boardId},#{comment},#{writerId},#{writerName},#{writerDepartmentName},#{writeDate})")
	public boolean setComment(SuggestionComment suggestionComment);
	/* comment show */
	@Select("select * from suggestion_comment where board_id = #{boardId}")
	public List<SuggestionComment> getCommentList(int boardId);
	@Select("select count(*) from suggestion_comment where board_id = #{boardId}")
	public int getCommentCount(int boardId);
	@Delete("delete from suggestion_comment where id=#{deleteNo}")
	public boolean deleteComment(String deleteNo);
	
	@Update("update suggestion_comment set comment=#{updateComment} where id=#{updateCommentId}")
	public boolean updateComment(@Param("updateComment") String updateComment,@Param("updateCommentId") String updateCommentId);

	@Select("select count(viewer_ip) from suggestion_view where board_id=#{boardId}")
	public int getViewCount(int boardId);
	
	@Insert("insert suggestion_view values(0,#{boardId},#{viewerIp})")
	public void setSuggestionViewer(SuggestionView suggetstionView);
	@Select("select count(*) from suggestion_view where board_id=#{boardId} and viewer_ip=#{viewerIp}")
	public String getOverlapCount(SuggestionView suggetstionView);
	/*to Notice-count*/
	@Update("update suggestion_board set count = #{count} where id = #{boardId};")
	public void setSuggestionBoardCount(@Param("count") int count,@Param("boardId") int boardId);
	@Delete("delete from suggestion_comment where board_id=#{id}")
	public void deleteAllComment(int id);
	@Delete("delete from suggestion_view where board_id=#{id}")
	public void deleteAllView(int id);

}
