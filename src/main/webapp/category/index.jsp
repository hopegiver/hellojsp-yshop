<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

ListManager catList = new ListManager();
catList.setRequest(request);
catList.setTable("tb_category t");
catList.setListNum(5);
catList.addWhere("status = 1");
catList.addSearch("category_name, description", f.get("s_keyword"), "LIKE");

p.setLayout("shop");
p.setBody("category/index");
p.setLoop("category_list" , catList.getDataSet());
p.setVar("total_cnt", catList.getTotalNum());
p.setVar("pagebar", catList.getPaging());
p.setVar("page_title", "Category");
p.setVar("page_action", "List");
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>