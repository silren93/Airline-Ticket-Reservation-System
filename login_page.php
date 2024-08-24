<?php
session_start();
?>
<html>

<head>
    <title>
        Account Login
    </title>
    <style>
        * {
            font-size: 20px;
        }

        input[type=text], input[type=password] {
            border: 1.5px solid #030337;
            border-radius: 4px;
            padding: 7px 30px;
            width: 300px; /* Tăng độ rộng của các input */
        }

        input[type=submit] {
            background-color: #030337;
            color: white;
            border-radius: 4px;
            padding: 7px 45px;
            margin: 0px 60px;
            font-weight: bold;
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

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            width: 100%;
        }

        .login-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            text-align: center;
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

        legend {
            color: #030337;
            text-align: center;
        }

        strong {
            color: #030337;
        }

        a {
            color: #030337;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .user-type {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
        }

        .user-type label {
            margin: 0 10px;
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
            <li><a href="home_page.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
            <li><a href="login_page.php"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
            <li><a href="login_page.php"><i class="fa fa-ticket" aria-hidden="true"></i> Book Tickets</a></li>
            <li><a href="pnrall.php"><i class="fa fa-ticket" aria-hidden="true"></i> Check PNR</a></li>
            <li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
            <li><a href="home_page.php"><i class="fa fa-phone" aria-hidden="true"></i> Contact Us</a></li>
        </ul>
    </div>
    <div class="login-container">
        <form class="login-form" action="login_handler.php" method="POST">
            <fieldset>
                <legend>LOGIN INFORMATION</legend>
                <div class="form-group">
                    <strong>Username:</strong><br>
                    <input type="text" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <strong>Password:</strong><br>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="form-group user-type">
                    <strong>User Type:</strong><br>
                    <label>
                        Customer <input type='radio' name='user_type' value='Customer' checked />
                    </label>
                    <label>
                        Administrator <input type='radio' name='user_type' value='Administrator' />
                    </label>
                </div>
                <?php
                if (isset($_GET['msg']) && $_GET['msg'] == 'failed') {
                    echo "<br>
                        <strong style='color:red'>Invalid Username/Password</strong>
                        <br><br>";
                }
                ?>
                <input type="submit" name="Login" value="Login">
            </fieldset>
            <br>
            <a href="new_user.php"><i class="fa fa-user-plus" aria-hidden="true"></i> REGISTER</a>
        </form>
    </div>
</body>

</html>
