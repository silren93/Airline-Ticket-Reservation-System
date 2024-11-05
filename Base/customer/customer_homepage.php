<?php
session_start();
if (!isset($_SESSION['login_user'])) {
    header('location:home_page.php');
    exit();
}
?>
<html>

<head>
    <title>
        Welcome Customer
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
            margin: 0px 127px;
        }

        input[type=date] {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 5.5px 44.5px;
        }

        select {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 6.5px 75.5px;
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

        h4 {
            color: #030337;
        }

        .admin_func {
            margin: 15px 0;
            text-align: center;
        }

        .admin_func a {
            text-decoration: none;
            color: #030337;
            font-weight: bold;
        }

        .admin_func a:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            margin: 20px 0;
        }

        table td {
            text-align: center;
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
            <li><a href="pnr.php"><i class="fa fa-desktop" aria-hidden="true"></i> Print Ticket</a></li>
            <li><a href="customer_homepage.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
            <li><a href="customer_homepage.php"><i class="fa fa-phone" aria-hidden="true"></i> Contact Us</a></li>
            <li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <?php
        echo "<h2>Welcome " . $_SESSION['login_user'] . "</h2>";
        require_once('Database Connection file/mysqli_connect.php');
        $query = "SELECT count(*),frequent_flier_no,mileage FROM Frequent_Flier_Details WHERE customer_id=?";
        $stmt = mysqli_prepare($dbc, $query);
        mysqli_stmt_bind_param($stmt, "s", $_SESSION['login_user']);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $cnt, $frequent_flier_no, $mileage);
        mysqli_stmt_fetch($stmt);
        if ($cnt == 1) {
            echo "<h4>Frequent Flier No.: " . $frequent_flier_no . " &emsp;&emsp; Mileage: " . $mileage . " points</h4>";
        }
        mysqli_stmt_close($stmt);
        mysqli_close($dbc);
        ?>
        <table cellpadding="5">
            <tr>
                <td class="admin_func"><a href="book_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> Book Flight Tickets</a></td>
            </tr>
            <tr>
                <td class="admin_func"><a href="view_booked_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> View Booked Tickets</a></td>
            </tr>
            <tr>
                <td class="admin_func"><a href="pnr.php"><i class="fa fa-plane" aria-hidden="true"></i> Print Booked Ticket</a></td>
            </tr>
            <tr>
                <td class="admin_func"><a href="cancel_booked_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> Cancel Booked Ticket</a></td>
            </tr>
        </table>
    </div>
</body>

</html>
