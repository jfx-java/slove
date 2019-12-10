<%@ taglib prefix="b" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taplibs.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .top{
            background-color: #c6e38d;
            width: 100%;
            height: 40px;
            font-size: 20px;
        }
        a{
            float: right;
            margin-left: 30px;
            margin-right: 40px;
        }
    </style>
</head>
<body>

<div class="top">
    欢迎${sessionScope.accepter.getName()}登陆!
    <a href="${ctx}/dispatcher/view">返回首页</a>
    <a href="${ctx}/dispatcher/accepter_list">个人中心</a>
    <a href="${ctx}/sharer/findAccepter">献出爱心</a>
</div>



</body>
</html>
