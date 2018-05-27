<?php 
include('db.php');
if(isset($_POST['collect'])){
	$uname = $_POST['u_id'];
	$query = mysqli_query($con,"CALL sp_collectgold('$uname')");
	$con->next_result();
	header("Location: index.php");
}

if(isset($_POST['buyfood'])){
	$uname = $_POST['u_id'];
	$a = $_POST['amount'];
	$query = mysqli_query($con,"CALL sp_buyfood('$uname','$a')");
	$con->next_result();
	header("Location: index.php");
}

if(isset($_POST['sellsubmit'])){

	$uname = $_POST['u_id'];
	$k_id = $_POST['k_id'];
	$query = mysqli_query($con,"CALL sp_selldragon('$uname','$k_id')");
	$con->next_result();
	header("Location: index.php");
}

if(isset($_POST['gacha'])){
	$uname = $_POST['u_id'];
	$query = mysqli_query($con,"CALL sp_normalgacha('$uname')");
	$con->next_result();
	header("Location: index.php");
}

function getInfo($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_showresource('$uname')") or die("Query fail: " . mysqli_error($db));
	$row = mysqli_fetch_assoc($query);
	echo "Gold : " .$row["gold"]. "<br>Food : " .$row["food"]. "<br>Stamina : " .$row["stamina"]. "/20 ";
	$db->next_result();
}


function getDragon($db){
	$uname = $_SESSION['username'];

	$db->next_result();
	$query2 = mysqli_query($db,"CALL sp_dragown('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
		 echo "<table class='dragonlist' border='1'>
  				<tr>
    				<th>Nama Naga</th>
    				<th>Level Naga</th>
    				<th>Upgrade</th>
    				<th>Sell</th>
  				</tr> ";
		while($row2 = mysqli_fetch_assoc($query2)){
			echo "<tr class='".$row2["naga_elemen"]."'><td>" .$row2["naga_nama"]. "</td><td>" .$row2["naga_level"]. "</td><td>Feed</td><td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Sell' name='sellsubmit'>
			</form>
			</td></tr>";
		}
		echo "</table>";
	}
	else echo "No Dragon";	
	$db->next_result();
}

function getDragonArena($db){
	$uname = $_SESSION['username'];

	$db->next_result();
	$query2 = mysqli_query($db,"CALL sp_dragown('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
		 echo "<table class='dragonlist' border='1'>
  				<tr>
    				<th>Nama Naga</th>
    				<th>Level Naga</th>
    				<th>Deploy 1</th>
    				<th>Deploy 2</th>
    				<th>Deploy 3</th>
  				</tr> ";
		while($row2 = mysqli_fetch_assoc($query2)){
			echo "<tr class='".$row2["naga_elemen"]."'><td>" .$row2["naga_nama"]. "</td><td>" .$row2["naga_level"]. "</td><td>Feed</td><td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Sell' name='sellsubmit'>
			</form>
			</td></tr>";
		}
		echo "</table>";
	}
	else echo "No Dragon";	
	$db->next_result();
}

function lvCheck($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_growthcheck()") or die("Query fail: " . mysqli_error($db));
	$db->next_result();
}

function staminaCheck($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_claimstamina('$uname')") or die("Query fail: " . mysqli_error($db));
	$db->next_result();
}


?>