package department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper dm;
	public String getDepart(int departmentId) {
		return dm.selectName(departmentId);
	}
}
