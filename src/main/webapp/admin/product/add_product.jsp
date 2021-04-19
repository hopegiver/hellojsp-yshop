<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%
    //Step1
    CategoryDao category = new CategoryDao();
    ProductDao product = new ProductDao();
    //Step2
    f.addElement("title", null, "required:'Y'");
    f.addElement("explanation", null, "required:true");
    f.addElement("att_file", null, "required:'Y'");
    f.addElement("is_banner", null, "title:'sort'");
    f.addElement("categoryid" , null , "required: 'Y'" );
    f.addElement("price" , null , "required: 'Y'");

    //Step3
    if(m.isPost() && f.validate()){
        product.item("title", f.get("title"));
        product.item("explanation", f.get("explanation"));
        product.item("categoryid",f.get("categoryid"));
        product.item("price",f.get("price"));
        product.item("reg_date",m.time("yyyyMMddHHmmss"));
        product.item("reg_user",auth.get("user_id"));
        product.item("status","1");
        if(!f.get("is_banner").equals("")){
            product.item("is_banner","1");
        }
        File attFile = f.saveFile("att_file");
        if(attFile != null) {
            product.item("att_file_name", f.getFileName("att_file"));
            product.item("att_file_code", attFile.getName());
        }
        //product.item("",f.get(""));
        if(!product.insert()){
            m.jsError("occured(insert)");
            return;
        }
        m.redirect("add_product.jsp");
        return;
    }
    DataSet cat = category.find("status = 1 ");
    p.setLoop("cat" , cat);
    p.setLayout("shop");
    p.setBody("admin/product/add_product");
    p.setVar("form_script" , f.getScript());
    p.print();
%>