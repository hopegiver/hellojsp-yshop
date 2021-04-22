<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_product_bag a JOIN tb_product b ON a.product_id = b.id");
    lm.setFields("a.* , b.title, b.explanation, b.price, b.att_file_code");
    lm.addWhere("a.status = 1");
    lm.addWhere("a.reg_user = '"+userId+"'");
    DataSet list = lm.getDataSet();

    p.setLayout("shop");
    p.setBody("user/cart");
    p.setLoop("list" , list);
    p.setVar("no_data", list.size() == 0);
    p.print();
%>
