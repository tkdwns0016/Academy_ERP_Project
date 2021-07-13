package noticeBoard;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import service.EmplClass;
import service.Employee;
import service.ServiceClass;

@Controller
public class NoticeBoardController {
	@Autowired
	NoticeService ns;

	@GetMapping("/notice")
	public String notice(Model model, String page) {
		ServiceClass list;
		if (page != null) {
			list = ns.getService(page);
			model.addAttribute("list", list);
		} else {
			list = ns.getService("1");
			model.addAttribute("list", list);
		}
		List<String> writer= new ArrayList<String>();
		List<NoticeBoard> nList = (List <NoticeBoard>)list.getTablelist();
		for(int i=0;i<nList.size();i++) {
			writer.add("["+ns.getWriter(nList.get(i).getWriter()).getDepartment().getDepartmentName()+"] "+ns.getWriter(nList.get(i).getWriter()).getName());
		}
		model.addAttribute("writer", writer);
		return "notice/notice";
	}


	@GetMapping("/noticeSearch")
	public String noticeSearch(Model model, int id) {

		NoticeBoard result = ns.selectOne(id);
		if(result.getFilename()!=null) {
			
		String[] fileStr=result.getFilename().split(",");
		
		List<String> file= new ArrayList<String>();
		for(String str: fileStr) {
			file.add(str);
		}
		
		model.addAttribute("file", file);
		}
		
		model.addAttribute("beforeIndex", ns.getIndexInfo(id).get("beforeIndex"));
		model.addAttribute("nextIndex", ns.getIndexInfo(id).get("nextIndex"));
		model.addAttribute("result", result);
		model.addAttribute("writer", ns.getWriter(result.getWriter()));
		
		
		return "community/notice/noticeSearch"; 
	}

	/* 삭제 페이지 */
	@GetMapping("/deleteNotice")
	public String getDeleteNotice(int id) {

		ns.selectOne(id);

		return "notice";
	}

	@PostMapping("/deleteNotice")
	public String postDeleteNotice(int id) {
		ns.deleteNotice(id);
		System.out.println(id);
		String deleteFolder = "D:/files/"+id;
		File file = new File(deleteFolder);
		while(file.exists()) {
			File[] fileList=file.listFiles();
			for(int i = 0; i<fileList.length;i++) {
				fileList[i].delete();
			}
			if(fileList.length==0&& file.isDirectory()) {
				file.delete();
				
			}
		}
		return "community/notice/noticeDeleteResult";
	}

	/* 작성 페이지 */
	@GetMapping("/noticeWriter")
	public String getNoticeWriter(Model model) {

		
		
		return "community/notice/noticeWriter";

	}

	@PostMapping("/noticeWriter")
	public String postNoticeWriter(Model model, NoticeBoard noticeBoard, List<MultipartFile> filename) {
		
		String uploadFolder = "D:/files/"+ns.getLastIndex();
		System.out.println(uploadFolder);
		File folder = new File(uploadFolder);
		
		if(!folder.exists()) {
			try {
				folder.mkdir();
			}catch(Exception e) {
				System.out.println("폴더 못만들어 이바보야");
			}
		}
		
		String imgName= "";
		for(MultipartFile fileList : filename) {
			System.out.println(fileList.getOriginalFilename());
			
			File uploadFile = new File(uploadFolder, fileList.getOriginalFilename());
	
			imgName+=fileList.getOriginalFilename()+",";
		try {
			fileList.transferTo(uploadFile);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		}
		noticeBoard.setFilename(imgName);
		boolean result = ns.noticeWriter(noticeBoard);

		model.addAttribute("result", result);

		return "community/notice/noticeWriterResult";

	}

	/* 수정 페이지 */
	@PostMapping("/noticeModify")
	public String getNoticeModify(Model model, int id) {
		NoticeBoard notice = ns.selectOne(id);

		model.addAttribute("notice", notice);
		return "community/notice/noticeModify";
	}

	@PostMapping("/noitceModify1")
	public String getNoticeModify1(Model model, NoticeBoard board, int id) {
		ns.updateNotice(board);
		return "community/notice/noticeUpdateResult";
	}

	@GetMapping("/filedownload")
	public String fileDownload(Model model, int id, String filename) {

		
		model.addAttribute("id", id);
		model.addAttribute("filename", filename);
		
		
		return "file/fileDownload";
	}
}
