
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改俱乐部会员信息</title>
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
                    <small>修改俱乐部会员信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form class="form-inline" action="${pageContext.request.contextPath}/edit" method="post" onsubmit="return checkEmpty()">
        <div class="row clearfix">
            <div class="col-md-12 column">
                    <input type="hidden" name="id" value="${member.id}">
                    姓名：<input class="form-control" type="text" name="mname" value="${member.mname}"><br><br>
                    <div id="sex">
                        性别：
                        <input type="radio" name="mgender" value="男"
                            <c:if test="${member.mgender eq '男'}">checked="checked"</c:if> >男
                        <input type="radio" name="mgender" value="女"
                            <c:if test="${member.mgender eq '女'}">checked="checked"</c:if>>女
                    </div> <br><br>
                    年龄：<input class="form-control" type="text" name="mage" value="${member.mage}"><br><br>
                    家庭住址：<input class="form-control" type="text" name="maddress" value="${member.maddress}"><br><br>
                    Email：<input class="form-control" type="text" name="memail" value="${member.memail}"><br><br>
                    <input type="submit" value="修改" class="btn btn-success">&nbsp;&nbsp;
                    <input type="reset" value="重置" class="btn btn-danger">
            </div>
        </div>
    </form>

</div>
</body>
</html>
