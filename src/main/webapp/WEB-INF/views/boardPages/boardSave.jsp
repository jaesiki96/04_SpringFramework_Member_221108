<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글작성</title>
</head>
<body>
<form action="/board/save" method="post" enctype="multipart/form-data">
        <input type="text" name="boardTitle" placeholder="제목"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea> <br>
        <input type="file" name="boardFileName"> <br>
        <input type="submit" value="작성">
</form>
</body>
</html>
