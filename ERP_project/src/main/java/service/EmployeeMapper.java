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
	
	@Select("select * from employee")
	public List<Employee> selectList();
	@Select("select * from department where department_id=#{departmentId}")
	public Department getDepartment(int departmentId);
	
	@Select("select * from position where position_id=#{positionId}")
	public Position getPosition(int positionId);
	
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
			+ "#{positionId},#{salary},#{manager},#{status})")
	public int insert(Employee employee);
	
	@Update("update employee set name=#{name},user_id=#{userId},"
			+ "password=#{password},address_id=#{addressId},"
			+ "address1=#{address1},address2=#{address2},phone=#{phone},"
			+ "email=#{email},hire_date=#{hireDate},birth_date=#{birthDate},"
			+ "sex=#{sex},department_id=#{departmentId},img_name=#{imgName},"
			+ "position_id=#{positionId},salary=#{salary},manager=#{manager},status=#{status} where id=#{id}")
	public int update(Employee employee);
	
	@Select("select count(user_id) from employee where department_id=#{departmentId}")
	public int userIdCount(int departmentId);
	
	@Select("select * from employee join department on department.department_id=employee.department_id join position on employee.position_id=position.position_id where name like concat('%',#{name},'%')")
	public List<EmplClass> getSearchName(@Param("name")String name);

	
}

