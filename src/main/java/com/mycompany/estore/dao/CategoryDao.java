
package com.mycompany.estore.dao;

import com.mycompany.estore.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    public int saveCategory(Category cat){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;

    }
    public List<Category> getCategories(){
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }

    public Category getCategoryById(int catId){
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, catId);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
