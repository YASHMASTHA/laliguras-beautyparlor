<?php
session_start();
error_reporting(0);
include ('includes/dbconnection.php');

// Check if user is logged in
if (strlen($_SESSION['bpmsuid']) == 0) {
    header('location:logout.php');
} else {
    // Fetch services from tblservices
    $service_query = mysqli_query($con, "SELECT * FROM tblservices");
    $services = array();
    while ($row = mysqli_fetch_assoc($service_query)) {
        $services[] = $row;
    }

    // Handle form submission
    if (isset($_POST['submit'])) {
        $uid = $_SESSION['bpmsuid'];
        $adate = $_POST['adate'];
        $atime = $_POST['atime'];
        $msg = $_POST['message'];
        $service = $_POST['service']; // Retrieve selected service

        // Validate time range (11:00am to 6:00pm)
        $time_start = strtotime('11:00');
        $time_end = strtotime('18:00');
        $selected_time = strtotime($atime);

        if ($selected_time < $time_start || $selected_time > $time_end) {
            echo '<script>alert("Please select a time between 11:00am and 6:00pm.")</script>';
        } else {
            // Generate random appointment number
            $aptnumber = mt_rand(100000000, 999999999);

            // Insert into database
            $query = mysqli_query($con, "INSERT INTO tblbook (UserID, AptNumber, AptDate, AptTime, Message, Service) VALUES ('$uid', '$aptnumber', '$adate', '$atime', '$msg', '$service')");

            if ($query) {
                // Retrieve inserted appointment number
                $ret = mysqli_query($con, "SELECT AptNumber FROM tblbook WHERE tblbook.UserID = '$uid' ORDER BY ID DESC LIMIT 1");
                $result = mysqli_fetch_array($ret);
                $_SESSION['aptno'] = $result['AptNumber'];
                echo "<script>window.location.href='thank-you.php'</script>";
            } else {
                echo '<script>alert("Something Went Wrong. Please try again")</script>';
            }
        }
    }
}
?>
<!doctype html>
<html lang="en">

<head>
    <title>Laliguras Beauty Parlor | Appointment Page</title>
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
</head>

<body id="home">
    <?php include_once ('includes/header.php'); ?>

    <script src="assets/js/jquery-3.3.1.min.js"></script> <!-- Common jquery plugin -->
    <!--bootstrap working-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- disable body scroll which navbar is in active -->

    <!-- breadcrumbs -->
    <section class="w3l-inner-banner-main">
        <div class="about-inner contact ">
            <div class="container">
                <div class="main-titles-head text-center">
                    <h3 class="header-name">
                        Book Appointment
                    </h3>
                    <p class="tiltle-para">.</p>
                </div>
            </div>
            <div class="breadcrumbs-sub">
                <div class="container">
                    <ul class="breadcrumbs-custom-path">
                        <li class="right-side propClone"><a href="index.php" class="">Home <span
                                    class="fa fa-angle-right" aria-hidden="true"></span></a>
                            <p>
                        </li>
                        <li class="active ">
                            Book Appointment
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumbs //-->
    <section class="w3l-contact-info-main" id="contact">
        <div class="contact-sec	">
            <div class="container">
                <div class="d-grid contact-view">
                    <div class="cont-details">
                        <?php
                        $ret = mysqli_query($con, "SELECT * FROM tblpage WHERE PageType='contactus' ");
                        $cnt = 1;
                        while ($row = mysqli_fetch_array($ret)) {
                            ?>
                            <div class="cont-top">
                                <div class="cont-left text-center">
                                    <span class="fa fa-phone text-primary"></span>
                                </div>
                                <div class="cont-right">
                                    <h6>Call Us</h6>
                                    <p class="para"><a href="#">+977 <?php echo $row['MobileNumber']; ?></a></p>
                                </div>
                            </div>
                            <div class="cont-top margin-up">
                                <div class="cont-left text-center">
                                    <span class="fa fa-envelope-o text-primary"></span>
                                </div>
                                <div class="cont-right">
                                    <h6>Email Us</h6>
                                    <p class="para"><a href="mailto:example@mail.com"
                                            class="mail"><?php echo $row['Email']; ?></a></p>
                                </div>
                            </div>
                            <div class="cont-top margin-up">
                                <div class="cont-left text-center">
                                    <span class="fa fa-map-marker text-primary"></span>
                                </div>
                                <div class="cont-right">
                                    <h6>Address</h6>
                                    <p class="para"> <?php echo $row['PageDescription']; ?></p>
                                </div>
                            </div>
                            <div class="cont-top margin-up">
                                <div class="cont-left text-center">
                                    <span class="fa fa-map-marker text-primary"></span>
                                </div>
                                <div class="cont-right">
                                    <h6>Time</h6>
                                    <p class="para"> <?php echo $row['Timing']; ?></p>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="map-content-9 mt-lg-0 mt-4">
                        <form method="post" onsubmit="return validateTime()">
                            <div style="padding-top: 30px;">
                                <label>Appointment Date</label>
                                <input type="date" class="form-control appointment_date" placeholder="Date" name="adate"
                                    id="adate" required>
                            </div>
                            <div style="padding-top: 30px;">
                                <label>Appointment Time</label>
                                <input type="time" class="form-control appointment_time" placeholder="Time" name="atime"
                                    id="atime" required>
                            </div>
                            <div style="padding-top: 30px;">
                                <label>Select Service</label>
                                <select class="form-control" name="service" required>
                                    <option value="">Select Service</option>
                                    <?php foreach ($services as $service) { ?>
                                        <option value="<?php echo $service['ServiceName']; ?>">
                                            <?php echo $service['ServiceName']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div style="padding-top: 30px;">
                                <textarea class="form-control" id="message" name="message" placeholder="Message"
                                    required></textarea>
                            </div>
                            <button type="submit" class="btn btn-contact" name="submit">Make an Appointment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php include_once ('includes/footer.php'); ?>
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fa fa-long-arrow-up"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }

        // JavaScript validation function for time selection
        function validateTime() {
            var selectedTime = document.getElementById('atime').value;
            var timeParts = selectedTime.split(':');
            var hour = parseInt(timeParts[0]);
            var minute = parseInt(timeParts[1]);

            // Check if time is between 11:00am (11:00) and 6:00pm (18:00)
            if (hour < 11 || (hour == 11 && minute < 0) || hour > 18 || (hour == 18 && minute > 0)) {
                alert('Please select a time between 11:00am and 6:00pm.');
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
    <!-- /move top -->
</body>

</html>
