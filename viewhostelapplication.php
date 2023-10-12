<?php
include("header.php");
if(isset($_GET['delid']))
{
	$sql = "DELETE  FROM  hostel_application WHERE hostel_application_id='" . $_GET['delid'] . "'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>viewmessagebox('Hostel Application record deleted successfully...','viewhostelapplication.php');</script>";
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
	<section class="contact-wthree" id="contact">
		<div class="">
			<div class="row pt-xl-4">
				<div class="col-lg-12">
					<div class="contact-form-wthreelayouts">
				<h3 class="title-w3 text-bl text-center font-weight-bold">View Hostel Applications</h3>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
<table id="datatable"  class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>App No.</th>		
			<th>ID</th>		
			<th>Hosteller</th>		
			<th>Department</th>		
			<th>Session</th>		
			<th>Hostel Type</th>		
			<th>Room Type</th>		
			<th>Hostel Status</th>
<?php
if(isset($_SESSION['emp_id']))
{
?>
			<th>Action</th>			
<?php
}
?>
		</tr>
	</thead>
	<tbody>
	<?php
	$sql ="SELECT *,hostel_application.hostel_status as hostelstatus FROM `hostel_application` LEFT JOIN hosteller ON hostel_application.hostellerid=hosteller.hostellerid";
	$qsql = mysqli_query($con,$sql);
	while($rs = mysqli_fetch_array($qsql))
	{
		echo "<tr>
			<td>$rs[0]</td>		
			<td>$rs[place_belong]</td>				
			<td>$rs[name]</td>		
			<td>$rs[cocurricular_activities]</td>		
			<td>$rs[session]</td>	
			<td>$rs[hostel_type]</td>
			<td>$rs[room_type]</td>
			<td>$rs[hostel_status]";
			if ($rs['hostel_status'] == 'Approved') {
				echo "<br><a href='hostelapplicationstatus.php?hostel_application_id=$rs[0]' class='btn btn-warning'>View</a>";
				echo "<li><a href='hostelbookingblock.php'>Book Hostel</a></li>";
			} else {
				echo "<br>Application Pending</td>";
			}
			
			if (isset($_SESSION['emp_id'])) {
				echo "<td><a href='updatehostelapplication.php?editid=$rs[0]' class='btn btn-info'>Update</a>   
					  <a href='#' onclick='return confirmtodel(`$rs[0]`)' class='btn btn-primary'>Delete</a></td>";
			}
			
			echo "</tr>";
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
$(document).ready( function () {
    $('#datatable').DataTable();
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