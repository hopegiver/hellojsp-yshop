<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

    CartDao cartDao = new CartDao();

    DataSet totalCost = cartDao.getTotalCost(userId);
    if(!totalCost.next()){
        m.jsError("totalcost is null");
        return;
    }
    f.addElement("total_cost", null, "required : 'Y'");
    f.addElement("zipcode", null, "required : 'Y'");

    if(m.isPost() && f.validate()) {
        cartDao.item("status", -1);
        cartDao.update("reg_user = '" + userId + "'");
        m.redirect("index.jsp");
        return;
    }
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_product_bag a JOIN tb_product b ON a.product_id = b.id");
    lm.setFields("a.* , b.title, b.explanation, b.price, b.att_file_code");
    lm.addWhere("a.status = 1");
    lm.addWhere("a.reg_user = '"+userId+"'");
    DataSet list = lm.getDataSet();

    p.setLayout("shop");
    p.setBody("cart/index");
    p.setLoop("list" , list);
    p.setVar("no_data", list.size() == 0);
    p.setVar("form_script", f.getScript());
    p.setVar("totalCost", totalCost);
    p.print();
%>