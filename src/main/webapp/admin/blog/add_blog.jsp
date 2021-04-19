<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
BlogDao blog = new BlogDao();
f.addElement("subject" , null,"required:'Y'");
f.addElement("content" , null, "required:'Y'");
f.addElement("att_file" , null , "");
f.addElement("content_title" , null, "required:'Y'");
if(m.isPost() && f.validate()){
}
p.setLayout("shop");
p.setBody("admin/add_blog");
p.print();
%>

