<%--
  Created by IntelliJ IDEA.
  User: yezhentou
  Date: 2019/10/12
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taplibs.jsp" %>
<html>
<head>
    <title>上传者注册</title>
    <style type="text/css">
        body{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .container{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #000000;
        }


        *{
            margin: 0;
            padding: 0;
        }
        #zhu{
            position: absolute;
            top: 4rem;
            left: 30rem;
        }
        #aaa{
            position: absolute;
            padding-left: 30px;
            box-sizing:border-box;
            width: 500px;
            height: 500px;
            border: 1px solid #ccc;
            background-color:rgba(255,255,255,0.5);
        }
        p{
            margin-top: 17px;
            width: 400px;
            height: 50px;
            font-size: 20px;
        }
        .shuru{
            position: absolute;
            margin-left: 30px;
            width: 250px;
            height: 42px;
        }
        .btn{
            margin-top: 125px;
            margin-left: 10px;
            width: 85px;
            height: 35px;
            background-color: rgba(96, 255, 193, 0.5);
            border: none;
            border-radius: 20px;
        }
        .btn:hover{
            background-color: rgba(255,123,132,0.5);
        }
        .kn{
            position: absolute;
            margin-left: 30px;
            overflow-x:hidden;
            overflow-y:hidden;
            width: 250px;
            height: 150px;
        }
    </style>
    <script type="text/javascript" src="${ctx}/resource/plugin/jquery/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="jsi-cherry-container" class="container"></div>
<div id="zhu">
    <div class="cheng" id="aaa">
        <br>
        <h2 >上传者注册：</h2>
        <p> 用户名&nbsp;：<input class="shuru" type="text" id="loginname"></p>
        <p> 密&nbsp;&nbsp;码：<input  class="shuru"type="text" id="password"></p>
        <p> 确认密码：<input class="shuru" type="text" id="qrpassword"></p>
        <p> 个人描述：<textarea id="difficulty" class="kn"></textarea></p>

        <input class="btn" type="button" value="取消" id="quxiao">
        <input class="btn" type="button" value="注册" id="zhuce">
    </div>
