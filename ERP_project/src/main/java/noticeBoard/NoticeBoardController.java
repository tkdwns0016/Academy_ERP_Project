package noticeBoard;

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

@Controller
public class NoticeBoardController {
	@Autowired
	NoticeService ns;

	@GetMapping("/notice")
	public String notice(Model model, String page) {
		if (page != null) {
			model.addAttribute("list", ns.getService(page));
		} else {
			model.addAttribute("list", ns.getService("1"));
		}
		return "notice/notice";
	}

	@GetMapping("/noticeContent")
	public String noticeContent(Model model, int id) {
		model.addAttribute("notice", ns.showContent(id));
		return "notice/noticeContent";
	}

	@GetMapping("/noticeSearch")
	public String noticeSearch(Model model, String page, int id) {

		NoticeBoard result = ns.selectOne(id);
		model.addAttribute("result", result);
		
		if (page != null) {
			model.addAttribute("list", ns.getService(page));
		} else {
			model.addAttribute("list", ns.getService("1"));
		}
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
		return "community/notice/noticeDeleteResult";
	}

	/* 작성 페이지 */
	@GetMapping("/noticeWriter")
	public String getNoticeWriter(Model model) {

		return "community/notice/noticeWriter";

	}

	@PostMapping("/noticeWriter")
	public String postNoticeWriter(Model model, NoticeBoard noticeBoard) {

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

}
