<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="init.jsp"%><%

UserDao userDao = new UserDao();
f.addElement("name",null,"required:'Y'");
f.addElement("password",null,"required:'Y'");
f.addElement("email",null,"required:'Y',option:'email'");
if(m.isPost() && f.validate()) {
    userDao.item("name",f.get("name"));
    userDao.item("email", f.get("email"));
    userDao.item("status" , "1");
    userDao.item("role" , "user");
    String enc = aes.encrypt(f.get("password"));
    userDao.item("password" , enc);
    if(!userDao.insert()) {
        m.jsError("sign up error");
        return;
    }
    m.redirect("/login.jsp");
    return;
}
p.setVar("isAdmin",isAdmin);
p.setLayout("shop");
p.setBody("user/signup");
p.print();
%>
