<?php
$start_date = $_GET['start_date'];
$enddate = $_GET['enddate'];
$paid_amt = $_GET['paid_amt'];
$selected_date  = $_GET['selected_date'];

// Validate inputs
if (!empty($start_date) && !empty($enddate) && !empty($paid_amt) && !empty($selected_date)) {
    $startTimeStamp = strtotime($start_date);
    $endTimeStamp = strtotime($enddate);
    $timeDiff = abs($endTimeStamp - $startTimeStamp);
    $numberDays = $timeDiff/86400;  // 86400 seconds in one day
    $numberDays = intval($numberDays);

    // Check for division by zero
    if ($numberDays !== 0) {
        $amt_per_day = $paid_amt / $numberDays;

        $startTimeStamp = strtotime($start_date);
        $endTimeStamp = strtotime($selected_date);
        $timeDiff = abs($endTimeStamp - $startTimeStamp);
        $BalDays = $timeDiff/86400;  // 86400 seconds in one day
        $BalDays = intval($BalDays);

        $totalBalDays = $numberDays - $BalDays;
        $refundableamt = $amt_per_day * $totalBalDays;
        $refundableamt = intval($refundableamt);
    } else {
        // Handle division by zero error
        echo "Error: Division by zero.";
    }
} else {
    // Handle missing or empty inputs
    echo "Error: Missing or empty inputs.";
}
?>

<div class="form-group">
	<label>
		<h4 class="text-dark">Remaining Days</h4>
	</label><span class="errclass" id="idemp_name"></span>
	<input class="form-control"  type="text" name="tot_num_days" id="tot_num_days" readonly value="<?php echo $totalBalDays; ?>" >
</div>
<br>
<div class="form-group">
	<label>
		<h4 class="text-dark">Total refundable Amount</h4>
	</label><span class="errclass" id="idemp_name"></span>
	<input class="form-control"  type="text" name="tot_refundable_amt" id="tot_refundable_amt" readonly  value="<?php echo $refundableamt; ?>" >
</div>