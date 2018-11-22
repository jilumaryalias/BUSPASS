


<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Current bus pass Details</h2><hr>



<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th>#</th>
             
            <th>Course & <br> Batch</th>
            <th>Address</th>
            
            <th> Valid </th>
            <th> Route </th>

           
            <th>-</th>
        </tr>
    </thead>

    <c:forEach items="${passes}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            
            
             <td align="center" class="h5">
                <img  src="${pageContext.request.contextPath}/temp_bus/img/dp/<c:out value="${b.user.profilePicture}"/>" 
                      style="border-radius: 50%;width: 130px;height: 130px;"> 

            <br><br> <c:out value="${b.user.firstName}"/> <c:out value="${b.user.lastName}"/> 
             (<c:out value="${b.user.gender}"/> )</td> 
            
 
            <td> <c:out value="${b.user.course}"/> <br> <c:out value="${b.user.batch}"/></td>

            <td> <c:out value="${b.user.houseName}"/> <br> <c:out value="${b.user.place}"/> <br>pin:<c:out value="${b.user.pincode}"/>  
                <c:out value="${b.user.phone}"/>  <br>
                <c:out value="${b.user.email}"/>  </td>
            
            <td> <h5><c:out value="${b.issueAdte}"/> <br>To<br> <c:out value="${b.validTill}"/></h5></td>
             
            <td> <c:out value="${b.newPassengerRequest.route.routeName}"/> <br><br>
                <p class="text-danger">
             
                 Stops : <c:out value="${b.newPassengerRequest.route.stopDetails}"/>
                </p>
             </td>
             
             
               <td> -  </td>
            
            
           
 
        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


