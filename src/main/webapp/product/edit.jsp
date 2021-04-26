<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

ProductDao productDao = new ProductDao();
CategoryDao categoryDao = new CategoryDao();

int id = m.reqInt("id");
if(id == 0) { m.jsError("Primary Key is required"); return; }

ListManager data = new ListManager();
data.setRequest(request);
data.setTable("tb_category a JOIN tb_product b ON b.category_id = a.id");
data.addWhere("b.status = 1");
data.addWhere("b.id="+id);
data.setFields("a.*, b.*");
DataSet info = data.getDataSet();
if(!info.next()) { m.jsError("No Data"); return; }

f.addElement("price", info.s("price"), "title:'price'");
f.addElement("title", info.s("title"), "required:'Y'");
f.addElement("explanation", info.s("explanation"), "required:true");
f.addElement("isbanner", info.s("is_banner"), null);
f.addElement("att_file" , info.s("att_file_name") , null);
f.addElement("category" , info.s("category_name"),"required:'Y'");

if(m.isPost() && f.validate()) {

    productDao.item("title", f.get("title"));
    productDao.item("explanation", f.get("explanation"));
    if(!f.get("category").equals(info.s("category_id"))) {
        productDao.item("category_id",f.get("category"));
    }
    if(f.get("isbanner") != null) {
    productDao.item("is_banner", 1);
    } else {
        productDao.item("is_banner",0);
    }
    productDao.item("price", f.get("price"));
    File attFile = f.saveFile("att_file");
    if(attFile != null) {
        productDao.item("att_file_name", f.getFileName("att_file"));
        productDao.item("att_file_code", attFile.getName());
    }
    productDao.item("update_date",m.time("yyyyMMddHHmmss"));
    productDao.item("update_user",auth.get("user_id"));
    //blog.setDebug(out);
    if(!productDao.update("id = " + id)) {
        m.jsAlert("Error occurred(update)");
        return;
    }

    m.redirect("index_admin.jsp");
    return;
}

DataSet list = categoryDao.find("status != -1");


p.setVar("page_title", "Product");
p.setVar("page_action", "update");
p.setVar("userId", userId);
p.setLayout("shop");
p.setBody("product/edit");
p.setLoop("list", list);
p.setVar("info", info);
p.setVar("form_script", f.getScript());
p.print();

%>