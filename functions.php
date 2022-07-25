<?php
define("DEVELOPMENT",TRUE);
function dbConnect(){
	$db=new mysqli("localhost","root","","raport");// Sesuaikan dengan konfigurasi server anda.
	return $db;
}

$con = dbConnect();


function bisa($con, $query)
{
    $db = mysqli_query($con, $query);

    if ($db) {
        return 1;
    } else {
        return 0;
    }
}

function getListPelajaran()
{
    $conn = dbConnect();
    if($conn->connect_errno==0){
		$res=$conn->query("SELECT * 
						 FROM mata_pelajaran
                         ORDER BY kd_mp");
		if($res){
			$data=$res->fetch_all(MYSQLI_ASSOC);
			$res->free();
			return $data;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}

function getListSiswa()
{
    $conn = dbConnect();
    if($conn->connect_errno==0){
		$res=$conn->query("SELECT * 
						 FROM siswa
                         ORDER BY nis");
		if($res){
			$data=$res->fetch_all(MYSQLI_ASSOC);
			$res->free();
			return $data;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}

function ambilsatubaris($conn, $query)
{
    $db = mysqli_query($conn, $query);
    return mysqli_fetch_assoc($db);
}

function hapus($where, $table, $con)
{
    $query = 'DELETE FROM ' . $table . ' WHERE ' . $where;
    echo $query;
}

// getListKategori digunakan untuk mengambil seluruh data dari tabel produk
function getListKategori(){
	$db=dbConnect();
	if($db->connect_errno==0){
		$res=$db->query("SELECT * 
						 FROM kategori
						 ORDER BY IdKategori");
		if($res){
			$data=$res->fetch_all(MYSQLI_ASSOC);
			$res->free();
			return $data;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}

// digunakan untuk mengambil data sebuah produk
function getDataProduk($IdProduk){
	$db=dbConnect();
	if($db->connect_errno==0){
		$res=$db->query("SELECT p.IdProduk,p.Nama,p.IdKategori,p.Skala,p.Pemasok,
								p.Deskripsi,p.Stok,p.HargaBeli,p.HargaJual,
								k.Nama NamaKategori,k.Keterangan KeteranganKategori
						 FROM produk p JOIN kategori k ON p.IdKategori=k.IdKategori
						 WHERE p.IdProduk='$IdProduk'");
		if($res){
			if($res->num_rows>0){
				$data=$res->fetch_assoc();
				$res->free();
				return $data;
			}
			else
				return FALSE;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}

function showError($message){
	?>
<div style="background-color:#FAEBD7;padding:10px;border:1px solid red;margin:15px 0px">
<?php echo $message;?>
</div>
	<?php
}
?>