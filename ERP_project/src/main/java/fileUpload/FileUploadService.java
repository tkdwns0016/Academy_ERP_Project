package fileUpload;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	public boolean saveUploadFile(MultipartFile filename) {
		
		//파일을 저장하기 위해 file자료형 사용
		//업로드할 폴더
		String uploadFolder = "/image";
		
		File file = new File(uploadFolder, filename.getOriginalFilename());
		
		try {
			filename.transferTo(file);
			return true;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return false;
		}
}
//	public void downLoadFile(HttpServletResponse response,String FileName) {
//		String downLoadFile = "/image";
//		File file  = new File(downLoadFile, FileName);
//		try {
//			byte [] fileByte = FileUtils.readFileToByteArray(file);
//			response.setContentType("application/octet-stream");
//			response.setContentLength(fileByte.length);
//			response.setHeader("Content-Disposition", "attachment; FileName=\"" + URLEncoder.encode(FileName, "UTF-8")+"\";");
//		    response.setHeader("Content-Transfer-Encoding", "binary");
//		    response.getOutputStream().write(fileByte);
//		    response.getOutputStream().flush();
//		    response.getOutputStream().close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
}