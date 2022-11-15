<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-10
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate.jsp</title>
</head>
<body>
<form action="/board/update" method="post" name="updateForm">
    <input type="hidden" name="id" value="${board.id}" readonly> <br>
    <input type="text" name="boardTitle" value="${board.boardTitle}"> <br>
    <input type="text" name="boardWriter" value="${board.boardWriter}" readonly> <br>
    <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
    <input type="button" value="수정" onclick="updateReFn()">
</form>
</body>
<script>
    const updateReFn = () => {
        if (confirm("수정을 완료하시겠습니까?")) {
            document.updateForm.submit();
        }
    }
</script>
</html>
