package controller;

import model.Login;
import model.NewPassengerRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminDeleteController {
 
     @RequestMapping(value = "/admin/admin_delete/{id}/{table}/{table_id}/{action}")
    public String deleteSubject(@PathVariable String id,@PathVariable String table,@PathVariable String action,@PathVariable String table_id, RedirectAttributes ra, Model model, NewPassengerRequest npr, Login lg) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String com = "delete from " + table + " where " + table_id+ " = '" + id + "'";
        Query qry = session.createQuery(com);
        qry.executeUpdate();

        session.getTransaction().commit();
        
        return "redirect:/admin/"+action;
    }

}
