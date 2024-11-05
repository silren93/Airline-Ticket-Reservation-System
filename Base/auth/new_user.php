<html>
<head>
    <title>
        Create New User Account
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
        .logos {
            width: 100%; /* Thay đổi chiều rộng thành 100% để chiếm toàn bộ chiều rộng của trang */
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: flex-start; /* Di chuyển ảnh đầu đề sang bên trái */
            background-color: #f3f3f3; /* Mở rộng nền */
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

        .center_form {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            width: 100%;
            min-height: calc(100vh - 100px); /* Đảm bảo nền trắng chiếm toàn bộ chiều cao màn hình trừ đi chiều cao của phần đầu */
            padding-top: 20px; /* Thêm khoảng cách trên cùng */
        }

        .center_form form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            text-align: center;
            width: 100%;
            max-width: 600px; /* Đặt giới hạn chiều rộng cho form */
            max-height: 842px; /* Chiều cao tối đa A4 */
            overflow: auto; /* Thêm thanh cuộn nếu cần */
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
            <li><a href="home_page.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
            <li><a href="login_page.php"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
            <li><a href="login_page.php"><i class="fa fa-ticket" aria-hidden="true"></i> Book Tickets</a></li>
            <li><a href="pnrall.php"><i class="fa fa-ticket" aria-hidden="true"></i> Check PNR</a></li>
            <li><a href="home_page.php"><i class="fa fa-plane" aria-hidden="true"></i> About Us</a></li>
            <li><a href="home_page.php"><i class="fa fa-phone" aria-hidden="true"></i> Contact Us</a></li>
        </ul>
    </div>
    <br>
    <div class="center_form">
        <form action="new_user_form_handler.php" method="POST" id="new_user_form">
            <h2><i class="fa fa-user-plus" aria-hidden="true"></i> REGISTER</h2>
            <br>
            <table cellpadding='10'>
                <tr>
                    <td><strong>Enter Username</strong></td>
                    <td><input type="text" name="username" required><br><br></td>
                </tr>
                <tr>
                    <td><strong>Enter Password</strong></td>
                    <td><input type="password" name="password" required><br><br></td>
                </tr>
                <tr>
                    <td><strong>Enter Your Email</strong></td>
                    <td><input type="text" name="email" required><br><br></td>
                </tr>
            </table>
            <br>
            <table cellpadding='10'>
                <tr>
                    <td><strong>Enter Your Name</strong></td>
                    <td><input type="text" name="name" required><br><br></td>
                </tr>
                <tr>
                    <td><strong>Enter Your Phone Number</strong></td>
                    <td><input type="text" name="phone_no" required><br><br></td>
                </tr>
                <tr>
                    <td><strong>Enter Your Address</strong></td>
                    <td><input type="text" name="address" required><br><br></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Register" name="Submit">
            <br>
        </form>
    </div>
</body>
</html>
