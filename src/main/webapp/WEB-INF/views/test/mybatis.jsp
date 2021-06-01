<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${name }님 <br>


<c:forEach var="item" items="${test}">
	id : ${item.id } <br>
	날짜 : ${item.regDate } <br>
	갱신 날짜 : ${item.updateDate } <br>
	제목 : ${item.title } <br>
	내용 : ${item.content } <br>
	<hr />
</c:forEach>


</body>
<script>
</script>
</html>