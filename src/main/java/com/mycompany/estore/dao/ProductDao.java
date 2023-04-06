
package com.mycompany.estore.dao;

import com.mycompany.estore.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

public boolean saveProduct(Product product){
boolean flag = false;
    try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(product);
        tx.commit();
        session.close();
         flag = true;
    } catch (Exception e) {
        e.printStackTrace();
        flag = false;
    }
    return flag;
}


public List<Product> getAllProducts(){
    Session session = this.factory.openSession();
    Query query = session.createQuery("from Product");
    List<Product> list = query.list();
    return list;
}

public List<Product> getProductsByCategoryId(int cid){
    Session session = this.factory.openSession();
    Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
    query.setParameter("id", cid);
    List<Product> list = query.list();
    return list;
}

}

