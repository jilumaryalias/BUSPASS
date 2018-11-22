package controller;

import java.util.List;
import model.Bus;
import model.NewPassengerRequest;
import model.Route;
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
public class AdminBusController {

    @RequestMapping(value = "/admin/admin_view_bus_details")
    public String admin_view_routes(@ModelAttribute("SpringWeb") Route route, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Bus";
        rs = session.createQuery(qry).list();
        model.addAttribute("buses", rs);
        tr.commit();

        return "admin_view_bus_details";

    }

    @RequestMapping(value = "/admin/admin_add_bus_action")
    public String admin_add_route_action(@ModelAttribute("SpringWeb") Bus bus, ModelMap model) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        session.save(bus);
        tr.commit();
        return "redirect:/admin/admin_view_bus_details";

    }

    @RequestMapping(value = "/admin/admin_add_bus_details")
    public String admin_add_route(@ModelAttribute("SpringWeb") Route route, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Route";
        rs = session.createQuery(qry).list();
        model.addAttribute("routes", rs);
        tr.commit();

        return "admin_add_bus_details";

    }
   

   
}
