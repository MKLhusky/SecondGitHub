<%@ page import="cn.kgc.news.service.NewsService" %>
<%@ page import="cn.kgc.news.service.impl.NewsServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.kgc.news.pojo.News" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-06-15
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <%
            List<News> list = (List)session.getAttribute("list");
            for (News news : list){
        %>
        <tr>
            <td><%=news.getTitle()%></td>
            <td><%=news.getContent()%></td>
            <td><%=news.getAuthor()%></td>
            <td><a href="<%=request.getContextPath()%>/jsp/addNew.jsp" >添加</a></td>
            <td><a href="<%=request.getContextPath()%>/UserServlet?id=<%=news.getId()%>" name="">删除</a></td>
        </tr>
        <%}%>
    </table>
</body>
</html>
