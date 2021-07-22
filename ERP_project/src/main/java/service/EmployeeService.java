package service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import department.Department;
import position.Position;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper em;
	@Autowired
	ImageService is;

	public void employeeService(Model model,String page) {
		ServiceClass serviceClass;
		
		List<Employee> list;
		
		List<EmplClass> emplList;
		
		if(page!=null) {
			serviceClass=new ServiceClass(Integer.parseInt(page),15, em.EmpleCount());
			emplList= em.selectECList(serviceClass.getFirstRow(),serviceClass.getPagePerCount());
			list = em.selectList(serviceClass.getFirstRow(),serviceClass.getPagePerCount());
		}else {
			serviceClass=new ServiceClass(1,15, em.EmpleCount());
			emplList= em.selectECList(serviceClass.getFirstRow(),serviceClass.getPagePerCount());
			list = em.selectList(serviceClass.getFirstRow(),serviceClass.getPagePerCount());
		}
		
		for(int i=0; i<list.size();i++) {
			emplList.get(i).setDepartment(em.getDepartment(list.get(i).getDepartmentId()));
			emplList.get(i).setPosition(em.getPosition(list.get(i).getPositionId()));
		}
		serviceClass.setTablelist(emplList);
		model.addAttribute("emplList",serviceClass);
	}
	
	public Employee select(int userId,String name,String birthDate) { 
		return em.changePassword(userId,name,birthDate);
	}
	
	public void updateEmpl(Model model, Employee employee,MultipartFile uploadFile,String birthDate1,String birthDate2,HttpSession session,String fileName) {
			Employee empl=(Employee)session.getAttribute("empl");
			employee.setBirthDate(birthDate1+birthDate2);
			employee.setUserId(empl.getUserId());
			if(!(fileName==null||fileName.equals(""))) {
				employee.setImgName(fileName);
				model.addAttribute("result", em.updateMyInfo(employee));
			}else {
				Employee empls=is.saveUploadedFile(uploadFile, employee);
				model.addAttribute("result", em.updateMyInfo(empls));
			}
			empl=em.selectWithUserId(employee.getUserId());
			session.setAttribute("empl", empl);
	}
	
	public boolean update(Employee employee) {
		int affectedRow=em.updateEmplInfo(employee);
		boolean result=true;
		if(affectedRow==-1) {
			result=false;
		}
		return result;
	}
	
	public Employee login(int userId, String password) {
		return em.select(userId, password);
	}

	
	public int selectUserId(int departmentId) {
		return em.getUserId(departmentId);
	}
	
	public void insertEmployee(Model model,Employee employee,String birthDate1,String birthDate2,MultipartFile imgName) {
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
		employee.setBirth(birthDate1.substring(2,4)+"월"+birthDate1.substring(4,6)+"일");
		employee.setPassword(userId2+"");
		employee.setHireDate(now);
		employee.setCompanyAddress("오주원 상사");
		employee.setCompanyPhone("010-0000-0000");
		employee.setManager("비권한");
		employee.setStatus("재직");
		Employee empl=is.saveUploadedFile(imgName, employee);
		model.addAttribute("join", em.insert(employee));
		model.addAttribute("resultType", "인사 등록이 완료되었습니다.");
	}

	public ServiceClass searchInfo(String name, String userId,String page) {
		List<EmplClass> list = new ArrayList<EmplClass>();
		List<Employee> emplList;
		List<EmplClass> listEc;
		if(!name.trim().equals("")) {
			ServiceClass serviceClass=new ServiceClass(Integer.parseInt(page),15, em.SearchNameCount());
			
			emplList=em.getEmplSearchName(name);
			listEc=em.getEcSearchName(name);
			for(int i=0; i<listEc.size();i++) {
				listEc.get(i).setDepartment(em.getDepartment(emplList.get(i).getDepartmentId()));
				listEc.get(i).setPosition(em.getPosition(emplList.get(i).getPositionId()));
				list.add(listEc.get(i));
			}
			serviceClass.setTablelist(list);
			return serviceClass;
		}
		
		  if(!userId.trim().equals("")) { 
			  ServiceClass serviceClass=new ServiceClass(Integer.parseInt(page),15, em.SearchUserIdCount());
			  emplList=em.getEmplSerachUserId(Integer.parseInt(userId));
			  listEc=em.getEcSerachUserId(Integer.parseInt(userId));
			  for(int i=0; i<listEc.size();i++) {
					listEc.get(i).setDepartment(em.getDepartment(emplList.get(i).getDepartmentId()));
					listEc.get(i).setPosition(em.getPosition(emplList.get(i).getPositionId()));
					list.add(listEc.get(i));
				}
			  serviceClass.setTablelist(list);
			  return serviceClass;
		  }
		  if(name!=null && userId!=null) { 
			   
			  emplList=em.getEmplSearchAll(name,Integer.parseInt(userId));
			  listEc=em.getEcSearchAll(name,Integer.parseInt(userId));
			  for(int i=0; i<listEc.size();i++) {
					listEc.get(i).setDepartment(em.getDepartment(emplList.get(i).getDepartmentId()));
					listEc.get(i).setPosition(em.getPosition(emplList.get(i).getPositionId()));
					list.add(listEc.get(i));
				}
			  ServiceClass serviceClass=new ServiceClass(Integer.parseInt(page),15, em.SearchAllCount());
			  serviceClass.setTablelist(list);
			  return serviceClass;
		  }
		  
		 
		return null;
	}
	public ServiceClass search(String page, String SearchOption, String search) {
		List<Employee> empl = new ArrayList<Employee>();
		List<EmplClass>emplC= new ArrayList<EmplClass>();
		int count=0;
		ServiceClass sc;
		switch (SearchOption) {
		case "position":
			Position p=em.getSearchPo(search);
			count=em.searchCountWithPositionId(p.getPositionId());
			if(p!=null) {
				sc = new ServiceClass(Integer.parseInt(page), 15, count);
				empl= em.searchEmplListWithPositionId(p.getPositionId(),sc.getFirstRow(),15);
				
				if(!empl.isEmpty()) {
					emplC= em.searchECListWithPositionId(p.getPositionId(),sc.getFirstRow(),15);
					for(int i=0;i<emplC.size();i++) {
						emplC.get(i).setDepartment(em.getDepartment(empl.get(i).getDepartmentId())); 
						emplC.get(i).setPosition(em.getPosition(empl.get(i).getPositionId())); 
					}
					sc.setTablelist(emplC);
				}else {
					return null;
				}
			}
			else {
				return null;
			}
			break;

		case "department":
			Department d = em.getSearchDep(search);
			if(d!=null) {
				count=em.searchCountWithDepartmentId(d.getDepartmentId());
				sc = new ServiceClass(Integer.parseInt(page), 15, count);
				
				empl= em.searchEmplListWithDepartmentId(d.getDepartmentId(),sc.getFirstRow(),15);
				if(!empl.isEmpty()) {
					emplC= em.searchECListWithDepartmentId(d.getDepartmentId(),sc.getFirstRow(),15);
					for(int i=0;i<emplC.size();i++) {
						emplC.get(i).setDepartment(em.getDepartment(empl.get(i).getDepartmentId())); 
						emplC.get(i).setPosition(em.getPosition(empl.get(i).getPositionId())); 
					}
					
					sc.setTablelist(emplC);
				}else {
					return null;
				}
			}else {
				return null;
				
			}
			break;

		case "name":
			count=em.searchCountWithName(search);
			sc = new ServiceClass(Integer.parseInt(page), 15, count);
			empl= em.searchEmplListWithName(search,sc.getFirstRow(),15);
			if(!empl.isEmpty()) {
				
				emplC= em.searchECListWithName(search,sc.getFirstRow(),15);
				for(int i=0;i<emplC.size();i++) {
					emplC.get(i).setDepartment(em.getDepartment(empl.get(i).getDepartmentId())); 
					emplC.get(i).setPosition(em.getPosition(empl.get(i).getPositionId())); 
				}
				sc.setTablelist(emplC);
			}else {
				return null;
			}
			break;

		case "hire_date":
			count=em.searchCountWithHireDate(search);
			sc = new ServiceClass(Integer.parseInt(page), 15, count);
			empl= em.searchEmplListWithHireDate(search,sc.getFirstRow(),15);
			if(!empl.isEmpty()) {
				emplC= em.searchECListWithHireDate(search,sc.getFirstRow(),15);
				for(int i=0;i<emplC.size();i++) {
					emplC.get(i).setDepartment(em.getDepartment(empl.get(i).getDepartmentId())); 
					emplC.get(i).setPosition(em.getPosition(empl.get(i).getPositionId())); 
				}
				sc.setTablelist(emplC);
			}else {
				return null;
			}
			break;

		case "user_id":
			count=em.searchCountWithUserId(search);
			sc = new ServiceClass(Integer.parseInt(page), 15, count);
			empl= em.searchEmplListWithUserId(search,sc.getFirstRow(),15);
			if(!empl.isEmpty()) {
				emplC= em.searchECListWithUserId(search,sc.getFirstRow(),15);
				for(int i=0;i<emplC.size();i++) {
					emplC.get(i).setDepartment(em.getDepartment(empl.get(i).getDepartmentId())); 
					emplC.get(i).setPosition(em.getPosition(empl.get(i).getPositionId())); 
				}
				sc.setTablelist(emplC);
			}else {
				return null;
			}
			break;

		default:
			return null;
		}
		 return sc;
	}

	public Employee selectWithUserId(int userId) {
		Employee ep=em.getEmplSeletWithUserId(userId);
		return ep;
	}
}

