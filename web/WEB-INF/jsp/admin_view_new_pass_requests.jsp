



<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>New Pass Requests</h2><hr>



<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>#</th>
            
            <th>Course & <br> Batch</th>
            <th>Contact</th>
            <th>Request Date</th>
            <th>Route</th>
            <th>Status</th>
 
            
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${new_requests}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            
            <td align="center" class="h5">
                <img  src="${pageContext.request.contextPath}/temp_bus/img/dp/<c:out value="${b.user.profilePicture}"/>" 
                      style="border-radius: 50%;width: 130px;height: 130px;"> 

            <br><br> <c:out value="${b.user.firstName}"/> <c:out value="${b.user.lastName}"/> 
             (<c:out value="${b.user.gender}"/> )</td> 
            
            

            <td> <c:out value="${b.user.course}"/> <br> <c:out value="${b.user.batch}"/></td>


            <td>  <c:out value="${b.user.phone}"/>  <br>
                <c:out value="${b.user.email}"/>  </td>


            <td>  <c:out value="${b.date}"/>  </td>
            
             <td> <c:out value="${b.route.routeName}"/> <br><br>
                <p class="text-danger">
             
                 Stops : <c:out value="${b.route.stopDetails}"/>
                </p>
             </td>
            
            <td>  <c:out value="${b.status}"/>  </td>
            
            <td>  <a href="/bus/admin/admin_approve/<c:out value="${b.requestId}"/>/NewPassengerRequest/request_id/status/Pass Approved & payment pending/admin_view_new_pass_details"> Approve Pass </a> 
                <br>  <a href="/bus/admin/admin_approve/<c:out value="${b.requestId}"/>/NewPassengerRequest/request_id/status/Pass Rejected/admin_view_new_pass_details"> Reject Pass </a></td>


        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


