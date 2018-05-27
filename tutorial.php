<?php 
	include('auth.php');
	include('db.php');
	include('utility.php')
?>
<!DOCTYPE html>
<html>
<head>
	<title>Tutorial</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
</head>
<body>
	<div class="header">
		<h2><?php echo $_SESSION['username']; ?>'s Tutorial Time!</h2>
	</div>
	<div class="content">
		<div>
			<p>
				<?php getInfo($con); ?>	
			</p>
		</div>
			<p> <a href="index.php">HOME</a></p>
			<p> <a href="logout.php" style="color: red;">logout</a> </p>
		<br>
		<div class="text" style="margin: auto;width: 70%;">
			<p><ol>
				<li>COLLECT GOLD</li>
				<li>BUY FOOD</li>
				<li>FEED YOUR DRAGON TO LEVEL UP</li>
				<li>BATTLE AGAINST OTHER PLAYER</li>
				<li>PROFIT</li>
			</ol></p>
		</div>
	</div>
</body>

</html>