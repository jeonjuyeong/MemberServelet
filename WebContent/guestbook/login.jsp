<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function loginCheck(){
   if($("#userid").val()==""){
      alert("아이디 입력 하세요");
      return false;
   }
   if($("#pwd").val()==""){
      alert("비번 입력 하세요");
      return false;
   }
  frm.submit();
}
function memberDel(member){
   location.href="deleteProc.jsp?userid="+member;
}
</script>
</head>
<body>
	<form action='login' method="post" name="frm">
		<div class="col-xs-4">
		   <table class="table">
		   	<tr>
		         <th colspan=2 ><h1>LOGIN</h1></th>
		      </tr>
		      <tr>
		         <td>아이디</td>
		         <td><input type="text" class="form-control" name="userid" id="userid"></td>
		      </tr>
		      <tr>
		         <td>암호</td>
		         <td><input type="password" class="form-control"  name="pwd" id="pwd"></td>
		      </tr>
		      <tr>
		      <td colspan="2" align="center">
		         <input type="submit" value="로그인" class="btn btn-primary btn-sm" onclick="loginCheck()">&nbsp;&nbsp;
		         <input type="reset" value="취소" class="btn btn-default btn-sm" >&nbsp;&nbsp;
		         <input type="button" value="회원 가입" class="btn btn-primary btn-sm" onclick="location.href='join.jsp'">
		      </td>
		      </tr>
		   </table>
	   </div>
	</form>
</body>
</html>