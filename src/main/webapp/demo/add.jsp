<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
  StampDao stamp = new StampDao();
  f.addElement("ownername" , null , "required: 'Y'");
  f.addElement("stampname" , null , "required:'Y'");
  f.addElement("level" , "1","");
  f.addElement("explanation" , null ,"");
  f.addElement("stampimg" , null , "");
  f.addElement("usingplace" , null , "");
  if(m.isPost() && f.validate()){
      stamp.item("ownerid" , auth.get("user_id"));
      stamp.item("ownername",f.get("ownername"));
      stamp.item("stampname",f.get("stampname"));
      stamp.item("level" , f.get("level"));
      stamp.item("explanation" , f.get("explanation"));
      stamp.item("stampimg",f.get("stampimg"));
      stamp.item("usingplace" , f.get("usingplace"));
      if(!stamp.insert()){
          m.jsError("insert is failed");
          return;
      }
      else {
          m.redirect("list.jsp");
      }
  }
    p.setLayout("demo");
    p.setBody("demo/add");
    p.print();
%>
