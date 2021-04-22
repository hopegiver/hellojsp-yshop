<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    ProductDao productDao = new ProductDao();
    CategoryDao categoryDao = new CategoryDao();

    int id = m.reqInt("id");
    DataSet categories = categoryDao.find("status = 1");
    while(categories.next()){
        categories.put("pid", categories.getInt("parent_id") == 0 ? "" : categories.getInt("parent_id"));
        categories.put("name", categories.get("category_name"));
    }

    if(id == 0){
        m.jsError("id is null");
        return;
    }
    DataSet product = productDao.getProduct(id);

    if(!product.next()){
        m.jsError("product detail view failed");
        return;
    }
    p.setVar("item",product);
    p.setLoop("categories" , categories);
    p.setLayout("shop");
    p.setBody("user/product_detail");
    p.print();
%>
