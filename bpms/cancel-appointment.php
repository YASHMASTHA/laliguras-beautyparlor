<?php
session_start();
include('includes/dbconnection.php');

if (strlen($_SESSION['bpmsuid'] == 0)) {
    header('location:logout.php');
} else {
    if (isset($_GET['aptnumber'])) {
        $aptnumber = $_GET['aptnumber'];
        $userid = $_SESSION['bpmsuid'];

        // Delete the appointment
        $query = mysqli_query($con, "DELETE FROM tblbook WHERE AptNumber='$aptnumber' AND UserID='$userid'");

        if ($query) {
            echo "<script>alert('Appointment cancelled successfully.');</script>";
            echo "<script>window.location.href='booking-history.php'</script>";
        } else {
            echo "<script>alert('Something went wrong. Please try again.');</script>";
        }
    }
}
?>
