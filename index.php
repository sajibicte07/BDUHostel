<?php
include("header.php");
?>
	<!-- banner -->
	<div class="banner-w3pvt">
	<?php include("slider.php"); ?>
	</div>
	<!-- //banner -->
	
		<!-- events -->
	<div class="about-w3sec" id="event">
		<div class="container py-xl-5">
			<div class="title text-center mb-sm-5 mb-4"><h4 class="title-w3 text-bl text-center font-weight-bold"> HostelEase: A Smart Hassle-free Solution for BDU Hostel</h4>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>
			<div class="evnt-grid p-sm-5 p-4">
				<div class="row">
					<div class="col-lg-12 col-sm-3 text-center mt-2">
<p><b>The motive of HostelEase is to revolutionize the hostel experience at Bangabandhu Sheikh Mujibur Rahman Digital University, ensuring that students thrive in every aspect of their lives. By adopting a student-centric approach, we aim to provide a seamless and efficient hostel management system that simplifies administrative tasks and saves valuable time. Moreover, we strive to foster a vibrant and inclusive community, encouraging cross-disciplinary interactions and cultural exchange among residents.</b></p>
<p><b>With a strong focus on innovation and sustainability, HostelEase aims to create an environment where students can flourish academically, socially, and personally, ensuring a memorable and enriching university experience.</b></p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="about-w3sec py-5" id="event" >
		<div class="container py-xl-5 py-lg-3">
			<div class="title text-center mb-sm-5 mb-4">
			<h4 class="title-w3 text-bl text-center font-weight-bold"> NEWS & EVENTS</h4>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>
			
<?php
	$sql ="SELECT * FROM event WHERE status='Published' ORDER BY eventid DESC";
	$qsql = mysqli_query($con,$sql);
	while($rs = mysqli_fetch_array($qsql))
	{
		$img = unserialize($rs['event_banner']);
?>		
		<div class="evnt-grid p-sm-5 p-4">
			<div class="row">
				<div class="col-lg-2 col-sm-3 text-center mt-2">
					<img src='imgevent/<?php echo $img[0]; ?>' style='width: 150px;height:150px;'  class="img-fluid">
				</div>
				<div class="col-lg-7 col-sm-9 abt-block pr-lg-5 mt-sm-0 mt-4">
					<h4 class="mb-2"><?php echo $rs['event_title']; ?></h4>
					<p><?php echo substr($rs['event_description'], 0, 125); ?></p>
					<ul class="list-unstyled mt-3">
						<li class="mx-md-4 mx-2">
							<span class="fa fa-clock-o mr-2"></span>Event Date:<?php echo date("d-M-Y",strtotime($rs['event_date'])); ?>
						</li>
						<?php
						/*
						<li>
							<span class="fa fa-map-marker mr-2"></span>Hall No.1
						</li>
						*/
						?>
					</ul>
				</div>
				<div class="col-lg-3 abt-block text-center">
					<a href="eventdetail.php?eventid=<?php echo $rs[0]; ?>" style="max-width: 150px;" class="btn button-style mt-sm-5 mt-4">View More</a>
				</div>
			</div>
		</div>
<?php
	}
?>	
		</div>
	</div>
	<!-- //events -->
<?php
if(!isset($_SESSION['hostellerid']))
{
	if(!isset($_SESSION['guestid']))
	{
		if(!isset($_SESSION['emp_id']))
		{
		?>
	<!-- news -->
	<section class="blog_w3ls " id="news">
		<div class="container py-xl-5 py-lg-3"><hr>
			<div class="title text-center mb-sm-5 mb-4">
				<h4 class="title-w3 text-bl text-center font-weight-bold"> ACCOUNT PANEL</h4>
				<div class="arrw">
					<i class="fa fa-building-o" aria-hidden="true"></i>
				</div>
			</div>

					<div class="row pt-4">

						<!-- blog grid -->
						<div class="col-lg-3 col-md-3 mt-lg-0 mt-5">
							<div class="card border-0 med-blog">
								<div class="card-header p-0">
									<a href="hostellerlogin.php">
										<img class="card-img-bottom" src="images/hostel1.jpg" alt="Card image cap">
									</a>
								</div>
								<div class="card-body border border-top-0 pb-5">
									<div class="mb-3">
										<h4 class="blog-title card-title font-weight-bold m-0">
											<a href="hostellerlogin.php">Hosteller - Login</a>
										</h4>
									</div>
									<a href="hostellerlogin.php" class="blog-btn">Click here to Login</a>
								</div>
							</div>
						</div>
						<!-- //blog grid -->
						<!-- blog grid -->
						<div class="col-lg-3 col-md-3 mt-md-0 mt-5">
							<div class="card border-0 med-blog">
								<div class="card-header p-0">
									<a href="hosteller.php">
										<img class="card-img-bottom" src="images/hostel2.jpg" alt="Card image cap">
									</a>
								</div>
								<div class="card-body border border-top-0 pb-5">
									<div class="mb-3">
										<h4 class="blog-title card-title font-weight-bold m-0">
											<a href="hosteller.php">Hosteller - Register</a>
										</h4>
									</div>
									<a href="hosteller.php" class="blog-btn">Click here to Register</a>
								</div>
							</div>
						</div>
						<!-- //blog grid -->
						<!-- blog grid -->
						<div class="col-lg-3 col-md-3 mt-lg-0 mt-5">
							<div class="card border-0 med-blog">
								<div class="card-header p-0">
									<a href="guestlogin.php">
										<img class="card-img-bottom" src="images/hostel3.jpg" alt="Card image cap">
									</a>
								</div>
								<div class="card-body border border-top-0 pb-5">
									<div class="mb-3">
										<h4 class="blog-title card-title font-weight-bold m-0">
											<a href="guestlogin.php">Guest - Login</a>
										</h4>
									</div>
									<a href="guestlogin.php" class="blog-btn">Click here to Register</a>
								</div>
							</div>
						</div>
						<!-- //blog grid -->
						<!-- blog grid -->
						<div class="col-lg-3 col-md-3 mt-lg-0 mt-5">
							<div class="card border-0 med-blog">
								<div class="card-header p-0">
									<a href="guest.php">
										<img class="card-img-bottom" src="images/hostel4.jpg" alt="Card image cap">
									</a>
								</div>
								<div class="card-body border border-top-0 pb-5">
									<div class="mb-3">
										<h4 class="blog-title card-title font-weight-bold m-0">
											<a href="guest.php">Guest - Register</a>
										</h4>
									</div>
									<a href="guest.php" class="blog-btn">Click here to Register</a>
								</div>
							</div>
						</div>
						<!-- //blog grid -->
					</div>
		
		</div>
	</section>
	<!-- //blog -->
		<?php
		}
	}
}
?>	
<?php
include("footer.php");
?>