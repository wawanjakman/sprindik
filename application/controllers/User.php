<?php

class User extends CI_Controller {

public function __construct(){

        parent::__construct();
  			$this->load->helper('url');
  	 		$this->load->model('user_model');
        $this->load->library('session');

}

public function index()
{
$this->load->view("index.php");
}

public function register_user(){

      $user=array(
      'username'=>$this->input->post('user_name'),
	  'password'=>md5($this->input->post('user_password')),
      'email'=>$this->input->post('user_email'),
      'nohp'=>$this->input->post('user_mobile')
        );
        print_r($user);
		$this->user_model->register_user($user);

$email_check=$this->user_model->email_check($user['user_email']);
//var_dump($email_check);
	if($email_check){
	  $this->user_model->register_user($user);
	  $this->session->set_flashdata('success_msg', 'Registered successfully.Now login to your account.');
	  redirect('user/login_view');
	}else{
	  $this->session->set_flashdata('error_msg', 'Error occured,Try again.');
	  redirect('user');
	}
 
}

public function login_view(){

$this->load->view("index.php");

}



}

?>
