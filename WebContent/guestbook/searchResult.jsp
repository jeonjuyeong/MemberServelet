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
			<td>${i.name }</td>
			<td><a href="javascript:fview(${i.num })">${i.content }</a></td>
			<td>${i.grade }</td>
			<td>${i.created }</td>
			<td>${i.ipaddr }</td>
			<c:if test="${sessionScope.m.name==i.name}">
				<td><input type="button" value="삭제" onclick="location.href='delete?name=${i.name}'" ></td>
			</c:if>
		</tr>
	</c:forEach>
</table>
<div align ="center">
	<!-- 이전 -->
	<c:if test="${p.startpage>p.blockpage}">
		<a href="javascript:getSearch(${p.startpage-p.blockpage },'${field }','${word }')">[이전]</a>
	</c:if>
	<c:forEach begin="${p.startpage}" end="${p.endpage}" var="i">
		<c:if test="${i==p.currentpage}">
			[${i}]
		</c:if>
		<c:if test="${i!=p.currentpage}">
			<a href="javascript:getSearch(${i},'${field }','${word }')">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${p.startpage>p.blockpage}">
		<a href="javascript:getSearch(${p.endpage+1},'${field }','${word }')">[다음]</a>
	</c:if>
</div>