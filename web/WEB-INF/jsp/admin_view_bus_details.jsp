
<%@include file="../header/admin_header.html"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Available Buses</h2> 

<form method="post" action="/bus/admin/admin_search_bus_routes">
    <table class="table" >
        <tr>
            <td><input placeholder="Search Route,stops,bus no.." type="text" name="routeName" value="" class="form-control" /></td>
            <td ><input type="submit"  class="primary-btn text-uppercase small" />
                <a class="btn btn-link"  href="/bus/admin/admin_view_bus_details">Refresh</a> 
                <a class="primary-btn text-uppercase small" href="/bus/admin/admin_add_bus_details">Click here for ADD NEW BUS</a> 
        <input class="btn-link" type="button" onclick="printDiv('printableArea')" value="print bus report" /></td>
        </tr>
    </table>



</form>


<div id="printableArea">
<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>Register No</th>
            <th>Driver</th>
            <th>Phone</th>
            <th>Model</th>
            <th>Total <br> Seats</th>
            <th>Route</th>
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${buses}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            <td class="h6 text-danger">  <c:out value="${b.regNo}"/>  </td>
            <td>  <c:out value="${b.driver}"/>  </td>
            <td>  <c:out value="${b.phone}"/>  </td>
            <td>  <c:out value="${b.model}"/> <br>
                <c:out value="${b.manufacturerYear}"/>  </td>
            <td>  <c:out value="${b.noOfSeats}"/>  </td>
           
            <td class="h6 text-danger"> <c:out value="${b.route.routeName}"/> <br><br>
                <p class="text-danger">
             
                 Stops : <c:out value="${b.route.stopDetails}"/>
                </p>
             </td>
            
            
            
            
            <td><a href="/bus/admin/admin_delete/<c:out value="${b.busId}"/>/Bus/busId/admin_view_bus_details"> X </a></td>

        </tr>
    </c:forEach>

</table>

</div>

<%@include file="../header/footer.html"%>


      






<script>
function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>

