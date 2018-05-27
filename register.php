<!DOCTYPE html>
<?php include('registerverif.php') ?>
<html>
<head>
<meta charset="utf-8">
<title>Registration</title>
<link rel="stylesheet" href="css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<style type="text/css">
  html {
    background: black;
  }

  body {
    font-family: "Open Sans";
    font-size: 16px;
    color: White;
    font-smoothing: antialiased;
    font-weight: 600;
  }

  a {
    color: #BBB;
  }
</style>
<body>
<div class="content">
<h1>Registration</h1>
<form name="registration" action="register.php" method="post">
<div class="form_error" >
    <input type="text" name="username" placeholder="Username (alphanumeric)" required><br>
    <input type="password" name="password_1" placeholder="Password" required=><br>
    <input type="password" name="password_2" placeholder="Retype Password" required><br>
<input type="submit" name="reg_user" value="Register" />
</form>
Already have one? <a href="login.php">Login here.</a>
</div>
</body>
<script type="text/javascript">
    $("input[name='username'] ").focus(function (e) {
        if (!(e.which != 8 && e.which != 0 && ((e.which >= 48 && e.which <= 57)  || (e.which >= 65 && e.which <= 90) || (e.which >= 97 && e.which <= 122) ))) {
            event.preventDefault();
        }
    }).keyup(function (e) {
        if (!(e.which != 8 && e.which != 0 && ((e.which >= 48 && e.which <= 57)  || (e.which >= 65 && e.which <= 90) || (e.which >= 97 && e.which <= 122) ))) {
        event.preventDefault();
            }
    }).keypress(function (e) {
        if (!(e.which != 8 && e.which != 0 && ((e.which >= 48 && e.which <= 57)  || (e.which >= 65 && e.which <= 90) || (e.which >= 97 && e.which <= 122) ))) {
            event.preventDefault();
        }
    
    });
</script>

</html>