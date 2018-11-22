package controller;

import java.util.List;
import model.Login;
import model.NewPassengerRequest;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminPassRenewal {

    @RequestMapping(value = "/admin/admin_view_new_pass_details")
    public String user_register_users(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From NewPassengerRequest";
        rs = session.createQuery(qry).list();
        model.addAttribute("new_requests", rs);
        tr.commit();

        return "admin_view_new_pass_requests";
    }

    @RequestMapping(value = "admin/admin_view_pass_renewals")
    public String admin_pass(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From RenewalRequest";
        rs = session.createQuery(qry).list();
        model.addAttribute("renewals", rs);

        tr.commit();

        return "admin_view_renewals";

    }
    
    

    @RequestMapping(value = "/admin/admin_view_current_pass_details")
    public String admin_pass1(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Pass";
        rs = session.createQuery(qry).list();
        model.addAttribute("passes", rs);

        tr.commit();

        return "admin_view_current_pass_details";

    }
    
      @RequestMapping(value = "/admin/admin_view_expire_passes")
    public String admin_pass12(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Pass where valid_till>=NOW()";
        rs = session.createQuery(qry).list();
        model.addAttribute("expire_passes", rs);

        tr.commit();

        return "admin_view_expire_pass_details";

    }
    
    
    
    

}
