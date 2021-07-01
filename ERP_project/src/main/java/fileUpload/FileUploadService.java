package fileUpload;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	public boolean saveUploadFile(MultipartFile filename) {
		
		//파일을 저장하기 위해 file자료형 사용
		//업로드할 폴더
		String uploadFolder = "E:\\과정평가형_송민현\\project\\fileUpload";
		
		File file = new File(uploadFolder, filename.getOriginalFilename());
		
		try {
			filename.transferTo(file);
			return true;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return false;
		}
}
}