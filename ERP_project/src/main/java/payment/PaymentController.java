package payment;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import service.Employee;

@Controller
public class PaymentController {
	@Autowired
	PaymentService ps;
	@Autowired
	PaymentMapper pm;
	
	

	
	@GetMapping("/payment")
	public String paymentList(Model model, HttpServletResponse response,HttpSession session, String paymentStatus) {			
		Employee emp=new Employee();
		if(session.getAttribute("empl")==null) {
			try {
				response.sendRedirect("/login");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			
			emp=(Employee)session.getAttribute("empl");
		}
		
		model.addAttribute("paymentList",  ps.getPaymentBoardList(emp.getUserId(),paymentStatus));
		
		
		return "payment/paymentBoard";
	}
	
	
	@PostMapping("/payment")
	public String paymentBoardSearch(Model model, String startDate, String endDate, HttpSession session) {
		Employee em = (Employee)session.getAttribute("empl");
	
		
		model.addAttribute("paymentList", ps.getPaymentBoardDaySearch(startDate, endDate, em.getUserId()));
		
		return "payment/paymentBoard";
	}

	@GetMapping("/paymentWriter")
	public String payment(Model model) {
	
		
		return "payment/paymentWriter";
	}

	@GetMapping("/paymentPopup")
	public String paymentPopup(Model model) {
		
		
		
		model.addAttribute("Operation", ps.department10());
		model.addAttribute("Development", ps.department20());
		model.addAttribute("HumanResources", ps.department30());
		model.addAttribute("research", ps.department40());
		return "payment/paymentPopup";
	}

	@GetMapping("/account")
	public String accountPopup(Model model, String search) {
		ps.accountSearch(search);
		return "payment/accountPopup";
	}

	@PostMapping("/accountSearch")
	public String accountPopupPost(Model model, String search) {
		model.addAttribute("search", ps.accountSearch(search));
		return "payment/accountPopupSearch";
	}

	@PostMapping("/paymentResult")
	public String paymentResult(Model model, MultipartFile receipt, Paymentboardlist paymentboardlist,Payment payment,HttpSession session, int userId) {
		Employee em = (Employee)session.getAttribute("empl");
		/*
		if(!receipt.getOriginalFilename().equals("")) {
			payment.setReceipt(receipt.getOriginalFilename());
			model.addAttribute("result",ps.insertPayment(payment,em.getUserId()+"")); 
		}else {
			model.addAttribute("result",ps.insertPayment(payment,em.getUserId()+""));
		}
		*/
		
		
		if(!(receipt.getOriginalFilename().equals(""))) {
			paymentboardlist.setReceipt(receipt.getOriginalFilename());
			
			model.addAttribute("result",ps.insertPayment(paymentboardlist,userId)); 
		}else {
			model.addAttribute("result",ps.insertPayment(paymentboardlist,userId));
		}
		
		return "payment/paymentWriterResult";
	}
	

	
	@GetMapping("/paymentView")
	public String paymentView(Model model, int id) {
		
		model.addAttribute("selectlist", pm.getPaymentBoardListSelectId(id));
		
		
		return "payment/paymentListView";
	}
	
	
	@GetMapping("/paymentApprove")
	public String paymentApprove(int id) {
		
		ps.paymentApproveBoard(id);
		ps.paymentboardlistApproveBoard(id);
		
		return "payment/paymentApproveResult";
	}

}
