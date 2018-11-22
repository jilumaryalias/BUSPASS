<%@include file="../header/admin_header.html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2> Add New Bus </h2> <hr>

<a class="btn-link" href="/bus/admin/admin_view_bus_details">Back</a>

<form action="admin_add_bus_action" method="post">
    
    <table align="center" class="table table-light" style="width:850px">

    <tr>
        <td>Register No</td>
        <td><input type="text" name="regNo" value="" class="form-control  btn-light" placeholder="Register No" /></td>
     
        <td>Driver Name</td>
        <td><input type="text" name="driver" value="" class="form-control  btn-light" placeholder="Driver name" /></td>
    </tr>
    <tr>
        <td>Phone</td>
        <td><input type="text" name="phone" value="" class="form-control  btn-light" placeholder="phone"/></td>
    
        <td>Model</td>
        <td><input type="text" name="model" value="" class="form-control  btn-light" placeholder="Model" /></td>
    </tr>
     <tr>
        <td>Year of Manufacturer</td>
        <td><input type="text" name="manufacturerYear" value="" class="form-control  btn-light" placeholder="Year of Manufacturer" /></td>
    
        <td>Number Of Seats</td>
        <td><input type="text" name="noOfSeats" value="" class="form-control  btn-light" placeholder="Total seats" /></td>
    </tr>
    
    <tr>
        <td>Route</td>
        <td> 
            <select name="route.routeId" class="form-control">
                         <c:forEach items="${routes}" var="b">
                             <option value="<c:out value="${b.routeId}"/>">  
                                 <c:out value="${b.routeName}"/> 
                             </option>
                             </c:forEach>
             </select>
                 </td>
     
                 
        <td align="right"></td>
        <td align="right">
            <input type="reset" class="btn btn-danger" />
            <input type="submit" class="btn btn-success" /></td>
    </tr>

</table>
</form>






<%@include file="../header/footer.html"%>



