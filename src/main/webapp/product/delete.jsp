<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

ProductDao productDao = new ProductDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

DataSet product = productDao.find("id = " + id);
if(!product.next()) { m.jsError("No Data"); return; }

f.addElement("id", product.s("id"), "required:'Y'");

if(m.isPost() && f.validate()) {

    if(!"".equals(product.s("att_file_code"))) {
        m.delFile(f.uploadDir + "/" + product.s("att_file_code"));
    }
    productDao.item("status", -1);

    if(!productDao.update("id = " + id)) {
        m.jsAlert("Error occurred(delete)");
        return;
    }

    m.redirect("index_admin.jsp");
    return;
}

p.setLayout("shop");
p.setBody("category/delete");
p.setVar("info", product);
p.setVar("form_script", f.getScript());
p.setVar("page_title", "Product");
p.setVar("page_action", "delete");
p.setVar("userId", userId);
p.print();
%>