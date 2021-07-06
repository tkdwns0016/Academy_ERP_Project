package department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface DepartmentMapper {
	
	@Select("select department_name from department where department_id=#{departmentId}")
	public String selectName(int departmentId); 
	
	
}
