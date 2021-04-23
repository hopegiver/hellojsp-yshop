<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="../init.jsp" %><%

ProductDao productDao = new ProductDao();
CategoryDao categoryDao = new CategoryDao();

int id = m.reqInt("id");
DataSet categories = categoryDao.getTree();

if(id == 0){
    m.jsError("id is null");
    return;
}
DataSet product = productDao.getProduct(id);

if(!product.next()){
    m.jsError("product detail view failed");
    return;
}
p.setLayout("shop");
p.setBody("user/product_detail");
p.setLoop("categories", categories);
p.setVar("item", product);
p.print();
%>
