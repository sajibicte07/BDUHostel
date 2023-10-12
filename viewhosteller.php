<?php
include("header.php");
if(isset($_GET['delid']))
{
	$sql = "DELETE FROM hosteller WHERE hostellerid='" . $_GET['delid'] . "'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>viewmessagebox('hosteller record deleted successfully...','viewhosteller.php');</script>";
	}
}
?>
	</div>
	<!-- //banner -->
	<!-- page details -->
	<div class="breadcrumb-agile">
		<ol class="breadcrumb m-0">
			<li class="breadcrumb-item">
				<a href="index.php">Home</a>
			</li>
		</ol>
	</div>
	<!-- //page details -->

	<!-- contact -->
	<section class="contact-wthree py-5" id="contact">
		<div >
			<div class="title text-center mb-sm-5 mb-4">
				<h3 class="title-w3 text-bl text-center font-weight-bold">View Hosteller</h3>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>
			<div class="row pt-xl-4">
				<div class="col-lg-12">
					<div class="contact-form-wthreelayouts">
					
<table id="datatable"  class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Hosteller type</th>	
			<th>ID</th>	
			<th>Name</th>
			<th>Department</th>	
			<th>Email ID </th>	
			<th>DOB</th>	
			<th>Father name</th>	
			<th>Mother name</th>		
			<th>Address</th>		
			<th>Contact Number</th>
			<th>Status</th>				
			<th>Action</th>			
		</tr>
	</thead>
	<tbody>
	<?php
	$sql ="SELECT * FROM  hosteller";
	$qsql = mysqli_query($con,$sql);
	while($rs = mysqli_fetch_array($qsql))
	{
		echo "<tr>
			<td>$rs[hostellertype]</td>	
			<td>$rs[place_belong]</td>	
			<td>$rs[name]</td>
			<td>$rs[cocurricular_activities]</td>		
			<td>$rs[emailid]</td>	
			<td>" . date("d-m-Y",strtotime($rs['dob'])) . "</td>
			<td>$rs[father_name]</td>
			<td>$rs[mother_name]</td>
			<td>$rs[address]</td>
			<td>$rs[contact_no]</td>
			<td>$rs[status]</td>		
			<td><a href='hosteller.php?editid=$rs[0]' class='btn btn-info' >Edit</a>  <a href='#' onclick='return confirmtodel(`$rs[0]`)' class='btn btn-danger' >Delete</a></td>		
		</tr>";
	}
	?>
	</tbody>
</table>					
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //contact -->

	<?php
	include("footer.php");
	?>
<script>
//12
/* Custom filtering function which will search data in column four between two values */
$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var min = parseInt( $('#min').val(), 10 );
        var min12 = parseInt( $('#min12').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );1
        var max12 = parseInt( $('#max12').val(), 10 );
        var age = parseFloat( data[9] ) || 0; // use data for the age column
        var age12 = parseFloat( data[12] ) || 0; // use data for the age column
 
        if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && age <= max ) ||
             ( min <= age   && isNaN( max ) ) ||
             ( min <= age   && age <= max )  ||
			 ( isNaN( min12 ) && isNaN( max12) ) ||
             ( isNaN( min12 ) && age <= max12 ) ||
             ( min <= age12   && isNaN( max12 ) ) ||
             ( min <= age12   && age <= max12 ) )
        {
            return true;
        }
        return false;
    }
);
 
$(document).ready(function() {
    var table = $('#datatable').DataTable();
     
    // Event listener to the two range filtering inputs to redraw on input
    $('#min, #max,#min12, #max12').keyup( function() {
        table.draw();
    } );
} );
</script>
<script>
function confirmtodel(delid)
{
	swal({
	  title: "Are you sure?",
	  text: "Once deleted, you will not be able to recover this record!",
	  icon: "warning",
	  buttons: true,
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		window.location="?delid="+delid;
	  } else {
		swal("Your Delete request terminated..!");
	  }
	});
	return false;
}
</script>