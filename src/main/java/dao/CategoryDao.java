package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

import java.util.HashMap;

public class CategoryDao extends DataObject {

    private HashMap<String, DataSet> subset = new HashMap<String, DataSet>();

    public CategoryDao() {
        this.table = "tb_category";
    }

    public DataSet getTree(){
        DataSet categories = this.find("status = 1 order by parent_id");
        while(categories.next()){
            categories.put("pid", categories.getInt("parent_id") == 0 ? "" : categories.getInt("parent_id"));
            categories.put("name", categories.get("category_name"));
        }
        return categories;
    }

    public DataSet getTreeSet(DataSet rs) {
        while(rs.next()) {
            String pcd = rs.s("parent_id");
            if(!"0".equals(pcd)) {
                if(!subset.containsKey(pcd)) subset.put(pcd, new DataSet());
                subset.get(pcd).addRow(rs.getRow());
            }
        }
        rs.first();
        DataSet ret = new DataSet();
        while(rs.next()) {
            if("0".equals(rs.s("parent_id"))) {
                ret.addRow(rs.getRow());
                ret.put("name_conv", rs.s("category_name"));
                addSub(rs.s("id"), ret, rs.s("category_nm"));
            }
        }
        ret.first();
        return ret;
    }

    private void addSub(String key, DataSet ret, String name) {
        if(subset.containsKey(key)) {
            DataSet sub = subset.get(key);
            sub.first();
            while(sub.next()) {
                ret.addRow(sub.getRow());
                String pathName = name + " > " + sub.s("category_name");
                ret.put("name_conv", pathName);
                addSub(sub.s("id"), ret, pathName);
            }
        }
    }

}
