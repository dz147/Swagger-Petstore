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
            <input type="hidden" name="id" value="${pets.id}"/>
            <select name="category">
                <option value="1">猫</option>
                <option value="2">狗</option>
            </select>
        </td>
        <td><input type="text" name="name" value="${pets.name}"/></td>
        <td><input type="text" name="photoUrls" value="${pets.photoUrls}"/></td>
        <td>
            <select name="tags">
                <option value="1">长毛</option>
                <option value="2">短毛</option>
                <option value="3">黑色</option>
                <option value="4">棕色</option>
            </select>
        </td>
        <td><input type="text" name="status" value="${pets.status}"/></td>
    </tr>
    </tbody>
</table>
<input type="button" value="修改" style="display: block;width: 100px;height: 40px; margin: 0 auto" id="addPet"/>


<script src="../../js/jquery.js"></script>
<script type="text/javascript">

    $("#addPet").click(function () {
        $.ajax({
            url: "/petUpdate",
            type: "PUT",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({
                id: $("input[name=id]", $("#tbody01 tr")).val(),
                category: $("select[name=category]", $("#tbody01 tr")).val(),
                name: $("input[name=name]", $("#tbody01 tr")).val(),
                photoUrls: $("input[name=photoUrls]", $("#tbody01 tr")).val(),
                tags: $("select[name=tags]", $("#tbody01 tr")).val(),
                status: $("input[name=status]", $("#tbody01 tr")).val()
            })
        }).done(function (data) {
            if(data.msg === "修改成功"){
                alert(data.msg);
                window.location.href = "/pet";
            }
        });
    });
</script>
</body>
</html>
