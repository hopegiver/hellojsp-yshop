<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

BlogDao blogDao = new BlogDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet blog = blogDao.find("id = " + id);
if(!blog.next()) { m.jsError("No Data"); return; }

f.addElement("id", blog.s("id"), "title:'ID', required:'Y'");

if(m.isPost() && f.validate()) {

    if(!"".equals(blog.s("att_file_code"))) {
        m.delFile(f.uploadDir + "/" + blog.s("att_file_code"));
    }
    blogDao.item("status", -1);
    if(!blogDao.update("id = " + id)) {
        m.jsAlert("Error occurred(delete)");
        return;
    }

    m.redirect("index_admin.jsp");
    return;
}
p.setLayout("shop");
p.setBody("category/delete");
p.setVar("info", blog);
p.setVar("form_script", f.getScript());
p.setVar("page_title", "Blog");
p.setVar("page_action", "Delete");
p.setVar("userId", userId);
p.print();
%>