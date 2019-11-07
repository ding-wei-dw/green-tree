
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Paper列表</title>
    <!-- 引入 Bootstrap -->
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
                    <small>列表显示 —— 俱乐部会员信息</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="toAdd">新增</a>
            <div class="input-group">
                <input type="text" class="form-control" name="mname" id="uname">
                    <span class="input-group-btn">
                        <button id="btn" class="btn btn-default" type="button">查询</button>
                    </span>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" id="tab">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>家庭住址</th>
                    <th>Email</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%--<c:forEach  items="${list}" var="l">--%>
                <%--分页显示--%>
                    <c:forEach  items="${pagemsg.lists}" var="l">
                    <tr>
                        <td><a href="getById/${l.id}" >${l.id}</a></td>
                        <td>${l.mname}</td>
                        <td>${l.mgender}</td>
                        <td>${l.mage}</td>
                        <td>${l.maddress}</td>
                        <td>${l.memail}</td>
                        <td>
                            <a href="del/${l.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <table  border="0" cellspacing="0" cellpadding="0"  width="900px">
        <tr>

            <td class="td2">


                <span>第${pagemsg.currPage }/ ${pagemsg.totalPage}页</span>
                <span>总记录数：${pagemsg.totalCount }  每页显示:${pagemsg
                .pageSize}</span>
                <span>
       <c:if test="${pagemsg.currPage!=1}">
           <a href="${pageContext.request.contextPath }/getList?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/getList?currentPage=${pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${pagemsg.currPage!=pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/getList?currentPage=${pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/getList?currentPage=${pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
            </td>
        </tr>
    </table>

</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            var uname = $("#uname").val();//先获取input输入框的值
            $.ajax({
                url:'getListByName?mname='+uname,
                datatype:"json",
                success:function (res) {
                    var trObj="";
                    $.each(res,function (i,n) {//遍历生成表格
                        trObj+="<tr>\n" +
                            "                        <td>\n" +
                            "                            <a href='getById/"+n.id+"'>"+n.id+"</a></td>\n" +
                            "                        <td>"+n.mname+"</td>\n" +
                            "                        <td>"+n.mgender+"</td>\n" +
                            "                        <td>"+n.mage+"</td>\n" +
                            "                        <td>"+n.maddress+"</td>\n" +
                            "                        <td>"+n.memail+"</td>\n" +
                            "                        <td>\n" +
                            "                            <a href='doDel/"+n.id+"'>删除</a>\n" +
                            "                        </td>\n" +
                            "                    </tr>"
                    })
                    //将生成的tr追加到表格中
                    $("#tab tr:gt(0)").remove();
                    $("#tab").append($(trObj));
                }
            })
        })
    });
</script>
</html>
