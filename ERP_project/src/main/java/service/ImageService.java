package service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {

	public Employee saveUploadedFile(MultipartFile imgName, Employee employee) {
		String uploadFolder = "C:/Users/JungGil/git/Project_ERP/ERP_project/src/main/webapp/WEB-INF/image/";
		if(imgName.getOriginalFilename().equals("")) {
			employee.setImgName("normalImg.jpg");
			return employee;
		}
		
		File dir = new File(uploadFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String extension = imgName.getOriginalFilename().substring(imgName.getOriginalFilename().lastIndexOf("."));
		File file = new File(uploadFolder, employee.getUserId() + extension);
		// 실제로 파일을 저장
		try {
			imgName.transferTo(file);
			employee.setImgName(employee.getUserId() + extension);
			return employee;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	} 

}
