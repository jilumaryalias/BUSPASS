package controller;
 
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
public class AdminApproveController {

    @RequestMapping(value = "/admin/admin_approve/{id}/{table}/{table_id}/{table_attribute}/{action}/{redirect}")
    public String deleteSubject(@PathVariable String id, @PathVariable String table, @PathVariable String table_id, @PathVariable String table_attribute, @PathVariable String action, @PathVariable String redirect, RedirectAttributes ra) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String com = "update " + table + " set " + table_attribute + "='" + action + "' where " + table_id + " = '" + id + "' ";
        Query qry = session.createQuery(com);
        qry.executeUpdate();

        session.getTransaction().commit();

        return "redirect:/admin/"+redirect;
    }

}
