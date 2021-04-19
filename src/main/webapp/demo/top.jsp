<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="/init.jsp"%><%
    Boolean isLoggedin = false;
    if(userId != null){
        isLoggedin = true;
    }
    p.setVar("is_logged" , isLoggedin);
    p.setBody("demo/top");
    p.setVar("modify" , true);
    p.print();
%>
