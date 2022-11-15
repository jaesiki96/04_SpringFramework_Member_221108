<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberLogin.jsp</title>
</head>
<body>
<form action="/login" method="post" name="loginForm">
  <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일을 입력하세요"> <br>
  <input type="password" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요"> <br>
  <input type="submit" value="로그인">
</form>
</body>
</html>
