package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper em;
	
	public ServiceClass employeeService(int page) {
		ServiceClass serviceClass=new ServiceClass(page, em.selectList(), 20, em.EmpleCount());
		return serviceClass;
	}
	public Employee select(int userId,String name,String birthDate) {
		return em.changePassword(userId,name,birthDate);
	}
	
	public void update(Employee employee) {
		em.update(employee);
	}
	
	public Employee login(int userId, String password) {
		return em.select(userId, password);
	}
	public List<Employee> selectList(){
		return em.selectList();
	}
	
	public int selectUserId(int departmentId) {
		return em.getUserId(departmentId);
	}
	
	public int insertEmployee(Employee employee) {
		return em.insert(employee);
	}
	
	public int userIdCount(int departmentId) {
		return em.userIdCount(departmentId);
	}
}

