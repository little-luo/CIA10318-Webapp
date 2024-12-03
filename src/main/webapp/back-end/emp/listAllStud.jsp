<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stud.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    StudService studSvc = new StudService();
    List<StudVO> list = studSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ������Ǹ�� - listAllStud.jsp</title>

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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ������Ǹ�� - listAllStud.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�����ǽs��</th>
		<th>�����Ǧa�I</th>
		<th>�����ǦW��</th>
		<th>�����Ǧ��e�H��</th>
		<th>�����ǯ���</th>
		<th>�����ǳ]��</th>
		<th>�ק�</th>
		<th>�R��</th>
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
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="studID"  value="${studVO.studID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="studID"  value="${studVO.studID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- 
	1.request.getRequestURI()�����Ghttp://localhost:8081/CIA103G6/back-end/emp/listAllStud.jsp?whichPage=1
	  <A href="<%=request.getRequestURI()%>?whichPage=1">�ܲĤ@��</A>&nbsp;
    2.pageIndex<pageIndexArray[pageNumber-1]
      �ثe���ƪ��Ĥ@����ƪ����ޭȤp��̫�@�����Ĥ@����ƪ����ޭȧY����٨S����̫�@���C
    3.rowsPerPage<rowNumber
      �`�@����Ƶ��Ƥj��C���T����ơA��ܥi�H�����U�@���C  
 --%>
<%@ include file="page2.file" %>

</body>
</html>