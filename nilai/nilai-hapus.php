<?php
include_once("../functions.php");

$nis = $_GET['nis'];

$query = mysqli_query($con,"SELECT * FROM nilai where nis='$nis'");

$data = mysqli_fetch_array($query);
$kd_mp = $data['kd_mp'];

$execute = bisa($con, "DELETE FROM nilai WHERE nis='$nis' AND kd_mp=$kd_mp");

if($execute == 1){
    header('location: nilai.php');
}
else
echo "Gagal menghapus data";
?>