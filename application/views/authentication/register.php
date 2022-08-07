<div class="card">
    <div class="card-header">
        <h5 class="card-header-title">Daftarkan akun anda</h5>
    </div>
    <div class="card-body">

        <div class="text-center m-b-15">
            <a href="<?= base_url();?>" class="logo logo-admin"><img src="<?= base_url();?>assets/images/logo.png" height="50" alt="logo"></a>
        </div>

        <div class="p-3">
            <form class="form-horizontal" action="<?= site_url('register/proses_daftar');?>" method="post">

                <div class="form-group row">
                    <div class="col-12">
                        <input class="form-control" type="text" name="nama" required placeholder="Nama lengkap">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12">
                        <input class="form-control" type="text" name="no_telp" required placeholder="Nomor telepon">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12">
                        <textarea class="form-control" type="text" name="alamat" required placeholder="Alamat lengkap"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12">
                        <input class="form-control" type="email" name="email" required placeholder="Email">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12">
                        <input class="form-control" type="password" name="password" required placeholder="Password">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12">
                        <input class="form-control" type="password" name="password_conf" required placeholder="Konfirmasi Password">
                    </div>
                </div>

                <div class="form-group text-center row m-t-20">
                    <div class="col-12">
                        <button class="btn btn-danger btn-block waves-effect waves-light" type="submit" id="send-button">Daftar</button>
                    </div>
                </div>

                <div class="form-group m-t-10 mb-0 row">
                    <div class="col-12 m-t-20 text-center">
                        Sudah punya akun? <a href="<?= site_url('login');?>" class="text-muted">Masuk sekarang</a>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>