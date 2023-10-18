 <?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
class Pointage extends CI_Controller {


    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('login_model');
        $this->load->model('dashboard_model'); 
        $this->load->model('employee_model'); 
        $this->load->model('pointage_model');
        $this->load->model('settings_model');
        $this->load->model('leave_model');
    }
    
	public function index()
	{
		#Redirect to Admin dashboard after authentication
        if ($this->session->userdata('user_login_access') == 1)
            redirect('dashboard/Dashboard');
            $data=array();
            #$data['settingsvalue'] = $this->dashboard_model->GetSettingsValue();
			$this->load->view('login');
	}
	public function import(){
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$upload_status =  $this->uploadDoc();
			if ($upload_status != false) {
				$inputFileName = 'uploads/' . $upload_status;
	
				
	
				$inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				$dataToInsert = []; // Tableau pour stocker les données à insérer
	
				// Initialiser un tableau pour suivre les valeurs minimales et maximales d'Idp pour chaque combinaison de sName et Date
				$idpRanges = [];
	
				// Parcourir les lignes pour collecter les plages d'Idp et les valeurs de Time
				foreach ($sheet->getRowIterator() as $row) {
					$sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
					$Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
					$Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());
					$Idp = (int)trim($spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue());
	
					if (!isset($idpRanges[$sName][$Date])) {
						// Initialiser la plage d'Idp pour une nouvelle combinaison de sName et Date
						$idpRanges[$sName][$Date] = [
							'min' => $Idp,
							'max' => $Idp,
							'Time_in' => $Time,
							'Time_out' => $Time,
						];
					} else {
						// Mettre à jour les valeurs minimales et maximales d'Idp
						if ($Idp < $idpRanges[$sName][$Date]['min']) {
							$idpRanges[$sName][$Date]['min'] = $Idp;
							$idpRanges[$sName][$Date]['Time_in'] = $Time;
						}
						if ($Idp > $idpRanges[$sName][$Date]['max']) {
							$idpRanges[$sName][$Date]['max'] = $Idp;
							$idpRanges[$sName][$Date]['Time_out'] = $Time;
						}
					}
				}
	
				// Vérifier si une entrée avec la même date existe déjà dans la base de données
				foreach ($idpRanges as $sName => $dateRanges) {
					foreach ($dateRanges as $Date => $range) {
						$existingData = $this->db->query("SELECT * FROM pointage WHERE Date = ? LIMIT 1", [$Date])->row();
						if ($existingData) {
							echo "Une entrée de la même date existe déjà. Veuillez choisir un autre fichier.";
							return; // Arrêter le processus d'importation
						}
	
						$timeIn = $range['Time_in'];
						$timeOut = $range['Time_out'];
	
						// Calculez la différence de temps
						$timeInObj = new DateTime($timeIn);
						$timeOutObj = new DateTime($timeOut);
						$diff = $timeInObj->diff($timeOutObj);
	
						// Insérer les données dans la base de données
						$dataToInsert[] = [
							'sName' => $sName,
							'Date' => $Date,
							'Time_in' => $timeIn,
							'Time_out' => $timeOut,
							'Time_diff' => $diff->format('%H:%i:%s'), // Format de la différence de temps
						];
					}
				}
	
				// Insérer les données dans la base de données
				foreach ($dataToInsert as $data) {
					$this->db->insert('pointage', $data);
				}
	
				echo "Fichier importé avec succès";
			}
		}
	}
	

   /*
	public function import()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$upload_status =  $this->uploadDoc();
			if ($upload_status != false) {
				$inputFileName = 'uploads/' . $upload_status;
				$inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				$dataToInsert = []; // Tableau pour stocker les données à insérer
	
				foreach ($sheet->getRowIterator() as $row) {
					
					$sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
					$Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
					$Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());

	
					// Analyser l'heure pour déterminer time_in ou time_out
					$timeParts = explode(':', $Time);
					$hour = (int)$timeParts[0]; // Récupérer l'heure
					$minute = (int)$timeParts[1]; // Récupérer les minutes
	
					if ($hour < 12) {
						// Heure avant midi, c'est time_in
						$dataToInsert[] = [
							'sName' => $sName,
							'Date' => $Date,
							'time_in' => $Time,
							'time_out' => null, // Initialiser time_out comme null
						];
					} else {
						// Heure après midi, c'est time_out
						// Vérifier si nous avons déjà une entrée pour la même sName et Date
						$existingIndex = null;
						foreach ($dataToInsert as $index => $data) {
							if ($data['sName'] == $sName && $data['Date'] == $Date) {
								$existingIndex = $index;
								break;
							}
						}
	
						if ($existingIndex !== null) {
							// Si oui, mettez à jour time_out
							$dataToInsert[$existingIndex]['time_out'] = $Time;
						} else {
							// Sinon, créez une nouvelle entrée
							$dataToInsert[] = [
								'sName' => $sName,
								'Date' => $Date,
								'time_in' => null, // Initialiser time_in comme null
								'time_out' => $Time,
							];
						}
					}
				}
	
				// Calculer la différence entre time_in et time_out
				foreach ($dataToInsert as &$data) {
					if ($data['time_in'] !== null && $data['time_out'] !== null) {
						$timeIn = new DateTime($data['time_in']);
						$timeOut = new DateTime($data['time_out']);
						$interval = $timeIn->diff($timeOut);
						$data['time_diff'] = $interval->format('%H:%I:%S');
					}
				}
	
				// Maintenant, insérez les données dans la base de données
				foreach ($dataToInsert as $data) {
					$this->db->insert('pointage', $data);
				}
				echo "Fichier importé avec succès";
			}
		}
	}
	

	/*
	
	
	
	public function import()
	{
		if($_SERVER['REQUEST_METHOD']=='POST')
		{
			$upload_status =  $this->uploadDoc();
			if($upload_status!=false)
			{
				$inputFileName = 'assets/uploads/'.$upload_status;
				$inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				foreach($sheet->getRowIterator() as $row)
				{
					$sName = $spreadsheet->getActiveSheet()->getCell('A'.$row->getRowIndex());
					$Date = $spreadsheet->getActiveSheet()->getCell('B'.$row->getRowIndex());
					$Time_out = $spreadsheet->getActiveSheet()->getCell('C'.$row->getRowIndex());
					$data = array(
						'sName'=> $sName,
						'Date'=> $Date,
						'Time_out'=> $Time_out,
						
					);

					$this->db->insert('check_out',$data);
					$count_Rows++;
				}
				echo "Fichier importé avec succès";
			}
			else{
				
				redirect(base_url());
			}
		}
		else
		{
			
		}
		
	}
*/



	public function importp()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$upload_status =  $this->uploadDoc();
			if ($upload_status != false) {
				$inputFileName = 'uploads/' . $upload_status;
				$inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				foreach ($sheet->getRowIterator() as $row) {
					$em_id = $spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue();
					$first_name = $spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue();
					$last_name = $spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue();
					$dep_id = $spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue();
					$des_id = $spreadsheet->getActiveSheet()->getCell('E' . $row->getRowIndex())->getValue();
					$contrat = $spreadsheet->getActiveSheet()->getCell('F' . $row->getRowIndex())->getValue();
					$em_joining_date = $spreadsheet->getActiveSheet()->getCell('G' . $row->getRowIndex())->getValue();
					$em_birthday = $spreadsheet->getActiveSheet()->getCell('H' . $row->getRowIndex())->getValue();
					$em_phone = $spreadsheet->getActiveSheet()->getCell('I' . $row->getRowIndex())->getValue();
					$em_gender = $spreadsheet->getActiveSheet()->getCell('J' . $row->getRowIndex())->getValue();
					$em_nid = $spreadsheet->getActiveSheet()->getCell('K' . $row->getRowIndex())->getValue();
	
					
					// Convertir chaque champ en UTF-8
					
					$first_name = mb_convert_encoding($first_name, 'UTF-8', 'auto');
					$last_name = mb_convert_encoding($last_name, 'UTF-8', 'auto');
					
					
                // Generating employee name based on last name
                $em_id = substr($last_name, 0, 3) . rand(1000, 2000);
					// ... faites de même pour les autres champs
				// Default password (MD5 hash)
				$em_password = md5("123456789");
	
					$data = array(
						'em_id' => $em_id,
						'first_name' => $first_name,
						'last_name' => $last_name,
						'dep_id' => $dep_id,
						'des_id' => $des_id,
						'contrat' => $contrat,
						'em_joining_date' => $em_joining_date,
						'em_birthday' => $em_birthday,
						'em_phone' => $em_phone,
						'em_gender' => $em_gender,
						'em_nid' => $em_nid,
						
						'em_password' => $em_password,
					);
	
					$this->db->insert('employee', $data);
					$count_Rows++;
				}
				echo "Fichier importé avec succès";
			} else {
				redirect(base_url());
			}
		} else {
	
		}
	}
	


	function uploadDoc()
	{
		$uploadPath = 'uploads/';
		if(!is_dir($uploadPath))
		{
			mkdir($uploadPath,0777,TRUE); // FOR CREATING DIRECTORY IF ITS NOT EXIST
		}

		$config['upload_path']=$uploadPath;
		$config['allowed_types'] = 'csv|xlsx|xls';
		$config['max_size'] = 1000000;
		$this->load->library('upload',$config);
		$this->upload->initialize($config);
		if($this->upload->do_upload('upload_excel'))
		{
			$fileData = $this->upload->data();
			return $fileData['file_name'];
		}
		else
		{
			return false;
		}
	}
 
}
