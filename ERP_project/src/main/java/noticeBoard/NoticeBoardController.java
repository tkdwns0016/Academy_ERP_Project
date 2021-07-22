package noticeBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	/* 공지 사항 이동 */
	@GetMapping("/notice")
	public String notice(Model model, String page) {
		
		ns.getService(page ,model);
		
		return "community/notice/notice";
	}

		

	@GetMapping("/noticeSearch")
	public String noticeSearch(Model model, NoticeComment comment, int id, String deleteNo,String updateCommentId,String updateComment , HttpServletRequest req,
			HttpSession session) {
		
		ns.noticeSearchService(model,comment,id,deleteNo,updateCommentId,updateComment,req,session);
		
		/*댓글 수정,삭제, 작성 결과 페이지 이동*/
		if(model.getAttribute("comment")!=null) {
			return "community/notice/result";
		}
		/*공지사항 게시판으로 이동*/
		return "community/notice/noticeSearch"; 
	}

	/* 삭제 페이지 */
	@PostMapping("/deleteNotice")
	public String postDeleteNotice(Model model, int id) {
		
		ns.deleteNotice(id,model);
		
		return "community/notice/result";
	}

	/* 작성 페이지 */
	@GetMapping("/noticeWriter")
	public String getNoticeWriter(Model model) {

		return "community/notice/noticeWriter";

	}

	/* 작성 후 결과 페이지 이동 */
	@PostMapping("/noticeWriter")
	public String postNoticeWriter(Model model, NoticeBoard noticeBoard, List<MultipartFile> filename) {
	
		ns.noticeWriteService(model,noticeBoard,filename);
		
		return "community/notice/result";

	}

	/* 수정 페이지 */
	@PostMapping("/noticeModify")
	public String getNoticeModify(Model model, int id) {
	
		ns.selectNoticeModifyService(id,model);
		
		return "community/notice/noticeModify";
	}
	
	/* 수정 작업 이후 결과창 이동*/
	@PostMapping("/noitceModify1")
	public String getNoticeModify1(Model model, NoticeBoard board, int id,List<MultipartFile>filename1) {

		ns.updateNoticeService(board,model,id,filename1);
		return "community/notice/result";
	}

	/* 업로드 파일 다운 페이지 이동*/
	@GetMapping("/filedownload")
	public String fileDownload(Model model, int id, String filename) {

		
		model.addAttribute("id", id);
		model.addAttribute("filename", filename);
		
		
		return "file/fileDownload";
	}

}
