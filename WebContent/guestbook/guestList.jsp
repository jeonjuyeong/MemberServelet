<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>  
body{
	padding : 30px;
}

	body { background: #fff; }
	#blueone {
	  border-collapse: collapse;
	}  
	#blueone th {
	  padding: 10px;
	  color: #168;
	  border-bottom: 3px solid #0B2161;
	  text-align: left;
	}
	#blueone td {
	  color: #669;
	  padding: 10px;
	  border-bottom: 1px solid #ddd;
	}
	#blueone tr:hover td {
	  color: #004;
	}
</style>
<table id="blueone">
	<tr>
		<th>no</th>
		<th>이름</th>
		<th>내용</th>
		<th>평가</th>
		<th>날짜</th>
		<th>IP주소</th>
	</tr>
	<c:forEach var="i" items="${lists}" varStatus="status">
		<tr>
			<td>${i.num }</td>
			<td><a href="javascript:fview(${i.num })">${i.name }</a></td>
			<td>${i.content }</td>
			<td>${i.grade }</td>
			<td>${i.created }</td>
			<td>${i.ipaddr }</td>
		</tr>
	</c:forEach>
</table>