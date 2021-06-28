package noticeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import anonymousBoard.AnonymousBoard;
import service.ServiceClass;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardMapper nm;
	
	public ServiceClass getService(String page){
		ServiceClass sc= new ServiceClass(Integer.parseInt(page), nm.selectList(), 20, nm.count());
		return sc;
	}
	public NoticeBoard showContent(int id) {
		NoticeBoard nb=nm.select(id);
		nm.countPlus(nb.getCount()+1,id);
		return nb;
	}
	
	public List<NoticeBoard> mainList(){
		return nm.mainList();
	}
}
