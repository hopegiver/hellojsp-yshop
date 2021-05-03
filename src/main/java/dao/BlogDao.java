package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

import java.util.Locale;

public class BlogDao extends DataObject {

	public BlogDao() {
		this.table = "tb_blog";
	}

	public DataSet getBlogView(int id) {
		return this.query("Select a.* , b.* from " +
				"tb_blog a JOIN tb_user b ON a.reg_user = b.id  " +
				"where a.status = 1 AND a.id = '" + id +"'");
	}
}