<?php 
function getInfo($db){
	$uname = $_SESSION['username'];
	$query = mysqli_query($db,"CALL sp_showresource('$uname')") or die("Query fail: " . mysqli_error());
	$row = mysqli_fetch_assoc($query);
	echo "gold : " .$row["gold"]. "<br>food : " .$row["food"]. "<br>stamina : " .$row["stamina"]. "/20 ";
}


function getDragon($db){
	$uname = $_SESSION['username'];

	$db->next_result();
	$query2 = mysqli_query($db,"CALL sp_dragown('$uname')") or die("Query fail: " . mysqli_error($db));
	if(mysqli_num_rows($query2) > 0) {
		 echo "<table style='width:50%'>
  				<tr>
    				<th>Nama Naga</th>
    				<th>Level Naga</th>
  				</tr> ";
		while($row2 = mysqli_fetch_assoc($query2)){
			echo "<tr class='".$row2["naga_elemen"]."'><td>" .$row2["naga_nama"]. "</td><td>" .$row2["naga_level"]. "</td></tr>";
		}
		echo "</table>";
	}
	else echo "No Dragon";	
}

?>