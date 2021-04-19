<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    CategoryDao category = new CategoryDao();
    DataSet categorylist = category.find("");
    p.setLoop("category",categorylist);
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_blog t");
    lm.setFields("t.*");
    lm.addWhere("status = 1");
    DataSet info = lm.getDataSet();
    p.setLoop("list", info);
    p.setLayout("shop");
    p.setBody("user/blog_list");
    p.print();
%>
