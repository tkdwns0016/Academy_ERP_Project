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

	public boolean insertPayment(Payment payment, String userId) {
		int paypmentBoadrdId=pm.Lastindex()+1;

		//String[] fileList = payment.getReceipt().split(",");
		String[] division = payment.getDivision().split(",");
		String[] detail = payment.getDetail().split(",");
		String[] type = payment.getType().split(",");
		String[] supplyPrice = payment.getSupplyPrice().split(",");
		String[] VAT = payment.getVAT().split(",");
		String[] ammountPrice = payment.getAmmountPrice().split(",");
		String[] remark = payment.getRemark().split(",");
		System.out.println("디테일:"+detail.length);
		System.out.println("타입:"+type.length);
		System.out.println("서플라이프라이스:"+supplyPrice.length);
		System.out.println("브이에이티:"+VAT.length);
		System.out.println("어마운트프라이스:"+ammountPrice.length);
		System.out.println("디비전:"+division.length);
		//System.out.println("파일:"+fileList.length);
		System.out.println(payment.getReceipt());
		for(int i=0; i<division.length; i++) { 
			String division1=division[i];
			String detail1=detail[i];
			String type1=type[i];
			String supplyPrice1=supplyPrice[i];
			String VAT1=VAT[i];
			String ammountPrice1=ammountPrice[i];
			String remark1=remark[i];
			LocalDate now=LocalDate.now();
			
			pm.insertPayment(new Payment(0,
					paypmentBoadrdId,
					payment.getStartDate(),
					payment.getEndDate(),
					payment.getAccountCompany(),
					payment.getWriter(),
					payment.getWriterDepartment(),
					payment.getApprover(),
					division1, 
					detail1, 
					type1, 
					supplyPrice1, 
					VAT1, 
					ammountPrice1, 
					payment.getReceipt(),
					remark1,
					"결제대기",
					userId,
					now));
		}
		return true;
	}
	
	/* 결제게시판 */
	
	public List<Payment> getpaymentListBoard(){
		return pm.getPaymentListBoard();
	}
	
	public ServiceClass paymentList(String page){
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),  15, pm.paymentCount());
		sc.setTablelist(pm.selectList(sc.getFirstRow(),15));
		return sc;
		
		
	}
	
	public ServiceClass getListWithProgress(String paymentStatus, String page) {
		ServiceClass sc = new ServiceClass(Integer.parseInt(page),  15, pm.paymentCount());
		sc.setTablelist(pm.selectWithPaymentStatus(sc.getFirstRow(),15,paymentStatus));
		return sc;
	}
	
}
