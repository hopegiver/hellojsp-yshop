<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    UserDao user = new UserDao();
    DataSet userinfo = user.find("username = '" + auth.get("user_id") + "'");
    if(!userinfo.next()){
        m.jsError("user info not found");
        return;
    }
    f.addElement("username" , userinfo.s("username") , null);
    f.addElement("password" , userinfo.s("password"),null);
    if(m.isPost() && f.validate()){
        user.item("username",f.get("username"));
        user.item("password" , f.get("password"));
        if(!user.update("id = " + userinfo.get("id"))){
            m.jsError("update error");
        }
        else {
            auth.put("user_id",f.get("username"));
            auth.save();
            m.redirect("mypagelist.jsp");
        }
    }
    StampDao stamp = new StampDao();
    DataSet list = new DataSet();
    DataSet info = stamp.getStamplListM(auth.get("user_id"));
//    DataSet info = stamp.find("ownerid = 'root'");
    p.setLayout("demo");
    p.setBody("demo/mypage");
    p.setLoop("list" , info);
    p.setVar("form_script", f.getScript());
    p.setVar("user" , userinfo);
    p.print();
%>
