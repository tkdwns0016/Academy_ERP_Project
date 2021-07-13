package service;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
   private int id;
   private String name;
   private int userId;
   private String password;
   private String addressId;
   private String address1;
   private String address2;
   private String phone;
   private String email;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private LocalDate hireDate;
   private String birthDate;
   private String sex;
   private int departmentId;
   private String imgName;
   private int positionId;
   private long salary;
   private String manager;
   private String status;
   private String englishName;
   private String lunarCalendar;
   private String birth;
   private String koreanForeigner;
   private String companyPhone;
   private String marriage;
   private String companyAddress;
   private String salaryPaymentStandards;
   private String workType;
   private String remark;

   public Employee(int id, String name, int userId, String password, String addressId, String address1,
         String address2, String phone, String email, LocalDate hireDate, String birthDate, String sex,
         int departmentId, String imgName, int positionId, long salary, String manager, String status,
         String englishName, String lunarCaledar, String birth, String koreanForeigner, String companyPhone,
         String marriage, String companyAddress, String salaryPaymentStandards,
         String workType, String remark) {
      super();
      this.id = id;
      this.name = name;
      this.userId = userId;
      this.password = password;
      this.addressId = addressId;
      this.address1 = address1;
      this.address2 = address2;
      this.phone = phone;
      this.email = email;
      this.hireDate = hireDate;
      this.birthDate = birthDate;
      this.sex = sex;
      this.departmentId = departmentId;
      this.imgName = imgName;
      this.positionId = positionId;
      this.salary = salary;
      this.manager = manager;
      this.status = status;
      this.englishName = englishName;
      this.lunarCalendar = lunarCaledar;
      this.birth = birth;
      this.koreanForeigner = koreanForeigner;
      this.companyPhone = companyPhone;
      this.marriage = marriage;
      this.companyAddress = companyAddress;
      this.salaryPaymentStandards = salaryPaymentStandards;
      this.workType = workType;
      this.remark = remark;
   }

   public Employee() {
      super();
   }

   @Override
   public String toString() {
      return "Employee [id=" + id + ", name=" + name + ", userId=" + userId + ", password=" + password
            + ", addressId=" + addressId + ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone
            + ", email=" + email + ", hireDate=" + hireDate + ", birthDate=" + birthDate + ", sex=" + sex
            + ", departmentId=" + departmentId + ", imgName=" + imgName + ", positionId=" + positionId + ", salary="
            + salary + ", manager=" + manager + ", status=" + status + ", englishName=" + englishName
            + ", lunarCaledar=" + lunarCalendar + ", birth=" + birth + ", koreanForeigner=" + koreanForeigner
            + ", companyPhone=" + companyPhone  + ", marriage=" + marriage
            + ", companyAddress=" + companyAddress+ ", salaryPaymentStandards="
            + salaryPaymentStandards + ", workType=" + workType + ", remark=" + remark + "]";
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getUserId() {
      return userId;
   }

   public void setUserId(int userId) {
      this.userId = userId;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getAddressId() {
      return addressId;
   }

   public void setAddressId(String addressId) {
      this.addressId = addressId;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public LocalDate getHireDate() {
      return hireDate;
   }

   public void setHireDate(LocalDate hireDate) {
      this.hireDate = hireDate;
   }

   public String getBirthDate() {
      return birthDate;
   }

   public void setBirthDate(String birthDate) {
      this.birthDate = birthDate;
   }

   public String getSex() {
      return sex;
   }

   public void setSex(String sex) {
      this.sex = sex;
   }

   public int getDepartmentId() {
      return departmentId;
   }

   public void setDepartmentId(int departmentId) {
      this.departmentId = departmentId;
   }

   public String getImgName() {
      return imgName;
   }

   public void setImgName(String imgName) {
      this.imgName = imgName;
   }

   public int getPositionId() {
      return positionId;
   }

   public void setPositionId(int positionId) {
      this.positionId = positionId;
   }

   public long getSalary() {
      return salary;
   }

   public void setSalary(long salary) {
      this.salary = salary;
   }

   public String getManager() {
      return manager;
   }

   public void setManager(String manager) {
      this.manager = manager;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getEnglishName() {
      return englishName;
   }

   public void setEnglishName(String englishName) {
      this.englishName = englishName;
   }

   public String getLunarCalendar() {
      return lunarCalendar;
   }

   public void setLunarCalendar(String lunarCalendar) {
      this.lunarCalendar = lunarCalendar;
   }

   public String getBirth() {
      return birth;
   }

   public void setBirth(String birth) {
      this.birth = birth;
   }

   public String getKoreanForeigner() {
      return koreanForeigner;
   }

   public void setKoreanForeigner(String koreanForeigner) {
      this.koreanForeigner = koreanForeigner;
   }

   public String getCompanyPhone() {
      return companyPhone;
   }

   public void setCompanyPhone(String companyPhone) {
      this.companyPhone = companyPhone;
   }



   public String getMarriage() {
      return marriage;
   }

   public void setMarriage(String marriage) {
      this.marriage = marriage;
   }

   public String getCompanyAddress() {
      return companyAddress;
   }

   public void setCompanyAddress(String companyAddress) {
      this.companyAddress = companyAddress;
   }


   public String getSalaryPaymentStandards() {
      return salaryPaymentStandards;
   }

   public void setSalaryPaymentStandards(String salaryPaymentStandards) {
      this.salaryPaymentStandards = salaryPaymentStandards;
   }

   public String getWorkType() {
      return workType;
   }

   public void setWorkType(String workType) {
      this.workType = workType;
   }

   public String getRemark() {
      return remark;
   }

   public void setRemark(String remark) {
      this.remark = remark;
   }

}