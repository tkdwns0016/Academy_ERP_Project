package service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {

	public Boolean saveUploadedFile(MultipartFile imgName, int userId) {
		String uploadFolder = "/WEB-INF/image";
		
		
		File dir = new File(uploadFolder);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		String extension = imgName.getOriginalFilename().substring(imgName.getOriginalFilename().lastIndexOf("."));
		File file = new File(uploadFolder, userId + extension);
		// 실제로 파일을 저장
		try {
			imgName.transferTo(file);
			return true;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}
