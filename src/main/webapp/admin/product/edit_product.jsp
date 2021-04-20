<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../../init.jsp" %><%

    //Step1
    ProductDao product = new ProductDao();

//Step2
    int id = m.reqInt("id");
    if(id == 0) { m.jsError("Primary Key is required"); return; }

//Step3
    ListManager data = new ListManager();
    data.setRequest(request);
    data.setTable("tb_category a JOIN tb_product b ON b.categoryid = a.category_id");
    data.addWhere("b.status = 1");
    data.addWhere("product_id="+id);
    data.setFields("a.*, b.*");
   // DataSet info = product.find("product_id = " + id);
    DataSet info = data.getDataSet();
    if(!info.next()) { m.jsError("No Data"); return; }

//Step4
    f.addElement("price", info.s("price"), "title:'price'");
    f.addElement("title", info.s("title"), "required:'Y'");
    f.addElement("explanation", info.s("explanation"), "required:true");
    f.addElement("isbanner", info.s("is_banner"), null);
    f.addElement("att_file" , info.s("att_file_name") , null);
    f.addElement("category" , info.s("category_name"),"required:'Y'");
//Step5
    if(m.isPost() && f.validate()) {

        product.item("title", f.get("title"));
        product.item("explanation", f.get("explanation"));
        if(!f.get("category").equals(info.s("categoryid"))){
            product.item("categoryid",f.get("category"));
        }
        if(f.get("isbanner") != null){
            product.item("is_banner", 1);
        }
        else {
            product.item("is_banner",0);
        }
        product.item("price", f.get("price"));
        File attFile = f.saveFile("att_file");
        if(attFile != null) {
            product.item("att_file_name", f.getFileName("att_file"));
            product.item("att_file_code", attFile.getName());
        }
        product.item("update_date",m.time("yyyyMMddHHmmss"));
        product.item("update_user",auth.get("user_id"));
        //blog.setDebug(out);
        if(!product.update("product_id = " + id)) {
            m.jsAlert("Error occurred(update)");
            return;
        }

        m.redirect("add_product.jsp");
        return;
    }

    ListManager lm = new ListManager();
//lm.setDebug(out);
    lm.setRequest(request);
    lm.setTable("tb_category a");
    lm.setFields("a.*");
    lm.addWhere("a.status != -1");

    DataSet list = lm.getDataSet();

//Step6
    String pagetitle = "Product";
    String pageaction = "update";
    p.setVar("pagetitle", pagetitle);
    p.setVar("pageaction", pageaction);
    p.setVar("userId", userId);
    p.setLayout("shop");
    p.setBody("admin/product/update");
    p.setLoop("list", list);
    p.setVar("info", info);
    p.setVar("form_script", f.getScript());
    p.print();

%>