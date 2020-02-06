<?php
   session_start();
   session_destroy();
   unset($_SESSION['emailp']);
   $_SESSION['message'] = "Odjavljeni ste!";
   header('location: login.php');
?>