<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    Boolean isLoggedin = false;
    Boolean isAdmin = false;
    if(userId != null){
        isLoggedin = true;
    }
    if(is_admin != 0){
        isAdmin = true;
    }
    p.setVar("is_logged" , isLoggedin);
    p.setVar("isAdmin",isAdmin);
    p.setLayout("shop");
    p.setBody("admin/index");
    p.print();
%>

