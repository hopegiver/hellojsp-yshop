<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    ProductDao product = new ProductDao();
    CategoryDao category = new CategoryDao();
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
    int id = m.reqInt("id");
    if(id == 0){
        m.jsError("id is null");
        return;
    }
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_category a JOIN tb_product b ON b.categoryid = a.category_id");
    lm.addWhere("b.status = 1");
    lm.addWhere("product_id="+id);
    lm.setFields("a.*, b.*");
    DataSet info = lm.getDataSet();
            //product.find("product_id="+id);
    if(!info.next()){
        m.jsError("product detail view failed");
        return;
    }
    p.setVar("item",info);
    p.setLoop("cattree" , tree);
    p.setLayout("shop");
    p.setBody("user/product_detail");
    p.print();
%>
