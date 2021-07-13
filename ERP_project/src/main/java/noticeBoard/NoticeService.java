package noticeBoard;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import anonymousBoard.AnonymousBoard;
import department.Department;
import service.EmplClass;
import service.Employee;
import service.ServiceClass;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardMapper nm;

	public ServiceClass getService(String page) {
		ServiceClass sc = new ServiceClass(Integer.parseInt(page), 20, nm.count());
		sc.setTablelist(nm.selectList(sc.getFirstRow(),20));
		return sc;
	}

	public NoticeBoard showContent(int id) {
		NoticeBoard nb = nm.select(id);
		nm.countPlus(nb.getCount() + 1, id);
		return nb;
	}

	public List<NoticeBoard> mainList() {
		return nm.mainList();
	}

	public NoticeBoard selectOne(int id) {
		NoticeBoard result = nm.select(id);
		return result;
	}

	public boolean noticeWriter(NoticeBoard noticeBoard) {

		noticeBoard.setWriteDate(LocalDate.now());
		return nm.insert(noticeBoard);
	}

	public boolean deleteNotice(int id) {
		return nm.delete(id);
	}

	public int updateNotice(NoticeBoard board) {
		return nm.update(board);
	}

	public EmplClass getWriter(String writer) {
		Map<String, String> writerMap= new HashMap<String, String>();
		Employee empl=nm.getWriter(writer);
		EmplClass ec=nm.getECWriter(writer);
		Department dp =new Department(empl.getDepartmentId(),nm.getDepartment(empl.getDepartmentId()));
		ec.setDepartment(dp);
		
		return ec;
	}

	public int getLastIndex() {
		return nm.getLastIndex()+1;
		
	}
	public int getNextIndex(int id) {
		return nm.getNextIndex(id);
	}
	public int getBeforeIndex(int id) {
		return nm.getBeforeIndex(id);
	}
	public Map<String, Integer> getIndexInfo(int id) {
		Map<String, Integer> index = new HashMap<String, Integer>();
		
		if(nm.getFirstIndex()==id) {
			index.put("beforeIndex",id);
		}else {
			index.put("beforeIndex",nm.getBeforeIndex(id));
		}
		if(nm.getLastIndex()==id) {
			index.put("nextIndex",id);
		}else {
			index.put("nextIndex", nm.getNextIndex(id));
		}
		return index;
	}
	
}
