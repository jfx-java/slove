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
        .top {
            background-color: #c6e38d;
            width: 100%;
            height: 40px;
            font-size: 20px;
        }

        .divloading {
            position: absolute;
            z-index: 99;
            top: 62%;
            left: 51%;
            width: 50px;
            height: 50px;
            display: none;
        }

        a {
            float: right;
            margin-left: 30px;
            margin-right: 40px;
        }

    </style>
</head>
<body>
<div class="top">
    欢迎${sessionScope.sharer_info.getName()}登陆!
    <a href="${ctx}/dispatcher/view">返回首页</a>
    <a href="${ctx}/sharer/findAccepter">投票</a>
</div>


<div class="divloading">
    <img src="${ctx}/resource/image/loading.gif" width="100%" height="100%"/>
</div>


<b:forEach var="accepter" items="${pageInfo.list}" varStatus="status">
    <div class="col-md-4">
        <div class="thumbnail">
            <img width="100px" height="100px" src="/portrait/${accepter.imgurl}"/>
            <div class="caption">
                <h3>
                    id: ${accepter.id}---姓名： ${accepter.name}
                </h3>
                <p>
                    个人描述：${accepter.difficulty}
                </p>
                <p>
                    已收票数：<span id="a${accepter.id}">${accepter.acceptLoveData}</span>
                </p>
                <p>
                        <%--${ctx}/sharer/upDataLove?sharerId=${sessionScope.sharer_info.id}&accepterId=${accepter.id}--%>
                    <a class="btn btn-primary" onclick="a(${accepter.id})" href="#">投票</a>
                    <%--<a class="btn btn-primary" href="${ctx}/sharer/upDataLove?sharerId=${sessionScope.sharer_info.id}&accepterId=${accepter.id}">投票</a>--%>
                </p>
            </div>
        </div>
    </div>
</b:forEach>


<div class="col-md-12 column">
    <p>
        当前页：${pageInfo.pageNum}/${pageInfo.pages}
        &nbsp;总条数:${pageInfo.total}
    </p>
    <ul class="pagination">
        <c:if test="${pageInfo.pageNum -1 != 0}">
            <li>
                <a href="${ctx}/sharer/findAccepter?pn=${pageInfo.pageNum -1}">上一页</a>
            </li>
        </c:if>
        <c:if test="${pageInfo.pageNum != 0}">
            <c:forEach begin="1" end="${pageInfo.pages}" var="p">
                <li>
                    <a href="${ctx}/sharer/findAccepter?pn=${p}">${p}</a>
                </li>
            </c:forEach>
        </c:if>
        <c:if test="${pageInfo.pageNum + 1 != pageInfo.pages +1}">
            <li>
                <a href="${ctx}/sharer/findAccepter?pn=${pageInfo.pageNum +1}">下一页</a>
            </li>
        </c:if>
    </ul>
</div>


</body>
<script src="${ctx}/resource/plugin/jquery/jquery-3.4.1.min.js">
</script>
<script type="text/javascript">
    function a(id) {
        $.ajax({
            async:true,
            url: "${ctx}/sharer/vote",//要提交的地址 *必填项*
            data: {//传的数据
                accepterId: id,
                sharerId: ${sessionScope.sharer_info.id}
            },
            beforeSend:function(){
                $(".divloading").show();
            },
            //提交完成后执行，无论成功或者失败，通常配合loading使用
            complete:function(){
                $(".divloading").hide();
            },
            //提交成功后调用的方法 *必填项*
            success:function (response){
                $(".divloading").hide();
                if (response.isSuccess==true){
                    if (response.isVoteSuccess==true){
                        alert(response.msg);
                        var text=$("#a"+id).text();
                        var newtext = parseInt(text)+1;
                        $("#a"+id).html(newtext);
                    }else {
                        alert(response.msg);
                    }
                }else {
                    alert("投票异常");
                }
            },
            //出错了调用的方法 *必填项*
            error:function (message) {
                alert("error:"+message);
            }
        });

    }
</script>
</html>
