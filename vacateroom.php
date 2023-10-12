<?php
include("header.php");
if(!isset($_SESSION['hostellerid']))
{
	echo "<script>window.location='hostellerlogin.php';</script>";
}
if(isset($_POST['submit']))
{
	$sql = "UPDATE admission SET end_date='" . $_POST['end_date'] . "'  WHERE admission_id='$_POST[admission_id]'";
	$qsql = mysqli_query($con,$sql);
	$sqlins = "INSERT INTO vacate_room(admission_id, from_date, enddate, paid_amt, vacate_date, tot_num_days, tot_refundable_amt,refund_status,vacate_reason) VALUES ('$_POST[admission_id]', '$_POST[from_date]', '$_POST[enddate]', '$_POST[paid_amt]', '$_POST[end_date]', '$_POST[tot_num_days]', '$_POST[tot_refundable_amt]','Pending','$_POST[vacate_reason]')";
	$qsql = mysqli_query($con,$sqlins);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Room Vacating request sent successfully..');</script>";
		echo "<script>window.location='viewroomvacate.php';</script>";
	}
}
if(isset($_GET['delid']))
{
	$sql = "DELETE  FROM mess_bill WHERE mess_bill_id='" . $_GET['delid'] . "'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Record deleted successfully..');</script>";
		echo "<script>window.location='viewmessbill.php';</script>";
	}
}
function getWorkingDays($startDate,$endDate){
  $startDate = strtotime($startDate);
  $endDate = strtotime($endDate);

  if($startDate <= $endDate){
    $datediff = $endDate - $startDate;
    return floor($datediff / (60 * 60 * 24));
  }
  return false;
}
?>
	<!-- what we do -->
	<div class="serives-agile py-5" id="what">
		<div class="container py-xl-5 py-lg-3">
			<div class="row welcome-bottom">
				<div class="col-lg-12 col-sm-12">
					<div class="welcome-grid bg-white py-5 px-4">
						<h4 class="mt-4 mb-3 text-dark">VACATE ROOM</h4>
						<p>
<table id="datatable"  class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Room Type</th>		
			<th>Room No.</th>		
			<th>Start date</th>		
			<th>End date</th>		
				
			<th style='text-align: right;'>Fees Paid</th>		
		</tr>
	</thead>
	<tbody>
	<?php
	$sql ="SELECT * FROM admission LEFT JOIN hosteller ON admission.hostellerid=hosteller.hostellerid LEFT JOIN room ON room.room_id=admission.room_id LEFT JOIN fees_structure ON fees_structure.fee_str_id=room.fee_str_id LEFT JOIN blocks on blocks.block_id=fees_structure.block_id WHERE admission.status='Active' AND ('$dt' BETWEEN admission.start_date AND admission.end_date) AND  hosteller.hostellerid='" . $_SESSION['hostellerid'] . "'  Order by admission_id DESC limit 0,1";
	$qsql = mysqli_query($con,$sql);
	while($rs = mysqli_fetch_array($qsql))
	{		
		$sqlbilling = "SELECT * FROM billing WHERE admission_id='" . $rs['admission_id'] . "'";
		$qsqlbilling = mysqli_query($con,$sqlbilling);
		echo mysqli_error($con);
		$rsbilling = mysqli_fetch_array($qsqlbilling);
		echo "<tr>
			<td>" . $rs['block_name'] . " - " . $rs['room_type'] . "</td>		
			<td>$rs[room_no]</td>			
			<td>" . date("d-m-Y",strtotime($rs['start_date'])) . "</td>		
			<td>" . date("d-m-Y",strtotime($rs['end_date'])) . "</td>		
					
			<td style='text-align: right;'>".$rsbilling['paid_amt']."</td>			
		</tr>";
		$admission_id = $rs['admission_id'];
		$start_date = $rs['start_date'];
		$enddate = $rs['end_date'];
		$paid_amt = $rsbilling['paid_amt'];
	}
	?>
	</tbody>
</table>

<hr>
							<div class="row pt-xl-4">
				<div class="col-lg-8 offset-2">
					<div class="contact-form-wthreelayouts">
					
<form action="" method="post" class="register-wthree" name="frmform" onsubmit="return validateform()">
	<input type="hidden" name="admission_id" id="admission_id"  value="<?php echo $admission_id; ?>">
	<input type="hidden" name="from_date" id="from_date"  value="<?php echo $start_date; ?>">
	<input type="hidden" name="enddate" id="enddate"  value="<?php echo $enddate; ?>">
	<input type="hidden" name="paid_amt" id="paid_amt"  value="<?php echo $paid_amt; ?>">
	<div class="form-group">
		<label>
			<h4 class="text-dark">Enter the date to Vacate Room</h4>
		</label><span class="errclass" id="idend_date"></span>
		<input class="form-control"  type="date" name="end_date" id="end_date" min="<?php echo date("Y-m-d"); ?>" max="<?php echo $enddate; ?>" onchange="fun_vacate_room('<?php echo $start_date; ?>','<?php echo $enddate; ?>','<?php echo $paid_amt; ?>',this.value)" >
	</div><br>	
	<div class="form-group">
		<label>
			<h4 class="text-dark">Reason for Vacating Room</h4>
		</label><span class="errclass" id="idvacating_reason"></span>
		<textarea class="form-control" name="vacate_reason" id="vacate_reason"  ></textarea>
	</div><br>
	<div id="divrecx"><?php include("ajax_vacate_room.php"); ?></div>
	<div class="form-group mt-4 mb-0">
		<button type="submit" name="submit" class="btn btn-w3layouts w-100">Submit</button>
	</div>
</form>
					</div>
				</div>
			</div>
						</p>
					</div>
				</div>
				<br><hr>
			</div>
			
			
		</div>
	</div>
	<!-- //what we do -->
<?php
include("footer.php");
?>
<script>
function fun_vacate_room(start_date,enddate,paid_amt,selected_date)
{    
	var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("divrecx").innerHTML = this.responseText;
      }
    };
    xmlhttp.open("GET","ajax_vacate_room.php?start_date="+start_date+"&enddate="+enddate+"&paid_amt="+paid_amt+"&selected_date="+selected_date,true);
    xmlhttp.send();
}
</script>
<script>
function validateform()
{
	var numericExpression = /^[0-9]+$/;
	var alphaExp = /^[a-zA-Z]+$/;
	var alphaSpaceExp = /^[a-zA-Z\s]+$/;
	var alphanumericExp = /^[0-9a-zA-Z]+$/;
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;

	$(".errclass").html('');
	var errstatus = "true";
	
	if(document.frmform.end_date.value == "")
	{
		document.getElementById("end_date").focus();
		document.getElementById("idend_date").innerHTML = "Vacating Date should not be empty...";
		errstatus = "false";
	}
	if(document.frmform.vacate_reason.value == "")
	{
		document.getElementById("vacate_reason").focus();
		document.getElementById("idvacating_reason").innerHTML = "Kindly enter reason for vacating room...";
		errstatus = "false";
	}
	
	if(errstatus == "true")
	{
			if(confirm("Are you sure?") == true)
			{
				return true;
			}
			else
			{
				return false;
			}
	}
	else
	{
		return false;
	}
}
</script>