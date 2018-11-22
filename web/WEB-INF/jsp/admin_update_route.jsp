


<%@include file="../header/admin_header.html"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 

<h2>Update Stop details</h2> <hr>

<table class="table table-striped w-auto">

    <thead>
        <tr>
            
            <th>Route</th>
            <th>Start Place</th>
            <th>End Place</th>
            <th>Stop Details</th>
            <th>Details</th>
 
        </tr>
    </thead>

    <c:forEach items="${routes}" var="b">
        <form method="post" action="/bus/admin/admin_update_route_action">
        <tr>
            
            <td>  <c:out value="${b.routeName}"/>  </td>
            <td>  <c:out value="${b.startPlace}"/>  </td>
            <td>  <c:out value="${b.endingPlace}"/>  </td>
            <td>  <c:out value="${b.stopDetails}"/>  </td>
            <td>  <c:out value="${b.otherDetails}"/>  </td>
            
        </tr>
        <tr >
        <input type="hidden" name="routeId" value="<c:out value="${b.routeId}"/> ">
            <td > <span class="h4 text-danger"> Update Stop Details </span><br><br>(Stops should be separated with any character) </td>
            <td colspan="3" ><textarea style="width: 100%" class="form-control" type="text" name="stopDetails" />${b.stopDetails}</textarea></td>
            <td><input type="submit" value="UPDATE" class="btn btn-primary" />   </td>
        </tr>
        
         <tr >
             <td  colspan="5"> &nbsp; </td>
               </tr>
        </form>
    </c:forEach>

</table>

<%@include file="../header/footer.html"%>



