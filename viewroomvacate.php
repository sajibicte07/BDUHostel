<?php
include("header.php");
if(isset($_GET['vacida']))
{
	$sql = "UPDATE vacate_room SET refund_status='Refunded'  WHERE vacate_room_id ='" . $_GET['vacida'] ."'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		
		echo "<script>viewmessagebox('Money Refunded successfully...','viewroomvacate.php');</script>";
	}
}
?>
	</div>
	<!-- contact -->
	<section class="contact-wthree py-5" id="contact">
		<div class="container py-xl-5 py-lg-3">
			<div class="title text-center mb-sm-5 mb-4">
				<h3 class="title-w3 text-bl text-center font-weight-bold">View Room Vacate Requests</h3>
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
			<th>Room No.</th>		
			<th>Start date</th>		
			<th>End date</th>		
			<th>Total Paid Amount during Admission</th>		
			<th>Vacating Date</th>		
			<th>Total Number of days Remaining</th>		
			<th>Total Refundable Amount</th>
			<th>Reason for Leaving Room</th>
			<th>Refund Status</th>
		</tr>
	</thead>
	<tbody>
	<?php
	$sql ="SELECT vacate_room.*,room.room_no FROM `vacate_room` LEFT JOIN admission ON vacate_room.admission_id=admission.admission_id LEFT JOIN room on room.room_id=admission.room_id";
	if(isset($_SESSION['hostellerid']))
	{
	$sql = $sql . " WHERE admission.hostellerid='" . $_SESSION['hostellerid'] . "'";
	}
	$qsql = mysqli_query($con,$sql);
	while($rs = mysqli_fetch_array($qsql))
	{
		echo "<tr>
			<td>$rs[room_no]</td>				
			<td>" . date("d-m-Y",strtotime($rs['from_date'])) . "</td>		
			<td>" . date("d-m-Y",strtotime($rs['enddate'])) . "</td>		
			<td>$rs[paid_amt]</td>			
			<td>" . date("d-m-Y",strtotime($rs['vacate_date'])) . "</td>
			<td>$rs[tot_num_days]</td>			
			<td>$rs[tot_refundable_amt]</td>			
			<td>$rs[vacate_reason]</td>			
			<td style='width: 100px;'>" .$rs['refund_status'];
		if(isset($_SESSION['emp_id']))
		{
			if($rs['refund_status'] == "Pending")
			{
				echo "<a href='viewroomvacate.php?vacida=$rs[0]' class='btn btn-info' onclick='return confirmrefund($rs[0])'>Refund Money</a>";
			}
		}
		echo "</td></tr>";
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
function confirmrefund(vacida)
{
	swal({
	  title: "Are you sure?",
	  text: "Are you refunding hosteller money?",
	  icon: "warning",
	  buttons: true,
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		window.location="?vacida="+vacida;
	  } else {
		swal("Your request terminated..!");
	  }
	});
	return false;
}
</script>
<script>
function confirmverification(verificationid)
{
	swal({
	  title: "Are you sure?",
	  text: "Are you sure want to approve this billing receipt?",
	  icon: "warning",
	  buttons: true,
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		window.location="?verificationid="+verificationid;
	  } else {
		swal("Request terminated..!");
	  }
	});
	return false;
}
</script>