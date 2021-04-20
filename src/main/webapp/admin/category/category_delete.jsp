<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../../init.jsp" %><%

//Step1
CategoryDao category = new CategoryDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet info = category.find("category_id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("id", info.s("category_id"), "title:'ID', required:true");

//Step5
if(m.isPost() && f.validate()) {

	if(!"".equals(info.s("att_file_code"))) {
		m.delFile(f.uploadDir + "/" + info.s("att_file_code"));
	}
	category.item("status", -1);

	//blog.setDebug(out);
	if(!category.update("category_id = " + id)) {
		m.jsAlert("Error occurred(delete)");
		return;
	}

	m.redirect("create.jsp");
	return;
}

//Step6
String pagetitle = "Category"; 
String pageaction = "delete"; 
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);
p.setLayout("shop");
p.setBody("admin/category/delete");
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>