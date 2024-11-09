<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.stud.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單筆錄音室資料</title>
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
	width: 600px;
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
<%
	StudVO studVO = (StudVO) request.getAttribute("studVO");
%>
<body>
<h1>listOneStud.jsp</h1>
<table id="table-1">
	<tr><td>
		 <h3>錄音室資料 - listOneStud.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/emp/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
	</tr>
	<tr>
		<td>${studVO.studID}</td>
		<td>${studVO.studLoc}</td>
		<td>${studVO.studName}</td>
		<td>${studVO.capacity}</td>
		<td>${studVO.hourlyRate}</td>
		<td>${studVO.equipment}</td>
	</tr>
</table>
</body>
</html>