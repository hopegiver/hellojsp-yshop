<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    //Step1
    BlogDao blogDao = new BlogDao();

//Step2
    f.addElement("keyword" , null , null);
    f.addElement("subject", null, "required:'Y'");
    f.addElement("content", null, "required:true");
    f.addElement("att_file", null, "required:'Y'");
    f.addElement("title" , null , "required: 'Y'" );

//Step3
    if(m.isPost() && f.validate()){
        blogDao.item("subject", f.get("subject"));
        blogDao.item("content", f.get("content"));
        blogDao.item("content_title",f.get("title"));
        blogDao.item("reg_date",m.time("yyyyMMddHHmmss"));
        blogDao.item("reg_user",userId);
        blogDao.item("status","1");
        File attFile = f.saveFile("att_file");
        if(attFile != null) {
            blogDao.item("att_file_name", f.getFileName("att_file"));
            blogDao.item("att_file_code", attFile.getName());
        }
        if(!blogDao.insert()){
            m.jsError("occured(insert)");
            return;
        }
        m.redirect("blog_create.jsp");
        return;
    }

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_blog");
    lm.addWhere("status = 1");
    lm.setFields("*");
    lm.setListNum(5);
    lm.addSearch("subject, content_title , content", f.get("s_keyword"), "LIKE");
    DataSet blogs =lm.getDataSet();

    p.setLayout("shop");
    p.setBody("blog/blog_create");
    p.setLoop("list" , blogs);
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.setVar("form_script" , f.getScript());
    p.print();
%>