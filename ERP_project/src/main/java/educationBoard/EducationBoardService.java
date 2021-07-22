package educationBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import service.Employee;

@Service
public class EducationBoardService {
@Autowired
EducationBoardMepper em;

	public List<EducationBoard> getList(){
		return em.selectList();
	}
	public List<EducationBoard> getBoardWithDepatmentId(int departmentId) {
	
		return em.selectEducation(departmentId);
	}
	public void getCRUDEdu(EducationBoard educationBoard,String button,Employee employee,Model model) {
		boolean result=false;
		if(button.equals("작성")) {
			int affectedRow=em.insert(educationBoard);
			if(affectedRow==1) {
				result =true;
			}
		
		}
		if(button.equals("삭제")) {
			int affectedRow=em.delete(educationBoard.getId());
			if(affectedRow==1) {
				result =true;
			}
		}
		if(button.equals("수정")) {
			int affectedRow=em.update(educationBoard);
			if(affectedRow==1) {
				result =true;
			}
		}
	
		model.addAttribute("departmentId",educationBoard.getDepartmentId());
		model.addAttribute("result", result);
		model.addAttribute("button", button);
	
	}
}
