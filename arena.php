<?php 
	include('auth.php');
	include('db.php');
	include('utility.php')
?>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2><?php echo $_SESSION['username']; ?>'s Dragon Arena</h2>
	</div>
	<div class="content">
			<p> <a href="logout.php" style="color: red;">logout</a> </p>
		<div>
			<p>
				<?php getInfo($con); ?>	
			</p>
		</div>
		<br>
		<div class="">
			<p>Dragon Owned :<br>
				<?php  getDragon($con); ?>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript" href="script.js"></script>
</html>