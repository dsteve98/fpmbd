<?php

require('db.php');
if (isset($_POST['reg_user'])) {
    // receive all input values from the form
    $username = mysqli_real_escape_string($con, $_POST['username']);
    $password_1 = mysqli_real_escape_string($con, $_POST['password_1']);
    $password_2 = mysqli_real_escape_string($con, $_POST['password_2']);

    // form validation: ensure that the form is correctly filled
    if (empty($username)) { array_push($errors, "Username is required."); }
    if (empty($password_1)) { array_push($errors, "Password is required."); }

    if ($password_1 != $password_2) {
      array_push($errors, "The two passwords do not match.");
    }

    $query = mysqli_query($con,"CALL sp_daftar('$username','$password_1')");
    $row = mysqli_fetch_row($query);
    if($row[0] == -1){
          array_push($errors, $row[1]);
    }

    // register user if there are no errors in the form
    if (count($errors) == 0) {
      $_SESSION['username'] = $username;
      $_SESSION['success'] = "You are now logged in";
      $_SESSION['LAST_ACTIVITY'] = time();
      header('location: index.php');
    }

  }
?>
