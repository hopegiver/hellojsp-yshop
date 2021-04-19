<%@ page contentType="text/html;charset=UTF-8" %><%@include file="init.jsp"%><%
    ProductDao product = new ProductDao();
    CategoryDao category = new CategoryDao();
    f.addElement("keyword" , null , null);
    Boolean isLoggedin = false;
    String isAdmin = "0";
    if(userId != null){
        isLoggedin = true;
    }
    if(is_admin != 0){
        isAdmin = "1";
    }
    DataSet banner = product.find("is_banner = '1'");
    DataSet product6 = product.find("status = '1'","*","product_id DESC LIMIT 6 ");
    DataSet categorylist = category.find("status = '1'");
    DataSet tree = new DataSet();
    for(int i = 0 ; i< categorylist.size() ; i++){
        HashMap<String, Object> cat = categorylist.get(i);
        if(cat.get("parent_id").toString().equals("0")){
            tree.addRow();
            tree.put("id", cat.get("category_id").toString());
            tree.put("pid", "");
            tree.put("name", cat.get("category_name").toString());
        }
        else{
            tree.addRow();
            tree.put("id", cat.get("category_id").toString());
            tree.put("pid", cat.get("parent_id").toString());
            tree.put("name", cat.get("category_name").toString());
        }
    }
    p.setVar("imgdir" , f.uploadDir);
    p.setLoop("cattree" , tree);
    p.setLoop("products" , product6);
    p.setLoop("banner", banner);
    p.setVar("is_logged" , isLoggedin);
    p.setVar("isAdmin",isAdmin);
    p.setLayout("shop");
    p.setBody("user/index");
    p.print();
%>