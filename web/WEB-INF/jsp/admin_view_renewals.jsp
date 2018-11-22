<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Renewal Pass Requests</h2><hr>



<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
             <th>#</th>
            <th>Name(g)</th>
            <th>Course & <br> Batch</th>
            <th>Request Date</th>
            <th>Requested Route</th>
            <th>Previous Duration</th>
            <th>Contact</th>
            
            
            <th>Status</th>
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${renewals}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            
             <td>
                <img  src="${pageContext.request.contextPath}/temp_bus/img/dp/<c:out value="${b.pass.user.profilePicture}"/>" 
                      style="border-radius: 50%;width: 130px;height: 130px;"> </td>

            </td>
            
            
            <td>  <c:out value="${b.pass.user.firstName}"/>  <c:out value="${b.pass.user.lastName}"/>
                (<c:out value="${b.pass.user.gender}"/> ) </td> 

            <td> <c:out value="${b.pass.user.course}"/> <br> <c:out value="${b.pass.user.batch}"/></td>
           <td>  <c:out value="${b.date}"/>  </td>
           
            <td> <c:out value="${b.pass.newPassengerRequest.route.routeName}"/> <br><br>
                <p class="text-danger">
             
                 Stops : <c:out value="${b.pass.newPassengerRequest.route.stopDetails}"/>
                </p>
             </td>
             
             <td class="text-danger">  <c:out value="${b.pass.issueAdte}"/>  <br>TO<br>
                <c:out value="${b.pass.validTill}"/>  </td>
           

            <td>  <c:out value="${b.pass.user.phone}"/>  <br>
                <c:out value="${b.pass.user.email}"/>  </td>


           
            <td>  <br><br> <c:out value="${b.pass.newPassengerRequest.status}"/>  </td>
            
            <td>  <a href="/bus/admin/admin_approve/<c:out value="${b.pass.user.userId}"/>/NewPassengerRequest/user.userId/status/Pass Approved & payment pending/admin_view_pass_renewals"> Approve Pass </a> 
              
                
                <br>  <a href="/bus/admin/admin_approve/<c:out value="${b.renewalRequest}"/>/RenewalRequest/renewalRequest/status/Pass not approved/admin_view_pass_renewals"> Reject Pass </a></td>


        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


