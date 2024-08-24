<?php
session_start();
?>
<html>

<head>
	<title>Welcome to Airlines</title>
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
			margin: 0;
			padding: 0;
		}

		.container img {
			width: 100vw;
			height: auto;
			object-fit: cover;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
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
	<div class="container">
		<img src="images/maybay1.jpg" alt="Airplane">
	</div>
</body>

</html>
