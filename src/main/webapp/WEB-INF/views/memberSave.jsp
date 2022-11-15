<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave.jsp</title>
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<form action="/save" method="post" name="saveForm">
    <input type="text" name="memberEmail" id="memberEmail" onblur="emailDuplicateCheck()" placeholder="이메일을 입력하세요"> <br>
    <span id="checkEmail"></span> <br>
    <input type="text" name="memberPassword" id="memberPassword" onblur="passwordCheck()" placeholder="비밀번호를 입력하세요">
    <br>
    <span id="checkPassword"></span> <br>
    <input type="text" name="memberName" id="memberName" placeholder="이름을 입력하세요"> <br>
    <input type="text" name="memberMobile" id="memberMobile" onblur="mobileCheck()" placeholder="전화번호를 입력하세요"> <br>
    <input type="file" name="memberProfile"> <br>
    <input type="submit" value="가입하기">
</form>
</body>
<script>
    const emailDuplicateCheck = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("checkEmail");
        $.ajax({
            type: "post",
            url: "/checkEmail",
            dataType: "text",
            data: {inputEmail: email},
            success: function () {
                checkResult.innerHTML = "사용가능";
                checkResult.style.color = "green";
            },
            error: function () {
                checkResult.innerHTML = "사용불가";
                checkResult.style.color = "red";
            }
        })
    }
    const passwordCheck = () => {
        const text = document.getElementById("memberPassword").value;
        const pass = document.getElementById("checkPassword");
        const exp = /^(?=.*[a-z])[a-z\d]{5,10}$/;
        if (text.match(exp)) {
            pass.innerHTML = "사용가능";
            pass.style.color = "green";
        } else {
            pass.innerHTML = "영문 소문자 (필수), 숫자 (5~10자)를 입력해주세요";
            pass.style.color = "red";
        }
    }
    const mobileCheck = () => {
        const text = document.getElementById("memberMobile").value;
        const phone = document.getElementById("checkMobile");
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        if (text.match(exp)) {
            phone.innerHTML = "사용가능";
            phone.style.color = "green";
        } else {
            phone.innerHTML = "(-)기호를 포함해주세요"
            phone.style.color = "red";
        }
    }
</script>
</html>
