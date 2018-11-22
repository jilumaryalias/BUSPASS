package model;
// Generated Oct 26, 2018 5:26:26 PM by Hibernate Tools 4.3.1



/**
 * Payment generated by hbm2java
 */
public class Payment  implements java.io.Serializable {


     private Integer paymentId;
     private Pass pass;
     private User user;
     private String amount;
     private String status;

    public Payment() {
    }

    public Payment(Pass pass, User user, String amount, String status) {
       this.pass = pass;
       this.user = user;
       this.amount = amount;
       this.status = status;
    }
   
    public Integer getPaymentId() {
        return this.paymentId;
    }
    
    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }
    public Pass getPass() {
        return this.pass;
    }
    
    public void setPass(Pass pass) {
        this.pass = pass;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getAmount() {
        return this.amount;
    }
    
    public void setAmount(String amount) {
        this.amount = amount;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


