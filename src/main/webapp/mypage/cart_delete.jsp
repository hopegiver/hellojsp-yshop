<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    CartDao cardDao = new CartDao();
        int id = m.reqInt("id");
        if(id == 0){
            m.jsAlert("id is empty");
            return;
        }
    cardDao.item("status",-1);
        if(!cardDao.update("id = " + id)){
            m.jsAlert("Error occured (delete)");
            return;
        }
        m.redirect("cart_list.jsp");
%>
