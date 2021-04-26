package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

public class CommentDao extends DataObject {
    public CommentDao() {
        this.table = "tb_blog_comment";
    }

    public DataSet getComments(int id) {
        return  this.query("SELECT a.*, b.* FROM " +
                "tb_blog_comment a JOIN tb_blog b JOIN tb_user c ON b.id = a.blog_id and a.reg_user = c.id " +
                "WHERE b.blog_id = " + id );
    }
    public DataSet getTotalComments(String id){
        return  this.query("Select count(id) as total from tb_blog_comment where blog_id = '29'" );
    }
}
