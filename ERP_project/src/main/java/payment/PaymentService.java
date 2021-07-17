package payment;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.Employee;
import service.ServiceClass;

@Service
public class PaymentService {
	@Autowired
	PaymentMapper pm;
	
	
	/* payment */
	public List<Employee> department10() {
		return pm.department10();
	}

	public List<Employee> department20() {
		return pm.department20();
	}

	public List<Employee> department30() {
		return pm.department30();
	}

	public List<Employee> department40() {
		return pm.department40();
	}
	
	/*account*/
	public List<Account> accountSearch(String search){
		return pm.accountSearch(search);
	}

	public boolean insertPayment(Paymentboardlist Paymentboardlist, int userId) {
		int paypmentBoadrdId=pm.Lastindex()+1;
		String title=Paymentboardlist.getTitle();
		String Approver=Paymentboardlist.getApprover();
		LocalDate now=LocalDate.now();
		//String[] fileList = Paymentboardlist.getReceipt().split(",");
		String[] division = Paymentboardlist.getDivision().split(",");
		String[] detail = Paymentboardlist.getDetail().split(",");
		String[] type = Paymentboardlist.getType().split(",");
		String[] supplyPrice = Paymentboardlist.getSupplyPrice().split(",");
		String[] VAT = Paymentboardlist.getVAT().split(",");
		String[] ammountPrice = Paymentboardlist.getAmmountPrice().split(",");
		String[] remark = Paymentboardlist.getRemark().split(",");
	
		
		
		System.out.println(Paymentboardlist.getReceipt());
		for(int i=0; i<division.length; i++) { 
			String division1=division[i];
			String detail1=detail[i];
			String type1=type[i];
			String supplyPrice1=supplyPrice[i];
			String VAT1=VAT[i];
			String ammountPrice1=ammountPrice[i];
			String remark1=remark[i];
			for(int j=0; j<ammountPrice1.length(); j++) {
				int allPrice=Integer.parseInt(ammountPrice1);
				int allPriceSum+=allPrice;
				총액계산하는거부터해야함;
			}
			
			
			
			
			pm.insertPaymentboardlist(new Paymentboardlist(
					0,
					paypmentBoadrdId,
					Paymentboardlist.getStartDate(),
					Paymentboardlist.getEndDate(),
					Paymentboardlist.getAccountCompany(),
					Paymentboardlist.getWriter(),
					Paymentboardlist.getWriterDepartment(),
					Approver,
					division1, 
					detail1, 
					type1, 
					supplyPrice1, 
					VAT1, 
					ammountPrice1, 
					Paymentboardlist.getReceipt(),
					remark1,
					"결제대기",
					userId,
					now,
					title));
		}
		pm.insertPayment(new Payment(
				paypmentBoadrdId, 
				title, 
				Paymentboardlist.getWriter(),
				Approver,
				"지출결의서",
				"결제대기",
				userId,
				now
				));
		
		return true;
	}
	
	/* 조회 */
	public List<Payment> getPaymentBoardList(int userId){
		
		return pm.paymentBoardList(userId);
	}
	
	public List<Paymentboardlist> getPaymentBoardListSelectId(int id){
		
		return pm.getPaymentBoardListSelectId(id);
	}
	
	/* 결제게시판 */
	
	public List<Paymentboardlist> getpaymentListBoard(){
		return pm.getPaymentListBoard();
	}
	
	public ServiceClass paymentList(String page){
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),  15, pm.PaymentboardlistCount());
		sc.setTablelist(pm.selectList(sc.getFirstRow(),15));
		return sc;
		
		
	}
	
	public ServiceClass getListWithProgress(String paymentStatus, String page) {
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),  15, pm.PaymentboardlistCount());
		sc.setTablelist(pm.selectWithPaymentStatus(sc.getFirstRow(),15,paymentStatus));
		return sc;
	}
	
}
