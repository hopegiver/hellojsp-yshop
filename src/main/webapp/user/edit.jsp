<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

UserDao userDao = new UserDao();
DataSet user = userDao.find("id = " + userId);
if(!user.next()) {
    m.jsError("user not found ");
    return;
}
f.addElement("username", user.s("name") , null);
f.addElement("email" , user.s("email"), null);
f.addElement("password" , aes.decrypt(user.s("password")), null);
if(m.isPost() && f.validate()) {
    userDao.item("name", f.get("username"));
    userDao.item("email" , f.get("email"));
    userDao.item("password", aes.encrypt(f.get("password")));
    if(!userDao.update("id = " + userId)) {
        m.jsError("account update error");
        return;
    }
    m.redirect("edit.jsp");
}
p.setLayout("shop");
p.setBody("user/edit");
p.setVar("form_script", f.getScript());
p.setVar("user", user);
p.setVar("page_title", "Account");
p.print();
%>