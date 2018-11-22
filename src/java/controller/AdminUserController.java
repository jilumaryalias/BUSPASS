/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class AdminUserController {
    
    
    @RequestMapping(value = "/admin/admin_view_users")
    public String user_register_users(@ModelAttribute("SpringWeb") User user, ModelMap model) {

        List rs;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();

        String qry = "From User";

        rs = session.createQuery(qry).list();
        model.addAttribute("users", rs);
        tr.commit();

        return "admin_view_users";

    }
    
}
