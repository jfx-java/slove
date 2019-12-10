
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taplibs.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>最美实训生</title>
    <link rel="stylesheet" href="${ctx}/resource/css/style/style.css" media="screen" type="text/css" />
</head>
<body>

<div class="tj_top">
    <a href="${ctx}/dispatcher/tl" style="font-size: 33px">开始投票</a>
    <a href="${ctx}/dispatcher/atl" style="font-size: 33px">我要上传</a>
</div>
<div class="tj_tit"></div>
<div class="dataStatistics">
    <div class="digit_set"></div>
    <div class="digit_set"></div>
    <div class="digit_set"></div>
    <div class="digit_set"></div>
    <div class="digit_set"></div>
    <div class="digit_set set_last"></div>
</div>

<div class="tj_foot"></div>
<div style="font-size: 40px;color: #ff7986;width: 300px;height: 80px;position: absolute;top: 22rem;z-index: 99;margin-left: 15px">
    参与投票人数：
</div>

<script type="text/javascript" src='${ctx}/resource/js/jquery.js'></script>
<script type="text/javascript" src="${ctx}/resource/js/jquery.dataStatistics.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.dataStatistics').dataStatistics({min:0,max:${loveData},time:1,len:6});
    });
</script>
</body>
</html>