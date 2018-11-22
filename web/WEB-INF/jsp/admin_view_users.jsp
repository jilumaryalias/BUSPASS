


<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Users</h2><hr>

 

<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>#</th>
            
            <th>Course & <br> Batch</th>
             
            <th>Address</th>
            
            <th>Contact</th>
            
            <th>Parent <br> Details</th>
            <th>Status</th>
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${users}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            
             <td align="center" class="h5 text-uppercase">
                <img  src="${pageContext.request.contextPath}/temp_bus/img/dp/<c:out value="${b.profilePicture}"/>" 
                      style="border-radius: 50%;width: 130px;height: 130px;"> 

            <br><br> <c:out value="${b.firstName}"/> <c:out value="${b.lastName}"/> 
             <br> D O B :  <c:out value="${b.dob}"/></td> 
            
            
           

            <td> <c:out value="${b.course}"/> <br> <c:out value="${b.batch}"/></td>

            
            <td> <c:out value="${b.houseName}"/> <br> <c:out value="${b.place}"/> <br> <c:out value="${b.pincode}"/> </td>


            <td>  <c:out value="${b.phone}"/>   <br> <c:out value="${b.email}"/>  </td>
            <td>  <c:out value="${b.parentName}"/> <br> <c:out value="${b.parentPhone}"/>  </td> 
            <td>  <c:out value="${b.login.type}"/>  </td>
            
             <td> <a class=" btn-link"  href="/bus/admin/admin_approve/${b.login.loginId}/Login/loginId/type/user_blocked/admin_view_users">Block</a> 
                <br> <a class=" btn-link"  href="/bus/admin/admin_approve/${b.login.loginId}/Login/loginId/type/user/admin_view_users">Unblock</a></td>


        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


