<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%


CategoryDao categoryDao = new CategoryDao();

ListManager catlist = new ListManager();
catlist.setRequest(request);
catlist.setTable("tb_category t");
catlist.setListNum(5);
catlist.addWhere("status = 1");
catlist.addSearch("category_name, description", f.get("s_keyword"), "LIKE");

p.setLayout("shop");
p.setBody("category/index");
p.setLoop("category_list" , catlist.getDataSet());
p.setVar("total_cnt", catlist.getTotalNum());
p.setVar("pagebar", catlist.getPaging());
p.setVar("page_title", "Category");
p.setVar("page_action", "List");
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>