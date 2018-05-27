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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
</head>
<body>
	<div class="header">
		<h2><?php echo $_SESSION['username']; ?>'s Dragon Village</h2>
	</div>
	<div class="content">
		<div>
			<p>
				<?php lvCheck($con);
				staminaCheck($con);
				getInfo($con); ?>	
			</p>
		</div>
		<br>
			<p> <a href="arena.php">ARENA</a></p>
			<p> <a href="logout.php" style="color: red;">logout</a> </p>
			<form action="utility.php" method="post">
				<input type="hidden" <?php echo "value='".$_SESSION['username']."'"; ?>" name="u_id">
    			<button name="collect" value="collect">COLLECT YOUR GOLD REVENUE</button>
			</form>
			<form action="utility.php" method="post">
				<input type="hidden" <?php echo "value='".$_SESSION['username']."'"; ?>" name="u_id">
    			<button name="gacha" value="gacha">GACHA NOW! 100G</button>
			</form>
			<form action="utility.php" method="post">
				<input type="hidden" <?php echo "value='".$_SESSION['username']."'"; ?>" name="u_id">
				Buy Food (1 Food = 1 G) <input type="text" name="amount">
    			<button name="buyfood" value="buyfood">BUY FOOD!</button>
			</form>
			<br>
		<div class="">
			<p>Dragon Owned :<br>
				<h4>Element Picker</h5>
				<h5 id="e1" onclick="switches(1)"><i class="fa fa-tint" aria-hidden="true"></i>Water</h5>
				<h5 id="e2" onclick="switches(2)"><i class="fa fa-fire" aria-hidden="true"></i>Fire</h5>
				<h5 id="e3" onclick="switches(3)"><i class="fa fa-leaf" aria-hidden="true"></i>Wind</h5>
				<h5 id="e4" onclick="switches(4)"><i class="fa fa-paw" aria-hidden="true"></i>Earth</h5>
				<h5 id="e5" onclick="switches(5)"><i class="fa fa-bolt" aria-hidden="true"></i>Thunder</h5>
				<?php  getDragon($con); ?>
			</p>
			<br>
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