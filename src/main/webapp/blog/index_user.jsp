<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%

    //Step1
    CategoryDao categoryDao = new CategoryDao();

    String catId = m.request("cid");

    f.addElement("keyword" , null , null);

    DataSet categories = categoryDao.getTree();

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setListNum(6);
    lm.setTable("tb_blog a JOIN tb_user b ON a.reg_user = b.id");
    lm.setFields("a.* , b.name");
    lm.addWhere("a.status = 1");
    lm.addSearch("a.subject, a.content_title , a.content", f.get("s_keyword"), "LIKE");

    p.setLayout("shop");
    p.setBody("blog/index_user");
    p.setLoop("categories" , categories);
    p.setLoop("list" , lm.getDataSet());
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.setVar("form_script" , f.getScript());
    p.print();
%>