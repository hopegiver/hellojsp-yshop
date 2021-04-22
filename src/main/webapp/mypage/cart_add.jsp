<%@ page contentType="text/html;charset=UTF-8"%><%@include file="init.jsp"%><%
    CartDao bag = new CartDao();
    int id = m.reqInt("id");
    if(id == 0){
        m.jsError("product is not available");
        return;
    }
        bag.item("product_id",id);
        bag.item("reg_user" , auth.get("user_id"));
        bag.item("reg_date" , m.time("yyyyMMdd"));
        bag.item("count" , 1);
        bag.item("status" , 1);
        if(bag.insert()){
            m.redirect("product_list.jsp");
        }
        else{
            m.jsError("occured(insert)");
            return;
        }
%>
