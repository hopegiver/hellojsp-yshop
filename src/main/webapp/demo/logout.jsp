<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="/init.jsp"%><%
    auth.put("user_id", "");
    auth.save();
    auth.destroy();
    m.redirect("index.jsp");
%>
