package dao;

import hellojsp.db.DataObject;
import hellojsp.util.DataSet;

public class ProductDao extends DataObject {
    public ProductDao() {
        this.table = "tb_product";
    }

    public DataSet getProduct(int id) {
        return  this.query("SELECT a.*, b.* FROM " +
                "tb_category a JOIN tb_product b ON b.categoryid = a.id " +
                "WHERE b.status = 1 AND b.id = " + id );
    }

    public DataSet getProducts(int limit) {
        return  this.query("SELECT a.*, b.* FROM " +
                "tb_category a JOIN tb_product b ON b.categoryid = a.id " +
                "WHERE b.status = 1 ORDER BY b.id DESC LIMIT " + limit);
    }
}