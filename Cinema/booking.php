<!DOCTYPE html>
<html>
<?php 
        $id = $_GET['id'];
        $link = mysqli_connect("localhost", "root", "", "baza");

        $movieQuery = "SELECT * FROM movieTable WHERE movieID = $id"; 
        $movieImageById = mysqli_query($link,$movieQuery);
        $row = mysqli_fetch_array($movieImageById);
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <title>Book <?php echo $row['movieTitle']; ?> Now</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="background-color:#969696;">
    <div class="booking-panel">
    <div class="booking-panel-section booking-panel-section1">
</div>
        <div class="booking-panel-section booking-panel-section2">
        <i style="font-size:24px;color:black" class="fa fa-times-circle"  onclick="window.history.go(-2); return false;"> </i>
        </div>
        <div class="booking-panel-section booking-panel-section3">
            <div class="movie-box">
                <?php
                    echo '<img src="'.$row['movieImg'].'" alt="">';
                    ?>
            </div>
        </div>
        <div class="booking-panel-section booking-panel-section4">
            <div class="title"><?php echo $row['movieTitle']; ?></div>
            <div class="movie-information">
                <table>
                    <tr>
                        <td>ŽANR:</td>
                        <td><?php echo $row['movieGenre']; ?></td>
                    </tr>
                    <tr>
                        <td>TRAJANJE:</td>
                        <td><?php echo $row['movieDuration']; ?></td>
                    </tr>
                    <tr>
                        <td>DATUM IZLASKA:</td>
                        <td><?php echo $row['movieRelDate']; ?></td>
                    </tr>
                    <tr>
                        <td>REDATELJ:</td>
                        <td><?php echo $row['movieDirector']; ?></td>
                    </tr>
                    <tr>
                        <td>GLUMCI:</td>
                        <td><?php echo $row['movieActors']; ?></td>
                    </tr>
                </table>
            </div>
            <div class="booking-form-container">
                <form action="" method="POST">

                    <select name="theatre" required>
                        <option value="" disabled selected>DVORANA</option>
                        <option value="Velika">Velika</option>
                        <option value="VIP">VIP </option>
                        <option value="Mala">Mala</option>
                    </select>


                    <select name="type" required>
                        <option value="" disabled selected>TIP </option>
                        <option value="3d">3D</option>
                        <option value="2d">2D</option>
                        <option value="imax">IMAX</option>
                        <option value="4d">4D</option>
                    </select>

                    <select name="date" required>
                        <option value="" disabled selected>DATUM</option>
                        <option value="12-3">Ožujak 12,2020</option>
                        <option value="13-3">Ožujak 13,2020</option>
                        <option value="14-3">Ožujak 14,2020</option>
                        <option value="15-3">Ožujak 15,2020</option>
                        <option value="16-3">Ožujak 16,2020</option>
                    </select>

                    <select name="hour" required>
                        <option value="" disabled selected>VRIJEME</option>
                        <option value="09-00">09:00 AM</option>
                        <option value="12-00">12:00 AM</option>
                        <option value="15-00">03:00 PM</option>
                        <option value="18-00">06:00 PM</option>
                        <option value="21-00">09:00 PM</option>
                        <option value="24-00">12:00 PM</option>
                    </select>
                   

                    <input placeholder="Ime" type="text" name="fName" required>

                    <input placeholder="Prezime" type="text" name="lName">

                    <input placeholder="Broj mobitela" type="text" name="pNumber" required>

                    <button type="submit" value="submit" name="submit" class="form-btn"> Rezerviraj sjedalo </button>

                    <?php
                    $fNameErr = $pNumberErr= "";
                    $fName = $pNumber = "";
            
                    if(isset($_POST['submit'])){
                     
            
                        $fName = $_POST['fName'];
                        if (!preg_match('/^[a-zA-Z0-9\s]+$/', $fName)) {
                            $fNameErr = 'Name can only contain letters, numbers and white spaces';
                            echo "<script type='text/javascript'>alert('$fNameErr');</script>";
                        }   
            
                        $pNumber = $_POST['pNumber'];
                        if (preg_match("/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/", $pNumber)) {
                            $pNumberErr = 'Phone Number can only contain numbers and white spaces';
                            echo "<script type='text/javascript'>alert('$pNumberErr');</script>";
                        } 
                        
                        $insert_query = "INSERT INTO 
                        bookingTable (  movieName,
                                        bookingTheatre,
                                        bookingType,
                                        bookingDate,
                                        bookingTime,
                                        bookingFName,
                                        bookingLName,
                                        bookingPNumber)
                        VALUES (        '".$row['movieTitle']."',
                                        '".$_POST["theatre"]."',
                                        '".$_POST["type"]."',
                                        '".$_POST["date"]."',
                                        '".$_POST["hour"]."',
                                        '".$_POST["fName"]."',
                                        '".$_POST["lName"]."',
                                        '".$_POST["pNumber"]."')";
                        mysqli_query($link,$insert_query);
                        if ($insert_query == TRUE){
                            $last_id = $link->insert_id;
                            echo "Uspjesno ste rezervirali.Vaš broj rezervacije je: " . $last_id;
                            echo "<br>Ako ne dođete pola sata ranije , vaša rezervacija bit će poništena.";
                        }
                        }
                    ?>
                </form>
            </div>
        </div>
    </div>

    <script src="scripts/jquery-3.3.1.min.js "></script>
    <script src="scripts/script.js "></script>
   
</body>
   

</html>