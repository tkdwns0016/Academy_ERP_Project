package payment;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public String paymentResult(Model model, MultipartFile receipt, Payment payment,HttpSession session) {
		Employee em = (Employee)session.getAttribute("empl");
		/*
		if(!receipt.getOriginalFilename().equals("")) {
			payment.setReceipt(receipt.getOriginalFilename());
			model.addAttribute("result",ps.insertPayment(payment,em.getUserId()+"")); 
		}else {
			model.addAttribute("result",ps.insertPayment(payment,em.getUserId()+""));
		}
		*/
		if(!receipt.getOriginalFilename().equals("")) {
			payment.setReceipt(receipt.getOriginalFilename());
			model.addAttribute("result",ps.insertPayment(payment,"21050607")); 
		}else {
			model.addAttribute("result",ps.insertPayment(payment,"21050607"));
		}
		
		return "payment/paymentWriterResult";
	}
	
	@GetMapping("/payment")
	public String paymentList(Model model, String name) {
		
		System.out.println(ps.getpaymentListBoard());
		model.addAttribute("paymentList", ps.getpaymentListBoard());
		
		return "payment/paymentBoard";
	}
	
	@GetMapping("/paymentView")
	public String paymentView(Model model) {
		
		return "payment/paymentListView";
	}

	@GetMapping("/paymentlist")
	public String payment(Model model, String page) {
		if (page != null) {
			model.addAttribute("list", ps.paymentList(page));
			model.addAttribute("theList", ps.getListWithProgress("결제", page));
			model.addAttribute("returnList", ps.getListWithProgress("반려", page));
			model.addAttribute("waitList", ps.getListWithProgress("승인대기", page));
		} else {
			model.addAttribute("list", ps.paymentList("1"));
			model.addAttribute("theList", ps.getListWithProgress("결제", "1"));
			model.addAttribute("returnList", ps.getListWithProgress("반려", "1"));
			model.addAttribute("waitList", ps.getListWithProgress("승인대기", "1"));
		}
		return "payment/paymentlist";
	}
	
}
