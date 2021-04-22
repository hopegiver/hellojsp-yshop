<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    // step 1
    ProductDao productDao = new ProductDao();

    // step 2
    int user_id = Integer.parseInt(userId);

    // step 3
    f.addElement("key_word" , null , null);

    // step 4
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setListNum(5);
    lm.setTable("tb_product");
    lm.setFields("*");
    lm.addWhere("status = 1");
    lm.addWhere("isbanner = '1'");
    lm.addSearch("");
%>