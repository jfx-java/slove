<%--
  Created by IntelliJ IDEA.
  User: yezhentou
  Date: 2019/10/12
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="b" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/common/taplibs.jsp" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body {
            font-weight: bold;
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

        #difficulty {
            overflow-x: hidden;
            overflow-y: hidden;
            width: 250px;
            height: 150px;
        }

    </style>


    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
欢迎${sessionScope.accepters.getName()}登陆！<br>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="tabbable" id="tabs-621328">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-951815" data-toggle="tab">收到的票数</a>
                    </li>
                    <li>
                        <a href="#panel-598893" id="information" data-toggle="tab">个人中心</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane" id="panel-951815">
                        <p>收到的票数</p>
                        ${sessionScope.accepters.acceptLoveData}
                    </div>
                    <div class="tab-pane" id="panel-598893">
                        <div class="divloading">
                            <img src="${ctx}/resource/image/loading.gif" width="100%" height="100%"/>
                        </div>
                        <p>
                            你的信息：
                        </p>
                        <div style="background-color: #c6e38d">
                            头像：<img id="touxiang" src="/portrait/${sessionScope.accepters.imgurl}" width="50px"
                                    height="50px">
                            <form enctype="multipart/form-data" id="upData">
                                <input id="file" name="img" type="file" value="上传新头像">
                                <input type="button" id="change" value="修改">
                            </form>
                            <br>
                            <p>
                                用户名：${sessionScope.accepters.loginName}
                            </p>
                            <p>
                                网名：<input type="text" id="name" value="${sessionScope.accepters.name}">
                            </p>
                            <p>
                                密码：<input type="text" id="password" value="${sessionScope.accepters.password}">
                            </p>
                            <p>
                                个人描述：
                                <textarea id="difficulty">${sessionScope.accepters.difficulty}</textarea>
                                <%--<input type="text" id="difficulty" value="${sessionScope.accepters.difficulty}">--%>
                            </p>
                            <input type="button" id="xiugai" value="修改">

                        </div>


                        <div id="accepterList">

                        </div>
                        <%--<b:forEach items="accepter" var="${}">--%>

                        <%--</b:forEach>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    $(function () {
        $("#file").on("change", function () {
            var path=$("#file").val();
            if (checking(path)) {
                var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                $("#touxiang").attr("src", objUrl); //将图片路径存入src中，显示出图片
            }else {
                alert("上传类型必须为图片！");
            }
        });


        $("#change").on("click", function () {
            var formData = new FormData($("form")[0]);
            formData.append('file', $('#file').files);
            $.ajax({
                url: "${ctx}/accepter/imgChange",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                datatype: "json",
                success: function (response) {
                    if (response.isSuccess == true) {
                        if (response.isChangeSuccess == true) {
                            alert("修改成功");
                            $("#touxiang").attr("src", "/portrait/" + response.isurl);
                        } else {
                            alert("修改失败");
                        }
                    } else {
                        alert("修改异常");
                    }
                }

            })

        });


        $("#xiugai").on("click", function () {
                var name = $("#name").val();
                var password = $("#password").val();
                var difficulty = $("#difficulty").val();
                $.ajax({
                    //默认是异步的 (async默认true，false是同步)，
                    async: true,
                    url: "${ctx}/accepter/upData",//要提交的地址 *必填项*

                    type: "post",//传输方式 默认get
                    datatype: "json",//返回值类型 json、plain、html、xml
                    data: {
                        id:${sessionScope.accepters.id},
                        name: name,
                        password: password,
                        difficulty: difficulty
                    },
                    beforeSend: function () {
                        $(".divloading").show();
                    },
                    //提交完成后执行，无论成功或者失败，通常配合loading使用
                    complete: function () {
                        $(".divloading").hide();
                    },
                    //提交成功后调用的方法 *必填项*
                    success: function (response) {
                        $(".divloading").hide();
                        if (response.isSuccess == true) {
                            if (response.isUpDataSuccess == true) {
                                window.location = "${ctx}/dispatcher/updataAccepter"
                            } else {
                                alert("修改失败" + "    " + response.msg);
                            }
                        } else {
                            alert("修改异常");
                        }
                    },
                    //出错了调用的方法 *必填项*
                    error: function (message) {
                        alert("error:" + message);
                    }

                })

            }
        )


        function getObjectURL(file) {
            var url = null;
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        }

        function  checking(path) {
            if (path.length == 0) {
                alert("上传为空");
                return false;
            } else {
                var extStart = path.lastIndexOf('.'),
                    ext = path.substring(extStart, path.length).toUpperCase();
                if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF') {
                    return false;
                }else {
                    return true;
                }
            }
        }


    });


</script>
</html>
