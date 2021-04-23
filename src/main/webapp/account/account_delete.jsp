<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

UserDao userDao = new UserDao();
int id = m.reqInt("id");
if(id == 0) {
    m.jsError("Primary Key is required");
    return;
}

DataSet user = userDao.find("id = " + id);
if(!user.next()) {
    m.jsError("No Data");
    return;
}

f.addElement("id",user.s("id") , "required:true");

if(m.isPost() && f.validate()) {
    userDao.item("status" , "-1");
    if(!userDao.update("id = " + id)){
        m.jsAlert("user delete error");
        return;
    }
    m.redirect("/logout.jsp");
}
p.setLayout("shop");
p.setBody("account/delete");
p.setVar("form_script", f.getScript());
p.setVar("pagetitle" , "Account");
p.setVar("pageaction", "Delete");
p.print();
%>
