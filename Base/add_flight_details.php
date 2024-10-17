<?php
session_start();
?>
<html>

<head>
	<title>
		Add Flight Schedule Details
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
			margin: 0px 200px
		}
	</style>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
</head>

<body>
	<img class="logo" src="images/shutterstock_22.jpg" />
	<h1 id="title">
		VIETNAM AIRLINES
	</h1>
	<div>
		<ul>
			<li><a href="admin_homepage.php"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
			<li><a href="admin_homepage.php"><i class="fa fa-desktop" aria-hidden="true"></i> Dashboard</a></li>
			<li><a href="logout_handler.php"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
		</ul>
	</div>
	<form action="add_flight_details_form_handler.php" method="post">
		<h2>NHẬP CHI TIẾT LỊCH BAY</h2>
		<?php
		if (isset($_GET['msg']) && $_GET['msg'] == 'success') {
			echo "<strong style='color: green'>The Flight Schedule has been successfully added.</strong>
						<br>
						<br>";
		} else if (isset($_GET['msg']) && $_GET['msg'] == 'failed') {
			echo "<strong style='color: red'>*Invalid Flight Schedule Details, please enter again.</strong>
						<br>
						<br>";
		}
		?>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Số hiệu</td>
			</tr>
			<tr>
				<td class="fix_table"><input type="text" name="flight_no" required></td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Từ</td>
				<td class="fix_table">Đến</td>
			</tr>
			<tr>
				<td class="fix_table"><input type="text" name="origin" required></td>
				<td class="fix_table"><input type="text" name="destination" required></td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Ngày khởi hành</td>
				<td class="fix_table">Ngày đến</td>
			</tr>
			<tr>
				<td class="fix_table"><input type="date" name="dep_date" required></td>
				<td class="fix_table"><input type="date" name="arr_date" required></td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Thời gian khởi hành</td>
				<td class="fix_table">Thời gian đến </td>
			</tr>
			<tr>
				<td class="fix_table"><input type="time" name="dep_time" required></td>
				<td class="fix_table"><input type="time" name="arr_time" required></td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Số chỗ trong Hạng phổ thông</td>
				<td class="fix_table">Số chỗ trong Hạng thương gia</td>
			</tr>
			<tr>
				<td class="fix_table"><input type="number" name="seats_eco" required></td>
				<td class="fix_table"><input type="number"" name=" seats_bus" required></td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">Giá vé (Hạng phổ thông)</td>
				<td class="fix_table">Giá vé (Hạng thương gia)</td>
			</tr>
		</table>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">
					<input type="number" name="price_eco" required>
				</td>
				<td class="fix_table">
					<input type="number" name="price_bus" required>
				</td>
			</tr>
		</table>
		<br>
		<hr>
		<table cellpadding="5">
			<tr>
				<td class="fix_table">ID máy bay</td>
			</tr>
			<tr>
				<td class="fix_table">
					<input type="text" name="jet_id" required>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Tạo" name="Submit">
	</form>
	<!--check out addling local host in links and other places

		-->
</body>

</html>