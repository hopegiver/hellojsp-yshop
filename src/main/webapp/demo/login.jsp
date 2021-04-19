<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="/init.jsp"%><%
    UserDao user = new UserDao();
    f.addElement("username" , null , "required:'Y'");
    f.addElement("password" , null , "required:'Y'");
    if(m.isPost() && f.validate()){
        DataSet uinfo = user.find("username = '" +f.get("username") + "'");
        if(!uinfo.next()){
            m.jsError("user can not find");
            return;
        }
        else{
            if(!uinfo.get("password").equals(f.get("password"))){
                m.jsError("password not match");
                return;
            }
            else {
                auth.put("user_id" , f.get("username"));
                auth.save();
                m.redirect("index.jsp");
                return;
            }
        }
    }
    p.setBody("demo/login");
    p.print();
%>

