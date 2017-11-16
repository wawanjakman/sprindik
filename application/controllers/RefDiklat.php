<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RefDiklat extends AUTH_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('M_refDiklat');
	}

	public function index() {
		$data['userdata'] 	= $this->userdata;
		$data['dataRefDiklat'] = $this->M_refDiklat->select_all();

		$data['page'] 		= "refDiklat";
		$data['judul'] 		= "Referensi Diklat";
		$data['deskripsi'] 	= "Manage Data Referensi Diklat";

		$data['modal_tambah_refDiklat'] = show_my_modal('modals/modal_tambah_refDiklat', 'tambah-refDiklat', $data);

		$this->template->views('refDiklat/home', $data);
	}

	public function tampil() {
		$data['dataRefDiklat'] = $this->M_refDiklat->select_all();
		$this->load->view('refDiklat/list_data', $data);
	}

	public function prosesTambah() {
		$this->form_validation->set_rules('refDiklat', 'refDiklat', 'trim|required');

		$data 	= $this->input->post();
		if ($this->form_validation->run() == TRUE) {
			$result = $this->M_refDiklat->insert($data);

			if ($result > 0) {
				$out['status'] = '';
				$out['msg'] = show_succ_msg('Data Referensi Diklat Berhasil ditambahkan', '20px');
			} else {
				$out['status'] = '';
				$out['msg'] = show_err_msg('Data Referensi Diklat Gagal ditambahkan', '20px');
			}
		} else {
			$out['status'] = 'form';
			$out['msg'] = show_err_msg(validation_errors());
		}

		echo json_encode($out);
	}

	public function update() {
		$data['userdata'] 	= $this->userdata;

		$id 				= trim($_POST['id']);
		$data['dataRefDiklat'] = $this->M_refDiklat->select_by_id($id);

		echo show_my_modal('modals/modal_update_refDiklat', 'update-refDiklat', $data);
	}

	public function prosesUpdate() {
		$this->form_validation->set_rules('refDiklat', 'refDiklat', 'trim|required');

		$data 	= $this->input->post();
		if ($this->form_validation->run() == TRUE) {
			$result = $this->M_refDiklat->update($data);

			if ($result > 0) {
				$out['status'] = '';
				$out['msg'] = show_succ_msg('Data Referensi Diklat Berhasil diupdate', '20px');
			} else {
				$out['status'] = '';
				$out['msg'] = show_succ_msg('Data Referensi Diklat Gagal diupdate', '20px');
			}
		} else {
			$out['status'] = 'form';
			$out['msg'] = show_err_msg(validation_errors());
		}

		echo json_encode($out);
	}

	public function delete() {
		$id = $_POST['id'];
		$result = $this->M_refDiklat->delete($id);
		
		if ($result > 0) {
			echo show_succ_msg('Data Referensi Diklat Berhasil dihapus', '20px');
		} else {
			echo show_err_msg('Data Referensi Diklat Gagal dihapus', '20px');
		}
	}

	public function detail() {
		$data['userdata'] 	= $this->userdata;

		$id 				= trim($_POST['id']);
		$data['refDiklat'] = $this->M_refDiklat->select_by_id($id);
		// $data['dataRefDiklat'] = $this->M_refDiklat->select_by_pegawai($id);

		echo show_my_modal('modals/modal_detail_refDiklat', 'detail-refDiklat', $data, 'lg');
	}

	public function export() {
		error_reporting(E_ALL);
    
		include_once './assets/phpexcel/Classes/PHPExcel.php';
		$objPHPExcel = new PHPExcel();

		$data = $this->M_refDiklat->select_all();

		$objPHPExcel = new PHPExcel(); 
		$objPHPExcel->setActiveSheetIndex(0); 
		$rowCount = 1; 

		$objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, "ID"); 
		$objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, "Nama Referensi Diklat");
		$rowCount++;

		foreach($data as $value){
		    $objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, $value->id); 
		    $objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, $value->keterangan); 
		    $rowCount++; 
		} 

		$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel); 
		$objWriter->save('./assets/excel/Data Referensi Diklat.xlsx'); 

		$this->load->helper('download');
		force_download('./assets/excel/Data Referensi Diklat.xlsx', NULL);
	}

	public function import() {
		$this->form_validation->set_rules('excel', 'File', 'trim|required');

		if ($_FILES['excel']['name'] == '') {
			$this->session->set_flashdata('msg', 'File harus diisi');
		} else {
			$config['upload_path'] = './assets/excel/';
			$config['allowed_types'] = 'xls|xlsx';
			
			$this->load->library('upload', $config);
			
			if ( ! $this->upload->do_upload('excel')){
				$error = array('error' => $this->upload->display_errors());
			}
			else{
				$data = $this->upload->data();
				
				error_reporting(E_ALL);
				date_default_timezone_set('Asia/Jakarta');

				include './assets/phpexcel/Classes/PHPExcel/IOFactory.php';

				$inputFileName = './assets/excel/' .$data['file_name'];
				$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
				$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);

				$index = 0;
				foreach ($sheetData as $key => $value) {
					if ($key != 1) {
						$check = $this->M_refDiklat->check_keterangan($value['B']);

						if ($check != 1) {
							$resultData[$index]['keterangan'] = ucwords($value['B']);
						}
					}
					$index++;
				}

				unlink('./assets/excel/' .$data['file_name']);

				if (count($resultData) != 0) {
					$result = $this->M_kota->insert_batch($resultData);
					if ($result > 0) {
						$this->session->set_flashdata('msg', show_succ_msg('Data Referensi Diklat Berhasil diimport ke database'));
						redirect('RefDiklat');
					}
				} else {
					$this->session->set_flashdata('msg', show_msg('Data Referensi Diklat Gagal diimport ke database (Data Sudah terupdate)', 'warning', 'fa-warning'));
					redirect('RefDiklat');
				}

			}
		}
	}
}

/* End of file RefDiklat.php */
/* Location: ./application/controllers/RefDiklat.php */