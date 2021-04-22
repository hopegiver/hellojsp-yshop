<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%

    //Step1
    BlogDao blogDao = new BlogDao();

//Step2
    int id = m.reqInt("id");
    if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
    ListManager data = new ListManager();
    data.setRequest(request);
    data.setTable(" tb_blog ");
    data.addWhere(" status = 1");
    data.addWhere(" id= " + id );
    data.setFields("*");
    DataSet blog = data.getDataSet();
    if(!blog.next()) { m.jsError("No Data"); return; }

//Step4
    f.addElement("subject", blog.s("subject"),  "required:'Y'");
    f.addElement("title", blog.s("content_title"), "required:'Y'");
    f.addElement("content", blog.s("content"), "required:true");
    f.addElement("att_file" , blog.s("att_file_name") , null);
//Step5
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
        blogDao.item("update_user",auth.get("user_id"));
        //blog.setDebug(out);
        if(!blogDao.update("id = " + id)) {
            m.jsAlert("Error occurred(update)");
            return;
        }

        m.redirect("blog_create.jsp");
        return;
    }

//Step6
    p.setLayout("shop");
    p.setBody("blog/blog_update");
    p.setVar("info", blog);
    p.setVar("pagetitle", "Blog");
    p.setVar("pageaction", "Update");
    p.setVar("userId", userId);
    p.setVar("form_script", f.getScript());
    p.print();

%>