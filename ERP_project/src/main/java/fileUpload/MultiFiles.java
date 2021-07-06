package fileUpload;

import org.springframework.web.multipart.MultipartFile;

public class MultiFiles {

	private String title;
	private MultipartFile[] fileName;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MultipartFile[] getFileName() {
		return fileName;
	}

	public void setFileName(MultipartFile[] fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "MultiFiles [title=" + title + ", fileName=" + fileName + "]";
	}

	
}
