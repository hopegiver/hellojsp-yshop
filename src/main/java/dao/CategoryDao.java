package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

public class CategoryDao extends DataObject {
    public CategoryDao() {
        this.table = "tb_category";
    }

    public DataSet getTree(){
        DataSet categories = this.find("status = 1");
        while(categories.next()){
            categories.put("pid", categories.getInt("parent_id") == 0 ? "" : categories.getInt("parent_id"));
            categories.put("name", categories.get("category_name"));
        }
        return categories;
    }

}
