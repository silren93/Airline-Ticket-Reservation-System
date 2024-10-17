<?php
	session_start();
?>
<html>
	<head>
		<title>
			Welcome Administrator
		</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body>
		<img class="logo" src="images/shutterstock_22.jpg"/> 
		<h1 id="title">
			VIETNAM AIRLINES	</h1>
		<div>
			<ul>
				<li><a href="admin_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li><a href="admin_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
				<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<h2>Xin chào Quản trị viên!</h2>
		<table cellpadding="5">
			
			<tr>
				<td class="admin_func"><a href="admin_view_booked_tickets.php"><i class="fa fa-plane" aria-hidden="true"></i> Xem danh sách vé đã đặt cho chuyến bay</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="add_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i>Thêm chuyến bay</a>
				</td>
			</tr>
			<!-- <tr>
				<td class="admin_func"><a href="modify_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Modify Flight Schedule Details</a>
				</td>
			</tr> -->
			<tr>
				<td class="admin_func"><a href="delete_flight_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Xóa chi tiết lịch bay</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="add_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Thêm chi tiết máy bay</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="activate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Kích hoạt máy bay</a>
				</td>
			</tr>
			<tr>
				<td class="admin_func"><a href="deactivate_jet_details.php"><i class="fa fa-plane" aria-hidden="true"></i> Hủy kích hoạt máy bay</a>
				</td>
			</tr>
		</table>
	</body>
</html>