<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

BlogDao blogDao = new BlogDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet blog = blogDao.find("id = " + id);
if(!blog.next()) { m.jsError("No Data"); return; }

f.addElement("subject", blog.s("subject"),  "required:'Y'");
f.addElement("title", blog.s("content_title"), "required:'Y'");
f.addElement("content", blog.s("content"), "required:'Y'");
f.addElement("att_file" , blog.s("att_file_name") , null);


if(m.isPost() && f.validate()) {

    blogDao.item("subject", f.get("subject"));
    blogDao.item("content", f.get("content"));
    blogDao.item("content_title", f.get("title"));
    File attFile = f.saveFile("att_file");
    if(attFile != null) {
        blogDao.item("att_file_name", f.getFileName("att_file"));
        blogDao.item("att_file_code", attFile.getName());
    }
    blogDao.item("update_date",m.time("yyyyMMddHHmmss"));
    blogDao.item("update_user",userId);
    if(!blogDao.update("id = " + id)) {
        m.jsAlert("Error occurred(update)");
        return;
    }
    m.redirect("index.jsp");
    return;
}


p.setLayout("shop");
p.setBody("blog/edit");
p.setVar("info", blog);
p.setVar("page_title", "Blog");
p.setVar("page_action", "Update");
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.print();
%>