package busWeb;

import dbcon.FilePath;
import java.io.File;
import java.io.FileOutputStream;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.apache.commons.codec.binary.Base64;

@WebService(serviceName = "BusWeb")
public class BusWeb {

    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {

        String res = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from login where username='" + username + "'and password='" + password + "'");
            if (rs.next()) {
                res = rs.getString(1) + "#" + rs.getString(4);
            } else {
                res = "failed";
            }
        } catch (Exception e) {
            res = e.toString();
        }
        return res;
    }

    ////----2.Register----//////
    @WebMethod(operationName = "user_register")
    public String shopreg(@WebParam(name = "fname") String fname, @WebParam(name = "lname") String lname, @WebParam(name = "course") String course, @WebParam(name = "batch") String batch, @WebParam(name = "dob") String dob, @WebParam(name = "house") String house, @WebParam(name = "place") String place, @WebParam(name = "pincode") String pincode, @WebParam(name = "phone") String phone, @WebParam(name = "email") String email, @WebParam(name = "pname") String pname, @WebParam(name = "pcontact") String pcontact, @WebParam(name = "user") String user, @WebParam(name = "pass") String pass, @WebParam(name = "img") String img) {
        String res = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_hh_mm_ss");
            String filename = sdf.format(new Date()) + ".jpg";
            Statement st = con.createStatement();
            int a = 0;
            int b1 = 0;

            a = st.executeUpdate("INSERT INTO login(username, password, type) VALUES ('" + user + "','" + pass + "','user_pending')");

            b1 = st.executeUpdate("INSERT INTO user(first_name, last_name, course, batch, gender, dob, house_name, place, pincode, phone, email, parent_name, parent_phone, login_id, profile_picture) VALUES ('" + fname + "','" + lname + "','" + course + "','" + batch + "','" + dob + "','" + house + "','" + place + "','" + place + "','" + pincode + "','" + phone + "','" + email + "','" + pname + "','" + pcontact + "',(select max(login_id)from login),'" + filename + "')");
            if (b1 > 0) {

                FilePath fp = new FilePath();
                File f = new File(fp.dpPath() + "\\" + filename);
                if (!f.exists()) {
                    f.createNewFile();
                }

                FileOutputStream fout = new FileOutputStream(f);
                byte[] b;
                b = Base64.decodeBase64(img);

                fout.write(b);
                fout.flush();
                fout.close();

                res = "ok";
            } else {
                res = "failed";
            }

        } catch (Exception e) {
            System.out.println("Error" + e);
            res = e.toString();
        }
        return res;
    }

    /////------3.search stops----/////
    @WebMethod(operationName = "search_stops")
    public String searchsound(@WebParam(name = "stopdetail") String key_word) {
        String res = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from route where route_name like '" + "%" + key_word + "%" + "' or stop_details like '" + "%" + key_word + "%" + "' or start_place like '" + "%" + key_word + "%" + "' or ending_place like '" + "%" + key_word + "%" + "' ");
            if (rs1.next()) {
                rs1.beforeFirst();
                while (rs1.next()) {
                    res += rs1.getString(1) + "@" + rs1.getString(2) + "@" + rs1.getString(3) + "@" + rs1.getString(4) + "@" + rs1.getString(6) + "#";
                }
            } else {
                res = "nothing";
            }

        } catch (Exception e) {
            out.print("Error!" + e);
        }

        return res;
    }

    /////------4.apply pass----/////
    @WebMethod(operationName = "apply_pass")
    public String applyPass(@WebParam(name = "routeid") String route_id, @WebParam(name = "uid") String uid) {
        String res = "";
        String check = null;
        DbCon db = new DbCon();
        Connection con = db.connect();

        try {
            Statement st = con.createStatement();
            int a = 0;
            String user_id = null;

            ResultSet rs = st.executeQuery("select user_id from user where login_id = " + uid);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            ResultSet rs1 = st.executeQuery("select * from  new_passenger_request where user_id = " + user_id);
            if (rs1.next()) {
                res = "present";
            } else {
                a = st.executeUpdate("INSERT INTO `new_passenger_request`(`user_id`, `date`, `status`,`route_id`) VALUES ('" + user_id + "',curdate(),'pass requested & payment pending','" + route_id + "')");
            }

            if (a > 0) {
                res = "ok";
            } else {
                res = "failed";
            }

        } catch (Exception e) {
            System.out.println(e);
            res = e.toString();
        }

        return res;
    }

    /////------5.profile view----/////
    @WebMethod(operationName = "profile")
    public String profile(@WebParam(name = "uid") String logid) {
        String res = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from user where login_id=" + logid);
            while (rs1.next()) {
                res += rs1.getString("first_name") + "#" + rs1.getString("last_name") + "#" + rs1.getString("course") + "#" + rs1.getString("gender") + "#" + rs1.getString("batch") + "#" + rs1.getString("dob") + "#" + rs1.getString("house_name") + "@" + rs1.getString("place") + "#" + rs1.getString("pincode") + "#" + rs1.getString("phone") + "#" + rs1.getString("email") + "#" + rs1.getString("parent_name") + "#" + rs1.getString("parent_phone") + "#" + rs1.getString("profile_picture");

            }
        } catch (Exception e) {
            out.print("Error!" + e);
            res = e.toString();
        }

        return res;
    }

    /////------6.find routes----/////
    @WebMethod(operationName = "find_stops")
    public String findRoutes() {
        String res = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("SELECT * FROM route ORDER BY route_name ASC");
            while (rs1.next()) {
                res += rs1.getString(1) + "@" + rs1.getString(2) + "#";

            }
        } catch (Exception e) {
            out.print("Error!" + e);
        }

        return res;
    }

    /////------7.feedback----/////
    @WebMethod(operationName = "feedback")
    public String feedback(@WebParam(name = "feedback") String feedback, @WebParam(name = "uid") String uid) {
        String res = "";
        String user_id = null;
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select user_id from user where login_id = " + uid);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            int a = 0;
            a = st.executeUpdate("INSERT INTO feedback(`user_id`, `description`, `date`,`status`) VALUES ('" + user_id + "','" + feedback + "',curdate(),'sent')");
            if (a > 0) {
                res = "ok";
            } else {
                res = "failed";
            }

        } catch (Exception e) {
            out.println(e);
            res = e.toString();
        }

        return res;
    }

    /////---8.my pass details-------/////
    @WebMethod(operationName = "mypass_status")
    public String pass(@WebParam(name = "uid") String logid) {
        String res = "";
        String user_id = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st1 = con.createStatement();

            ResultSet rs = st1.executeQuery("select user_id from user where login_id = " + logid);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            ResultSet rs1 = st1.executeQuery("SELECT * FROM new_passenger_request INNER JOIN USER USING (user_id) INNER JOIN route USING (route_id) WHERE user.user_id=" + user_id);
            while (rs1.next()) {
                res += rs1.getString("request_id") + "#" + rs1.getString("first_name") + "#" + rs1.getString("last_name") + "#" + rs1.getString("date") + "#" + rs1.getString("route_name") + "#" + rs1.getString("stop_details") + "#" + rs1.getString("status") + "#";

            }
        } catch (Exception e) {
            out.print("Error!" + e);
            res = e.toString();
        }

        return res;
    }

    /////------9.payment----/////
    @WebMethod(operationName = "payment")
    public String payment(@WebParam(name = "uid") String uid, @WebParam(name = "req_id") String req_id) {
        String res = "";
        String user_id = null;
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {

            int a = 0;
            int b = 0;
            int c = 0;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select user_id from user where login_id = " + uid);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            ResultSet rs1 = st.executeQuery("select * from renewal_request inner join pass using(pass_id) where pass.user_id = '" + user_id + "'");
            if (rs1.next()) {
                String p_id = rs1.getString("pass_id");

                a = st.executeUpdate("delete from renewal_request where pass_id = '" + p_id + "' ");

                b = st.executeUpdate("update pass set issue_adte = 'curdate()' and valid_till = 'DATE_ADD(CURDATE(),INTERVAL 6 MONTH)' where pass_id = '" + p_id + "' ");

                c = st.executeUpdate("update new_passenger_request set status = 'pass approved' where user_id = " + user_id);

                if (a > 0 && b > 0 && c > 0) {
                    res = "ok";
                } else {
                    res = "failed";
                }

            } else {

                a = st.executeUpdate("INSERT INTO pass (user_id,issue_adte,valid_till,request_id)VALUES('" + user_id + "',CURDATE(), DATE_ADD(CURDATE(),INTERVAL 6 MONTH),'" + req_id + "')");

                b = st.executeUpdate("INSERT INTO payment (user_id,pass_id,amount,status)values('" + user_id + "',(select max(pass_id)from pass),'1200','payment success')");

                c = st.executeUpdate("update new_passenger_request set status = 'pass approved' where user_id = " + user_id);

                if (a > 0 && b > 0 && c > 0) {
                    res = "ok";
                } else {
                    res = "failed";
                }
            }

        } catch (Exception e) {
            out.println(e);
            res = e.toString();
        }

        return res;
    }

    /////---9.view pass-------/////
    @WebMethod(operationName = "view_pass")
    public String view_pass(@WebParam(name = "uid") String logid) {
        String res = "";
        String r_status = null;
        String user_id = "";
        DbCon db = new DbCon();
        Connection con = db.connect();
        try {
            Statement st1 = con.createStatement();

            ResultSet rs = st1.executeQuery("select user_id from user where login_id = " + logid);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            ResultSet rs2 = st1.executeQuery("SELECT * FROM pass WHERE valid_till <= NOW() and user_id = '" + user_id + "' ");
            if (rs2.next()) {
                r_status = "renew";
            } else {
                r_status = "valid";
            }

            ResultSet rs1 = st1.executeQuery("SELECT * FROM pass  INNER JOIN USER USING (user_id) INNER JOIN new_passenger_request USING (user_id) INNER JOIN route USING (route_id) where user.user_id = '" + user_id + "' ");
            while (rs1.next()) {

                res += rs1.getString("first_name") + "#" + rs1.getString("last_name") + "#" + rs1.getString("gender") + "#" + rs1.getString("course") + "#" + rs1.getString("house_name") + "#" + rs1.getString("phone") + "#" + rs1.getString("route_name") + "#" + rs1.getString("stop_details") + "#" + rs1.getString("issue_adte") + "#" + rs1.getString("issue_adte") + "#" + rs1.getString("valid_till") + "#" + rs1.getString("profile_picture") + "#" + r_status + "#" + rs1.getString("pass_id");

            }
        } catch (Exception e) {
            out.print("Error!" + e);
            res = e.toString();
        }

        return res;
    }

   
    /////------4.Renewal ----/////
    @WebMethod(operationName = "renew")
    public String renew(@WebParam(name = "abc") String abc, @WebParam(name = "def") String def) {

        System.out.print("pass : " + abc);
        String res = "";
        String user_id = null;
        DbCon db = new DbCon();
        Connection con = db.connect();

        try {
            Statement st = con.createStatement();
            int a = 0;

            ResultSet rs = st.executeQuery("select * from user where login_id = " + def);
            if (rs.next()) {
                user_id = rs.getString("user_id");
            }

            a = st.executeUpdate("insert into renewal_request (pass_id,date,status) values (" + abc + ",curdate(),'requested')");

            a = st.executeUpdate("update new_passenger_request set status = 'renewal_requested & payment pending' where user_id = " + user_id + "  ");
             
            System.out.print("user_id : "+user_id);
            if (a > 0) {
                res = "ok";
            } else {
                res = "failed";
            }

        } catch (Exception e) {
            System.out.println(e);
            res = e.toString();
        }

        return res;
    }

}