</div>
<script type="text/javascript">
    var RENDERER = {
        INIT_CHERRY_BLOSSOM_COUNT : 30,
        MAX_ADDING_INTERVAL : 10,

        init : function(){
            this.setParameters();
            this.reconstructMethods();
            this.createCherries();
            this.render();
        },
        setParameters : function(){
            this.$container = $('#jsi-cherry-container');
            this.width = this.$container.width();
            this.height = this.$container.height();
            this.context = $('<canvas />').attr({width : this.width, height : this.height}).appendTo(this.$container).get(0).getContext('2d');
            this.cherries = [];
            this.maxAddingInterval = Math.round(this.MAX_ADDING_INTERVAL * 1000 / this.width);
            this.addingInterval = this.maxAddingInterval;
        },
        reconstructMethods : function(){
            this.render = this.render.bind(this);
        },
        createCherries : function(){
            for(var i = 0, length = Math.round(this.INIT_CHERRY_BLOSSOM_COUNT * this.width / 1000); i < length; i++){
                this.cherries.push(new CHERRY_BLOSSOM(this, true));
            }
        },
        render : function(){
            requestAnimationFrame(this.render);
            this.context.clearRect(0, 0, this.width, this.height);

            this.cherries.sort(function(cherry1, cherry2){
                return cherry1.z - cherry2.z;
            });
            for(var i = this.cherries.length - 1; i >= 0; i--){
                if(!this.cherries[i].render(this.context)){
                    this.cherries.splice(i, 1);
                }
            }
            if(--this.addingInterval == 0){
                this.addingInterval = this.maxAddingInterval;
                this.cherries.push(new CHERRY_BLOSSOM(this, false));
            }
        }
    };
    var CHERRY_BLOSSOM = function(renderer, isRandom){
        this.renderer = renderer;
        this.init(isRandom);
    };
    CHERRY_BLOSSOM.prototype = {
        FOCUS_POSITION : 300,
        FAR_LIMIT : 600,
        MAX_RIPPLE_COUNT : 100,
        RIPPLE_RADIUS : 100,
        SURFACE_RATE : 0.5,
        SINK_OFFSET : 20,

        init : function(isRandom){
            this.x = this.getRandomValue(-this.renderer.width, this.renderer.width);
            this.y = isRandom ? this.getRandomValue(0, this.renderer.height) : this.renderer.height * 1.5;
            this.z = this.getRandomValue(0, this.FAR_LIMIT);
            this.vx = this.getRandomValue(-2, 2);
            this.vy = -2;
            this.theta = this.getRandomValue(0, Math.PI * 2);
            this.phi = this.getRandomValue(0, Math.PI * 2);
            this.psi = 0;
            this.dpsi = this.getRandomValue(Math.PI / 600, Math.PI / 300);
            this.opacity = 0;
            this.endTheta = false;
            this.endPhi = false;
            this.rippleCount = 0;

            var axis = this.getAxis(),
                theta = this.theta + Math.ceil(-(this.y + this.renderer.height * this.SURFACE_RATE) / this.vy) * Math.PI / 500;
            theta %= Math.PI * 2;

            this.offsetY = 40 * ((theta <= Math.PI / 2 || theta >= Math.PI * 3 / 2) ? -1 : 1);
            this.thresholdY = this.renderer.height / 2 + this.renderer.height * this.SURFACE_RATE * axis.rate;
            this.entityColor = this.renderer.context.createRadialGradient(0, 40, 0, 0, 40, 80);
            this.entityColor.addColorStop(0, 'hsl(330, 70%, ' + 50 * (0.3 + axis.rate) + '%)');
            this.entityColor.addColorStop(0.05, 'hsl(330, 40%,' + 55 * (0.3 + axis.rate) + '%)');
            this.entityColor.addColorStop(1, 'hsl(330, 20%, ' + 70 * (0.3 + axis.rate) + '%)');
            this.shadowColor = this.renderer.context.createRadialGradient(0, 40, 0, 0, 40, 80);
            this.shadowColor.addColorStop(0, 'hsl(330, 40%, ' + 30 * (0.3 + axis.rate) + '%)');
            this.shadowColor.addColorStop(0.05, 'hsl(330, 40%,' + 30 * (0.3 + axis.rate) + '%)');
            this.shadowColor.addColorStop(1, 'hsl(330, 20%, ' + 40 * (0.3 + axis.rate) + '%)');
        },
        getRandomValue : function(min, max){
            return min + (max - min) * Math.random();
        },
        getAxis : function(){
            var rate = this.FOCUS_POSITION / (this.z + this.FOCUS_POSITION),
                x = this.renderer.width / 2 + this.x * rate,
                y = this.renderer.height / 2 - this.y * rate;
            return {rate : rate, x : x, y : y};
        },
        renderCherry : function(context, axis){
            context.beginPath();
            context.moveTo(0, 40);
            context.bezierCurveTo(-60, 20, -10, -60, 0, -20);
            context.bezierCurveTo(10, -60, 60, 20, 0, 40);
            context.fill();

            for(var i = -4; i < 4; i++){
                context.beginPath();
                context.moveTo(0, 40);
                context.quadraticCurveTo(i * 12, 10, i * 4, -24 + Math.abs(i) * 2);
                context.stroke();
            }
        },
        render : function(context){
            var axis = this.getAxis();

            if(axis.y == this.thresholdY && this.rippleCount < this.MAX_RIPPLE_COUNT){
                context.save();
                context.lineWidth = 2;
                context.strokeStyle = 'hsla(0, 0%, 100%, ' + (this.MAX_RIPPLE_COUNT - this.rippleCount) / this.MAX_RIPPLE_COUNT + ')';
                context.translate(axis.x + this.offsetY * axis.rate * (this.theta <= Math.PI ? -1 : 1), axis.y);
                context.scale(1, 0.3);
                context.beginPath();
                context.arc(0, 0, this.rippleCount / this.MAX_RIPPLE_COUNT * this.RIPPLE_RADIUS * axis.rate, 0, Math.PI * 2, false);
                context.stroke();
                context.restore();
                this.rippleCount++;
            }
            if(axis.y < this.thresholdY || (!this.endTheta || !this.endPhi)){
                if(this.y <= 0){
                    this.opacity = Math.min(this.opacity + 0.01, 1);
                }
                context.save();
                context.globalAlpha = this.opacity;
                context.fillStyle = this.shadowColor;
                context.strokeStyle = 'hsl(330, 30%,' + 40 * (0.3 + axis.rate) + '%)';
                context.translate(axis.x, Math.max(axis.y, this.thresholdY + this.thresholdY - axis.y));
                context.rotate(Math.PI - this.theta);
                context.scale(axis.rate * -Math.sin(this.phi), axis.rate);
                context.translate(0, this.offsetY);
                this.renderCherry(context, axis);
                context.restore();
            }
            context.save();
            context.fillStyle = this.entityColor;
            context.strokeStyle = 'hsl(330, 40%,' + 70 * (0.3 + axis.rate) + '%)';
            context.translate(axis.x, axis.y + Math.abs(this.SINK_OFFSET * Math.sin(this.psi) * axis.rate));
            context.rotate(this.theta);
            context.scale(axis.rate * Math.sin(this.phi), axis.rate);
            context.translate(0, this.offsetY);
            this.renderCherry(context, axis);
            context.restore();

            if(this.y <= -this.renderer.height / 4){
                if(!this.endTheta){
                    for(var theta = Math.PI / 2, end = Math.PI * 3 / 2; theta <= end; theta += Math.PI){
                        if(this.theta < theta && this.theta + Math.PI / 200 > theta){
                            this.theta = theta;
                            this.endTheta = true;
                            break;
                        }
                    }
                }
                if(!this.endPhi){
                    for(var phi = Math.PI / 8, end = Math.PI * 7 / 8; phi <= end; phi += Math.PI * 3 / 4){
                        if(this.phi < phi && this.phi + Math.PI / 200 > phi){
                            this.phi = Math.PI / 8;
                            this.endPhi = true;
                            break;
                        }
                    }
                }
            }
            if(!this.endTheta){
                if(axis.y == this.thresholdY){
                    this.theta += Math.PI / 200 * ((this.theta < Math.PI / 2 || (this.theta >= Math.PI && this.theta < Math.PI * 3 / 2)) ? 1 : -1);
                }else{
                    this.theta += Math.PI / 500;
                }
                this.theta %= Math.PI * 2;
            }
            if(this.endPhi){
                if(this.rippleCount == this.MAX_RIPPLE_COUNT){
                    this.psi += this.dpsi;
                    this.psi %= Math.PI * 2;
                }
            }else{
                this.phi += Math.PI / ((axis.y == this.thresholdY) ? 200 : 500);
                this.phi %= Math.PI;
            }
            if(this.y <= -this.renderer.height * this.SURFACE_RATE){
                this.x += 2;
                this.y = -this.renderer.height * this.SURFACE_RATE;
            }else{
                this.x += this.vx;
                this.y += this.vy;
            }
            return this.z > -this.FOCUS_POSITION && this.z < this.FAR_LIMIT && this.x < this.renderer.width * 1.5;
        }
    };
    $(function(){
        RENDERER.init();
    });






    $(function () {
        $("#quxiao").on("click",function () {
            window.location="${ctx}/dispatcher/atl";
        })
        $("#zhuce").on("click",function () {
            var name = $("#loginname").val();
            var pwd = $("#password").val();
            var qrpwd = $("#qrpassword").val();
            var difficulty = $("#difficulty").val();
            if (name == null || name == undefined || name.length <= 0) {
                alert("请输入用户名！");
            } else if (pwd == null || pwd == undefined || pwd.length <= 0) {
                alert("请输入密码！");
            } else if (qrpwd == null || qrpwd == undefined || qrpwd.length <= 0) {
                alert("请输入密码！");
            }else if (qrpwd != pwd) {
                alert("密码不一致！");
            }else if (difficulty == null || difficulty == undefined || difficulty.length <= 0) {
                alert("困难描述不能为空！");
            }

            else {
                $.ajax({
                    url:"${ctx}/accepter/do_regist",
                    type:"post",
                    datatype:"json",
                    data:{
                        loginName:name,
                        password:pwd,
                        qrpassword:qrpwd,
                        difficulty:difficulty
                    },
                    success:function (response) {
                        if(response.isSuccess==true){
                            if (response.isRegistSuccess==true){
                                window.location="${ctx}/dispatcher/aregistSuccess";
                            }else {
                                alert("注册失败！"+"   "+response.msg);
                            }
                        }else {
                            alert("注册异常");
                        }
                    },
                    error:function (message) {
                        alert("error:"+message);
                    }
                });
            }
        });
    });
</script>
</body>
</html>
