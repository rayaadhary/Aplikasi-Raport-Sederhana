$('.hapus').on('click', function(e){
	e.preventDefault();
	var getLink = $(this).attr('href');

	Swal.fire({
	  title: 'Hapus Data?',
	  text: "Data akan dihapus permanen",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Hapus'
	}).then((result) => {
	  if (result.value) {
	    window.location.href = getLink;
	  }
	})
});


$('.tambah-data').on('click', function(e){
	e.preventDefault();
	var getLink = $(this).attr('href');

	Swal.fire({
		icon: 'success',
		title: 'Berhasil menambahkan data',
		showConfirmButton: false
	}).then((result) => {
	  if (result.value) {
	    window.location.href = getLink;
	  }
	})
});
