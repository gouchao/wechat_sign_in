<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.*" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<script type="text/javascript">
    window.serverTime=<%=new java.util.Date().getTime()%>;
</script>
 <link type="text/css" rel="stylesheet" href="${ctx}/resources/css/idialog.css" />
 <script src="${ctx}/resources/js/artDialog.js" type="text/javascript"></script>
 <script src="${ctx}/resources/js/iDialog.js" type="text/javascript"></script>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
response.setDateHeader("Expires",-10);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <style type="text/css">
body {
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
 	background:url(${ctx}/resources/images/login/back01.png) center no-repeat;
	width: 100%;
	height: 280px;
	position:relative;
	background-repeat: no-repeat;
	background-size:100% auto;
 	background-position:center center;

}

.top-font {
	background-image: url(${ctx}/resources/images/login/0001.png);
	left:50%;	  /*控制welcome的左右  */
 	top:10%; 
 	margin-left:-190px;
    width:380px; 
	height:200px;
	z-index:999;
	position:absolute;
	background-repeat: no-repeat;

}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px; 
	width: 200px; 
	padding-left: 10px;

}

.u_logo {
	background-image: url(${ctx}/resources/images/login/username01.png);
	padding: 12px 18px; 
	top: 43px;
	left: 70px;
	background-repeat: no-repeat;
}

.p_logo {
	background-image: url(${ctx}/resources/images/login/password01.png);
	padding:12px 18px;
	top: 12px;
	left: 70px;
	background-repeat: no-repeat;
}

.verify {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	padding-left: 10px;
}
</style>
        <script type="text/javascript" src="${ctx}/resources/js/mydialog.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/jsencrypt.js"></script>
    </head>
    <body style="background-repeat: no-repeat;background-position: 0px 0px;overflow: hidden;">
            <form action="${ctx}/login/login" method="post" id="loginForm"  onkeydown="keyLogin();">
           
            <div class="top-font">
	            
	        </div>		
			<DIV class="top_div" id="btImg">
			  			
			</DIV>
			<DIV
				style="background: rgb(255, 255, 255); margin: 20px auto auto; border-image: none; width: 400px; height: 200px; text-align: center;">
				<DIV style="width: 165px; height: 96px; position: absolute;">
				</DIV>
				<p style="padding: 40px 0px 15px; position: relative;">
					<span class="u_logo"></span>
					<input class="ipt" type="text"placeholder="请输入登录名" name="loginUser.loginName" id="loginName" style="font-size:12px">
				</p>
				<P style="position: relative;">
					<SPAN class="p_logo"></SPAN><INPUT class="ipt" autocomplete="off"
						type="password" placeholder="请输入密码" id="password" name="loginUser.pwd" style="font-size:12px" value="">
				</P>
				<P style="padding:30px 0px 10px; margin-top: -20px;">
					<INPUT class="verify" style="width:85px;font-size:12px;" type="text" placeholder="请输入验证码" value="" name="verifycode" id="validcode" maxlength="4">
					<img src="${ctx}/common/Captcha.jpg" id="capImg" alt="点击图片更换附加码"  width="145" height="36" align="top" hspace="2" style="cursor: pointer;"/>
				</P>
				<p >
				   <input id="btn" type="submit"  onclick="return beforeSubmit();" tabindex="4" style="border:0px; width:258px; height:36px; background-image:url(${ctx}/resources/images/login/icon03.png)" value="">
				</p>
				
			</DIV>
		
			<div text-align: center;"><div class="center" style="padding-top: 85px;"><s:text name="page.lable.address"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="page.lable.ju"/></div></div>
		
			 	
		</form>
        <script type="text/javascript">
            function beforeSubmit() {
                if($.nl.checkValue("loginName",true, false, 1, 60, "登录名") == false){
                    $("#loginName").blur();
                    return false;
                }
                if($.nl.checkValue("password",true, false, 6, 20, "登录密码") == false){
                    $("#password").blur();
                    return false;
                }
                if($.nl.checkValue("validcode",true, false, 1, 4, "验证码") == false){
                    $("#validcode").blur();
                    return false;
                }
                $("#password").val(doRSAEncrypt($("#password").val()));
                
                
            }
            
            /*Enter登录  */
           	function keyLogin(){
                	if (event.keyCode==13){//回车键的键值为13
                  	  document.getElementById("btn").click(); //调用登录按钮的登录事件
                  	  return false;
                	}  
                }
           	
            $(function(){
                $("#loginName").focus();
                $("#capImg").bind('click',changeSimpleCaptcha);
                var showAlert = false;
                if ($.browser.msie){
                    if (ScriptEngineMajorVersion() < 5){
                        showAlert = true;
                    }else if(ScriptEngineMajorVersion() == 5){
                        if (ScriptEngineMinorVersion() < 6){
                            showAlert = true;
                        }else if (ScriptEngineMinorVersion() == 6){
                            if (ScriptEngineBuildVersion() <= 8834){
                                showAlert = true;
                            }
                        }
                    }
                    var tip="您的浏览器IE6.0尚未进行必要的升级，将出现访问部分网页速度较慢的现象，建议您先安装相应的微软官方补丁。";
                    tip+="<a href=\"http://www.microsoft.com/downloads/zh-cn/details.aspx?familyid=0af373b2-2240-4079-a748-a38d1bc06f39\" target=\"_blank\">";
                    tip+="点击下载</a>";
                    if (showAlert){
                        jalert(tip,null,360,190);
                    }
                }
            });
            function changeSimpleCaptcha(event){
                var img = document.getElementById(event.target.id);
                var i = img.src.indexOf('?');
                var code;
             	if(i==-1){
                    code=img.src+'?'+Math.random( )*10000;
                } else{
                    code=img.src.substring(0,i+1)+Math.random( )*10000;
                }
                img.src=code;
            }
        </script>
    </body>
</html>
