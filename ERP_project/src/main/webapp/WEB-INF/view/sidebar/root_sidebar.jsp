<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Bootstrap core CSS -->
<link href="/static/bootstrap/assets/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/static/bootstrap/sidebars/sidebars.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
* {
	margin: 0;
}

html, body {
	height: 100%;
}

header {
	width: 100%;
	height: 10%;
	float: right;
	position: fixed;
	z-index: 5;
	background-color: white;
}

.headerdiv {
	height: 100%;
}

#home:hover {
	color: blue;
}

nav {
	min-width: 150px; 
	position : fixed;
	z-index: 3;
	background-color: darkmagenta;
	width: 15%;
	height: 90%;
	float: left;
	top: 10%;
	left: -20%;
	position: fixed;
}

.hover:hover {
	opacity: 50%
}

.rounded {
	min-width: 130px;
}

.set {
	position: absolute;
	top: 20%;
	left: 5%;
}

nav::after {
	clear: both;
	content: "";
	display: block;
}

.form-control {
	width: 250px;
	position: relative;
	top: 0%;
	margin-top: -19px;
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

.bi-house-door {
	color: white;
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

.font1 {
	font-size: 15px;
	text-align: center;
	border: 1px solid white;
}

.font2 {
	border: 1px solid white;
	font-size: 15px;
	text-align: center;
	width: 40px;
}

section {
	position: absolute;
	top: 10%;
	width: 100%;
	height: 90%;
}

@media screen and (max-width:1470px) {
	.top-bar {
		width: 20px;
		height: 20px;
	}
}

@media screen and (max-width:860px) {
	.top-bar {
		width: 0px;
		height: 0px;
	}
	#font {
		font-size: 0px;
	}
}

@media screen and (max-height:1024px) {
	.nav-link {
		font-size: 15px;
	}
}

@media screen and (max-height:600px) {
	.nav-link {
		font-size: 0px;
	}
}

@media screen and (max-height:400px) {
	.top-bar {
		width: 0;
		height: 0;
	}
	.nav-link {
		font-size: 0px;
	}
}

.no-underLine {
	text-decoration: none;
}

.rootSidebarfont-white {
	color: white !important;
}
</style>
</head>

<body class="body">

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
   
    <symbol id="bootstrap" viewBox="0 0 118 94">
      <title>Bootstrap</title>
      <path fill-rule="evenodd" clip-rule="evenodd"
			d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z">
        </path>
      </symbol>
      <svg id="home" xmlns="http://www.w3.org/2000/svg" width="24"
			height="24" fill="currentColor" class="bi bi-house-door"
			viewBox="0 0 16 16">
  <path
				d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
	</svg>
      <symbol id="speedometer2" viewBox="0 0 16 16">
        <path
			d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
          <path fill-rule="evenodd"
			d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
        </symbol>
      <symbol id="table" viewBox="0 0 16 16">
        <path
			d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
      </symbol>
      <symbol id="people-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
        <path fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
      </symbol>
      <symbol id="grid" viewBox="0 0 16 16">
        <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
      </symbol>
    </svg>

	<header>
		<div class="px-3 py-2 bg-dark text-white headerdiv">
			<div class="container">
				<div
					class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					<svg class="three_line slide" xmlns="http://www.w3.org/2000/svg"
						fill="currentColor" viewBox="0 0 16 16">
              <path fill-rule="evenodd"
							d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
            </svg>

					<ul
						class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small set">
						<li class="rootemplLi" st><a id="font" href="/main"
							class="nav-link text-white bi-house-door hover"> <svg
									class="bi d-block mx-auto mb-1 top-bar" width="24" height="24">
                    <use xlink:href="#home" /></svg> Home
						</a></li>
						<li class="rootemplLi"><a id="font" href="/notice"
							class="nav-link text-white hover"> <svg
									class="bi d-block mx-auto mb-1 top-bar" width="24" height="24">
                    <use xlink:href="#speedometer2" /></svg> NoticeBoard
						</a></li>
						<li class="rootemplLi"><a id="font"
							href="/educationBoard?departmentId=${empl.departmentId }"
							class="nav-link text-white hover"> <svg
									class="bi d-block mx-auto mb-1 top-bar" width="24" height="24">
                    <use xlink:href="#table" /></svg> Calendar
						</a></li>
						<li class="rootemplLi"><a id="font" href="/payment"
							class="nav-link text-white hover"> <svg
									class="bi d-block mx-auto mb-1 top-bar" width="24" height="24">
                    <use xlink:href="#grid" /></svg> Payment
						</a></li>
						<li class="rootemplLi"><a id="font" href="/myInfo"
							class="nav-link text-white hover"> <svg
									class="bi d-block mx-auto mb-1 top-bar" width="24" height="24">
                    <use xlink:href="#people-circle" /></svg> MyInfo
						</a></li>
					</ul>
				</div>
			</div>
			<form action="" name="search_form" class="search_form">
				<input type="search" class="form-control" placeholder="Search..."
					aria-label="Search">
				<svg class="search" onclick="search()"
					xmlns="http://www.w3.org/2000/svg" fill="currentColor"
					viewBox="0 0 16 16">
            <path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
          </svg>
			</form>
	</header>








	<nav style="left: -20%;">
		<!-- 이미지 구역 -->
		<article>
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="bootstrap" viewBox="0 0 118 94">
          <title>Bootstrap</title>
          <path fill-rule="evenodd" clip-rule="evenodd"
					d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z">
          </path>
        </symbol>
        <symbol id="home" viewBox="0 0 16 16">
          <path
					d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
        </symbol>
        <symbol id="speedometer2" viewBox="0 0 16 16">
          <path
					d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
          <path fill-rule="evenodd"
					d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
        </symbol>
        <symbol id="table" viewBox="0 0 16 16">
          <path
					d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
        </symbol>
        <symbol id="people-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
          <path fill-rule="evenodd"
					d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
        </symbol>
        <symbol id="grid" viewBox="0 0 16 16">
          <path
					d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
        </symbol>
      </svg>
		</article>


		<main class="main">
			</div>


			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="position: absolute; width: 100%; height: 100%;">
				<div class="dropdown" style="margin: 0 auto;">
					<img src="/image/${empl.imgName }" alt="" width="100px"
						height="120px" class="me-2"> <a href="#"
						class="d-flex align-items-center text-black text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"
						style="color: black;">
						<table style="border-collapse: collapse; text-align: center;">
							<tr>
								<td class="font1">&nbsp;직급</td>
								<td class="font2">&nbsp; ${department }</td>
							</tr>
							<tr>
								<td class="font1">&nbsp;부서</td>
								<td class="font2">${position }</td>
							</tr>
							<tr>
								<td class="font1" colspan="2">${empl.name }님</td>
							</tr>

						</table>

					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
						aria-labelledby="dropdownUser1">
						<li class="rootemplLi"><a
							class="dropdown-item rootSidebarfont-white" href="/myInfo"
							style="border-bottom: 1px solid white;">Profile</a></li>

						<li class="rootemplLi"><a style="color: white;"
							class="dropdown-item rootSidebarfont-white" href="/logout">Sign
								out</a></li>
					</ul>
				</div>
				<hr>
				<ul>
					<li style="list-style: none; margin: 0 12%;"><button
							type="button" onclick="onTime()" style="width: 50px">출근</button>&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="offTime()" style="width: 50px">퇴근</button></li>
				</ul>
				<hr>
				<a href="/main"
					class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
					<span class="fs-7 fw-semibold">Company</span>
				</a>

				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="false">인사관리</button>
						<div class="collapse" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="rootemplLi"><a href="/join"
									class="link-dark rounded">신규 등록</a></li>
								<li class="rootemplLi"><a href="/emplList"
									class="link-dark rounded">인사 정보 리스트</a></li>
							</ul>
						</div>
					</li>

					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">교육관리</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="rootemplLi"><a
									href="/educationBoard?departmentId=10"
									class="link-dark rounded">경영팀 교육 일정</a></li>
								<li class="rootemplLi"><a
									href="/educationBoard?departmentId=20"
									class="link-dark rounded">개발팀 교육 일정</a></li>
								<li class="rootemplLi"><a
									href="/educationBoard?departmentId=30"
									class="link-dark rounded">인사팀 교육 일정</a></li>
								<li class="rootemplLi"><a
									href="/educationBoard?departmentId=40"
									class="link-dark rounded">영업팀 교육 일정 </a></li>
							</ul>
						</div>
					</li>

					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#check-collapse"
							aria-expanded="false">근태관리</button>
						<div class="collapse" id="check-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="rootemplLi"><a href="/attendance"
									class="link-dark rounded">근태리스트</a></li>
							</ul>
						</div>
					</li>

					<li class="mb-1"><a class="no-underLine" href="/welfare"><button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#benefits-collapse"
								aria-expanded="false">복리후생</button></a></li>

					<li class="mb-1"><a class="no-underLine" href="/payment">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#Payment-collapse"
								aria-expanded="false">결제</button>
					</a></li>
					<li class="mb-1">
						<button
							class="btn btn-toggle align-items-center rounded collapsed"
							data-bs-toggle="collapse" data-bs-target="#community-collapse"
							aria-expanded="false">커뮤니티</button>
						<div class="collapse" id="community-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li class="rootemplLi"><a href="/notice"
									class="link-dark rounded">공지사항</a></li>
								<li class="rootemplLi"><a href="/suggestion"
									class="link-dark rounded">건의 게시판</a></li>
								<li class="rootemplLi"><a href="/anonymous"
									class="link-dark rounded">익명 게시판</a></li>
							</ul>
						</div>
					</li>
					<li class="border-top my-3"></li>

				</ul>
		</main>
	</nav>
	<!-- 사람클릭 시 나오는 것 -->
	<script src="/static/bootstrap/assets/dist/js/bootstrap.bundle.min.js"></script>

	<script src="/static/bootstrap/sidebars/sidebars.js"></script>
	<script>
		var notice = "공지사항";
		var noticeBoard = "공지게시판";
		var anonymous = "익명게시판";
		var suggestion = "건의사항";
		var suggestionBoard = "건의게시판";
		var payment = "결제";
		var empl = "인사관리";
		var join = "신규등록";
		$(".form-control")
				.keydown(
						function(key) {
							if (key.keyCode == 13) {
								if (notice.indexOf($('.form-control').val()) > -1
										|| noticeBoard.indexOf($(
												'.form-control').val()) > -1) {

									$(".search_form").attr('action', '/notice');
									$(".search_form").submit();
								} else if (anonymous.indexOf($('.form-control')
										.val()) > -1) {

									$(".search_form").attr('action',
											'/anonymous');
									$(".search_form").submit();
								} else if (suggestion
										.indexOf($('.form-control').val()) > -1
										|| suggestionBoard.indexOf($(
												'.form-control').val()) > -1) {

									$(".search_form").attr('action',
											'/suggestion');
									$(".search_form").submit();
								} else if (payment.indexOf($('.form-control')
										.val()) > -1) {
									$(".search_form")
											.attr('action', '/payment');
									$(".search_form").submit();
								} else if (empl.indexOf($('.form-control')
										.val()) > -1) {
									$(".search_form").attr('action',
											'/emplList');
									$(".search_form").submit();
								} else if (join.indexOf($('.form-control')
										.val()) > -1) {
									$(".search_form").attr('action', '/join');
									$(".search_form").submit();
								} else {
									alert("검색 결과를 찾을 수 없습니다.")
								}
							}
						})
		function onTime() {
			if (confirm("출근처리 하시겠습니까?")) {
				location.href = ('/attendanceOnTime')
			}
		}
		function offTime() {
			if (confirm("퇴근처리 하시겠습니까?")) {
				location.href = ('/attendanceOffTime')
			}
		}
	</script>




</body>
<!-- 스크립트 -->


</html>