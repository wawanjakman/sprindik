<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_refDiklat extends CI_Model {
	public function select_all() {
		$data = $this->db->get('ref_diklat');
		//var_dump($data);
		return $data->result();
	}

	public function select_by_id($id) {
		$sql = "SELECT * FROM ref_diklat WHERE id = '{$id}'";

		$data = $this->db->query($sql);

		return $data->row();
	}

	// public function select_by_pegawai($id) {
	// 	$sql = " SELECT pegawai.id AS id, pegawai.nama AS pegawai, pegawai.telp AS telp, kota.nama AS kota, kelamin.nama AS kelamin, posisi.nama AS posisi FROM pegawai, kota, kelamin, posisi WHERE pegawai.id_kelamin = kelamin.id AND pegawai.id_posisi = posisi.id AND pegawai.id_kota = kota.id AND pegawai.id_posisi={$id}";

	// 	$data = $this->db->query($sql);

	// 	return $data->result();
	// }

	public function insert($data) {
		$sql = "INSERT INTO ref_diklat VALUES('','".$data['keterangan']."','".$data['jadwal']."','".$data['status']."')";

		$this->db->query($sql);

		return $this->db->affected_rows();
	}

	public function insert_batch($data) {
		$this->db->insert_batch('ref_diklat', $data);
		
		return $this->db->affected_rows();
	}

	public function update($data) {
		$sql = "UPDATE ref_diklat SET keterangan='" .$data['keterangan'] ."',jadwal='" .$data['jadwal'] ."',status='" .$data['status'] ."', WHERE id='" .$data['id'] ."'";

		$this->db->query($sql);

		return $this->db->affected_rows();
	}

	public function delete($id) {
		$sql = "DELETE FROM ref_diklat WHERE id='" .$id ."'";

		$this->db->query($sql);

		return $this->db->affected_rows();
	}

	public function check_keterangan($keterangan) {
		$this->db->where('keterangan', $keterangan);
		$data = $this->db->get('ref_diklat');

		return $data->num_rows();
	}

	public function total_rows() {
		$data = $this->db->get('ref_diklat');

		return $data->num_rows();
	}
}

/* End of file M_refDiklat.php */
/* Location: ./application/models/M_refDiklat.php */