<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

CategoryDao categoryDao = new CategoryDao();

f.addElement("keyword" , null , null);
f.addElement("parent_id", null, "title:'parent_id'");
f.addElement("category_name", null, "title:'category_name', required:true");
f.addElement("description", null, "title:'description'");
f.addElement("sort", null, "title:'sort'");

if(m.isPost() && f.validate()) {

	categoryDao.item("parent_id", f.get("parent_id"));
	categoryDao.item("category_name", f.get("category_name"));
	categoryDao.item("description", f.get("description"));
	categoryDao.item("reg_date", m.time("yyyyMMddHHmmss"));
	categoryDao.item("sort", f.get("sort"));
	categoryDao.item("status", 1);
	if(!categoryDao.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}
	m.redirect("index.jsp");
	return;
}

ListManager catlist = new ListManager();
catlist.setRequest(request);
catlist.setTable("tb_category t");
catlist.setListNum(5);
catlist.addWhere("status = 1");
catlist.addSearch("category_name, description", f.get("s_keyword"), "LIKE");

p.setLayout("shop");
p.setBody("category/add");
p.setVar("page_title", "Category");
p.setVar("page_action", "add");
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>