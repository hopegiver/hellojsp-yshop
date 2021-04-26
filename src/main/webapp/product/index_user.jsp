<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="../init.jsp" %><%

    CategoryDao categoryDao = new CategoryDao();

    String catId = m.request("cid");
    f.addElement("s_keyword" , null , null);
    DataSet categories = categoryDao.getTree();

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setListNum(6);
    lm.setTable("tb_product");
    lm.setFields("*");
    lm.addWhere("status = 1");

    if(catId != ""){
        lm.addWhere("category_id = " + catId);
    }
    lm.addSearch("title , explanation", f.get("s_keyword"), "LIKE");

    p.setLayout("shop");
    p.setBody("product/index_user");
    p.setLoop("categories" , categories);
    p.setLoop("list" , lm.getDataSet());
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.setVar("form_script" , f.getScript());
    p.print();
%>