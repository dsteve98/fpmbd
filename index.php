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
		<h2><?php echo $_SESSION['username']; ?>'s Dragon Village</h2>
	</div>
	<div class="content">
			<p> <a href="arena.php">ARENA</a></p>
			<p> <a href="logout.php" style="color: red;">logout</a> </p>
		<div>
			<p>
				<?php lvCheck($con);
				staminaCheck($con);
				getInfo($con); ?>	
			</p>
		</div>
		<br>
		<div class="">
			<p>Dragon Owned :<br>
				<h4>Element Picker</h5>
				<h5 id="e1" onclick="switches(1)">Water</h5>
				<h5 id="e2" onclick="switches(2)">Fire</h5>
				<h5 id="e3" onclick="switches(3)">Wind</h5>
				<h5 id="e4" onclick="switches(4)">Earth</h5>
				<h5 id="e5" onclick="switches(5)">Thunder</h5>
				<?php  getDragon($con); ?>
			</p>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function switches(el){
	$('.1').css("display","none");
	$('.2').css("display","none");
	$('.3').css("display","none");
	$('.4').css("display","none");
	$('.5').css("display","none");
	$("."+el).fadeIn(1500);
}
</script>
</html>