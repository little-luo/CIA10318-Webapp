<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.stud.model.*"%>

<% 
   StudVO studVO = (StudVO) request.getAttribute("studVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�����Ǹ�Ʒs�W - addStud.jsp</title>

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
		 <h3>�����Ǹ�Ʒs�W - addStud.jsp</h3></td><td>
<!-- �^��select_page.jsp -->
<h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- �N��ưe��servlet -->
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" name="form1">
<table>
	
	
	
	
	<tr>
		<td>�����Ǧa�I:</td>
		<td><input type="TEXT" name="studLoc" value="<%= (studVO==null)? "��饫" : studVO.getStudLoc()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����ǦW��:</td>
		<td><input type="TEXT" name="studName"   value="<%= (studVO==null)? "������xxx" : studVO.getStudName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����Ǧ��e�H��:</td>
		<td><input name="capacity" type="text" value="<%=(studVO==null)? "1" :studVO.getCapacity() %>" ></td>
	</tr>
	<tr>
		<td>�����ǯ���:</td>
		<td><input type="TEXT" name="hourlyRate"   value="<%= (studVO==null)? "1000" : studVO.getHourlyRate()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����ǳ]��:</td>
		<td><input type="TEXT" name="equipment"  value="<%= (studVO==null)? "���J��" : studVO.getEquipment()%>" size="45"/></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

</body>

</html>