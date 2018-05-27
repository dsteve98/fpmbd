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

if(isset($_POST['feed'])){

	$uname = $_POST['u_id'];
	$k_id = $_POST['k_id'];
	$query = mysqli_query($con,"CALL sp_feed('$uname','$k_id')");
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

if(isset($_POST['set1'])){

	$uname = $_POST['u_id'];
	$k_id = $_POST['k_id'];
	$query = mysqli_query($con,"CALL sp_set1('$uname','$k_id')");
	$con->next_result();
	header("Location: arena.php");
}
if(isset($_POST['set2'])){

	$uname = $_POST['u_id'];
	$k_id = $_POST['k_id'];
	$query = mysqli_query($con,"CALL sp_set2('$uname','$k_id')");
	$con->next_result();
	header("Location: arena.php");
}
if(isset($_POST['set3'])){

	$uname = $_POST['u_id'];
	$k_id = $_POST['k_id'];
	$query = mysqli_query($con,"CALL sp_set3('$uname','$k_id')");
	$con->next_result();
	header("Location: arena.php");
}

if(isset($_POST['battle'])){
	$uname = $_POST['u_id'];
	$opname = $_POST['op_id'];
	$query = mysqli_query($con,"CALL sp_battle('$uname','$opname')");
	$con->next_result();
	header("Location: arena.php");
}

function getInfo($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_showresource('$uname')") or die("Query fail: " . mysqli_error($db));
	$row = mysqli_fetch_assoc($query);
	echo "Total Menang : ".$row["totalmenang"]."<br>Gold : " .$row["gold"]. "<br>Food : " .$row["food"]. "<br>Stamina : " .$row["stamina"]. "/20 ";
	$db->next_result();
}


function getDragon($db){
	$uname = $_SESSION['username'];
	$query2 = mysqli_query($db,"CALL sp_dragown('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
		 echo "<table class='dragonlist' border='1'>
  				<tr>
    				<th>Nama Naga</th>
    				<th>Level</th>
    				<th>Upgrade</th>
    				<th>Sell</th>
  				</tr> ";
		while($row2 = mysqli_fetch_assoc($query2)){
			echo "<tr class='".$row2["naga_elemen"]."'><td>" .$row2["naga_nama"]. "</td><td>" .$row2["naga_level"]. "</td>
			<td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Feed' name='feed'>
			</form>
			</td>
			<td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Sell' name='sellsubmit'>
			</form>
			</td></tr>";
		}
		echo "</table><br>";
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
    				<th>Level</th>
    				<th>Deploy 1</th>
    				<th>Deploy 2</th>
    				<th>Deploy 3</th>
  				</tr> ";
		while($row2 = mysqli_fetch_assoc($query2)){
			echo "<tr class='".$row2["naga_elemen"]."'><td>" .$row2["naga_nama"]. "</td><td>" .$row2["naga_level"]. "</td>
			<td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Set' name='set1'>
			</form>
			</td>
			<td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Set' name='set2'>
			</form>
			</td>
			<td>
			<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$row2["kepunyaan_id"]."'' name='k_id'>
    			<input type='submit' value='Set' name='set3'>
			</form>
			</td>
			</tr>";
		}
		echo "</table><br>";
	}
	else echo "No Dragon";	
	$db->next_result();
}

function getEnemy($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_findfoe('$uname')") or die("Query fail: " . mysqli_error($db));
	$row = mysqli_fetch_assoc($query);
	$opname = $row["player_id"];
	echo "<br>Upcoming Enemy = ".$opname."<br><a href='arena.php'>Change Opponent</a><br><table class='dragonlist' border='1'>
				<tr>
    				<th>Nama Naga</th>
    				<th>Level</th>
    				<th>Deploy</th>
  				</tr>";
	$db->next_result();
	$query1 = mysqli_query($db,"CALL sp_detail1('$opname')") or die("Query fail: " . mysqli_error($db));
 	if(mysqli_num_rows($query1) > 0) {
 		$row1 = mysqli_fetch_assoc($query1);
		echo	"<tr>
    				<td>".$row1["naga_nama"]."</td>
    				<td>".$row1["naga_level"]."</td>
    				<td>1</td>
  				</tr>";
	}
	$db->next_result();
	$query2 = mysqli_query($db,"CALL sp_detail2('$opname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
 		$row2 = mysqli_fetch_assoc($query2);
		echo	"<tr>
    				<td>".$row2["naga_nama"]."</td>
    				<td>".$row2["naga_level"]."</td>
    				<td>2</td>
  				</tr>";
	}
	$db->next_result();
	$query3 = mysqli_query($db,"CALL sp_detail3('$opname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query3) > 0) {
 		$row3 = mysqli_fetch_assoc($query3);
		echo	"<tr>
    				<td>".$row2["naga_nama"]."</td>
    				<td>".$row2["naga_level"]."</td>
    				<td>3</td>
  				</tr>";
	}
	$db->next_result();
  	echo "</table>";
  	echo "<form action='utility.php' method='post'>
				<input type='hidden' value='".$_SESSION['username']."'' name='u_id'>
				<input type='hidden' value='".$opname."'' name='op_id'>
    			<input type='submit' value='BATTLE' name='battle'>
			</form>";
}

function getDeploy($db){
	$uname = $_SESSION['username'];
	
	echo "<br> Your Deployment<br><table class='dragonlist' border='1'>
				<tr>
    				<th>Nama Naga</th>
    				<th>Level</th>
    				<th>Deploy ke</th>
  				</tr>";
	$query1 = mysqli_query($db,"CALL sp_detail1('$uname')") or die("Query fail: " . mysqli_error($db));
 	if(mysqli_num_rows($query1) > 0) {
 		$row1 = mysqli_fetch_assoc($query1);
		echo	"<tr>
    				<td>".$row1["naga_nama"]."</td>
    				<td>".$row1["naga_level"]."</td>
    				<td>1</td>
  				</tr>";
	}
	$db->next_result();
	$query2 = mysqli_query($db,"CALL sp_detail2('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
 		$row2 = mysqli_fetch_assoc($query2);
		echo	"<tr>
    				<td>".$row2["naga_nama"]."</td>
    				<td>".$row2["naga_level"]."</td>
    				<td>2</td>
  				</tr>";
	}
	$db->next_result();
	$query3 = mysqli_query($db,"CALL sp_detail3('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query3) > 0) {
 		$row3 = mysqli_fetch_assoc($query3);
		echo	"<tr>
    				<td>".$row2["naga_nama"]."</td>
    				<td>".$row2["naga_level"]."</td>
    				<td>3</td>
  				</tr>";
	}
	$db->next_result();
  	echo "</table>";
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