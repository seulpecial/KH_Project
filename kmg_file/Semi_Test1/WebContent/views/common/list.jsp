<%@page import="com.kh.board.model.vo.PageInfo"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>

  <style>
      
      h2 {
        display: inline-block;
        background-color: yellowgreen;
        color: darkgreen;
        padding: 8px;
        border-radius: 18px;
      }
      table {
 
 
      }
     
      div {
        /* 테두리 보여주기 위한 border. 사이즈 조정후 삭제할 것. */
     
      }
      #board_top {
        display: flex;
        justify-content: flex-end;
      }
      #board_top > * {
        margin: 0 0.5rem;
      }
      #board_main {
        display: flex;
        padding: none;
      }
      #board_option {
        flex: 1;
        padding: 1rem 0;
      }
      #board_content {
        flex: 5;
        display: flex;
        flex-wrap: wrap;
        align-content: flex-start;
        justify-content: center;
       
      }
     
      .content {
        padding: 0;
        width: 11.7rem;
        height: 12rem;
   		
      }
      img {
        width: 185px;
        height: 105px;
      }
      
   #content1{
	float: left;
   }
   
    </style>
    

<%
	List<Board> list = (ArrayList)request.getAttribute("list");
	System.out.println(list);
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<section id="content">
	<h2 align="center">게시판 </h2>
	
	<button type="button" id="btn-add"
			onclick="location.href ='<%=request.getContextPath() %>/board/write'" onfocus="checklogin()">글쓰기</button>
			
	 <form method="GET" action=<%=request.getContextPath()%>/searchrecipe>
	        <select name="search_sort" class="dropdown">
	          <option value="s_title" selected>제목</option>
	          <option value="s_id">글쓴이</option>
	          <option value="s_content">내용</option>
	        </select>
            <input type="search" placeholder="Search" name="searchword" />
            
            <button class="btn btn-primary" type="submit" >검색</button>
        </form>
        
        <select name="board_sort" class="dropdown">
          <option value="s_new" selected>최신순</option>
          <option value="s_rating">별점순</option> 
          <option value="s_views">조회순</option>
        </select>
        <select name="board_view" class="dropdown">
          <option value="v_10" selected>10개씩 보기</option>
          <option value="v_20">20개씩 보기</option>
        </select>
        
	 <div id="board_content" >
	 <%  for(Board board : list) { %>
          <div id="content1" class="content" >
       		<a href="<%=request.getContextPath() %>/board/view?boardNo=<%= board.getBoardNo() %>">  <img src="<%=request.getContextPath()%>/image/<%=board.getBoardImageFile()%>"> </a>
       		 <a><%= board.getBoardTitle() %></a><br>
            <a><%= board.getUserId() %></a><br>
             <a><%= board.getVeganlist()%></a><br>
            <a><%= board.getBoardCreateDate()%></a>
            <a>추천수:<%= board.getRecommned()%></a><br>
          </div>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <% } %>
    
     </div>
      <div id="pageBar" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getPrvePage() %>'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<% for(int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++){ %>
				<% if(p == pageInfo.getCurrentPage()){ %>
					<button disabled><%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
		</div>
		
		<script type="text/javascript">
		<script type="text/javascript">
		function checklogin() {
			if(<%= loginMember == null %>){
				alert("로그인 후 이용해주세요!");
				$("#userId").focus();
			}
		}
		</script>
		
		
</section>
<%@ include file="/views/common/footer.jsp" %>