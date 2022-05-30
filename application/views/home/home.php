<!-- Hero -->
<div class="row">
	<div class="col-12 text-center">
		<h5 class="mb-0">Temukan sayur segar pilihan yang ingin kamu inginkan</h5>
		<h1 class="display-4 my-0 font-weight-bold">Sayur Pilihan</h1>
	</div>
</div>
<hr class="my-5">
<!-- Pencarian -->
<div class="row justify-content-center mb-5">
	<div class="col-6">
		<form action="<?= base_url();?>" method="get" id="form-search">
			<div class="input-group input-group-lg input-group-rounded">
				<input type="text" class="form-control form-control-rounded" aria-label="Large" name="cari"
					aria-describedby="inputGroup-sizing-sm"
					placeholder="<?= $this->input->get('cari') ? $this->input->get('cari') : 'Masukkan kata kunci';?>">
				<?php if($this->input->get('cari')):?>
				<div class="input-group-append input-group-append-rounded">
					<span class="input-group-text input-group-text-rounded cursor" id="inputGroup-sizing-lg"
						onclick="resetSearch()"><i class="dripicons-trash"></i></span>
				</div>
				<?php else:?>
				<div class="input-group-append input-group-append-rounded">
					<span class="input-group-text input-group-text-rounded cursor" id="inputGroup-sizing-lg"
						onclick="submitSearch()"><i class="dripicons-search"></i></span>
				</div>
				<?php endif;?>
			</div>
		</form>
		<?php if($this->input->get('cari')):?>
		<span class="mt-5">Menemukan <?= count($sayur);?> sayur dari pencarian</span>
		<?php endif;?>
	</div>
</div>

<!-- Content -->
<div class="row justify-content-center">
	<?php if(empty($sayur)):?>
	<?php if($this->input->get('cari')):?>
	<h5 class="text-cente font-weight-normal">Tidak dapat menemukan sayur dengan kata kunci
		<b class="text-primary"><?= $this->input->get('cari');?></b></h5>
	<?php else:?>
	<h3 class="text-center">Belum ada sayur</h3>
	<?php endif;?>
	<?php else:?>
	<?php foreach($sayur as $val):?>
	<div class="col-lg-6 col-xl-3">

		<!-- Sayur card -->
		<div class="card">
			<div class="card-sayur">
				<img class="card-img-top img-fluid" src="<?= base_url();?><?= $val->gambar;?>" alt="Card image cap">
			</div>
			<?php if($this->session->userdata('logged_in') == false || !$this->session->userdata('logged_in')):?>
				<a href="<?= site_url('login');?>" class="btn btn-primary btn-sm waves-effect waves-light"
					data-toggle="tooltip" data-placement="top" title=""
					data-original-title="Sudah berada di wishlist anda"><i class="dripicons-bookmarks"></i> Tambahkan ke wishlist</a>
			<?php else:?>
			<button type="button" class="btn btn-primary btn-sm waves-effect waves-light"
				data-toggle="modal" data-target="#tambah-wishlist-<?= $val->id;?>"><i
					class="dripicons-bookmarks"></i>Tambahkan ke wishlist</button>
			<?php endif;?>
			<div class="card-body">
				<h4 class="card-title font-20 mt-0"><?= $val->sayur;?></h4>
				<p class="font-13 text-muted"><?= $val->keterangan;?></p>
				<hr>
				<h5 class="mb-0"><span class="h6">stok: <?= number_format($val->stok);?></span><span class="float-right pull-right">Rp. <?= number_format($val->harga);?></span></h5>
			</div>
		</div>

	</div><!-- end col -->

	<div id="tambah-wishlist-<?= $val->id;?>" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tambah wishlist</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body p-4">
					<form action="<?= site_url('home/tambah_wishlist');?>" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="<?= $val->id;?>" required>
						<p>Tambahkan <b><?= $val->sayur;?></b> kedalam wishlist anda, lengkapi data dibawah ini untuk
							melanjutkan</p>
						<div class="form-group">
							<label for="inputNamaSayur" class="input-label">Jumlah yang diinginkan <small
									class="text-danger">*</small></label>
							<div class="input-group">
								<input type="number" class="form-control" placeholder="Masukkan jumlah sayur"
									name="jumlah" required>
								<div class="input-group-append">
									<span class="input-group-text" id="inputGroup-sizing-lg">buah</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputKeteranganSayur" class="input-label">Tam bahkan catatan <small
									class="text-secondary">(optional)</small></label>
							<textarea class="form-control" name="keterangan" id="inputKeteranganSayur" name="catatan"
								rows="5"><?= $val->keterangan;?></textarea>
						</div>
						<div class="modal-footer px-0 mx-0">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
							<button type="submit" class="btn btn-primary">Tambahkan wishlist</button>
						</div>
					</form>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<?php endforeach;?>
	<?php endif;?>
</div>

<script>
	function submitSearch() {
		var form = document.getElementById("form-search");

		form.submit();
	}

	function resetSearch() {
		window.location.href = '<?= base_url();?>';
	}

</script>
