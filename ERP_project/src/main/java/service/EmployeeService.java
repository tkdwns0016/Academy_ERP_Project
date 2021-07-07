package service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.Position;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import department.Department;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper em;
	@Autowired
	ImageService is;

	public ServiceClass employeeService(String page) {
		List<Employee> list=em.selectList();
	
		ServiceClass serviceClass=new ServiceClass(Integer.parseInt(page), list,20, em.EmpleCount());
		return serviceClass;
	}
	public List<EmplClass> getEmplList(){
		List<EmplClass> emplList= new ArrayList<EmplClass>();
		List<Employee> list = em.selectList();
		for(int i=0;i<list.size();i++) {
			emplList.add(new EmplClass(
					list.get(i).getId(),list.get(i).getName(),
					list.get(i).getUserId(),list.get(i).getPassword(),list.get(i).getAddressId(),
					list.get(i).getAddress1(),list.get(i).getAddress2(),list.get(i).getPhone(),
					list.get(i).getEmail(),list.get(i).getHireDate(),list.get(i).getBirthDate(),
					list.get(i).getSex(),em.getDepartment(list.get(i).getDepartmentId()),
					list.get(i).getImgName(),em.getPosition(list.get(i).getPositionId()),
					list.get(i).getSalary(),list.get(i).getManager(),list.get(i).getStatus()
					));
		}
		return emplList;
	}
	public Employee select(int userId,String name,String birthDate) { 
		return em.changePassword(userId,name,birthDate);
	}
	public boolean noImgUpdateEmpl(Employee employee,String birthDate1,String birthDate2) {
		employee.setBirthDate(birthDate1+birthDate2);
		boolean result;
		int affectedRow=em.update(employee);
		if(affectedRow>=1) {
			result=true;
		}else {
			result=false;
		}
		return result;
	
	}
	public boolean updateEmpl(Employee employee,String birthDate1,String birthDate2,MultipartFile uploadFile) {
		employee.setBirthDate(birthDate1+birthDate2);
		Employee empl=is.saveUploadedFile(uploadFile, employee);
		boolean result;
		int affectedRow=em.update(empl);
		if(affectedRow>=1) {
			result=true;
		}else {
			result=false;
		}
		return result;
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
	
	public boolean insertEmployee(Employee employee,String birthDate1,String birthDate2,MultipartFile imgName) {
		String userId = "";
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		String classId=str.substring(2,4)+employee.getDepartmentId();
		userId=classId+"0000";
		int IdCount=em.userIdCount(employee.getDepartmentId());
		IdCount+=1;
		int userId2= Integer.parseInt(userId)+IdCount;
		employee.setUserId(userId2);
		
		employee.setBirthDate(birthDate1+birthDate2);
		
		employee.setPassword(userId2+"");
		employee.setHireDate(now);
		
		employee.setManager("비권한");
		employee.setStatus("근무");
		Employee empl=is.saveUploadedFile(imgName, employee);
		int affectedRow=em.insert(employee);
		boolean result;
		if(affectedRow>=1) {
			result=true;
		}else {
			result=false;
		}
		return result;
	}
	public List<EmplClass> searchInfo(String name, String userId) {
		List<EmplClass> list = new ArrayList<EmplClass>();
		System.out.println(name);
		System.out.println(name.trim());
		System.out.println(!name.trim().equals(""));
		if(!name.trim().equals("")) {
			System.out.println(em.getSearchName(name));
			//return ;
		}
		/*
		 * if(!userId.trim().equals("")) { //return em.getSerachUserId(userId); }
		 * if(name!=null && userId!=null) { // return em.getSearchAll(name,userId); }
		 */
		return null;
	}
	

}

