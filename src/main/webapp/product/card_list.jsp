<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    BagDao card = new BagDao();
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_product_bag a JOIN tb_product b ON a.product_id = b.product_id");
    lm.setFields("a.* , b.*");
    lm.addWhere("a.status = '1'");
    lm.addWhere("a.reg_user = '"+auth.get("user_id") +"'");
    lm.setListNum(3);
    DataSet list = lm.getDataSet();
    if(!list.next()){
        m.jsAlert("your card is empty");
    }
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.setLoop("list" , list);
    p.setLayout("shop");
    p.setBody("user/card");
    p.print();
%>
