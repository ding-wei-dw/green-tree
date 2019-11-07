<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/18
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增俱乐部会员信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    复习SSM框架的管理系统：实现增、删、改、查、模糊查询等。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增俱乐部会员信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form class="form-inline" action="doAdd" method="post" onsubmit="return checkEmpty()">
        <div class="row clearfix">
            <div class="col-md-12 column">
                    姓名：<input class="form-control" type="text" name="mname" id="mname"><br><br>
                    <div id="sex">
                        性别：
                        <input type="radio" name="mgender" value="男" checked="checked">男
                        <input type="radio" name="mgender" value="女">女
                    </div> <br><br>
                    年龄：<input class="form-control" type="text" name="mage" id="mage"><br><br>
                    家庭住址：<input class="form-control" type="text" name="maddress" id="maddress"><br><br>
                    Email：<input class="form-control" type="text" name="memail" id="memail"><br><br>
                    <input type="submit" value="添加" class="btn btn-success">&nbsp;&nbsp;
                    <input type="reset" value="重置" class="btn btn-danger">
            </div>
        </div>
    </form>

</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    function checkEmpty() {//非空判断
        var name = $("#mname").val();
        var age = $("#mage").val();
        var address = $("#maddress").val();
        var email = $("#memail").val();
        if(name=="" || name==null){
            alert("用户名不能为空!!!");
            return false;
        }else if (age=="" || age==null){
            alert("年龄不能为空!!!");
            return false;
        }else if (address=="" || address==null){
            alert("地址不能为空!!!");
            return false;
        }else if (email=="" || email==null){
            alert("邮箱不能为空!!!");
            return false;
        }else{
            return true;
        }
    }
</script>
</html>
