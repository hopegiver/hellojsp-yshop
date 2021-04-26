<%@ page contentType="text/html; charset=utf-8" %><%@ include file="init.jsp" %><%

//
CategoryDao categoryDao = new CategoryDao();
ProductDao productDao = new ProductDao();

ListManager lm = new ListManager();
lm.setRequest(request);
lm.setTable("tb_category a JOIN tb_product b ON b.category_id = a.id");
lm.addWhere("b.status = 1");
lm.setFields("a.* , b.*");
lm.setListNum(5);
lm.addSearch("title, explanation", f.get("s_keyword"), "LIKE");
DataSet products =lm.getDataSet();
DataSet cat = categoryDao.find("status = 1");

p.setLayout("shop");
p.setBody("product/index_admin");
p.setLoop("cat" , cat);
p.setLoop("list" , products);
p.setVar("total_cnt", lm.getTotalNum());
p.setVar("pagebar", lm.getPaging());
p.print();
%>