<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%

//Step1
BlogDao blogDao = new BlogDao();
CategoryDao categoryDao = new CategoryDao();
int id = m.reqInt("id");
if(id == 0){
    m.jsError("id is null");
    return;
}

DataSet categories = categoryDao.getTree();
DataSet blog = blogDao.find("id = " + id);
if(!blog.next()){
    m.jsError("detail view failed");
    return;
}
p.setLayout("shop");
p.setBody("user/blog_detail");
p.setLoop("category",categories);
p.setVar("info", blog);
p.print();
%>
