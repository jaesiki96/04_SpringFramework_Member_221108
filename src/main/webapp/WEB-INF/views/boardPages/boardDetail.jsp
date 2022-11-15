<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-10
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardDetail.jsp</title>
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<table>
    <tr>
        <th>회원번호</th>
        <td>${board.id}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${board.boardWriter}</td>
    </tr>
    <tr>
        <th>작성시간</th>
        <td>${board.boardCreatedDate}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${board.boardContents}</td>
    </tr>
    <c:if test="${board.storedFileName != null}">
        <tr>
            <th>file</th>
            <td>
                <img src="${pageContext.request.contextPath}/upload/${board.storedFileName}"
                     alt="" width="100" height="100">
            </td>
        </tr>
    </c:if>
</table>
<button onclick="listFn()">목록</button>
<c:if test="${sessionScope.loginEmail == board.boardWriter}">
<c:if test="${sessionScope.loginEmail != 'admin'}">
<button onclick="updateFn()">수정</button>
</c:if>
<button onclick="deleteFn('${board.id}')">삭제</button>
</c:if>
<div>
    <input type="text" id="commentWriter" placeholder="작성자" value="${sessionScope.loginEmail}" readonly> <br>
    <input type="text" id="commentContents" placeholder="댓글을 입력하세요."> <br>
    <button onclick="commentFn()">저장</button>
</div>
<div class="container mt-5" id="comment-list">
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    const commentFn = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function (commentList) {
                console.log(commentList);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    output += "<td>"+moment(commentList[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function () {
                console.log("실패");
            }
        });
    }
    const listFn = () => {
        const page = '${page}';
        location.href = "/board/paging?page=" + page;
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const deleteFn = (deleteCheck) => {
        location.href = "/board/delete?id=" + deleteCheck;
    }
</script>
</html>
