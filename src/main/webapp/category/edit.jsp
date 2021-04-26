<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

CategoryDao categoryDao = new CategoryDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet info = categoryDao.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("parent_id", info.s("parent_id"), "title:'parent_id'");
f.addElement("category_name", info.s("category_name"), "title:'category_name', required:true");
f.addElement("description", info.s("description"), "title:'description'");
f.addElement("sort", info.s("sort"), "title:'sort'");

if(m.isPost() && f.validate()) {

	categoryDao.item("parent_id", f.get("parent_id"));
	categoryDao.item("category_name", f.get("category_name"));
	categoryDao.item("description", f.get("description"));
	categoryDao.item("sort", f.get("sort"));

	if(!categoryDao.update("id = " + id)) {
		m.jsAlert("Error occurred(update)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

ListManager lm = new ListManager();
lm.setRequest(request);
lm.setTable("tb_category");
lm.setFields("*");
lm.addWhere("status != -1");
lm.addWhere("parent_id = 0");
lm.setOrderBy("id DESC");

DataSet list = lm.getDataSet();

p.setLayout("shop");
p.setBody("category/edit");
p.setVar("page_title", "Category");
p.setVar("page_action", "update");
p.setVar("userId", userId);
p.setVar("list", list);
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>