package controller;

import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import model.Login;
import model.Route;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminRouteController {

    @RequestMapping(value = "/admin/admin_view_routes")
    public String admin_view_routes(@ModelAttribute("SpringWeb") Route route, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Route";
        rs = session.createQuery(qry).list();
        model.addAttribute("routes", rs);
        tr.commit();

        return "admin_view_routes";

    }

    @RequestMapping(value = "/admin/admin_add_route_action")
    public String admin_add_route_action(@ModelAttribute("SpringWeb") Route route, ModelMap model) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        session.save(route);

        tr.commit();

        return "redirect:/admin/admin_view_routes";

    }

    @RequestMapping(value = "/admin/admin_add_route")
    public String admin_add_route(@ModelAttribute("SpringWeb") Route route, ModelMap model) {

        return "admin_add_route";

    }

    @RequestMapping(value = "/admin/admin_update_route/{id}")
    public String admin_update_route(@PathVariable int id, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Route where routeId = " + id;
        rs = session.createQuery(qry).list();
        model.addAttribute("routes", rs);
        tr.commit();

        return "admin_update_route";
    }
    
    

    @RequestMapping(value = "admin/admin_update_route_action")
    public String admin_update_route_action(@ModelAttribute("SpringWeb") Route route, ModelMap model,Route rt) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
    
        String com = "update Route set stopDetails = '"+rt.getStopDetails()+"' where routeId="+rt.getRouteId();
        Query qry = session.createQuery(com);
        qry.executeUpdate();

        tr.commit();

        return "redirect:/admin/admin_view_routes";

    }

}
