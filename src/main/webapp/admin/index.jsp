<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../init.jsp" %><%

//Step1
CategoryDao categoryDao = new CategoryDao();

//Step2
DataSet catInfo = categoryDao.find("status != -1 AND parent_id = 0", "*", "sort");

DataSet subCat = categoryDao.find("status != -1 AND parent_id != 0", "*", "sort");

while(subCat.next()) {
    subCat.put("reg_date", m.time("yyyy-MM-dd", subCat.s("reg_date")));
}

while(catInfo.next()) {
    catInfo.put("reg_date", m.time("yyyy-MM-dd", catInfo.s("reg_date")));
}

int id = m.reqInt("id");
int del = m.reqInt("del");

DataSet category = categoryDao.find("id = " + id);
if(id != 0) {
    if(del != 0){
        categoryDao.item("status", -1);
        categoryDao.update("id = " + id);
        m.redirect("index.jsp");
        return;
    }else{
        if(!category.next()) { m.jsError("No Data"); return; }
        f.addElement("parent_id", category.s("parent_id"), "title:'parent_id'");
        f.addElement("category_name", category.s("category_name"), "title:'category_name', required:true");
        f.addElement("description", category.s("description"), "title:'description'");
        f.addElement("sort", category.s("sort"), "title:'sort'");

        if(m.isPost() && f.validate()) {
            categoryDao.item("parent_id", f.get("parent_id"));
            categoryDao.item("category_name", f.get("category_name"));
            categoryDao.item("description", f.get("description"));
            categoryDao.item("sort", f.get("sort"));
            if(!categoryDao.update("id = " + id)) {
                m.jsAlert("Error occurred(update)");
                return;
            }
            m.redirect("index.jsp");
            return;
        }
        if(m.isPost() && f.validate()) {
            categoryDao.item("status", -1);
            if(!categoryDao.update("id = " + id)) {
                m.jsAlert("Error occurred(delete)");
                return;
            }
            m.redirect("index.jsp");
            return;
        }
    }
} else {
    f.addElement("parent_id", null, "title:'parent_id'");
    f.addElement("category_name", null, "title:'category_name', required:true");
    f.addElement("description", null, "title:'description'");
    f.addElement("sort", null, "title:'sort',  required:true");

    if(m.isPost() && f.validate()) {

        categoryDao.item("parent_id", f.get("parent_id"));
        categoryDao.item("category_name", f.get("category_name"));
        categoryDao.item("description", f.get("description"));
        categoryDao.item("reg_date", m.time("yyyyMMddHHmmss"));
        categoryDao.item("sort", f.get("sort"));
        categoryDao.item("status", 1);

            //blog.setDebug(out);
        if(!categoryDao.insert()) {
            m.jsError(" occurred(insert)");
            return;
        }

        m.redirect("index.jsp");
        return;
    }
}


//Step4
String pagetitle = "Category";
String pageaction = "";

//    p.setDebug(out);
p.setLayout("shop");
p.setBody("category/index");
p.setVar("id", id);
p.setLoop("list", catInfo);
p.setLoop("sublist", subCat);
p.setVar("info", category);
p.setLoop("parent", catInfo);
p.setVar("userId", userId);
p.setVar("form_script", f.getScript());
p.setVar("pagetitle", pagetitle);
p.setVar("pageaction", pageaction);
p.print();
%>