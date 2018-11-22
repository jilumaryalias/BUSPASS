 
package controller;

import java.util.List;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

 @Controller
public class AdminFeeController {
    
    
    @RequestMapping(value = "/admin/admin_view_fees")
    public String admin_fee(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Payment";

        rs = session.createQuery(qry).list();
        model.addAttribute("fees", rs);
        tr.commit();

        return "admin_view_fee";

    }
    
    
    
    
}
