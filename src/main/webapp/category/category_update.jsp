<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
CategoryDao categoryDao = new CategoryDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = categoryDao.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

//Step4
f.addElement("parent_id", info.s("parent_id"), "title:'parent_id'");
f.addElement("category_name", info.s("category_name"), "title:'category_name', required:true");
f.addElement("description", info.s("description"), "title:'description'");
f.addElement("sort", info.s("sort"), "title:'sort'");
//Step5
if(m.isPost() && f.validate()) {

	categoryDao.item("parent_id", f.get("parent_id"));
	categoryDao.item("category_name", f.get("category_name"));
	categoryDao.item("description", f.get("description"));
	categoryDao.item("sort", f.get("sort"));
	//blog.setDebug(out);
	if(!categoryDao.update("id = " + id)) {
		m.jsAlert("Error occurred(update)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

ListManager lm = new ListManager();
//lm.setDebug(out);
lm.setRequest(request);
lm.setTable("tb_category");
lm.setFields("*");
lm.addWhere("status != -1");
lm.addWhere("parent_id = 0");
lm.setOrderBy("id DESC");

DataSet list = lm.getDataSet();

//Step6
String pagetitle = "Category"; 
String pageaction = "update";

p.setLayout("shop");
p.setBody("category/category_update");
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);
p.setVar("list", list);
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>