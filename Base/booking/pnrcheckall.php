<?php
session_start();
error_reporting(0);

$con = mysqli_connect("localhost", "root", "", "airline_reservation");
$q = mysqli_query($con, "select pnr from ticket_details where pnr='" . $_SESSION['user'] . "'");
$n = mysqli_fetch_assoc($q);
$stname = $n['pnr'];
$id = $_SESSION['user'];

$result = mysqli_query($con, "SELECT * FROM passengers WHERE pnr='" . $_SESSION['user'] . "'");
?>
<html>

<head>
    <title>Passenger Details</title>
    <style>
        * {
            font-size: 20px;
        }

        .logos {
            width: 1230px;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: space-between;
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

        .container {
            width: 100%;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .print-button {
            background-color: #030337;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }

        h2, h3 {
            margin: 0;
            padding-bottom: 10px;
        }
    </style>
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css">
    <script src="bootstrap/jquery.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/admform.css">
    <script type="text/javascript">
        function printpage() {
            var printButton = document.getElementById("print");
            printButton.style.visibility = 'hidden';
            window.print();
            printButton.style.visibility = 'visible';
        }
    </script>
</head>

<body>
    <div class="logos">
        <img class="logo1" src="images/ban.png" />
    </div>
    <div class="menu">
        <ul>
            <li><a href="home_page.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
            <li>
                <?php
                if (isset($_SESSION['login_user']) && $_SESSION['user_type'] == 'Customer') {
                    echo "<a href=\"customer_homepage.php\"><i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i> Login</a>";
                } else if (isset($_SESSION['login_user']) && $_SESSION['user_type'] == 'Administrator') {
                    echo "<a href=\"admin_homepage.php\"><i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i> Login</a>";
                } else {
                    echo "<a href=\"login_page.php\"><i class=\"fa fa-sign-in\" aria-hidden=\"true\"></i> Login</a>";
                }
                ?>
            </li>
            <li>
                <?php
                if (isset($_SESSION['login_user']) && $_SESSION['user_type'] == 'Customer') {
                    echo "<a href=\"book_tickets.php\"><i class=\"fa fa-ticket\" aria-hidden=\"true\"></i> Book Tickets</a>";
                } else if (isset($_SESSION['login_user']) && $_SESSION['user_type'] == 'Administrator') {
                    echo "<a href=\"admin_ticket_message.php\"><i class=\"fa fa-ticket\" aria-hidden=\"true\"></i> Book Tickets</a>";
                } else {
                    echo "<a href=\"login_page.php\"><i class=\"fa fa-ticket\" aria-hidden=\"true\"></i> Book Tickets</a>";
                }
                ?>
            </li>
            <li><a href="pnrall.php"><i class="fa fa-ticket" aria-hidden="true"></i> Check PNR</a></li>
            <li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
            <li><a href="home_page.php"><i class="fa fa-phone" aria-hidden="true"></i> Contact Us</a></li>
        </ul>
    </div>
    <?php
    while ($row = mysqli_fetch_array($result)) {
        $ticketDetails = mysqli_query($con, "SELECT flight_no, journey_date, class FROM ticket_details WHERE pnr='" . $_SESSION['user'] . "'");
        $ticket = mysqli_fetch_assoc($ticketDetails);
    ?>
    <div class="container">
        <center>
            <h2>Airport Authority Of India</h2>
            <h3>Passenger Details against PNR Number</h3>
        </center>
        <table class="table table-bordered">
            <tr>
                <td style="width:20%;">PNR :</td>
                <td style="width:30%;" colspan="3"><?php echo $stname; ?></td>
            </tr>
            <tr>
                <td>Flight No :</td>
                <td colspan="3"><?php echo $ticket['flight_no']; ?></td>
            </tr>
            <tr>
                <td>Journey Date:</td>
                <td colspan="3"><?php echo $ticket['journey_date']; ?></td>
            </tr>
            <tr>
                <td>Class :</td>
                <td colspan="3"><?php echo $ticket['class']; ?></td>
            </tr>
            <tr>
                <td>Passenger No:</td>
                <td><?php echo $row[0]; ?></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><?php echo $row[2]; ?></td>
                <td>Age:</td>
                <td><?php echo $row[3]; ?></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><?php echo $row[4]; ?></td>
                <td>Meal Choice:</td>
                <td><?php echo $row[5]; ?></td>
            </tr>
            <tr>
                <td>Frequent Flier No. (If any)</td>
                <td colspan="3"><?php echo $row[6]; ?></td>
            </tr>
        </table>
    </div>
    <?php
    }
    ?>
    <center><button id="print" class="print-button" onclick="printpage();">Print</button></center>
    <center><a href="pnr.php">Check other PNR</a></center>
</body>

</html>
