<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    UserDao user = new UserDao();
    int id  = m.reqInt("id");
    m.jsAlert( id + "");
    if(!user.delete("id=" + id)){
        m.jsError("user failed");
    }
    else {
        userId = null;
        auth.put("user_id","");
        auth.save();
        m.redirect("logout.jsp");
    }
%>
