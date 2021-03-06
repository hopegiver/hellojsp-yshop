<%@ page contentType="text/html;charset=UTF-8" %><%@ include file="init.jsp" %><%

CartDao cartDao = new CartDao();

int id = m.reqInt("id");
if(id == 0) {
    m.jsError("product is not available");
    return;
}

cartDao.item("product_id" , id);
cartDao.item("reg_user" , auth.get("user_id"));
cartDao.item("reg_date" , m.time("yyyyMMdd"));
cartDao.item("count" , 1);
cartDao.item("status" , 1);
if(!cartDao.insert()) {
    m.jsError("occured (insert) ");
    return;
}
m.redirect("/product/index_user.jsp");
%>
