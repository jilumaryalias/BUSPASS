


<%@include file="../header/admin_header.html"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Available Routes</h2> <hr>

<a class="primary-btn text-uppercase small"  href="/bus/admin/admin_add_route">Click here for ADD NEW ROUTE</a><hr>

<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>Route</th>
            <th>Start Place</th>
            <th>End Place</th>
            <th>Stop Details</th>
            <th>Details</th>
<!--       <th>-</th>-->
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${routes}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            <td>  <c:out value="${b.routeName}"/>  </td>
            <td>  <c:out value="${b.startPlace}"/>  </td>
            <td>  <c:out value="${b.endingPlace}"/>  </td>
            <td>  <c:out value="${b.stopDetails}"/>  </td>
            <td>  <c:out value="${b.otherDetails}"/>  </td>
<!--             <td><a href="/bus/admin/admin_delete/<c:out value="${b.routeId}"/>/Route/routeId/admin_view_routes"> X </a></td>-->
              <td><a href="/bus/admin/admin_update_route/<c:out value="${b.routeId}"/>"> update route </a></td>

        </tr>
    </c:forEach>

</table>

<%@include file="../header/footer.html"%>



