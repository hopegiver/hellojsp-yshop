<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="init.jsp" %><%

//Step1
CategoryDao categoryDao = new CategoryDao();
ProductDao productDao = new ProductDao();

//Step2
f.addElement("keyword" , null, null);
f.addElement("title", null, "required:'Y'");
f.addElement("explanation", null, "required:true");
f.addElement("att_file", null, "required:'Y'");
f.addElement("category_id" , null, "required: 'Y'" );
f.addElement("price" , null, "required: 'Y'");

//Step3
if(m.isPost() && f.validate()){
    productDao.item("title", f.get("title"));
    productDao.item("explanation", f.get("explanation"));
    productDao.item("categoryid", f.get("category_id"));
    productDao.item("price", f.get("price"));
    productDao.item("reg_date", m.time("yyyyMMddHHmmss"));
    productDao.item("reg_user", auth.get("user_id"));
    productDao.item("status", "1");
    productDao.item("is_banner", 1);
    File attFile = f.saveFile("att_file");
    if(attFile != null) {
        productDao.item("att_file_name", f.getFileName("att_file"));
        productDao.item("att_file_code", attFile.getName());
    }
    if(!productDao.insert()){
        m.jsError("occured(insert)");
        return;
    }
    m.redirect("banner_create.jsp");
    return;
}

ListManager lm = new ListManager();
lm.setRequest(request);
lm.setTable("tb_category a JOIN tb_product b ON b.categoryid = a.id");
lm.addWhere("b.status = 1");
lm.addWhere("b.is_banner = '1'");
lm.setFields("a.* , b.*");
lm.setListNum(5);
lm.addSearch("title, explanation" , f.get("s_keyword") , "LIKE");
DataSet banners =lm.getDataSet();
DataSet cat = categoryDao.find("status = 1");

p.setLayout("shop");
p.setBody("banner/banner_create");
p.setLoop("cat" , cat);
p.setLoop("list" , banners);
p.setVar("total_cnt", lm.getTotalNum());
p.setVar("pagebar", lm.getPaging());
p.setVar("form_script" , f.getScript());
p.print();
%>