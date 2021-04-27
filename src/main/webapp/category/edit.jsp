<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

CategoryDao categoryDao = new CategoryDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet info = categoryDao.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("parent_id", info.s("parent_id"), null);
f.addElement("category_name", info.s("category_name"), "title:'category_name', required:'Y'");
f.addElement("description", info.s("description"), null);
f.addElement("sort", info.s("sort"), null);

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

DataSet parentCategories = categoryDao.find("status = 1");
DataSet treeCategories = categoryDao.getTreeSet(parentCategories);
p.setLayout("shop");
p.setBody("category/edit");
p.setLoop("list", treeCategories);
p.setVar("page_title", "Category");
p.setVar("page_action", "update");
p.setVar("userId", userId);
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();
%>