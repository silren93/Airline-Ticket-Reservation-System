<?php
session_start();

$con = mysqli_connect("localhost", "root", "", "airline_reservation");
if (!$con) {
    die("Database Not Found");
}

if (isset($_REQUEST["u_sub"])) {
    $id = $_POST['pnr'];

    if ($id != '') {
        $query = mysqli_query($con, "SELECT * FROM passengers WHERE pnr='$id'");
        $res = mysqli_fetch_row($query);
        $query0 = mysqli_query($con, "SELECT * FROM ticket_details WHERE pnr='$id'");
        $res0 = mysqli_fetch_row($query0);
        $query1 = mysqli_query($con, "SELECT * FROM payment_details WHERE pnr='$id'");
        $res1 = mysqli_fetch_row($query1);

        if ($res || $res0 || $res1) {
            $_SESSION['user'] = $id;
            header('location:pnrcheck.php');
        } else {
            echo '<script>alert("Invalid PNR")</script>';
        }
    } else {
        echo '<script>alert("Enter your PNR number")</script>';
    }
}
?>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css">
    <script src="bootstrap/jquery.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            background-color: #f3f3f3;
        }

        .logos {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }

        .logo1 {
            width: 300px;
        }

        .menu {
            width: 100%;
            background-color: #030337;
            margin-top: 20px;
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
            max-width: 400px;
            margin: 20px 0;
        }

        input {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 7px 30px;
        }

        input[type=submit], button {
            background-color: #030337;
            color: white;
            border-radius: 4px;
            padding: 7px 20px;
            margin: 10px 0;
            width: 100%;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            text-align: center;
            margin-bottom: 5px;
            font-weight: bold;
            color: #030337;
        }

        .form-group input {
            display: block;
            margin: 0 auto;
        }

        .image-container {
            text-align: center;
            margin-top: 20px;
        }

        .image-container img {
            max-width: 100px;
            height: auto;
        }
    </style>
    <title>PNR Check</title>
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
        <form id="index" action="pnr.php" method="post">
            <div class="form-group">
                <label for="pnr">Enter Your PNR Number</label>
                <input type="text" id="pnr" name="pnr" class="form-control" required>
            </div>
            <input type="submit" id="u_sub" name="u_sub" value="Print" class="btn btn-primary">
            <button type="button" onclick="location.href = './customer_homepage.php';" class="btn btn-primary">Back to Portal</button>
        </form>
    </div>
</body>

</html>
