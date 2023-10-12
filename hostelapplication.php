<?php
include("header.php");
if(isset($_POST['submit']))
{
	$sql = "INSERT INTO hostel_application(hostellerid,hostel_type,room_type,hostel_status)VALUES('" . $_SESSION['hostellerid'] . "','" .  $_POST['hostel_type'] . "','" .  $_POST['room_type'] . "','Pending')";
	$qsql = mysqli_query($con,$sql);
	echo mysqli_error($con);
	if(mysqli_affected_rows($con) ==1 )
	{
		echo "<script>viewmessagebox('Hostel Application sent successfully...','viewhostelapplication1.php')</script>";
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
		<div class="container py-xl-5 py-lg-3">
			<div class="title text-center mb-sm-5 mb-4">
				<h3 class="title-w3 text-bl text-center font-weight-bold">Hostel Application</h3>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>
			<div class="row pt-xl-4">
				<div class="col-lg-8 offset-2">
					<div class="contact-form-wthreelayouts">
<form action="" method="post" class="register-wthree" name="frmform" onsubmit="return validateform()">
	
<div class="form-group">
			<label>
				Hostel Type
			</label><span class="errclass" id="idhosteltype"></span>
			<select name="hostel_type" class="form-control">
				<option value="">Select</option>
				<?php
				$arr = array("Boys Hostel","Girls Hostel");
				foreach($arr as $val)
				{
					
					if($val == $rsedit['hostel_type'])
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
			<label>
				Room Type
			</label><span class="errclass" id="idroomtype"></span>
			<select name="room_type" class="form-control">
				<option value="">Select</option>
				<?php
				$arr = array("Single-Occupancy");
				foreach($arr as $val)
				{
					
					if($val == $rsedit['room_type'])
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
	
	<div class="form-group mt-4 mb-0">
		<button type="submit" name="submit" class="btn btn-w3layouts w-100">Apply for Hostel</button>
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
	
	if(!document.frmform.emp_name.value.match(alphaSpaceExp))
	{
		document.getElementById("idemp_name").innerHTML = "Entered name is not valid...";
		errstatus = "false";
	}
	if(document.frmform.emp_name.value == "")
	{
		document.getElementById("idemp_name").innerHTML = "Employee name should not empty...";
		errstatus = "false";
	}
	
	if(document.frmform.login_id.value == "")
	{
		document.getElementById("idlogin_id").innerHTML = "Login ID should not be empty...";
		errstatus = "false";
	}
	if(document.frmform.password.value.length<6)
	{
		document.getElementById("idpassword").innerHTML = "Password should contain more than 6 characters.....";
		errstatus = "false";
	}
	
	
	if(document.frmform.password.value == "")
	{
		document.getElementById("idpassword").innerHTML = "Password should not be empty...";
		errstatus = "false";
	}
	if(document.frmform.password.value != document.frmform.cpassword.value)
	{
		document.getElementById("idcpassword").innerHTML = "Password and Confirm password not matching...";
		errstatus = "false";
	}
	if(document.frmform.cpassword.value == "")
	{
		document.getElementById("idcpassword").innerHTML = "Confirm Password should not be empty...";
		errstatus = "false";
	}

	if(document.frmform.emp_type.value == "")
	{
		document.getElementById("idemp_type").innerHTML = "Kindly select employee type...";
		errstatus = "false";
	}
	if(document.frmform.gender.value == "")
	{
		document.getElementById("idgender").innerHTML = " Kindly select Gender ...";
		errstatus = "false";
	}
	
	if(document.frmform.designation.value == "")
	{
		document.getElementById("iddesignation").innerHTML = "Designation should not be empty...";
		errstatus = "false";
	}
	if(document.frmform.status.value == "")
	{
		document.getElementById("idstatus").innerHTML = "Kindly select status...";
		errstatus = "false";
	}
	if(errstatus == "true")
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>