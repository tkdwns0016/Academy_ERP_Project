package erp;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmployeeMapper {
	
	@Select("select * from employee")
	public List<Employee> selectList();
	
	@Select("select user_id from employee where department_id=#{departmentId} order by user_id desc limit 1")
	public String getUserId(int departmentId);
	@Insert("insert into employee values(#{id},#{name},#{userId},"
			+ "#{password},#{addressId},#{password},#{addressId},#{address},#{phone},"
			+ "#{email},#{hireDate},#{birthDate},#{sex},#{departmentId},#{imgName},"
			+ "#{positionId},#{salary})")
	public int insert(Employee employee);
}
