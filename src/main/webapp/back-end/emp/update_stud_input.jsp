<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.stud.model.*"%>

<% //��com.emp.controller.EmpServlet.java��163��s�Jreq��empVO���� (�����q��Ʈw���X��empVO, �]�i�H�O��J�榡�����~�ɪ�empVO����)
   StudVO studVO = (StudVO) request.getAttribute("studVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_emp_input.jsp</title>

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
		 <h3>�����Ǹ�ƭק� - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath() %>/back-end/emp/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" name="form1">
<table>
	<tr>
		<td>�����ǽs��:<font color=red><b>*</b></font></td>
		<td><%=studVO.getStudID()%></td>
	</tr>
	<tr>
		<td>�����Ǧa�I:</td>
		<td><input type="TEXT" name="studLoc" value="<%=studVO.getStudLoc()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����ǦW��:</td>
		<td><input type="TEXT" name="studName"   value="<%=studVO.getStudName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����Ǧ��e�H��:</td>
		<td><input type="TEXT" name="capacity" value="<%=studVO.getCapacity()%>" size="45"></td> 
	</tr>
	<tr>
		<td>�����ǯ���</td>
		<td><input type="TEXT" name="hourlyRate"   value="<%=studVO.getHourlyRate()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����ǳ]��</td>
		<td><input type="TEXT" name="equipment"  value="<%=studVO.getEquipment()%>" size="45"/></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="studID" value="<%=studVO.getStudID()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>


</html>