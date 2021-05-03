<%@ page contentType="text/html;charset=UTF-8" %><%@ include file="init.jsp" %><%

    language = m.request("lan");
    if(language == null){
        m.jsError("change language error");
        return;
    }
    m.setCookie("language" , language);
    m.redirect("/index.jsp");
%>
