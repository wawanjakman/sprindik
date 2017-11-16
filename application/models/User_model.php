<?php
class User_model extends CI_model{

	public function register_user($user){
	$this->db->insert('user', $user);
	}


	public function nama_check($nama){

	  $this->db->select('username');
	  $this->db->from('user');
	  $this->db->where('username',$nama);
	  $query=$this->db->get();
	//var_dump($query);
	  if($query->num_rows()>0){
		return false;
	  }else{
		return true;
	  }

	}

}


?>
