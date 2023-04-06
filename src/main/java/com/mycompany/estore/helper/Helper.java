
package com.mycompany.estore.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
    public static String get10Words(String text){
        String[] strs = text.split(" ");
        if (strs.length > 10) {
            String res = "";
            for (int i = 0; i < 10; i++) {
                res += strs[i]+" ";
            }
            return (res + "...");
        } else {
            return (text + "...");
        }
    }

public static Map<String,Long> getCounts(SessionFactory factrory){
    Session session = factrory.openSession();
    String q1 = "Select count(*) from User";
    String q2 = "Select count(*) from Product";
    Query query1 = session.createQuery(q1);
    Query query2 = session.createQuery(q2);
    long userCount = (long) query1.list().get(0);
    long productCount = (long) query2.list().get(0);
    Map<String, Long> map = new HashMap<>();
    map.put("userCount", userCount);
    map.put("productCount", productCount);
    session.close();
    return map;
}
}
