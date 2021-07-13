package fileUpload;

import java.io.File;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import noticeBoard.NoticeBoard;
import service.Employee;

@Controller
public class FileController {

	
	
	@GetMapping("/upload")
	public String writeBoard(Model m,HttpSession session) {
		Employee emp = (Employee) session.getAttribute("empl");

		return "fileupload";
	}

	@PostMapping("/upload")
	public String upload(List<MultipartFile> fileName, Model model) {
	
		String uploadFolder = "/file";
		
		
		

		for(MultipartFile fileList : fileName) {
			System.out.println(fileList.getOriginalFilename());
			
			File uploadFile = new File(uploadFolder, fileList.getOriginalFilename());
		
		
		try {
			fileList.transferTo(uploadFile);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		}
		
	//올라온 파일확인
//	for(MultipartFile file : multiFiles.getfileName()) {
//		System.out.println(file.getOriginalFilename());
//	}
	
	return "main";
}

//	
//	@PostMapping("/upload")
//	public String upload(MultipartHttpServletRequest mtfRequst) {
//		
//		List<MultipartFile> fileList =mtfRequst.getFiles("fileName");
//	
//	
//		System.out.println("파일이름 : " +fileList);
//		System.out.println("파일이름 : " +fileList.toString());
//			
//		return "main";
//	}
	
}
