<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

CategoryDao categoryDao = new CategoryDao();
ProductDao productDao = new ProductDao();


f.addElement("keyword" , null , null);
f.addElement("title", null, "required:'Y'");
f.addElement("explanation", null, "required:'Y'");
f.addElement("att_file", null, "required:'Y'");
f.addElement("is_banner", null, null);
f.addElement("category_id" , null , "required: 'Y'" );
f.addElement("price" , null , "required: 'Y'");


if(m.isPost() && f.validate()) {
    productDao.item("title", f.get("title"));
    productDao.item("explanation", f.get("explanation"));
    productDao.item("category_id",f.get("category_id"));
    productDao.item("price",f.get("price"));
    productDao.item("reg_date",m.time("yyyyMMddHHmmss"));
    productDao.item("reg_user",userId);
    productDao.item("status","1");
    if(!f.get("is_banner").equals("")){
        productDao.item("is_banner","1");
    }
    File attFile = f.saveFile("att_file");
    if(attFile != null) {
        productDao.item("att_file_name", f.getFileName("att_file"));
        productDao.item("att_file_code", attFile.getName());
    }
    if(!productDao.insert()) {
        m.jsError("occured(insert)");
        return;
    }
    m.redirect("index_admin.jsp");
    return;
}

DataSet categories = categoryDao.find("status = 1");

p.setLayout("shop");
p.setBody("product/add");
p.setLoop("cat" , categories);
p.setVar("form_script" , f.getScript());
p.print();
%>