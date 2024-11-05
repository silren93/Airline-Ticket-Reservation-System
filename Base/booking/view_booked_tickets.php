<?php
session_start();
?>
<html>

<head>
    <title>
        View Booked Tickets
    </title>
    <style>
        input {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 7px 30px;
        }

        input[type=submit] {
            background-color: #030337;
            color: white;
            border-radius: 4px;
            padding: 7px 45px;
            margin: 0px 135px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
        }

        th, td {
            border: 1px solid #030337;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f3f3f3;
        }

        .logos {
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            background-color: #f3f3f3;
        }

        .logo1 {
            object-fit: cover;
            width: 520px;
            padding: 10px;
        }

        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            background-color: #f3f3f3;
        }

        .menu {
            width: 100%;
            background-color: #030337;
        }

        .menu ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        .menu ul li {
            padding: 14px 20px;
        }

        .menu ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
        }

        .content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            text-align: center;
            width: 100%;
            max-width: 800px;
            margin: 20px 0;
        }

        h2 {
            color: #030337;
        }

        .set_nice_size {
            font-size: 17pt;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
</head>

<body>
    <div class="logos">
        <img class="logo1" src="images/ban.png" />
    </div>
    <div class="menu">
        <ul>
            <li><a href="customer_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
            <li><a href="customer_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
            <li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
            <li><a href="home_page.php"><i class="fa fa-phone" aria-hidden="true"></i> Contact Us</a></li>
            <li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <h2>VIEW BOOKED FLIGHT TICKETS</h2>
        <h3 class='set_nice_size'><u>Upcoming Trips</u></h3>
        <?php
        $todays_date = date('Y-m-d');
        $thirty_days_before_date = date_create(date('Y-m-d'));
        date_sub($thirty_days_before_date, date_interval_create_from_date_string("30 days"));
        $thirty_days_before_date = date_format($thirty_days_before_date, "Y-m-d");

        $customer_id = $_SESSION['login_user'];
        require_once('Database Connection file/mysqli_connect.php');
        $query = "SELECT pnr, date_of_reservation, flight_no, journey_date, class, booking_status, no_of_passengers, payment_id FROM Ticket_Details where customer_id=? AND journey_date>=? AND booking_status='CONFIRMED' ORDER BY journey_date";
        $stmt = mysqli_prepare($dbc, $query);
        mysqli_stmt_bind_param($stmt, "ss", $customer_id, $todays_date);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $pnr, $date_of_reservation, $flight_no, $journey_date, $class, $booking_status, $no_of_passengers, $payment_id);
        mysqli_stmt_store_result($stmt);
        if (mysqli_stmt_num_rows($stmt) == 0) {
            echo "<h3><center>No upcoming trips!</center></h3>";
        } else {
            echo "<table cellpadding=\"10\">
            <tr><th>PNR</th>
            <th>Date of Reservation</th>
            <th>Flight No.</th>
            <th>Journey Date</th>
            <th>Class</th>
            <th>Booking Status</th>
            <th>No. of Passengers</th>
            <th>Payment ID</th>
            </tr>";
            while (mysqli_stmt_fetch($stmt)) {
                echo "<tr>
                <td>" . $pnr . "</td>
                <td>" . $date_of_reservation . "</td>
                <td>" . $flight_no . "</td>
                <td>" . $journey_date . "</td>
                <td>" . $class . "</td>
                <td>" . $booking_status . "</td>
                <td>" . $no_of_passengers . "</td>
                <td>" . $payment_id . "</td>
                </tr>";
            }
            echo "</table> <br>";
        }
        echo "<br><h3 class=\"set_nice_size\"><u>Completed Trips</u></h3>";

        $query = "SELECT pnr, date_of_reservation, flight_no, journey_date, class, booking_status, no_of_passengers, payment_id FROM Ticket_Details where customer_id=? and journey_date<? and journey_date>=? ORDER BY journey_date";
        $stmt = mysqli_prepare($dbc, $query);
        mysqli_stmt_bind_param($stmt, "sss", $customer_id, $todays_date, $thirty_days_before_date);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $pnr, $date_of_reservation, $flight_no, $journey_date, $class, $booking_status, $no_of_passengers, $payment_id);
        mysqli_stmt_store_result($stmt);
        if (mysqli_stmt_num_rows($stmt) == 0) {
            echo "<h3><center>No trips completed in the past 30 days!</center></h3>";
        } else {
            echo "<table cellpadding=\"10\">
            <tr><th>PNR</th>
            <th>Date of Reservation</th>
            <th>Flight No.</th>
            <th>Journey Date</th>
            <th>Class</th>
            <th>Booking Status</th>
            <th>No. of Passengers</th>
            <th>Payment ID</th>
            </tr>";
            while (mysqli_stmt_fetch($stmt)) {
                echo "<tr>
                <td>" . $pnr . "</td>
                <td>" . $date_of_reservation . "</td>
                <td>" . $flight_no . "</td>
                <td>" . $journey_date . "</td>
                <td>" . $class . "</td>
                <td>" . $booking_status . "</td>
                <td>" . $no_of_passengers . "</td>
                <td>" . $payment_id . "</td>
                </tr>";
            }
            echo "</table> <br>";
        }
        mysqli_stmt_close($stmt);
        mysqli_close($dbc);
        ?>
    </div>
</body>

</html>
