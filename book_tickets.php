<?php
session_start();
?>
<html>
<head>
    <title>
        View Available Flights
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
        table {
            width: 100%;
            margin: 20px 0;
        }
        table td {
            padding: 10px;
            text-align: left;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
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
        <form action="view_flights_form_handler.php" method="post">
            <h2>Search Flights</h2>
            <table cellpadding="5">
                <tr>
                    <td>From</td>
                    <td>To</td>
                </tr>
                <tr>
                    <td>
                        <input list="origins" name="origin" placeholder="From" required>
                        <datalist id="origins">
                            <option value="bangalore">
                        </datalist>
                    </td>
                    <td>
                        <input list="destinations" name="destination" placeholder="To" required>
                        <datalist id="destinations">
                            <option value="mumbai">
                            <option value="mysore">
                            <option value="mangalore">
                            <option value="chennai">
                            <option value="hyderabad">
                        </datalist>
                    </td>
                </tr>
            </table>
            <br>
            <table cellpadding="5">
                <tr>
                    <td>Departure Date</td>
                    <td>Number of Passengers</td>
                </tr>
                <tr>
                    <td><input type="date" name="dep_date" min=
                        <?php 
                            $todays_date=date('Y-m-d'); 
                            echo $todays_date;
                        ?> 
                        max=
                        <?php 
                            $max_date=date_create(date('Y-m-d'));
                            date_add($max_date,date_interval_create_from_date_string("90 days")); 
                            echo date_format($max_date,"Y-m-d");
                        ?> required></td>
                    <td><input type="number" name="no_of_pass" placeholder="Eg. 5" required></td>
                </tr>
            </table>
            <br>
            <table cellpadding="5">
                <tr>
                    <td>Ticket Class</td>
                </tr>
                <tr>
                    <td>
                        <select name="class">
                            <option value="economy">Economy</option>
                            <option value="business">Business</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Search" name="Search">
        </form>
    </div>
</body>
</html>
