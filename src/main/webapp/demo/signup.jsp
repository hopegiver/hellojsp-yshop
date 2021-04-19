<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="/init.jsp"%><%
    UserDao user = new UserDao();
    f.addElement("username" , null , "required : 'Y'");
    f.addElement("password",null,"required:'Y'");
    if(m.isPost() && f.validate()){
        user.item("username" , f.get("username"));
        user.item("password" , f.get("password"));
        if(!user.insert()){
            m.jsError("sign up failed");
            return;
        }
        else{
            userId = f.get("username");
            auth.put("user_id" , f.get("username"));
            auth.save();
            m.redirect("index.jsp");
            return;
        }
    }
    p.setBody("demo/login");
    p.print();
%>
