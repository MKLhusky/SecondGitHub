<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-06-15
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
</head>
<body>
<form action="/AddNewServlet" method="get">
    <select name="leixing" id="">
        <option value="1">国内</option>
        <option value="2">国际</option>
    </select>
    标题：<input type="text" name="title"><br>
    总结：<textarea class="ckeditor" name="summary" cols="30" rows="10"></textarea><br>
    内容：<textarea  name="content" cols="30" rows="10" class="ckeditor" ></textarea><br>
    作者：<input type="text" name="author"><br>
    <input type="submit" value="添加">
</form>
</body>
</html>
