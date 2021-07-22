    window.addEventListener('load', () => {
    
    
      const forms = document.getElementsByClassName('validation-form');
	var button = $(".button");
 	console.dir(button);
	button[0].onclick=function(){

        var frontValue=$("#exampleInputEmail3").val();
		var iden1=frontValue.substring(0,1)*2;
        var iden2=frontValue.substring(1,2)*3;
        var iden3=frontValue.substring(2,3)*4;
        var iden4=frontValue.substring(3,4)*5;
        var iden5=frontValue.substring(4,5)*6;
        var iden6=frontValue.substring(5,6)*7;

		var afteridenvalue= $("#exampleInputPassword3").val();
        var iden7=afteridenvalue.substring(0,1)*8;
        var iden8=afteridenvalue.substring(1,2)*9;
        var iden9=afteridenvalue.substring(2,3)*2;
        var iden10=afteridenvalue.substring(3,4)*3;
        var iden11=afteridenvalue.substring(4,5)*4;
        var iden12=afteridenvalue.substring(5,6)*5;
        var iden13=afteridenvalue.substring(6,7);

        var iden14=(11-((iden1+iden2+iden3+iden4+iden5+iden6+iden7+iden8+iden9+iden10+iden11
        +iden12)%11))%10;
	
        if(iden14!=iden13){
            alert("주민등록번호가 올바르지 않습니다.");
            $("#exampleInputEmail3").focus();
            return false;
        }
          return true;
	}
        
        
          
      var input=document.querySelectorAll(".file_input")[0];
      var img=document.querySelectorAll(".img-circle")[0];
     
      input.onchange=function(){
      	$("#cancel").val("");
    	  var fileList=input.files;
    	  var reader = new FileReader();
    	  reader.readAsDataURL(fileList[0]);
    	  reader.onload=function(){
			img.src=reader.result;    		  
    	  }
      }
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
 function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
