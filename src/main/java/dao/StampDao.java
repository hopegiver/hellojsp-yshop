package dao;

import hellojsp.db.DataObject;
import hellojsp.db.ListManager;
import hellojsp.util.DataSet;

public class StampDao extends DataObject {
    public StampDao() {this.table = "tb_stamp";}
    public DataSet getStamplListM (String userid){
        DataSet list = new DataSet();
        try{
           list = query("SELECT * FROM tb_stamp WHERE ownerid = '" + userid + "'");
        } catch(Exception e){
                System.out.println(e);
        }
        return list;
    }
}
