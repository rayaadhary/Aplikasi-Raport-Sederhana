
<?php

$tglsekarang = date('d-m-Y_Hi');

include_once('vendor/ifsnop/mysqldump-php/src/Ifsnop/Mysqldump/Mysqldump.php');
$dump = new Ifsnop\Mysqldump\Mysqldump('mysql:host=localhost;dbname=raport', 'root', '');
$dump->start('database/backup-'.$tglsekarang.'.sql');


if($dump){
    echo "Data berhasil tercadangkan disimpan dalam folder database";
    header('Location: index.php?msg=success');
}else
?>
