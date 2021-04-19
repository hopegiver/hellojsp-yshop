<%@ page contentType="text/html;charset=UTF-8"%><%@include file="init.jsp"%><%
    StampDao stamp = new StampDao();
    int id  = m.reqInt("id");
    if(id == 0){
        m.jsError("id is null");
    }
    if( !stamp.delete("stampid = " + id)){
        m.jsError("can not delete");
        return;
    }
    else {
        m.redirect("mypagelist.jsp");
    }
%>
