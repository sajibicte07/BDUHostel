<?php
include("header.php");

$student_gender = ""; // Initialize a variable to store the student's gender

// Check if the student is logged in and get their gender from the session or database (you may adjust this part based on your authentication logic)
if (isset($_SESSION['hostellerid'])) {
    // Assuming hostellerid is the unique identifier for the logged-in student
    $hostellerid = $_SESSION['hostellerid'];
    
    // Retrieve the student's gender from the hosteller table based on the hostellerid
    $sql_hosteller = "SELECT gender FROM hosteller WHERE hostellerid='$hostellerid'";
    $qsql_hosteller = mysqli_query($con, $sql_hosteller);
    if ($rs_hosteller = mysqli_fetch_array($qsql_hosteller)) {
        $student_gender = $rs_hosteller['gender'];
    }
}

?>

<!-- news -->
<section class="blog_w3ls py-5" id="news">
    <div class="container py-xl-5 py-lg-3">
        <div class="title text-center mb-sm-5 mb-4">
            <h3 class="title-w3 text-bl text-center font-weight-bold">Select Block</h3>
            <div class="arrw">
                <i class="fa fa-building-o" aria-hidden="true"></i>
            </div>
        </div>
        <div class="row pt-4">

            <?php
            $allowed_blocks = array();

            // Based on the student's gender, add the allowed blocks to the $allowed_blocks array
            if ($student_gender == "Male") {
                $allowed_blocks = array("BOYS HOSTEL I", "BOYS HOSTEL II");
            } elseif ($student_gender == "Female") {
                $allowed_blocks = array("GIRLS HOSTEL I", "GIRLS HOSTEL II");
            }

            // Retrieve the blocks from the database based on the allowed_blocks array
            $sql = "SELECT * FROM blocks WHERE status='Active' AND block_name IN ('" . implode("','", $allowed_blocks) . "')";
            $qsql = mysqli_query($con, $sql);
            while ($rs = mysqli_fetch_array($qsql)) {
                ?>
                <!-- blog grid -->
                <div class="col-lg-6 col-md-6">
                    <div class="card border-0 med-blog">
                        <?php
                        /*
                        <div class="card-header p-0">
                            <a href="single.html">
                                <img class="card-img-bottom" src="images/blog2.jpg" alt="Card image cap">
                            </a>
                        </div>
                        */
                        ?>
                        <div class="card-body border border-top-0 pb-5">
                            <div class="mb-3">
                                <h5 class="blog-title card-title font-weight-bold m-0">
                                    <a href="hostelbookingfeestructure.php?block_id=<?php echo $rs['block_id']; ?>"><?php echo $rs['block_name']; ?></a>
                                </h5>
                                <p>
                                    <?php echo $rs['description']; ?>
                                </p>
                            </div>
                            <a href="hostelbookingfeestructure.php?block_id=<?php echo $rs['block_id']; ?>" class="blog-btn">Select</a>
                        </div>
                    </div>
                </div>
                <!-- //blog grid -->
            <?php
            }
            ?>

        </div>
    </div>
</section>
<!-- //blog -->

<?php
include("footer.php");
?>
