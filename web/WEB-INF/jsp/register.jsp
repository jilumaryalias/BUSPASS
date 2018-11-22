<%@include file="../header/home_header.html"%>
  
<h2>Register Here!</h2> <br>
<form method="post" action="/bus/user_register_process">
    
    <table    class="table table-striped w-auto table-sm">
        <tr>
            <td>First Name : </td>
            <td><input type="text" required name="firstName" class="input-group-text"></td>
            <td>Last Name : </td>
            <td><input type="text" required name="lastName" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>Course : </td>
            <td><input type="text" required name="course" class="input-group-text"></td>
            <td>Batch : </td>
            <td><input type="text" required name="batch" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>Gender : </td>
            <td><input type="text" required name="gender" class="input-group-text"></td>
            <td>Date of birth : </td>
            <td><input type="text" required name="dob" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>House : </td>
            <td><input type="text" required name="houseName" class="input-group-text"></td>
            <td>Place : </td>
            <td><input type="text" required name="place" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>Pin code : </td>
            <td><input type="text" required name="pincode" class="input-group-text"></td>
            <td>Phone : </td>
            <td><input type="text" required name="phone" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>Email : </td>
            <td><input type="text" required name="email" class="input-group-text"></td>
            <td>Parent Name : </td>
            <td><input type="text" required name="parentName" class="input-group-text"></td>
        </tr>
        
         <tr>
            <td>Parent Phone : </td>
            <td><input type="text" required name="parentPhone" class="input-group-text"></td>
            <td> </td>
            <td> </td>
        </tr>
        
         <tr>
            <td>Set username : </td>
            <td><input type="text" required name="username" class="input-group-text"></td>
            <td>Set password : </td>
            <td><input type="text" required name="password" class="input-group-text"></td>
        </tr>
        
        
        
         
         <tr>
             <td></td><td></td><td></td>
             <td><input type="submit" class="btn btn-primary" >
                 <input type="reset" class="btn btn-danger" >
             </td>
        </tr>
        
    </table>
</form>




    


    
<%@include file="../header/footer.html"%>