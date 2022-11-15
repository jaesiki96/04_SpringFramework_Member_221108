<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-15
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/myPage" method="post" name="memberPageForm">
    <input type="hidden" name="id" value="${member.id}"> <br>
    <input type="text" name="memberEmail" value="${member.memberEmail}" readonly> <br>
    <input type="password" name="memberPassword" id="memberPassword"> <br>
    <input type="text" name="memberName" value="${member.memberName}" readonly> <br>
    <input type="text" name="memberMobile" value="${member.memberMobile}"> <br>
    <input type="button" value="수정" onclick="memberUpdate()">
</form>
</body>
<script>
    const memberUpdate = () => {
        const passDB = '${member.memberPassword}';
        const pass = document.getElementById("memberPassword").value;
        if (passDB == pass) {
            document.memberPageForm.submit();
        } else {
            alert("비밀번호를 확인해주세요!");
        }
    }
</script>
</html>
