<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@include file="../init.jsp"%><%


BlogDao blogDao = new BlogDao();
CommentDao commentDao = new CommentDao();
CategoryDao categoryDao = new CategoryDao();
int id = m.reqInt("id");
if(id == 0) { m.jsError("id is null");return; }

f.addElement("comment", null, "required:'Y'");
if(m.isPost() && f.validate()) {
    commentDao.item("blog_id" , id);
    commentDao.item("comment" , f.get("comment"));
    commentDao.item("reg_date" , m.time("yyyy-MM-dd"));
    if(userId != null) {
        commentDao.item("reg_user" , userId);
    }
    if(!commentDao.insert()) {
        m.jsError("add comment error");
        return;
    }
    m.redirect("view.jsp?id=" + id);
    return;
}
DataSet categories = categoryDao.getTree();
DataSet blog = blogDao.getBlogView(id);
if(!blog.next()) {
    m.jsError("detail view failed");
    return;
}
DataSet comments = commentDao.find("blog_id = " + id);
p.setLayout("shop");
p.setBody("blog/view");
p.setLoop("category",categories);
p.setLoop("comments", comments);
p.setVar("info", blog);
p.print();
%>