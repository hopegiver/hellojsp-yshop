<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
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
    p.setLoop("cattree" , tree);
    ListManager lm = new ListManager();
    lm.setRequest(request);
    lm.setTable("tb_product t");
    lm.setFields("t.*");
    lm.addWhere("status = 1");
    lm.setListNum(6);
    p.setLoop("list" , lm.getDataSet());
    p.setLayout("shop");
    p.setBody("user/product_list");
    p.setVar("total_cnt", lm.getTotalNum());
    p.setVar("pagebar", lm.getPaging());
    p.print();
%>