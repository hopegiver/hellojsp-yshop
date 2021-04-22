<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
CategoryDao categoryDao = new CategoryDao();

//Step2
f.addElement("keyword" , null , null);
f.addElement("parent_id", null, "title:'parent_id'");
f.addElement("category_name", null, "title:'category_name', required:true");
f.addElement("description", null, "title:'description'");
f.addElement("sort", null, "title:'sort'");
//Step3
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

ListManager lm = new ListManager();
//lm.setDebug(out);
lm.setRequest(request);
lm.setTable("tb_category ");
lm.setFields("*");
lm.addWhere("status != -1");
lm.addWhere("parent_id = 0");
lm.setOrderBy("id ASC");

DataSet list = lm.getDataSet();
// category list
	ListManager catlist = new ListManager();
	catlist.setRequest(request);
	catlist.setTable("tb_category t");
	catlist.setListNum(5);
	catlist.addWhere("status = 1");
	catlist.addSearch("category_name, description", f.get("s_keyword"), "LIKE");

//Step4
//p.setDebug(out);
String pagetitle = "Category"; 
String pageaction = "add"; 

p.setLayout("shop");
p.setBody("category/category_create");
p.setLoop("list", list);
p.setLoop("categorylist" , catlist.getDataSet());
p.setVar("total_cnt", catlist.getTotalNum());
p.setVar("pagebar", catlist.getPaging());
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>