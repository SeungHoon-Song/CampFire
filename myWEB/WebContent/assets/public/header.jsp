<%--
  Created by IntelliJ IDEA.
  User: corne
  Date: 2021-03-05
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<header id="header">

    <!-- Nav -->
    <nav id="nav">
        <ul class="navbar">
            <a href="../index.jsp">
                <img class="current" src="../images/menu-icon.png" alt="홈 바로가기" height="50"></a>

            <li class=""><a href="#">전체</a></li>
            <li><a href="#" class="dropdown">계정 메뉴</a>
                <ul>
                    <li class="actions stacked" style="margin: 0 auto; width: fit-content;">
                        <a href="../../user/join.jsp">회원가입</a></li>
                    <li class="actions stacked" style="margin: 0 auto; width: fit-content;">
                        <a href="../../user/login.jsp">로그인</a></li>
                </ul></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="../../elements.jsp">고객센터</a></li>
            <!-- <li><a href="generic.html">Generic</a></li> -->
            <!-- <li><a href="elements.html">Elements</a></li> -->
        </ul>
    </nav>

    <!-- Logo -->


    <!-- <a class="logo" href="index.html">  <span>CORNER CAMP</span></a> -->
</header>



</body>
</html>