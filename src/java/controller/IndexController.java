package controller;

import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import model.Login;
import model.Route;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @RequestMapping(value = "/")
    public String login() {
        return "index";

    }

    @RequestMapping(value = "/login")
    public String login1() {
        return "login";

    }

    @RequestMapping(value = "/admin/admin")
    public String admin() {
        return "adin_home";

    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(ModelMap map) {
        map.addAttribute("heading", "Register");
        return "register";
    }

    @RequestMapping(value = "/user_register_process")
    public String user_register_action(@ModelAttribute("SpringWeb") User user, Login login, ModelMap model) {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        login.setType("user");
        session.save(login);
        user.setLogin(login);
        session.save(user);
        tr.commit();

        return "login";

    }
    
    
   
    
    
    @RequestMapping(value = "/admin/admin_search_bus_routes")
    public String user_register_action1(@ModelAttribute("SpringWeb") User user, Route route, ModelMap model) {

       
        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        
        
        String r = route.getRouteName();
        String qry = "From Bus where route.routeName like '"+"%"+r+"%"+"' or route.stopDetails like '"+"%"+r+"%"+"' or route.startPlace like '"+"%"+r+"%"+"' or route.endingPlace like '"+"%"+r+"%"+"' or regNo like '"+"%"+r+"%"+"' ";
        rs = session.createQuery(qry).list();
        model.addAttribute("buses", rs);
        tr.commit();

        return "admin_view_bus_details";

    }

 
    
    
    

    @RequestMapping(value = "/login_process", method = RequestMethod.POST)
    public String login_action(@ModelAttribute("SpringWeb") Login login, ModelMap model) {

        List<javax.xml.registry.infomodel.User> login_list;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From Login l where l.username ='" + login.getUsername() + "' and l.password = '" + login.getPassword() + "' ";
        login_list = session.createQuery(qry).list();

        Iterator it = login_list.iterator();
        String type = null;
        if (it.hasNext()) {
            Object o = (Object) it.next();
            Login log = (Login) o;
            type = log.getType();

            if (type.equalsIgnoreCase("admin")) {
                type = "admin_home";
            } else if (type.equalsIgnoreCase("user")) {
                type = "user_home";
            }
        } else {
            model.addAttribute("msg", "Invalid!");
            // model.addAttribute("msg",login.getUsername()+""+login.getPassword());
            model.addAttribute("link", "login");
            type = "alert_box";
        }

        session.getTransaction().commit();
        return type;

    }

    /////Redirected methods///////
    @RequestMapping(value = "/user")
    public String user() {
        return "user_home";

    }

    @RequestMapping(value = "/admin")
    public String admin1() {
        return "admin_home";
    }

}
