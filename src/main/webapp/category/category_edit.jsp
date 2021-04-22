<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
CategoryDao categoryDao = new CategoryDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet category = categoryDao.find("id = " + id);

if(!category.next()) { m.jsError("No Data"); return; }


//Step4

category.put("category_name", m.htt(category.s("category_name")));

category.put("reg_date", m.time("yyyy-MM-dd HH:mm", category.s("reg_date")));

DataSet parent_info = categoryDao.find("id = " + category.s("parent_id"));

if(!parent_info.next()) {
category.put("parent_name", "None");
}else{
category.put("parent_name", parent_info.s("category_name"));
}



//Step5
String pagetitle = "Category"; 
String pageaction = "read";

p.setLayout("shop");
p.setBody("category/category_read");
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);
p.setVar("info", category);
p.print();

%>