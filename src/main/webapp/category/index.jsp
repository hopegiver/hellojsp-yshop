<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step
CategoryDao categoryDao = new CategoryDao();

ListManager lm = new ListManager();
lm.setRequest(request);
lm.setTable("tb_category ");
lm.setFields("*");
lm.addWhere("status != -1");
lm.addWhere("parent_id = 0");
lm.setOrderBy("id ASC");

DataSet list = lm.getDataSet();
ListManager catlist = new ListManager();
catlist.setRequest(request);
catlist.setTable("tb_category t");
catlist.setListNum(5);
catlist.addWhere("status = 1");
catlist.addSearch("category_name, description", f.get("s_keyword"), "LIKE");

p.setLayout("shop");
p.setBody("category/index");
p.setLoop("list", list);
p.setLoop("categorylist" , catlist.getDataSet());
p.setVar("total_cnt", catlist.getTotalNum());
p.setVar("pagebar", catlist.getPaging());
p.setVar("page_title", "Category");
p.setVar("page_action", "List");
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>