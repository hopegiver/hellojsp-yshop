<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%


CategoryDao categoryDao = new CategoryDao();


int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }


DataSet category = categoryDao.find("id = " + id);

if(!category.next()) { m.jsError("No Data"); return; }

category.put("category_name", m.htt(category.s("category_name")));

category.put("reg_date", m.time("yyyy-MM-dd HH:mm", category.s("reg_date")));

DataSet parent_info = categoryDao.find("id = " + category.s("parent_id"));

if(!parent_info.next()) {
category.put("parent_name", "None");
} else {
category.put("parent_name", parent_info.s("category_name"));
}

p.setLayout("shop");
p.setBody("category/view");
p.setVar("page_title","Category" );
p.setVar("page_action", "read");
p.setVar("userId", userId);
p.setVar("info", category);
p.print();
%>