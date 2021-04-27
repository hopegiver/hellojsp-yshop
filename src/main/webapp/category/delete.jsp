<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%


CategoryDao categoryDao = new CategoryDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet category = categoryDao.find("id = " + id);
if(!category.next()) { m.jsError("No Data"); return; }

f.addElement("id", category.s("id"), "title:'ID', required:'Y'");

if(m.isPost() && f.validate()) {

	if(!"".equals(category.s("att_file_code"))) {
		m.delFile(f.uploadDir + "/" + category.s("att_file_code"));
	}
	categoryDao.item("status", -1);

	if(!categoryDao.update("id = " + id)) {
		m.jsAlert("Error occurred(delete)");
		return;
	}
	m.redirect("index.jsp");
	return;
}

p.setLayout("shop");
p.setBody("category/delete");
p.setVar("page_title", "Category");
p.setVar("page_action", "delete");
p.setVar("userId", userId);
p.setVar("info", category);
p.setVar("form_script", f.getScript());
p.print();
%>