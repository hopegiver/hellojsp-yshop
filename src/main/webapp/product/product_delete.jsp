<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

//Step1
ProductDao productDao = new ProductDao();

//Step2
int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
DataSet product = productDao.find("id = " + id);
if(!product.next()) { m.jsError("No Data"); return; }

f.addElement("id", product.s("id"), "title:'ID', required:true");

//Step5
if(m.isPost() && f.validate()) {

    if(!"".equals(product.s("att_file_code"))) {
        m.delFile(f.uploadDir + "/" + product.s("att_file_code"));
    }
    productDao.item("status", -1);

    //blog.setDebug(out);
    if(!productDao.update("id = " + id)) {
        m.jsAlert("Error occurred(delete)");
        return;
    }

    m.redirect("product_create.jsp");
    return;
}
//Step6
String pagetitle = "Product";
String pageaction = "delete";
p.setLayout("shop");
p.setBody("category/category_delete");
p.setVar("info", product);
p.setVar("form_script", f.getScript());
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.setVar("userId", userId);
p.print();
%>