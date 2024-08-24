<?php
session_start();

$con = mysqli_connect("localhost", "root", "", "airline_reservation");
if (!isset($con)) {
    die("Database Not Found");
}

if (isset($_REQUEST["u_sub"])) {
    $id = $_POST['pnr'];

    if ($id != '') {
        $query = mysqli_query($con, "select * from passengers where pnr='" . $id . "'");
        $res = mysqli_fetch_row($query);
        $query0 = mysqli_query($con, "select * from ticket_details where pnr='" . $id . "'");
        $res0 = mysqli_fetch_row($query0);
        $query1 = mysqli_query($con, "select * from payment_details where pnr='" . $id . "'");
        $res1 = mysqli_fetch_row($query1);

        if ($res) {
            $_SESSION['user'] = $id;
            header('location:pnrcheckall.php');
        } else {
            echo '<script>';
            echo 'alert("Wrong PNR Number")';
            echo '</script>';
        }
        if ($res0) {
            $_SESSION['user'] = $id;
            header('location:pnrcheckall.php');
        } else {
            echo '<script>';
            echo 'alert("Wrong PNR Number")';
            echo '</script>';
        }

        if ($res1) {
            $_SESSION['user'] = $id;
            header('location:pnrcheckall.php');
        } else {
            echo '<script>';
            echo 'alert("Wrong PNR Number")';
            echo '</script>';
        }
    } else {
        echo '<script>';
        echo 'alert("Wrong PNR Number")';
        echo '</script>';
    }
}
?>

<html>

<head>
    <title>Check PNR</title>
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

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            width: 100%;
            padding: 20px;
        }

        .form-container form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .form-container input[type=text] {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 7px 30px;
            width: 300px;
            margin-bottom: 15px;
        }

        .form-container input[type=submit] {
            background-color: #030337;
            color: white;
            border-radius: 4px;
            padding: 7px 45px;
            font-weight: bold;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>

<body style="background-image:url('./images/inbg.jpg');">
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
    <div class="form-container">
        <form id="index" action="pnrall.php" method="post">
            <fieldset>
                <legend>Check Your PNR</legend>
                <input type="text" id="u_id" name="pnr" placeholder="Enter Your PNR Number" required>
                <input type="submit" id="u_sub" name="u_sub" value="Check">
            </fieldset>
        </form>
    </div>
</body>

</html>
