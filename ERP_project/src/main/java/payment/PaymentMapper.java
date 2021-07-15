package payment;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import service.Employee;

@Mapper
public interface PaymentMapper {
	/* payment insert */
	@Insert("insert into payment values(0,#{paymentBoardId},#{startDate},#{endDate},#{accountCompany},"
			+ "#{writer},#{writerDepartment},#{approver},#{division},#{detail},#{type},"
			+ "#{supplyPrice},#{VAT},#{ammountPrice},#{receipt},#{remark},#{paymentStatus},#{userId},#{writeDate})")
	public boolean insertPayment(Payment payment);
	@Select("select count(*) from payment")
	public int paymentCount();
	/* select all & get List */
	@Select("select * from payment order by id desc limit #{firstRow},#{pagePerCount}")
	public List<Payment> selectList(@Param("firstRow")int firstRow, @Param("pagePerCount")int pagePerCount);
	@Select("select * from payment")
	public List<Payment> getPaymentList();
	
	/* my paymentList */
	@Select("select * from payment where approver=#{approver}")
	public List<Payment> getMyPaymentList();
	
	/*payment*/
	@Select("select * from employee where department_id=10")
	public List<Employee> department10();
	
	@Select("select * from employee where department_id=20")
	public List<Employee> department20();
	
	@Select("select * from employee where department_id=30")
	public List<Employee> department30();
	
	@Select("select * from employee where department_id=40")
	public List<Employee> department40();
	
	@Select("select * from payment order by id desc limit 1")
	public int Lastindex();
	
	@Select("select * from payment")
	public List<Payment> getPaymentListBoard();
	
	
	/*account*/
	@Select("select * from account where account_name like concat('%',#{search},'%')")
	public List<Account> accountSearch(String search);
	@Select("select * from payment where payment_status like concat('%',#{paymentStatus},'%') order by id desc limit #{firstRow},#{pagePerCount}")
	public List selectWithPaymentStatus(@Param("firstRow") int firstRow, @Param("pagePerCount")int pagePerCount, @Param("paymentStatus")String paymentStatus);
	
	
}
