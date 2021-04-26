package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

public class CartDao extends DataObject {
    public CartDao() {
        this.table = "tb_product_bag";
    }
    public DataSet getTotalCost(String userId) {
        return  this.query("" +
                "SELECT sum(price) as total FROM " +
                "tb_product_bag a JOIN tb_product b ON a.product_id = b.id " +
                "WHERE a.status = '1' and a.reg_user = '" + userId + "'");
    }
}
