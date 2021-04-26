<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%


CategoryDao category = new CategoryDao();


int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }


DataSet info = category.find("id = " + id);
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("id", info.s("id"), "title:'ID', required:true");

if(m.isPost() && f.validate()) {

	if(!"".equals(info.s("att_file_code"))) {
		m.delFile(f.uploadDir + "/" + info.s("att_file_code"));
	}
	category.item("status", -1);

	if(!category.update("id = " + id)) {
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
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>