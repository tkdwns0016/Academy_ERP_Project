package noticeBoard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.junit.runners.Parameterized.Parameters;

import anonymousBoard.AnonymousBoard;
import department.Department;
import service.EmplClass;
import service.Employee;

@Mapper
public interface NoticeBoardMapper {
	
	@Select("select * from notice_board order by id desc limit #{firstRow},#{pagePerCount}")
	public List<NoticeBoard> selectList(@Param("firstRow")int firstRow,@Param("pagePerCount") int pagePerCount);
	
	@Select("select count(*) from notice_board")
	public int count();
	@Select("select * from notice_board order by id desc limit 10")
	public List<NoticeBoard> mainList();
	@Select("select * from notice_board where id=#{id}")
	public NoticeBoard select(int id);
	@Select("select * from department where department_id=#{departmentId}")
	public Department noticeDepart(int departmentId);
	@Select("select name,department_id from employee where user_id=#{userId}")
	public Employee noticeName(int userId);
	
	@Insert("insert into notice_board(writer,title,content,password,write_date,filename) "
			+ " values(#{writer},#{title},#{content},#{password},#{writeDate},#{filename})")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	public boolean insert(NoticeBoard noticeBoard);
	
	@Update("update notice_board set title=#{title}, content=#{content}, filename=#{filename}"
			+ " where id=#{id}")
	public boolean update(NoticeBoard noticeboard);
	
	@Update("update notice_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	
	@Delete("delete from notice_board where id=#{id}")
	public boolean delete(int id);
	@Select("select * from employee where user_id=#{writer}")
	public Employee getWriter(int writer);
	@Select("select name from employee where user_id=#{writer}")
	public EmplClass getECWriter(int writer);
	@Select("select department_name from department where department_id=#{departmentId}")
	public String getDepartment(int departmentId);
	@Select("select id from notice_board order by id desc limit 1")
	public int getLastIndex();
	@Select("select id from notice_board order by id asc limit 1")
	public int getFirstIndex();
	@Select("select id from notice_board where id=(select min(id) from notice_board where id>#{id})")
	public int getNextIndex(int id);
	@Select("select id from notice_board where id=(select max(id) from notice_board where id<#{id})")
	public int getBeforeIndex(int id);
	
	@Insert("insert into notice_comment values(0,#{boardId},#{comment},#{writerId},#{writerName},#{writerDepartmentName},#{writeDate})")
	public boolean setComment(NoticeComment noticeComment);
	/* comment show */
	@Select("select * from notice_comment where board_id = #{boardId}")
	public List<NoticeComment> getCommentList(int boardId);
	@Select("select count(*) from notice_comment where board_id = #{boardId}")
	public int getCommentCount(int boardId);
	@Delete("delete from notice_comment where id=#{deleteNo}")
	public boolean deleteComment(String deleteNo);
	
	@Update("update notice_comment set comment=#{updateComment} where id=#{updateCommentId}")
	public boolean updateComment(@Param("updateComment") String updateComment,@Param("updateCommentId") String updateCommentId);

	@Select("select count(viewer_ip) from notice_view where board_id=#{boardId}")
	public int getViewCount(int boardId);
	
	@Insert("insert notice_view values(0,#{boardId},#{viewerIp})")
	public void setNoticeViewer(NoticeView noticeView);
	@Select("select count(*) from notice_view where board_id=#{boardId} and viewer_ip=#{viewerIp}")
	public String getOverlapCount(NoticeView noticeView);
	/*to Notice-count*/
	@Update("update notice_board set count = #{count} where id = #{boardId};")
	public void setNoticeBoardCount(@Param("count") int count,@Param("boardId") int boardId);

	@Delete("delete from notice_comment where board_id=#{id}")
	public void deleteViewAll(int id);

	@Delete("delete from notice_view where board_id=#{id}")
	public void deleteAllComment(int id);


}
