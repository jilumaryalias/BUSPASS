
<%@ include file="../header/home_header.html" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>

<h2 align="right">Login Here!</h2><br>
<form method="post" action="/bus/login_process">
    <table align="right">
        <tr>
             <td rowspan="5">
               
                <img src="${pageContext.request.contextPath}/temp_bus/img/login.jpg" height="180px"  width="180px" alt="" title="" />  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>


            <td>Username :  <br>
                <input type="text" name="username" class="input-group-text"></td>
           
        </tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>
            <td>Password : <br> 
                <input type="password" name="password" class="input-group-text"></td>


        </tr>

        <tr><td>&nbsp;</td><td>&nbsp;</td></tr>

        <tr>


            <td align="center"><input type="submit" class="btn btn-primary" >
                <input type="reset" class="btn btn-danger" ></td>


        </tr>

    </table>
</form>



<%@include file="../header/footer.html"%>