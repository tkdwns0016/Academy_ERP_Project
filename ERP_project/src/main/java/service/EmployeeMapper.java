package service;

import java.time.LocalDate;
import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import department.Department;
import position.Position;

@Mapper
public interface EmployeeMapper {
	
	@Select("select * from employee order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> selectList(@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> selectECList(@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from department where department_id=#{departmentId}")
	public Department getDepartment(int departmentId);
	@Select("select * from department where department_name like concat('%',#{search},'%')")
	public Department getSearchDep(String search);
	@Select("select * from position where position_id=#{positionId}")
	public Position getPosition(int positionId);
	@Select("select * from employee where user_id=#{userId}")
	public Employee selectWithUserId(int userId);
	@Select("select count(*) from employee")
	public int EmpleCount();
	
	@Select("select * from employee where user_id=#{userId} and name=#{name} and birth_date=#{birthDate}")
	public Employee changePassword(@Param("userId") int userId,@Param("name")String name,@Param("birthDate") String birthDate);
	
	@Select("select * from employee where user_id=#{userId} and password=#{password}")
	public Employee select(@Param("userId")int userId, @Param("password")String password);
	
	@Select("select user_id from employee where department_id=#{departmentId} order by user_id desc limit 1")
	public int getUserId(int departmentId);
	
	@Insert("insert into employee values(0,#{name},#{userId},"
			+ "#{password},#{addressId},#{address1},#{address2},#{phone},"
			+ "#{email},#{hireDate},#{birthDate},#{sex},#{departmentId},#{imgName},"
			+ "#{positionId},#{salary},#{manager},#{status},#{englishName},#{lunarCalendar},"
			+ "#{birth},#{koreanForeigner},#{companyPhone},#{marriage},#{companyAddress},"
			+ "#{salaryPaymentStandards},#{workType},#{remark})")
	public boolean insert(Employee employee);
	
	@Update("update employee set name=#{name},"
			+ "password=#{password},address_id=#{addressId},"
			+ "address1=#{address1},address2=#{address2},phone=#{phone},"
			+ "email=#{email},birth_date=#{birthDate},"
			+ "sex=#{sex},img_name=#{imgName},"
			+ "english_name=#{englishName},"
			+ "lunar_calendar=#{lunarCalendar},birth=#{birth},korean_foreigner=#{koreanForeigner},"
			+ "marriage=#{marriage} "
			+ "where user_id=#{userId}")
	public boolean updateMyInfo(Employee employee);
	
	@Update("update employee set name=#{name},"
			+ "phone=#{phone},"
			+ "email=#{email},hire_date=#{hireDate},"
			+ "sex=#{sex},department_id=#{departmentId},"
			+ "position_id=#{positionId},salary=#{salary},manager=#{manager},status=#{status},english_name=#{englishName},"
			+ "lunar_calendar=#{lunarCalendar},birth=#{birth},korean_foreigner=#{koreanForeigner},"
			+ "company_phone=#{companyPhone},marriage=#{marriage},"
			+ "company_address=#{companyAddress},salary_payment_standards=#{salaryPaymentStandards},"
			+ "work_type=#{workType},remark=#{remark} where id=#{id}")
	public int updateEmplInfo(Employee employee);
	
	@Select("select count(user_id) from employee where department_id=#{departmentId}")
	public int userIdCount(int departmentId);
	
	@Select("select * from employee where name like concat('%',#{name},'%')")
	public List<EmplClass> getEcSearchName(@Param("name")String name);
	@Select("select * from employee where name like concat('%',#{name},'%')")
	public List<Employee> getEmplSearchName(@Param("name")String name);
	@Select("select * from employee where user_id like concat('%',#{userId},'%')")
	public List<EmplClass> getEcSerachUserId(int userId);
	@Select("select * from employee where user_id like concat('%',#{userId},'%')")
	public List<Employee> getEmplSerachUserId(int userId);
	@Select("select * from employee where name like concat('%',#{name},'%') or user_id like concat('%',#{userId},'%')")
	public List<Employee> getEmplSearchAll(@Param("name")String name,@Param("userId") int userId);
	@Select("select * from employee where name like concat('%',#{name},'%') or user_id like concat('%',#{userId},'%')")
	public List<EmplClass> getEcSearchAll(@Param("name")String name,@Param("userId") int userId);
	@Select("select count(*) from employee where name like concat('%',#{name},'%')")
	public int SearchNameCount();
	@Select("select count(*) from employee where user_id like concat('%',#{userId},'%')")
	public int SearchUserIdCount();
	@Select("select count(*) from employee where name like concat('%',#{name},'%') or user_id like concat('%',#{userId},'%')")
	public int SearchAllCount();

	@Select("select * from employee where position_id=#{positionId} order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> searchEmplListWithPositionId(@Param("positionId") int positionId,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee where position_id=#{positionId} order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> searchECListWithPositionId(@Param("positionId") int positionId,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select count(*) from employee where position_id=#{positionId}")
	public int searchCountWithPositionId(int positionId);
	
	@Select("select * from employee where department_id=#{departmentId} order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> searchEmplListWithDepartmentId(@Param("departmentId")int departmentId,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee where department_id=#{departmentId} order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> searchECListWithDepartmentId(@Param("departmentId")int departmentId,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select count(*) from employee where department_id=#{departmentId}")
	public int searchCountWithDepartmentId(int departmentId);
	
	@Select("select * from employee where name like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> searchEmplListWithName(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee where name like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> searchECListWithName(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select count(*) from employee where name like concat('%',#{search},'%')")
	public int searchCountWithName(String search);
	
	@Select("select * from employee where hire_date like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> searchEmplListWithHireDate(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee where hire_date like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> searchECListWithHireDate(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select count(*) from employee where hire_date like concat('%',#{search},'%')")
	public int searchCountWithHireDate(String search);
	
	@Select("select * from employee where user_id like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Employee> searchEmplListWithUserId(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select * from employee where user_id like concat('%',#{search},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List<EmplClass> searchECListWithUserId(@Param("search")String search,@Param("firstRow") int firstRow,@Param("pagePerCount")int pagePerCount);
	@Select("select count(*) from employee where user_id like concat('%',#{search},'%')")
	public int searchCountWithUserId(String search);
	@Select("select * from position where position like concat('%',#{search},'%')")
	public Position getSearchPo(String search);
	
	@Select("select * from employee where user_id=#{userId}")
	public EmplClass getEcSeletWithUserId(int userId);
	@Select("select * from employee where user_id=#{userId}")
	public Employee getEmplSeletWithUserId(int userId);
	
}

