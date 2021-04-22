<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    BlogDao blog = new BlogDao();
    CategoryDao category = new CategoryDao();
    DataSet categorylist = category.find("");
    int id = m.reqInt("id");
    if(id == 0){
        m.jsError("id is null");
        return;
    }
    DataSet info = blog.find("id =" + id);
    if(!info.next()){
        m.jsError("detail view failed");
        return;
    }
    p.setVar("info" , info);
    p.setLoop("category",categorylist);
    p.setLayout("shop");
    p.setBody("user/blog_detail");
    p.print();
%>
