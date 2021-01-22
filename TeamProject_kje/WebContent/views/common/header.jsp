<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>
	<header>
		<h1 align="center">베프 프로젝트</h1>
		<div class="login-container">
	
		<input type="button" value="로그인" onclick="location.href = '<%= request.getContextPath() %>/member/login';">
		<input type="button" value="회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/enroll';">
		
		<input  type="button" value="마이페이지" onclick="location.href = '<%= request.getContextPath() %>/mypage/mypagehome';">
		<input type="button" value="로그아웃" onclick="location.replace('<%= request.getContextPath() %>/member/logout');">
	
		</div>
		<nav id="abc">
			<ul class="main-nav">
				<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
				<li id="notice"><a href="<%= request.getContextPath() %>/mypage/mypagehome" onfocus="checklogin()">마이페이지</a></li>
				<li id="board"><a href="<%=request.getContextPath() %>/board/list">게시판</a></li>
			</ul>
		</nav>
	</header>
	
	<script type="text/javascript">
	
	</script>