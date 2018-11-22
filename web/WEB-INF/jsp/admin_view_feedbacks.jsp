


<%@include file="../header/admin_header.html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% int i = 1;%>

<h2>Feedbacks</h2><hr>

 

<table class="table table-striped w-auto">

    <thead>
        <tr>
            <th>#</th>
            <th># Student Name</th>
            <th>Feedback</th>
             
            
    </thead>

    <c:forEach items="${feedbacks}" var="b">
        <tr>
            <td>  <%=i++%> </td>
            <td align="center" class="h5">
                <img  src="${pageContext.request.contextPath}/temp_bus/img/dp/<c:out value="${b.user.profilePicture}"/>" 
                      style="border-radius: 50%;width: 130px;height: 130px;"> 

            <br><br> <c:out value="${b.user.firstName}"/> <c:out value="${b.user.lastName}"/>   </td> 
            
            
            <td > <c:out value="${b.description}"/> <br><br> <c:out value="${b.date}"/>
                <br><br><p class="text-danger" ><c:out value="${b.status}"/></p>  </td>
        </tr>
    </c:forEach>

</table>
<%@include file="../header/footer.html"%>


