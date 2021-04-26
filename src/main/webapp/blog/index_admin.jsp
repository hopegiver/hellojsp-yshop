<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

    BlogDao blogDao = new BlogDao();

    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_blog");
    lm.addWhere("status = 1");
    lm.setFields("*");
    lm.setListNum(5);
    lm.addSearch("subject, content_title , content", f.get("s_keyword"), "LIKE");
    DataSet blogs =lm.getDataSet();

    p.setLayout("shop");
    p.setBody("blog/index");
    p.setLoop("list" , blogs);
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.print();
%>