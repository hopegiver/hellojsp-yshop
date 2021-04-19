<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%
    UserDao user = new UserDao();
    f.addElement("name",null,"required:'Y'");
    f.addElement("password",null,"required:'Y'");
    f.addElement("email",null,"required:'Y',option:'email'");
    if(m.isPost() && f.validate()){
        user.item("name",f.get("name"));
        user.item("email", f.get("email"));
        user.item("status" , "1");
        user.item("role" , "user");
        String enc = aes.encrypt(f.get("password"));
        user.item("password" , enc);
        if(!user.insert()){
            m.jsError("sign up error");
        }
        else{
            m.redirect("login.jsp");
        }
    }
    p.setLayout("shop");
    p.setBody("user/signup");
    p.print();
%>
