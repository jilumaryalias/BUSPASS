<%@include file="../header/admin_header.html"%>

<h2> Add New Route </h2> <hr>

<a class="btn-link" href="/bus/admin/admin_view_routes">Back</a>

<form action="admin_add_route_action" method="post">
    
    <table align="center" class="table table-light" style="width:800px">

    <tr>
        <td style="width:50%;">Route Name<br>
         <input type="text" name="routeName" value="" class="form-control  btn-light" placeholder="Route name" /></td>
     
        <td>Details<br>
         <input type="text" name="otherDetails" value="" class="form-control  btn-light" placeholder="Details" /></td>
    </tr>
    <tr>
        <td>Start Place<br>
         <input type="text" name="startPlace" value="" class="form-control  btn-light" placeholder="Start Place" /></td>
    
        <td>Ending Place</br>
        <input type="text" name="endingPlace" value="" class="form-control  btn-light" placeholder="Ending Place"/></td>
    </tr>
   
    
    <tr>
        <td colspan="2">Enter the stops between starting and ending place <br>
            <textarea name="stopDetails" class="form-control"></textarea></td>
    </tr>
    
    
    <tr>
        <td align="right"></td>
        <td align="right">
            <input type="reset" class="btn btn-danger" />
            <input type="submit" class="btn btn-success" /></td>
    </tr>

</table>
</form>






<%@include file="../header/footer.html"%>



