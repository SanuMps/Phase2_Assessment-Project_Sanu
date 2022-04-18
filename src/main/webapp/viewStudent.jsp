<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.learnersacademy.model.StudentObj"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="pt" uri="WEB-INF/print_tags.tld" %>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student</title>
</head>
<body>

<%
HttpSession mySession=request.getSession(false);
if(mySession==null){
	out.print("<center><h3>Your session has expired.. Navigating you to home page.....</h3></center>");
	response.setHeader("refresh", "5;url='/P2_Project_LAcad'");
}
else{
@SuppressWarnings("unchecked")
List<StudentObj> studentList=(List<StudentObj>)mySession.getAttribute("studentList");
if(studentList !=null){
Date createTime = new Date(mySession.getCreationTime());
%>
<h1 style="Color:rgb(0, 0, 0)">Learner's Academy</h1><b style="Color:red;position: absolute;top: 8px;right: 16px;font-size: 14px;">You Logged in at <%=createTime %></b>

<table  style="text-align:center; margin-left:auto;">
<tr><td>&nbsp;&nbsp;<a href="logout">logout</a>&nbsp;&nbsp;</td></tr>
<tr><td>&nbsp;&nbsp;<a href="/P2_Project_LAcad/Dashboard.jsp">Dashboard</a>&nbsp;&nbsp;</td></tr>
</table>
<br/>


<div style="color:rgb(255, 0, 0);text-align: center; border: 1px outset rgb(255, 0, 0);
  background-color: lightblue;" >
<%if(mySession.getAttribute("exception")!=null) {%>
<%=mySession.getAttribute("exception") %>
<%}if(mySession.getAttribute("exceptionSys")!=null) {%>
System Error <%=mySession.getAttribute("exceptionSys") %>
<%} %>

</div>
<br/>
<center><b>Student Details</b></center>
<br/>
<pt:printStudent studentList="<%=studentList %>"/>


<br/>
<form action="UpdateStudent" method="post">
<table border="1" style="text-align:center; margin-left:auto;margin-right:auto;">
<tr>
<td>Student Name </td><td><input type="text" name="studentName" placeholder="Student Name"></td>
</tr>
<tr>
<td>Date of Birth </td><td><input type="date" name="studentDoB" placeholder="Date of Birth"></td>
</tr>
<tr>
<td>ClassId </td><td><input type="text" name="classID" placeholder="Class ID"></td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="add" value="ADD Student"></td>
</tr>
</table>
</form>
<%@include file='footer.html' %>
<%} else{
response.sendRedirect("/P2_Project_LAcad/Dashboard.jsp");
%>

<%}} %>

<%mySession.removeAttribute("exception");
mySession.removeAttribute("exceptionSys");%>
</body>
</html>