<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宠物信息</title>
    <style type="text/css">
        table tr {
            text-align: center;
            height: 40px;
            line-height: 40px;
        }

        table tr:hover {
            background-color: #F8F8F8;
        }
    </style>
</head>
<body>

<table border="0px" align="center" width="60%" bordercolor="#E2E2E2" id="table01">
    <thead>
    <tr>
        <th>类型</th>
        <th>名称</th>
        <th>图片链接</th>
        <th>标签</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody id="tbody01">
    <tr>
        <td>
            <select name="category">
                <option>请选择</option>
                <option value="1">猫</option>
                <option value="2">狗</option>
            </select>
        </td>
        <td><input type="text" name="name"/></td>
        <td><input type="text" name="photoUrls"/></td>
        <td>
            <select name="tags">
                <option>请选择</option>
                <option value="1">长毛</option>
                <option value="2">短毛</option>
                <option value="3">黑色</option>
                <option value="4">棕色</option>
            </select>
        </td>
        <td><input type="text" name="status"/></td>
    </tr>
    </tbody>
</table>
<input type="button" value="添加" style="display: block;width: 100px;height: 40px; margin: 0 auto" id="addPet"/>

<form action="/getByStatus/status" method="get">
    <div style="margin: auto;text-align: center;">
        <br/><br/><br/>
        <label for="state">查询宠物状态</label>
        <select name="status" id="state">
            <option value="正常">正常</option>
            <option value="预定">预定</option>
            <option value="已售">已售</option>
        </select>

        <input type="submit" value="查询"/>
    </div>
</form>

<table border="0px" align="center" width="60%" bordercolor="#E2E2E2">
    <thead>
    <th>宠物编号</th>
    <th>类型</th>
    <th>名称</th>
    <th>图片</th>
    <th>标签</th>
    <th>状态</th>
    </thead>
    <tbody>
    <c:forEach items="${pets}" var="pet">
        <tr>
            <td>${pet.id}</td>
            <td>${pet.categorys.NAME}</td>
            <td>${pet.name}</td>
            <td><a href=${pet.photoUrls}>图片链接</a></td>
            <td>${pet.tag.name}</td>
            <td>${pet.status}</td>
            <td><a class="del" href="#" onclick="del(${pet.id})">删除</a></td>
            <td><a href="/getPetById/${pet.id}">修改</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="../../js/jquery.js"></script>
<script type="text/javascript">

    function del(x) {
        $.ajax({
            url: "/delPet/" + x + "",
            type: "DELETE"
        }).done(function (data) {
            if (data.msg === "删除成功") {
                window.location.reload();
            }
        });
    }

    $(function () {

    });
    $("#addPet").click(function () {
        $.post({
            url: "/petAdd",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                category: $("select[name=category]", $("#tbody01 tr")).val(),
                name: $("input[name=name]", $("#tbody01 tr")).val(),
                photoUrls: $("input[name=photoUrls]", $("#tbody01 tr")).val(),
                tags: $("select[name=tags]", $("#tbody01 tr")).val(),
                status: $("input[name=status]", $("#tbody01 tr")).val()
            })
        }).done(function (data) {
            if (data.msg === "succeed") {
                window.location.reload();
            }
            console.log(data.msg + ";" + data.cause);
        });
    });
</script>
</body>
</html>
