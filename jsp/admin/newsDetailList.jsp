<%@page import="cn.kgc.news.pojo.News"%>
<%@page import="java.util.List"%>
<%@page import="cn.kgc.news.service.impl.NewsServiceImpl"%>
<%@page import="cn.kgc.news.service.NewsService"%>
<%@ page import="cn.kgc.news.util.PageSuper" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>
	<script src=""></script>
<style type="text/css">
<!--

-->
</style>
</head>

<body>
<!--页面顶部-->

<!--主体-->
    <div class="main-content-right">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <form name ="searchForm" id="searchForm" action="<%=request.getContextPath()%>/jsp/admin/newsDetailList.jsp" method="post">
		 	          <div>
		 				新闻分类：
		 					<select name="categoryId">
		 						<option value="0">全部</option>
			        			
			        				<option value='1' >国内</option>
			        			
			        				<option value='2' >国际</option>
			        			
			        				<option value='3' >娱乐</option>
			        			
			        				<option value='4' >军事</option>
			        			
			        				<option value='5' >财经</option>
			        			
			        				<option value='6' >天气</option>
			        			
	        				</select>
		 				新闻标题<input type="text" name="title" id="title" value=''/>
		 					<button type="button" class="page-btn" onclick="gogo();">GO</button>
		 					<button type="button" onclick="addNews();" class="page-btn">增加</button>
		 					<input type="hidden" name="currentPageNo" value="1"/>
		 					<input type="hidden" name="pageSize" value="10"/>
		 					<input type="hidden" name="totalPageCount" value="2"/>
		 	</div>
		 	</form>
			<table cellpadding="1" cellspacing="1" class="admin-list">
				<thead >
					<tr class="admin-list-head">
						<th>新闻标题</th>
                        <th>作者</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<%
						PageSuper pageSuper = (PageSuper) session.getAttribute("pageSuper");
						int type =(Integer) session.getAttribute("type");
                		List<News> newsList = pageSuper.getNewsList();
                		int i= 0;
                		for(News news:newsList){
                			i++;
                	 %>
					<input type="hidden" id="go" value="<%=pageSuper.getSumPage()%>"/>
                	<tr <%if(i%2==0){ %>class="admin-list-td-h2"<%} %>>
                		<td><a href='<%=request.getContextPath()%>/jsp/admin/newsDetailView.jsp?id=<%=news.getId()%>'><%=news.getTitle() %></a></td>
                		<td><%=news.getAuthor() %></td>
                		<td><%=news.getCreateDate() %></td>
                		<td><a href='adminNewsCreate.jsp?id=2'>修改</a>
                			<a href="javascript:if(confirm('确认是否删除此新闻？')) location='<%=request.getContextPath()%>/UserServlet?id=<%=news.getId()%>'">删除</a>
                		</td>
                	</tr> 
                	<%} %>
                </tbody>
            </table>
           <div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共<%=pageSuper.getSumData()%>条记录&nbsp;&nbsp; <%=pageSuper.getThisPage()%>/<%=pageSuper.getSumPage()%>页</li>
				<%if (type == 1){%>
					<% if (pageSuper.getThisPage() != 1){%>
					<a href="/LoginServlet?pageIndex=1">首页</a>
					<a href="/LoginServlet?pageIndex=<%=pageSuper.getThisPage()-1%>">上一页</a>
					<%} if (pageSuper.getThisPage() != pageSuper.getSumPage()){%>
					<a href="/LoginServlet?pageIndex=<%=pageSuper.getThisPage()+1%>">下一页</a>
					<a href="/LoginServlet?pageIndex=<%=pageSuper.getSumPage()%>">最后一页</a>&nbsp;&nbsp;
					<%}%>
				<%}else if(type == 2){%>
					<% if (pageSuper.getThisPage() != 1){%>
					<a href="/GoNewsServlet?pageIndex=1">首页</a>
					<a href="/GoNewsServlet?pageIndex=<%=pageSuper.getThisPage()-1%>">上一页</a>
					<%} if (pageSuper.getThisPage() != pageSuper.getSumPage()){%>
					<a href="/GoNewsServlet?pageIndex=<%=pageSuper.getThisPage()+1%>">下一页</a>
					<a href="/GoNewsServlet?pageIndex=<%=pageSuper.getSumPage()%>">最后一页</a>&nbsp;&nbsp;
					<%}%>
				<%}%>
			</ul>
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
			 <% if (type == 1){%>
	     <button type="button" class="page-btn" onclick="go();">GO</button>
			 <%} if (type == 2){%>
	     <button type="button" class="page-btn" onclick="go1();">GO</button>
			 <%}%>
		</span>
		</div> 
        </div>
       </div>
   </div>
   </div>
<!--底部-->
</body></html>
<script>
    function addNews(){
        window.location.href="/jsp/admin/newsDetailCreateSimple.jsp";
        //疑问？ 为什么这里面不可以嵌套java代码
    }
    function go(){
        var a = document.getElementById("inputPage").value;//用户输入的页数
        var b = document.getElementById("go").value;//总页数
		var zhen = /^[1-9]\d*$/;
		if (zhen.test(a)) {
            if (b - a > 0) {
				window.location.href = "/LoginServlet?inputPage=" + a;
            } else {
                alert("你输入的页数不在范围内！");
            }
        }else {
            alert("你输入的页数不在范围内！");
        }
	}
    function go1(){
        var a = document.getElementById("inputPage").value;//用户输入的页数
        var b = document.getElementById("go").value;//总页数
        var zhen = /^[1-9]\d*$/;
        if (zhen.test(a)) {
            if (b - a >= 0) {
                window.location.href = "/GoNewsServlet?inputPage=" + a;
            } else {
                alert("你输入的页数不在范围内！");
            }
        }else {
            alert("你输入的页数不在范围内！");
        }
    }

	function gogo(){
        var e = document.getElementById("title").value;
        window.location.href = "/GoNewsServlet?titlePage=" + e;

	}
</script>