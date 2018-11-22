


<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Fee Details (Payments)</h2><hr>



<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>Name(g)</th>
            <th>Course & <br> Batch</th>

            <th>Contact</th>
            <th>Amount</th>
            <th>payment status</th>
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${fees}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            <td>  <c:out value="${b.user.firstName}"/>  <c:out value="${b.user.lastName}"/>
                (<c:out value="${b.user.gender}"/> ) </td> 

            <td> <c:out value="${b.user.course}"/> <br> <c:out value="${b.user.batch}"/></td>


            <td>  <c:out value="${b.user.phone}"/>  <br>
                <c:out value="${b.user.email}"/>  </td>


            <td>  <c:out value="${b.amount}"/>  </td>
            <td>  <c:out value="${b.status}"/>  </td>
            <td>  -  </td>
            <!--            <td> <a class=" btn-link"  href="/bus/admin/admin_approve/$ }/Login/loginId/type/user_blocked/admin_view_users">Block</a> 
                            <br> <a class=" btn-link"  href="/bus/admin/admin_approve/$ }/Login/loginId/type/user/admin_view_users">Unblock</a></td>
            -->

        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


