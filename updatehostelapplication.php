<?php
include("header.php");
if(isset($_POST['btnsubmit']))
{
	$sql = "UPDATE hostel_application SET  hostel_status='" . $_POST['hostel_status'] . "' WHERE hostel_application_id='" . $_POST['hostel_application_id'] . "'";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) ==1 )
	{
		echo "<script>viewmessagebox('Hostel Application updated successfully...','viewhostelapplication.php')</script>";
	}
}
if(isset($_GET['editid']))
{
	$sqledit = "SELECT * FROM hostel_application LEFT JOIN hosteller ON hostel_application.hostellerid=hosteller.hostellerid WHERE hostel_application.hostel_application_id='" . $_GET['editid'] . "'";
	$qsqledit = mysqli_query($con,$sqledit);
	$rs = mysqli_fetch_array($qsqledit);
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
		<div class="container py-xl-5 py-lg-3">
			<div class="title text-center mb-sm-5 mb-4">
				<h3 class="title-w3 text-bl text-center font-weight-bold">Update Hostel Application</h3>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>
			<div class="row pt-xl-4">
				<div class="col-lg-8 offset-2">
					<div class="contact-form-wthreelayouts">
<form action="" method="post" class="register-wthree" name="frmform" onsubmit="return validateform()">
	<input type="hidden" id="hostel_application_id" name="hostel_application_id" value="<?php echo $rs[0]; ?>" >
<table id="datatable"  class="table table-striped table-bordered">
<tr><th>Application No.</th><td><?php echo $rs[0]; ?></td></tr>	
		<tr><th>ID</th><td><?php echo $rs['place_belong']; ?></td></tr>
		<tr><th>Hosteller</th><td><?php echo $rs['name']; ?></td></tr>		
		<tr><th>Department</th><td><?php echo $rs['cocurricular_activities']; ?></td></tr>	
		<tr><th>Session</th><td><?php echo $rs['session']; ?></td></tr>	
		<tr><th>Hostel Type</th><td><?php echo $rs['hostel_type']; ?></td></tr>	
		<tr><th>Room Type</th><td><?php echo $rs['room_type']; ?></td></tr>	
		<tr><th>Hostel Status</th><td><?php echo $rs['hostel_status']; ?></td></tr>
</table>
	
	<div class="form-group">
		<label>
			Hostel Status
		</label><span class="errclass" id="idhostel_status"></span>
		<select class="form-control" name="hostel_status" id="hostel_status" >
			<?php
				$arr = array("Pending","Approved");
				foreach($arr as $val)
				{
					if($val == $rs['hostel_status'])
					{
					echo "<option value='$val' selected>$val</option>";
					}
					else
					{
					echo "<option value='$val'>$val</option>";
					}
				}
			?>
		</select>
	</div>
	<div class="form-group">
		<input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-info" value="Update Hostel Application">
	</div>
</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //contact -->
<?php
include("footer.php");
?>