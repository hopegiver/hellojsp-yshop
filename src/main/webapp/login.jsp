<%@ page contentType="text/html;charset=UTF-8" %><%@ include file="init.jsp" %><%
UserDao userDao = new UserDao();

f.addElement("email",null,"required:'Y', option: 'email'");
f.addElement("password",null,"required:'Y'");

if(m.isPost() && f.validate()) {
    DataSet user = userDao.find("status = 1 and email = '" +f.get("email") + "'");
    if(!user.next()) {
        m.jsError("user can not find");
        return;
    } else {
        if(user.s("password").equals(aes.encrypt(f.get("password")))){
            auth.put("user_id" , user.s("id"));
            if(user.s("role").equals("admin"))
                auth.put("is_admin","1");
            else
                auth.put("is_admin","0");
                auth.save();
                m.redirect("index.jsp");
                return;
        } else {
            m.jsError("password not match");
            return;
        }
    }
}

p.setLayout("shop");
p.setBody("user/login");
p.setVar("form_script", f.getScript());
p.print();
%>