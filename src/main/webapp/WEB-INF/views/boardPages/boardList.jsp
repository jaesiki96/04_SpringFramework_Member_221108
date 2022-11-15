<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardList.jsp</title>
</head>
<body>
<a href="/">로그아웃</a>
<a href="/myPage">마이페이지</a>
<a href="/board/save">게시글작성</a>
<a href="/board/paging">페이징목록</a>
<c:if test="${sessionScope.loginEmail == 'admin'}">
    <a href="/admin">관리자용 페이지</a>
</c:if>
</body>
</html>
