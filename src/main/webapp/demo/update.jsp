<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    StampDao stamp = new StampDao();
    int id = m.reqInt("id");
    if(id==0){
        m.jsError("id is null");
    }
    DataSet info = stamp.find("id = " + id);
    if(!info.next()){
        m.jsError("No Data");
        return;
    }
%>
