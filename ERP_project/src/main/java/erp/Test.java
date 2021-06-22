package erp;

import java.time.LocalDate;

public class Test {
	public static void main(String[] args) {
		
		LocalDate now = LocalDate.now();
		String str=now.getYear()+"";
		

		System.out.println(str.substring(2,4));
	}
	
}
