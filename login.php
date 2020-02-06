<?php 
include "config.php";
?>
<!DOCTYPE html>
<html>
<head>
    <title> Prijava korisnika i registracija</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="login.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <?php 
    $error_message = "";
    $success_message = "";
    
if(isset($_POST['btnreg'])){
   $ime = trim($_POST['ime']);
   $prezime = trim($_POST['prezime']);
   $email = trim($_POST['email']);
   $lozinka = trim($_POST['lozinka']);

   $isValid = true;

   // Check fields are empty or not
   if($ime == '' || $prezime == '' || $email == '' || $lozinka == '' ){
    $isValid = false;
    $error_message = "Molimo popuni sva polja.";
  }

  // Check if Email-ID is valid or not
  if ($isValid && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $isValid = false;
    $error_message = "Email nije dobar.";
  }

  if($isValid){

    // Check if Email-ID already exists
    $stmt = $con->prepare("SELECT * FROM korisnik WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    if($result->num_rows > 0){
      $isValid = false;
      $error_message = "Taj email već postoji..";
    }

  }

  // Insert records
  if($isValid){
    $insertSQL = "INSERT INTO korisnik(ime,prezime,email,lozinka ) values(?,?,?,?)";
    $stmt = $con->prepare($insertSQL);
    $stmt->bind_param("ssss",$ime,$prezime,$email,$lozinka);
    $stmt->execute();
    $stmt->close();

    $success_message = "Vaš račun je uspješno napravljen!";
  }
}
   ?>
   <?php
   
include "config.php";


if(isset($_POST['btnprijava'])){

    $uname = mysqli_real_escape_string($con,$_POST['emailp']);
    $password = mysqli_real_escape_string($con,$_POST['lozinkap']);

    
    if ($uname != "" && $password != ""){

        $sql_query = "select count(*) as cntUser from korisnik where email='".$uname."' and lozinka='".$password."'";
        $result = mysqli_query($con,$sql_query);
        $row = mysqli_fetch_array($result);

        $count = $row['cntUser'];

        if($count > 0){
            $_SESSION['emailp'] = $uname;
            header('Location: index.php');
        }else{
           $upozorenje = "Nevažeći email ili lozinka";
           echo $upozorenje;
        }

    }

}
?>

</head>
<body>
<div class="naslov"> 
<IMG SRC="img/kinostar.png" ALT="some text" WIDTH=200 HEIGHT=110>
<h3> <br>Dobro došli u KinoStar </h3> <br>
<h4> .................. NAŠ SVIJET KINA ................... </h4>
</div>
<div class="naslov2"> <h5><br>Za rezervaciju vašeg omiljenog mjesta u kinu prijavite se na našu stranicu. </h5></div>
<div class="container" >
<div class="login-box">
<div class="row" >
    <div class="col-md-6 login-left">
        <form action="" method="POST">
        <h2> Prijavi se </h2>
             <div class="form-group">
                <label> Email </label>
                <input type="text" name="emailp" class="form-control" required>
             </div>
             <div class="form-group">
                <label> Lozinka </label>
                <input type="password" name="lozinkap" class="form-control" required>
             </div>
             <button type="submit" name="btnprijava" class="btn btn-primary"> Prijava </button>
        </form>
    
    </div>
    <div class="col-md-6 login-right" >
         <form action="" method="POST">
         <h2> Registriraj se </h2>
         <?php 
            // Display Error message
            if(!empty($error_message)){
            ?>
            <div class="alert alert-danger">
              <strong>Greška!</strong> <?= $error_message ?>
            </div>

            <?php
            }
            ?>

            <?php 
            // Display Success message
            if(!empty($success_message)){
            ?>
            <div class="alert alert-success">
              <strong>Uspjeh!</strong> <?= $success_message ?>
            </div>

            <?php
            }
            ?>
             <div class="form-group">
                <label for="ime"> Ime </label>
                <input type="text" name="ime" id="ime" class="form-control" required>
             </div>
             <div class="form-group">
                <label for="prezime"> Prezime </label>
                <input type="text" name="prezime" id="prezime" class="form-control" required>
             </div>
            <div class="form-group">
                <label for="email"> Email </label>
                <input type="text" name="email" id="email" class="form-control" required>
             </div>
             <div class="form-group">
                <label for="lozinka"> Lozinka </label>
                <input type="password" name="lozinka" id="lozinka" class="form-control" required>
             </div>
             <button type="submit" name="btnreg" class="btn btn-primary"> Registracija </button>
        </form>
    </div>
</div>
</body>
</html>