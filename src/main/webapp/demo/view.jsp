<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    StampDao stamp = new StampDao();
    int id = m.reqInt("id");
    DataSet info = stamp.find("stampid = "+id);
    if(!info.next()){
        m.jsError("id not found");
        return;
    }
    f.addElement("stampid" , info.s("stampid"),null );
    f.addElement("stampname" , info.s("stampname") , null);
    f.addElement("ownername" , info.s("ownername") , null);
    f.addElement("explanation" , info.s("explanation") , null);
    f.addElement("level" , info.s("level") , null);
    f.addElement("usingplace" , info.s("usingplace") , null);
    f.addElement("stampimg", info.s("stampimg") , null);
    String ownerid = info.s("ownerid");
    if(m.isPost() && f.validate()){
        stamp.item("stampname",f.get("stampname"));
        stamp.item("ownername",f.get("ownername"));
        stamp.item("explanation",f.get("explanation"));
        stamp.item("level",f.get("level"));
        stamp.item("usingplace",f.get("usingplace"));
        stamp.item("stampimg",f.get("stampimg"));
        stamp.update("stampid = " + f.get("stampid"));
    }
    p.setLayout("demo");
    p.setBody("demo/view");
    p.setVar("item",info);
    p.setVar("form_script", f.getScript());
    p.setVar("ownerid", ownerid);
    p.setVar("authid", auth.get("user_id"));
    p.print();
%>
