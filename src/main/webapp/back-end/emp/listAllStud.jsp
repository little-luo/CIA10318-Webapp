<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stud.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    StudService studSvc = new StudService();
    List<StudVO> list = studSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有錄音室資料 - listAllStud.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有錄音室資料 - listAllStud.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>錄音室編號</th>
		<th>錄音室地點</th>
		<th>錄音室名稱</th>
		<th>錄音室收容人數</th>
		<th>錄音室租金</th>
		<th>錄音室設備</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>

	<%@ include file="page1.file" %> 
	<c:forEach var="studVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${studVO.studID}</td>
			<td>${studVO.studLoc}</td>
			<td>${studVO.studName}</td>
			<td>${studVO.capacity}</td>
			<td>${studVO.hourlyRate}</td>
			<td>${studVO.equipment}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="studID"  value="${studVO.studID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="studID"  value="${studVO.studID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- 
	1.request.getRequestURI()的結果http://localhost:8081/CIA103G6/back-end/emp/listAllStud.jsp?whichPage=1
	  <A href="<%=request.getRequestURI()%>?whichPage=1">至第一頁</A>&nbsp;
    2.pageIndex<pageIndexArray[pageNumber-1]
      目前頁數的第一筆資料的索引值小於最後一頁的第一筆資料的索引值即表示還沒有到最後一頁。
    3.rowsPerPage<rowNumber
      總共的資料筆數大於每頁三筆資料，表示可以跳轉到下一頁。  
 --%>
<%@ include file="page2.file" %>

</body>
</html>