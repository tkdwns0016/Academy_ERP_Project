package noticeBoard;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import anonymousBoard.AnonymousBoard;
import service.EmplClass;
import service.Employee;

@Mapper
public interface NoticeBoardMapper {
	
	@Select("select * from notice_board order by id desc limit #{firstRow},#{pagePerCount}")
	public List<NoticeBoard> selectList(@Param("firstRow")int firstRow,@Param("pagePerCount") int pagePerCount);
	
	@Select("select count(*) from notice_board")
	public int count();
	@Select("select * from notice_board order by id desc limit 5")
	public List<NoticeBoard> mainList();
	@Select("select * from notice_board where id=#{id}")
	public NoticeBoard select(int id);
	
	@Insert("insert into notice_board(writer,title,content,password,write_date,filename) "
			+ " values(#{writer},#{title},#{content},#{password},#{writeDate},#{filename})")
	public boolean insert(NoticeBoard noticeBoard);
	
	@Update("update notice_board set writer=#{writer}, title=#{title}, content=#{content}"
			+ " where id=#{id}")
	public int update(NoticeBoard noticeboard);
	
	@Update("update notice_board set count=#{count} where id=#{id}")
	public int countPlus(@Param("count")int count,@Param("id")int id);
	
	@Delete("delete from notice_board where id=#{id}")
	public boolean delete(int id);
	@Select("select name,department_id from employee where user_id=#{writer}")
	public Employee getWriter(String writer);
	@Select("select name from employee where user_id=#{writer}")
	public EmplClass getECWriter(String writer);
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
	
	
}
