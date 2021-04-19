<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    ListManager lm = new ListManager();
//    int id  = m.reqInt("id");
    f.addElement("searchkey" , null , null);
    lm.setRequest(request);
    lm.setTable("tb_stamp s ");
    lm.setOrderBy("s.stampid DESC");
    lm.setFields("s.*");
    lm.addSearch("s.stampname" , f.get("searchkey") , "LIKE");
    DataSet list = lm.getDataSet();
    p.setLayout("demo");
    p.setBody("demo/list");
    p.setLoop("list" , list);
    p.print();
%>
