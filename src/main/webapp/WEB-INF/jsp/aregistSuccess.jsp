<%--
  Created by IntelliJ IDEA.
  User: yezhentou
  Date: 2019/10/14
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taplibs.jsp" %>
<html>
<head>
    <title>注册成功</title>
    <script type="text/javascript" src="${ctx}/resource/plugin/jquery/jquery-3.4.1.min.js"></script>
</head>
<body>
    <p><span id="text">注册成功！将在<span style="color: red">5秒</span>后自动跳转到登陆页面   </span><a href="${ctx}/dispatcher/atl">点击此处快速跳转</a></p>
</body>
<script  type="text/javascript">
    $(function () {
        var num=4;
        window.setTimeout(a,1000);
        function a(){
            if (num!=0){
                $("#text").html("注册成功！将在<span style=\"color: red\">"+num+"秒</span>后自动跳转到登陆页面   ");
                window.setTimeout(a,1000);
                num--;
            }else {
                num=4;
                window.location="${ctx}/dispatcher/atl";
            }
        }
    });
</script>
</html>
