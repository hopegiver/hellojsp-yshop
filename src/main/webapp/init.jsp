<%@ page import="java.util.*,java.io.*,hellojsp.db.*,hellojsp.util.*,dao.*" %><%

Hello m = new Hello(request, response, out);

Form f = new Form();
f.setName("form1");
f.setRequest(request);

Page p = new Page();
p.setWriter(out);
p.setVar("m", m);
Message msg = new Message();
p.setVar("msg", msg);

Json j = new Json();
j.setWriter(out);

String language = null;
String userId = null;
int isAdmin = 0;
Boolean isLoggedin = false;
String secretId = "abcdefghijklmn12";
AES aes = new AES(secretId);
Auth auth = new Auth(request, response);
if(auth.validate()) {
	userId = auth.get("user_id");
	isAdmin = auth.getInt("is_admin");
	isLoggedin = true;
	//language = auth.get("language");
}
language = m.getCookie("language");
if("ko".equals(language)){
	msg.setLocale(Locale.KOREAN);
	msg.reload();
} else if("en".equals(language)) {
	msg.setLocale(Locale.ENGLISH);
	msg.reload();
}

p.setVar("is_logged" , isLoggedin);
p.setVar("isAdmin",isAdmin);
%>