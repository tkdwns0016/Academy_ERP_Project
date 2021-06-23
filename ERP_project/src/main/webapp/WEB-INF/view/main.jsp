<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

        #header, #side, #footer{border: 0px solid black;}
/* 
        nav::after{
            clear: both; content: ""; display: block;
        }     */
        
        #header{
            background-color: darkseagreen;
            height: 10%;
            width: 100%;
        }

        #side{
            background-color: burlywood;
            width: 10%;
            display: none;
            
        }
        
      
        #nav{
            float: left;
            height: 80%;
        }
        
        #footer{
            height: 10%;
            background-color: darkred;
            position: relative;
            clear: both;
        }
        
</style>
	<title>Insert title here</title>
</head>

<body>
	<section>
		<tiles:insertAttribute name="side"/>
	</section>

</body>
</html>