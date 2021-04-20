<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../../init.jsp" %><%

//Step1
CategoryDao category = new CategoryDao();

//Step2
f.addElement("parent_id", null, "title:'parent_id'");
f.addElement("category_name", null, "title:'category_name', required:true");
f.addElement("description", null, "title:'description'");
f.addElement("sort", null, "title:'sort'");
//Step3
if(m.isPost() && f.validate()) {

	category.item("parent_id", f.get("parent_id"));
	
	category.item("category_name", f.get("category_name"));
	category.item("description", f.get("description"));
	category.item("reg_date", m.time("yyyyMMddHHmmss"));
	category.item("sort", f.get("sort"));
	category.item("status", 1);

	
	if(!category.insert()) {
		m.jsError(" occurred(insert)");
		return;
	}

	m.redirect("index.jsp");
	return;
}

ListManager lm = new ListManager();
//lm.setDebug(out);
lm.setRequest(request);
lm.setTable("tb_category a");
lm.setFields("a.*");
lm.addWhere("a.status != -1");
lm.addWhere("a.parent_id = 0");
lm.setOrderBy("a.category_id ASC");

DataSet list = lm.getDataSet();
// category list
	ListManager catlist = new ListManager();
	catlist.setRequest(request);
	catlist.setTable("tb_category t");
	catlist.setListNum(5);
	catlist.addWhere("status = 1");

//Step4
//p.setDebug(out);
String pagetitle = "Category"; 
String pageaction = "add"; 
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);		
p.setLayout("shop");
p.setBody("admin/category/create");
p.setLoop("list", list);
p.setVar("form_script", f.getScript());
p.setLoop("categorylist" , catlist.getDataSet());
p.setVar("total_cnt", catlist.getTotalNum());
p.setVar("pagebar", catlist.getPaging());
p.print();

%>