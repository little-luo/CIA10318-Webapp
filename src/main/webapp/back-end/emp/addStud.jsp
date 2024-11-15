<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.stud.model.*"%>

<% 
   StudVO studVO = (StudVO) request.getAttribute("studVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>錄音室資料新增 - addStud.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>錄音室資料新增 - addStud.jsp</h3></td><td>
<!-- 回到select_page.jsp -->
<h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- 將資料送給servlet -->
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" name="form1">
<table>
	
	
	
	
	<tr>
		<td>錄音室地點:</td>
		<td><input type="TEXT" name="studLoc" value="<%= (studVO==null)? "桃園市" : studVO.getStudLoc()%>" size="45"/></td>
	</tr>
	<tr>
		<td>錄音室名稱:</td>
		<td><input type="TEXT" name="studName"   value="<%= (studVO==null)? "錄音室xxx" : studVO.getStudName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>錄音室收容人數:</td>
		<td><input name="capacity" type="text" value="<%=(studVO==null)? "1" :studVO.getCapacity() %>" ></td>
	</tr>
	<tr>
		<td>錄音室租金:</td>
		<td><input type="TEXT" name="hourlyRate"   value="<%= (studVO==null)? "1000" : studVO.getHourlyRate()%>" size="45"/></td>
	</tr>
	<tr>
		<td>錄音室設備:</td>
		<td><input type="TEXT" name="equipment"  value="<%= (studVO==null)? "麥克風" : studVO.getEquipment()%>" size="45"/></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>

</body>

</html>