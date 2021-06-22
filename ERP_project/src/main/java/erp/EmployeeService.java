package erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper em;
	
	public String selectUserId(int departmentId) {
		return em.getUserId(departmentId);
	}
	
	public int inserEmployee(Employee employee) {
		return em.insert(employee);
	}
}
