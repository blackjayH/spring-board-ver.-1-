<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1.0">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custorm.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script>
	//로그인
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			if ($('#pw').val().length < 1)
				alert('페스워드 미입력');
			else if ($('#pw').val() != $('#pw2').val())
				alert('페스워드 확인해주세요');
			else {
				var id = '<c:out value="${userID}"/>';
				//alert(id);
				var pw = $('#pw').val();
				$.ajax({
					type : "PUT",
					data : JSON.stringify({
						id : id,
						pw : pw
					}),
					url : "${path}/user",
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(response) {
						if (response.result == true)
							window.location.replace('${path}/board/view/home')
					},
					error : function(error) {
						alert(error);
					}
				});
			}
		});
	});
</script>
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<c:import url="board_menu_left.jsp" charEncoding="UTF-8"></c:import>
	</div>
	</nav>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<h3 style="text-align: center;">유저 정보 수정 화면</h3>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						id="pw" name="pw" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호확인"
						id="pw2" name="pw2" maxlength="20">
				</div>
				<div class="form-group">
					<input type="button" id="btnUpdate"
						class="btn btn-primary form-control" value="정보수정">
				</div>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="${path}/resources/js/bootstrap.min.js"></script>
</body>
</html>