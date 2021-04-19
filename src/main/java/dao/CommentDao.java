package dao;

import hellojsp.db.DataObject;

public class CommentDao extends DataObject {
    public CommentDao() {
        this.table = "tb_blog_comment";
    }
}
