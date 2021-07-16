package suggestionBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import noticeBoard.NoticeBoard;
import service.ServiceClass;

@Controller
public class SuggestionBoardController {

	@Autowired
	SuggestionBoardService ss;
	
	@GetMapping("/suggestion")
	public String suggestion(Model model,String page) {
		ServiceClass list;
		if(page!=null) {
			list=ss.getService(page);
			model.addAttribute("list", list);
		}else {
			list=ss.getService("1");
			model.addAttribute("list", list);
		}
		List<String> writer= new ArrayList<String>();
		List<SuggestionBoard> sList = (List <SuggestionBoard>)list.getTablelist();
		for(int i=0;i<sList.size();i++) {
			writer.add("["+ss.getWriter(sList.get(i).getWriter()).getDepartment().getDepartmentName()+"] "+ss.getWriter(sList.get(i).getWriter()).getName());
		}
		model.addAttribute("writer", writer);
		return "suggestion/suggestion";
	}
	@GetMapping("/suggestionSearch")
	public String suggestionContent(Model model,int id) {
		SuggestionBoard result=ss.showContent(id);
		if(result.getFilename()!=null) {
			if(!result.getFilename().equals("")) {
				
			String[] fileStr=result.getFilename().split(",");
			
			List<String> file= new ArrayList<String>();
			for(String str: fileStr) {
				file.add(str);
			}
			model.addAttribute("file", file);
			}
		}
		model.addAttribute("beforeIndex", ss.getIndexInfo(id).get("beforeIndex"));
		model.addAttribute("nextIndex", ss.getIndexInfo(id).get("nextIndex"));
		model.addAttribute("result", result);
		model.addAttribute("writer", ss.getWriter(result.getWriter()));
		
		
		return "suggestion/suggestionSearch";
	}
	@PostMapping("suggestionModify")
	public String suggestionModify(Model model, int id) {
		SuggestionBoard result = ss.showContent(id);
		if(result.getFilename()!=null) {
			if(!result.getFilename().equals("")) {
				String[] fileStr=result.getFilename().split(",");
				
				List<String> file= new ArrayList<String>();
				for(String str: fileStr) {
					file.add(str);
				}
				
				model.addAttribute("file", file);
			}
		
		}
		
		model.addAttribute("suggestion", result);
		return "suggestion/suggestionModify";
	}
	@PostMapping("/suggestionModify1")
	public String suggestionModify1(Model model,int id ,SuggestionBoard suggestionBoard,List<MultipartFile>filename1) {
		String fileName="";
		suggestionBoard.setId(id);
		String uploadFolder="D:/files/suggestionBoard/"+suggestionBoard.getId();
		File folder = new File(uploadFolder);
		if(!filename1.get(0).getOriginalFilename().equals("")) {
		if(!folder.exists()) {
			folder.mkdir();
		}
			for(MultipartFile m:filename1) {
				File fileList= new File(uploadFolder,m.getOriginalFilename());
				try {
					m.transferTo(fileList);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		
			
			for( MultipartFile m:filename1) {
				fileName+=m.getOriginalFilename()+",";
			}
		}
		if(suggestionBoard.getFilename()!=null) {
			suggestionBoard.setFilename(suggestionBoard.getFilename()+","+fileName);
			
		}else {
			suggestionBoard.setFilename(fileName);
		}
	
	
		folder = new File(uploadFolder);
		if(folder.exists()) {
			if(!suggestionBoard.getFilename().equals("")) {
		
				String[] str=suggestionBoard.getFilename().split(",");
				File[] fileList=folder.listFiles();
				List<String> list= new ArrayList<String>();
			
				for(int i =0; i<str.length;i++) {
					list.add(str[i]);
				}
				for(int i=0; i<fileList.length;i++) {
					if(!list.contains(fileList[i].getName())) {
						fileList[i].delete();
					}
				}

			}else {
			
					File[] fileList=folder.listFiles();
					for(int i=0; i<fileList.length;i++) {
						fileList[i].delete();
					
					}
					folder.delete();
				
					
						
				}
			}
			model.addAttribute("result",ss.update(suggestionBoard));
			model.addAttribute("resultType", "수정");
		return "suggestion/result";
		
	}

	@GetMapping("/suggestionWriter")
	public String suggestionWriter() {
		return "suggestion/suggestionWriter";
	}
	@PostMapping("/suggestionWriter")
	public String postWriter(Model model,SuggestionBoard suggestionBoard,List<MultipartFile> filename) {
		boolean result=ss.insert(suggestionBoard,filename);
		model.addAttribute("result", result);
		model.addAttribute("resultType","작성");
		return "suggestion/result";
	}
}
