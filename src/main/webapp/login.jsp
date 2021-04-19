<%@ page contentType="text/html;charset=UTF-8" %><%@include file="init.jsp"%><%
    UserDao user = new UserDao();
    String isAdmin = "0";
    if(is_admin != 0){
        isAdmin = "1";
    }
    f.addElement("email",null,"required:'Y', option: 'email'");
    f.addElement("password",null,"required:'Y'");
    if(m.isPost() && f.validate()){
//        DataSet uinfo = user.find("email='" +f.get("email") + "'");

        DataSet uinfo = user.find("status = '1' and email = '" +f.get("email") + "'");
        if(!uinfo.next()){
            m.jsError("user can not find");
            return;
        }
        else {
            if(uinfo.s("password").equals(aes.encrypt(f.get("password")))){
                auth.put("user_id" , uinfo.s("user_id"));
                if(uinfo.s("role").equals("admin")){
                    auth.put("is_admin","1");
                    auth.save();
                    m.redirect("admin_index.jsp");
                }
                else{
                    m.redirect("index.jsp");
                }
            }
            else{
                m.jsError("password not match");
            }
        }
    }
    p.setVar("isAdmin",isAdmin);
    p.setLayout("shop");
    p.setBody("user/login");
    p.print();
%>