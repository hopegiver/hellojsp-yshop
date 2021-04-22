<%@ page contentType="text/html;charset=UTF-8" %><%@include file="init.jsp"%><%
ProductDao productDao = new ProductDao();
CategoryDao categoryDao = new CategoryDao();

f.addElement("keyword" , null , null);

DataSet banner = productDao.find("is_banner = 1");
DataSet products = productDao.find("status = 1","*","id DESC LIMIT 6 ");
DataSet categories = categoryDao.find("status = 1");
while(categories.next()){
    categories.put("pid", categories.getInt("parent_id") == 0 ? "" : categories.getInt("parent_id"));
    categories.put("name", categories.get("category_name"));
}
p.setLayout("shop");
if(isAdmin == 1)  p.setBody("admin/index");
else              p.setBody("user/index");
p.setLoop("categories" , categories);
p.setLoop("products" , products);
p.setLoop("banner", banner);
p.setVar("imgdir" , f.uploadDir);
p.print();
%>