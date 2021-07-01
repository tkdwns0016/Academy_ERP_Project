 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

  <style>
    * {
      margin: 0;
      padding: 0;
    }

    a {
      text-decoration: none;
      color: black;
    }

    html,
    body {
      height: 100%;
    }

    header {
      width: 100%;
      height: 10%;
      position: relative;
      float: right;
      background-color: white;
      z-index: 3;
    }

    .headerdiv {
      height: 100%;
    }
    section {
      width: 100%;
      height: 100%;
      max-width: 100%
    }

    .slide_div {
      position: relative;
      overflow: hidden;
      width: 1300px;
      top: 20px;
      height: 30%;
      margin: 0 auto;
    }

    .img {
      width: 100%;
      float: left;
      opacity: 1;
    }

    .img_div {
      position: relative;
      margin: 1%;
      float: left;
    }

    .form-control {
      width: 250px;
      position: relative;
      top: 0%;
      margin-top: -19px;
    }

    .mb1 {
      float: left;
      margin-left: 50px;
    }

    .mb2 {
      float: left;
      left: 10%;
    }

    .mb3 {
      float: right;
      margin-right: 4%
    }

    .main_box {
      width: 25%;
      height: 35%;
      background-color: white;
      border-radius: 20px;
      margin-top: 1%;
      text-align: center;
      position: relative;
    }

    th,
    td {
      width: 1%;
    }

    .search {
      position: relative;
      margin-top: -15px;
      height: 32px;
      width: 32px;
      color: black;
      top: -25px;
      left: 85%;
      cursor: pointer;
    }

    .search_form {
      position: absolute;
      width: 250px;
      top: 50%;
      left: 80%;
      clear: both;
      height: 38px;
    }

    .login {
      position: absolute;
      top: 50%;
      margin-top: -19px;
      height: 38px;
      left: 90%;
    }

    .three_line:hover {
      cursor: pointer;
    }

    .three_line {
      width: 30px;
      height: 30px;
      position: absolute;
      top: 50%;
      left: 3%;
      margin-top: -15px;
    }

    .svg {
      display: none;
    }

    .menu_bar {
      position: absolute;
      width: 100%;
      height: 100%;
    }
@media screen (min-width:1500px);
  </style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body class="body" onload="showImage()">
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>


  <section>
    <div class="img_div" style="height: 40%;">
      <img class="img" id="show" style="height: 100%;" src="/image/1.jpg">
    </div>
    <div>
    <div class="main_box mb1">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">캘린더</th>
          <th></th>
        </tr>
      </table>
    </div>
    <div class="main_box mb2">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">공지사항</th>
          <th style="text-align: right;"><a href="#">+더보기</a>&nbsp;&nbsp;</th>
        </tr>
      </table>
      <table class="">
        <tr>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr></tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
      </table>
    </div>
    <div class="main_box mb3">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">건의 게시판</th>
          <th style="text-align: right;"><a href="#">+더보기</a>&nbsp;&nbsp;</th>
        </tr>
      </table>
      <table class="">
        <tr>
          <th>글번호</th>
          <th>제목</th>
          <th>작성자</th>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
        <tr>
          <td>${list.id}</td>
          <td>${list.title}</td>
          <td>${list.writer}</td>
        </tr>
      </table>
    </div>
  </div>
  </section>




</body>
<!-- 스크립트 -->
<script>


	
  var img = new Array();
  img[0] = "/image/1.jpg";
  img[1] = "/image/2.jpg";
  img[2] = "/image/3.jpg";
  img[3] = "/image/4.jpg";
  img[4] = "/image/5.jpg";
  var j = 0;
  var ms = 500;

  function showImage() {
    $("#show").animate({
      opacity: '0'
    }, ms, function () {
      $("#show")[0].src = img[j];
    })
    $("#show").animate({
      opacity: '1'
    }, ms)
    j++;
    if (j == 5) {
      j = 0;
    }
    setTimeout(showImage, 4000);
  }

  var i = true;
  imgs = document.querySelectorAll(".img")
  $(document).ready(function () {
    setTimeout(function () {


      $(".img_ul").animate({
        margin: '0 -100%'
      }, 0)
      $(".img_ul").append(img[0]);
    }, 2000)
  })

  function side_slide() {
    if (i) {
      $("nav").animate({
        left: '0%'
      }, 0);
      i = false;
    } else {
      $("nav").animate({
        left: '-20%'
      }, 0);
      i = true;
    }
  }

  function search() {
    document.querySelector(".search_form").submit();
  }

</script>
</html>