<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    CategoryDao categoryDao = new CategoryDao();

    String catId = m.request("cid");

    f.addElement("keyword" , null , null);
    DataSet categories = categoryDao.find("status = 1");
    while(categories.next()){
        categories.put("pid", categories.getInt("parent_id") == 0 ? "" : categories.getInt("parent_id"));
        categories.put("name", categories.get("category_name"));
    }

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setListNum(6);
    lm.setTable("tb_product");
    lm.setFields("*");
    lm.addWhere("status = 1");
    lm.addSearch("title, explanation", f.get("s_keyword"), "LIKE");

    p.setLayout("shop");
    p.setBody("user/product_list");
    p.setLoop("categories" , categories);
    p.setLoop("list" , lm.getDataSet());
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.setVar("form_script" , f.getScript());
    p.print();
%>