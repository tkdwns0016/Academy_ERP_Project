
 window.onload =function(){


$('#summernote').summernote({
  placeholder: '내용을 입력해주세요',
  minHeight: 370,
    maxHeight: null,
  lang: "ko-Kr",

  toolbar: [
    //글꼴 설정
    ['fontname', ['fontname']],
    //글자 크기 설정
    ['fontsize', ['fontsize']],
    ['font', ['bold', 'underline', 'clear']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['table', ['table']],
    ['insert', ['ajaxfileupload','link', 'picture', 'video']],
    ['view', ['fullscreen', 'codeview', 'help']]
  ],
  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});


$("#fileUpload").change(function(){
fileList = $("#fileUpload")[0].files;
fileListTag = '';
fileListTag += '<ul>';
for(let i = 0; i < fileList.length; i++){
  fileListTag += "<li class='notiLi'>"+fileList[i].name+"</li>";
 
}
fileListTag += '</ul>';

$('#fileList').html(fileListTag);
});
}