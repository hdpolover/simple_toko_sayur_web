<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Authentication extends CI_Controller
{

    // Construct
    public function __construct()
    {
        parent::__construct();

        // LOAD MODEL MASUK
        $this->load->model('M_auth');
    }

    // MAIN
    public function index()
    {
        if ($this->session->userdata('logged_in') == true || $this->session->userdata('logged_in')) {
            $this->session->set_flashdata('warning', 'Berhasil masuk ke akun.');
            redirect(site_url('home'));
        } else {
            if ($this->input->get('act') == "account-activated") {
                $this->session->set_flashdata('success', 'Berhasil aktivasi akun, silahkan login kedalam akun anda.');
            }
            $this->templateauth->view('authentication/login');
        }
    }

    public function blocked()
    {
        $this->templateauth->view('authentication/blocked');
    }

    public function password_hash()
    {
        echo password_hash("12341234", PASSWORD_DEFAULT);
    }

    public function proses_login()
    {
        // ambil inputan dari view
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        // cek apakah data user ada, berdasarkan email yang dimasukkan
        if ($this->M_auth->cek_user($email) == true) {
            // ambil data user, menjadi array
            $user = $this->M_auth->get_user($email);

            // cek apakah password yang dimasukkan sama dengan database
            if (password_verify($password, $user->password)) {

                // simpan data user yang login kedalam session
                $session_data = array(
                    'user_id' => $user->user_id,
                    'nama' => $user->nama,
                    'email' => $user->email,
                    'no_telp' => $user->no_telp,
                    'role'      => $user->role,
                    'logged_in' => true,
                    'otp' => true,
                );

                $this->session->set_userdata($session_data);

                // cek aktivasi
                if ($user->status == 0) {
                    $this->session->set_flashdata('warning', "Harap melakukan aktivasi akun terlebih dahulu!");
                    redirect(site_url('aktivasi-akun'));
                } else {
                    if ($this->session->userdata('redirect')) {
                        $this->session->set_flashdata('success', 'Anda telah masuk. Silahkan melanjutkan aktivitas anda!');
                        redirect($this->session->userdata('redirect'));
                    } else {
                        if($user->role == 1){
                            $this->session->set_flashdata('success', "Selamat datang admin!");
                            redirect(site_url('admin'));
                        }else{
                            $this->session->set_flashdata('success', "Selamat datang!");
                            redirect(site_url('home'));
                        }
                    }
                }
            } else {
                $this->session->set_flashdata('warning', "Mohon maaf. Password yang Anda masukkan salah!");
                redirect(site_url('login'));
            }
        } else {
            $this->session->set_flashdata('error', "Mohon maaf. Akun tidak terdaftar!");
            redirect(site_url('login'));
        }
    }

    // OTP PROCCESS
    public function otp_send()
    {
        if ($this->session->userdata('logged_in') == false || !$this->session->userdata('logged_in')) {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun Anda untuk melanjutkan!");
            redirect('login');
        } else {
            // OTP Check
            if ($this->session->userdata('otp') == false || !$this->session->userdata('otp')) {
                $this->templateauth->view('authentication/otp_send');
            } else {
                $this->session->set_flashdata('warning', "Anda telah melakukan proses OTP !");
                redirect(site_url('home'));
            }
        }
    }

    public function verifikasi_otp()
    {
        if ($this->session->userdata('logged_in') == false || !$this->session->userdata('logged_in')) {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun Anda untuk melanjutkan!");
            redirect('login');
        } else {
            // OTP Check
            if ($this->session->userdata('otp') == false || !$this->session->userdata('otp')) {
                $this->templateauth->view('authentication/otp_login');
            } else {
                $this->session->set_flashdata('warning', "Anda telah melakukan proses OTP !");
                redirect(site_url('home'));
            }
        }
    }


    public function proses_verifikasiOtp()
    {
        if ($this->session->userdata('logged_in') == true || $this->session->userdata('logged_in')) {
            $kode_otp = htmlspecialchars($this->input->post('kode_otp'), true);
            $data_otp = $this->M_auth->get_dataOTP($this->session->userdata('user_id'));
            // cek apakah waktu token valid kurang dari 1 menit
            if (time() - $data_otp->expired_otp < (60)) {
                if ($this->M_auth->cekOtp_kode(str_replace('-', '', $kode_otp), $this->session->userdata('user_id')) == true) {

                    // simpan data user yang login kedalam session
                    $session_data = array(
                        'otp' => true,
                    );

                    $this->session->set_userdata($session_data);

                    $this->session->set_flashdata('success', "Berhasil verifikasi OTP. Selamat datang!");
                    redirect(site_url('home'));
                } else {
                    $this->session->set_flashdata('error', 'Kode yang anda masukkan salah. Cek kembali email anda!');
                    redirect($this->agent->referrer());
                }
            } else {
                $this->session->set_flashdata('error', 'Anda telah melewati batas waktu OTP, harap mengulang proses OTP. ');
                redirect(site_url('otp'));
            }
        } else {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->unset_userdata('redirect');
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun Anda untuk melanjutkan!");
            redirect('login');
        }
    }

    public function send_otp_email()
    {
        if ($this->session->userdata('logged_in') == true || $this->session->userdata('logged_in')) {
            $email = htmlspecialchars($this->session->userdata('email'), true);

            if ($this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true)) == false) {
                $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengambil data anda !!');
                redirect(site_url('login'));
            } else {

                // create & save OTP (must call every proccess)
                if ($this->M_auth->create_otp($this->session->userdata('user_id')) == true) {
                    $aktivasi = $this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true));

                    if ($aktivasi->status != 0) {
                        $subject = "KODE OTP";
                        $message = "Hai {$this->session->userdata('nama')}, nomor OTPmu adalah: <b>{$this->encryption->decrypt($aktivasi->otp)}</b>. Jangan bagikan ke siapapun.<br> Kode ini hanya aktif selama 1 menit.";

                        if ($this->send_email($email, $subject, $message) == true) {
                            $this->session->set_flashdata('success', 'Berhasil mengirimkan kode OTP ke email Anda. Harap cek kotak masuk atau folder spam Anda!');
                            redirect(site_url('verifikasi-otp'));
                        } else {
                            $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengirimkan pesan ke email anda !');
                            redirect(site_url('otp'));
                        }
                    } else {
                        $this->session->set_flashdata('warning', 'Harap aktivasi akun anda terlebih dahulu !');
                        redirect(site_url('aktivasi-akun'));
                    }
                } else {
                    $this->session->set_flashdata('error', 'Terjadi kesalahan saat membuat kode OTP anda !');
                    redirect(site_url('otp'));
                }
            }
        } else {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->unset_userdata('redirect');
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun anda, untuk melanjutkan");
            redirect('login');
        }
    }

    // RECOVERY PROCESS
    public function lupa_password()
    {
        $this->templateauth->view('authentication/lupa_password');
    }

    public function ubah_password($email = null)
    {
        if ($this->M_auth->cek_user($email) == true) {
            $user = $this->M_auth->get_user($email);

            $data['user_id'] = $user->user_id;
            $data['email'] = $email;

            $this->templateauth->view('authentication/ubah_password', $data);
        } else {
            $this->session->set_flashdata('error', 'Tidak dapat menemukan akun dengan email tersebut !');
            redirect(site_url('login'));
        }
    }

    public function proses_lupa()
    {
        $email = $this->input->post('email');

        if ($this->M_auth->cek_user($email) == true) {
            $user = $this->M_auth->get_user($email);

            $subject = "Pemulihan password - {$user->email}";
            $message = "Hai, {$user->nama}. Kami mendapatkan permintaan pemulihan password atas nama email <b>{$user->email}</b>.<br>Harap klik link berikut ini untuk memulihkan password anda, atau abaikan email ini jika anda tidak merasa melakukan proses pemulihan akun.<br><br><b><i>" . base_url() . "recovery-password/{$email}</i></b>";

            if ($this->send_email($email, $subject, $message)) {
                $this->session->set_flashdata('success', "Berhasil mengirim link pemulihan password anda, harap cek email anda !");
                redirect($this->agent->referrer());
            } else {
                $this->session->set_flashdata('error', "Terjadi kesalahan, saat mengirimkan email pemulihan password, coba lagi nanti !");
                redirect($this->agent->referrer());
            }
        } else {
            $this->session->set_flashdata('warning', "Tidak dapat menemukan akun atas nama email {$email}. Pastikan email tersebut telah terdaftar diwebsite kami !");
            redirect($this->agent->referrer());
        }
    }

    public function proses_ubahPassword()
    {
        $user_id = $this->input->post('user_id');
        $password = $this->input->post('password');
        $password_conf = $this->input->post('password_conf');

        if ($password == $password_conf) {
            $data_user = array(
                'password' => password_hash($password, PASSWORD_DEFAULT)
            );
            $where = array('user_id' => $user_id);
            $user = $this->M_auth->get_userByID($user_id);

            if ($this->M_auth->update_password($data_user, $where)) {
                $now = date("d F Y - H:i");

                $subject = "Perubahan password - {$user->email}";
                $message = "Hai, {$user->nama} password kamu telah dirubah, pada {$now}. Harap hubungi admin jika ini bukan anda atau abaikan email ini.</br></br></br></br>";

                $this->send_email($user->email, $subject, $message);

                $this->session->set_flashdata('success', "Berhasil merubah password anda, harap login untuk melanjutkan !");
                redirect(site_url('login'));
            } else {
                $this->session->set_flashdata('error', "Terjadi kesalahan, saat mengubah password anda, coba lagi nanti !");
                redirect($this->agent->referrer());
            }
        } else {
            $this->session->set_flashdata('warning', "Password yang anda masukkan tidak sama, harap coba lagi !");
            redirect($this->agent->referrer());
        }
    }

    // ACTIVATION ACCOUNT PROCCESS
    public function aktivasi_email()
    {
        if ($this->session->userdata('logged_in') == true) {
            $email = htmlspecialchars($this->session->userdata('email'), true);

            if ($this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true)) == false) {
                $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengambil data anda !!');
                redirect(site_url('login'));
            } else {
                $aktivasi = $this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true));

                if ($aktivasi->status == 0) {
                    $subject = "KODE AKTIVASI AKUN";
                    $message = "Kode aktivasi anda: <br><br><center><b style'font-size: 50px;'>{$this->encryption->decrypt($aktivasi->aktivasi)}</b></center><br><br>";

                    if ($this->send_email($email, $subject, $message) == true) {
                        $data['mail'] = $email;
                        $data['kode_aktivasi'] = $this->encryption->decrypt($aktivasi->aktivasi);
                        $this->templateauth->view('authentication/aktivasi', $data);
                    } else {
                        $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengirimkan pesan ke email anda !!');
                        redirect(site_url('aktivasi-akun'));
                    }
                } else {
                    $this->session->set_flashdata('error', 'Anda telah mengaktivasi akun anda !!');
                    redirect(site_url('home'));
                }
            }
        } else {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->unset_userdata('redirect');
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun anda, untuk melanjutkan");
            redirect('login');
        }
    }

    public function waiting()
    {
        if ($this->session->userdata('logged_in') == true || $this->session->userdata('logged_in')) {
            $email = htmlspecialchars($this->session->userdata('email'), true);

            if ($this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true)) == false) {
                $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengambil data anda !!');
                redirect(site_url('login'));
            } else {
                $aktivasi = $this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true));

                if ($aktivasi->status == 0) {
                    $subject = "KODE AKTIVASI AKUN";
                    $message = "Kode aktivasi anda <b style='font-size:50px'>{$this->encryption->decrypt($aktivasi->aktivasi)}</b></br>";

                    if ($this->send_email($email, $subject, $message) == true) {
                        $data['mail'] = $email;
                        $this->templateauth->view('authentication/aktivasi_tunggu', $data);
                    } else {
                        $this->session->set_flashdata('error', 'Terjadi kesalahan saat mengirimkan pesan ke email anda !!');
                        redirect(site_url('aktivasi-akun'));
                    }
                } else {
                    redirect('home');
                }
            }
        } else {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->unset_userdata('redirect');
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun anda, untuk melanjutkan");
            redirect('login');
        }
    }

    public function aktivasi_akun()
    {
        if ($this->session->userdata('logged_in') == true || $this->session->userdata('logged_in')) {
            $kode_aktivasi = htmlspecialchars($this->input->post('kode_aktivasi'), true);
            $aktivasi = $this->M_auth->get_aktivasi(htmlspecialchars($this->session->userdata('user_id'), true), true);

            if ($this->M_auth->aktivasi_kode(str_replace('-', '', $kode_aktivasi), $this->session->userdata('user_id')) == true) {
                if ($this->M_auth->aktivasi_akun($this->session->userdata('user_id')) == true) {

                    // $this->session->set_flashdata('success', 'Berhasil aktivasi akun !!');
                    // redirect('home');

                    // SESS DESTROY
                    $user_data = $this->session->all_userdata();

                    foreach ($user_data as $key => $value) {
                        if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
                            $this->session->unset_userdata($key);
                        }
                    }

                    $this->session->sess_destroy();

                    // SUCCESS
                    redirect(site_url('login?act=account-activated'));
                } else {
                    $this->session->set_flashdata('error', 'Terjadi kesalahan saat mencoba meng-aktivasi akun anda !!');
                    redirect($this->agent->referrer());
                }
            } else {
                $this->session->set_flashdata('error', 'Kode yang anda masukkan salah, cek kembali email anda !!');
                redirect($this->agent->referrer());
            }
        } else {
            if (!empty($_SERVER['QUERY_STRING'])) {
                $uri = uri_string() . '?' . $_SERVER['QUERY_STRING'];
            } else {
                $uri = uri_string();
            }
            $this->session->unset_userdata('redirect');
            $this->session->set_userdata('redirect', $uri);
            $this->session->set_flashdata('error', "Harap login ke akun Anda untuk melanjutkan!");
            redirect('login');
        }
    }

    // LOGOUT
    public function logout()
    {

        // SESS DESTROY
        $user_data = $this->session->all_userdata();

        foreach ($user_data as $key => $value) {
            if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
                $this->session->unset_userdata($key);
            }
        }

        $this->session->sess_destroy();
        $this->session->set_flashdata('success', 'Berhasil keluar!');
        redirect(base_url());
    }

    // MAILER SENDER

    public function send_email($email, $subject, $message)
    {
        $mail = array(
            'to' => $email,
            'subject' => $subject,
            'message' => $message
        );

        if ($this->mailer->send($mail) == true) {
            return true;
        } else {
            return false;
        }
    }
}
