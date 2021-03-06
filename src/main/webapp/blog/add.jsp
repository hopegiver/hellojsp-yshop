<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

BlogDao blogDao = new BlogDao();

f.addElement("keyword" , null , null);
f.addElement("subject", null, "required:'Y'");
f.addElement("content", null, "required:'Y'");
f.addElement("att_file", null, "required:'Y'");
f.addElement("title" , null , "required: 'Y'" );

if(m.isPost() && f.validate()) {

    blogDao.item("subject", f.get("subject"));
    blogDao.item("content", f.get("content"));
    blogDao.item("content_title",f.get("title"));
    blogDao.item("reg_date",m.time("yyyy-MM-dd"));
//        blogDao.item("reg_time" , m.time("HH : mm"));
    blogDao.item("reg_user",userId);
    blogDao.item("status","1");

    File attFile = f.saveFile("att_file");
    if(attFile != null) {
        blogDao.item("att_file_name", f.getFileName("att_file"));
        blogDao.item("att_file_code", attFile.getName());
    }

    if(!blogDao.insert()) {
        m.jsError("occured(insert)");
        return;
    }

    m.redirect("index_admin.jsp");
    return;
}


p.setLayout("shop");
p.setBody("blog/add");
p.setVar("form_script" , f.getScript());
p.print();
%>