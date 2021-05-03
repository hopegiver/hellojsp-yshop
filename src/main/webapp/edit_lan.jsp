<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%
  language = m.request("type");
    if(language == null){
        m.jsError("change language error");
        return;
    }
    if("ko".equals(language)){
        msg.setLocale(Locale.KOREAN);
        msg.reload();
    } else if("en".equals(language)) {
        msg.setLocale(Locale.ENGLISH);
        msg.reload();
    }
    m.redirect("/index.jsp");
%>
