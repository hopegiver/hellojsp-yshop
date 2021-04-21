<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    BagDao card = new BagDao();
        int id = m.reqInt("id");
        if(id == 0){
            m.jsAlert("id is empty");
            return;
        }
       DataSet info =  card.find("bag_id="+id);
        card.item("status",-1);
        if(!card.update("bag_id = " + id)){
            m.jsAlert("Error occured (delete)");
            return;
        }
        m.redirect("card_list.jsp");
%>
