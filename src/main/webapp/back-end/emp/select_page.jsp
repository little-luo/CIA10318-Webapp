<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>CIA103G6 Studio: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>CIA103G6 studio: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for CIA103G6 studio: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllStud.jsp'>List</a> all Studs.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" >
        <b>輸入錄音室編號 (如1):</b>
        <input type="text" name="studID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="studSvc" scope="page" class="com.stud.model.StudService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" >
       <b>選擇錄音室編號:</b>
       <select size="1" name="studID">
         <c:forEach var="studVO" items="${studSvc.all}" > 
          <option value="${studVO.studID}">${studVO.studID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/stud/stud.do" >
       <b>選擇錄音室名稱:</b>
       <select size="1" name="studID">
         <c:forEach var="studVO" items="${studSvc.all}" > 
          <option value="${studVO.studID}">${studVO.studName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>錄音室管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/emp/addStud.jsp'>Add</a> a new Stud.</li>
</ul>

</body>
</html>