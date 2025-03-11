<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use PhpOffice\PhpSpreadsheet\IOFactory; // Namespace pour PhpSpreadsheet
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Employee extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('dashboard_model');
        $this->load->model('employee_model');
        $this->load->model('login_model');
        $this->load->model('payroll_model');
        $this->load->model('settings_model');
        $this->load->model('leave_model');
  
    }
    
	public function index()
	{
		if ($this->session->userdata('user_login_access') != 1)
            redirect(base_url() . 'login', 'refresh');
        if ($this->session->userdata('user_login_access') == 1)
          $data= array();
        redirect('employee/Employees');
	}

    public function Employees(){
        if($this->session->userdata('user_login_access') != False) { 
        //$data['employee'] = $this->employee_model->emselect();
        $this->load->view('backend/employees');
        }
    else{
		redirect(base_url() , 'refresh');
	}   
    } 

    public function Ancien_GetEmployee() {
        $data = $this->employee_model->emselect();
        $output = array();
    
        foreach ($data as $value) {
            $output[] = array(
                'image' => base_url() . 'uploads/users/' . $value->em_image,
                'em_id' => $value->em_id,
                'name' => $value->first_name . ' ' . $value->last_name,
                'des_id' => $value->des_id,
                'phone' => $value->em_phone,
                'contrat' => $value->contrat,
                'joining_date' => $value->em_joining_date,
                'anciennete' => $this->calculateAnciennete($value->em_joining_date)
                
            );
        }
    
        echo json_encode(array('data' => $output));
    }
    
    public function export_excel() {
        // Charger le modèle
        $this->load->model('Employee_model');
        $employees = $this->Employee_model->get_all_employees(); // Notez la majuscule dans Employee_model

        // Créer le spreadsheet
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Définir les en-têtes
        $sheet->setCellValue('A1', 'Matricule');
        $sheet->setCellValue('B1', 'Noms');
        $sheet->setCellValue('C1', 'Prénoms');
        $sheet->setCellValue('D1', 'Fonction');
        $sheet->setCellValue('E1', 'Departement');
        $sheet->setCellValue('F1', 'Sexe');
        $sheet->setCellValue('G1', 'Date d embauche');
        $sheet->setCellValue('H1', 'Ancienneté');
        $sheet->setCellValue('I1', 'Adresse');
        $sheet->setCellValue('J1', 'Telephone');
        $sheet->setCellValue('K1', 'Nationalité');
        $sheet->setCellValue('L1', 'Categorie');
        $sheet->setCellValue('M1', 'Type de contrat');
        $sheet->setCellValue('N1', 'Groupe');
        $sheet->setCellValue('O1', 'Date de naissance');
        $sheet->setCellValue('P1', 'Lieu de naissance');
        $sheet->setCellValue('Q1', 'Age');
        $sheet->setCellValue('R1', 'CIN');
        $sheet->setCellValue('S1', 'Date CIN');
        $sheet->setCellValue('T1', 'Lieu CIN');
        $sheet->setCellValue('U1', 'N° CNAPS');
        $sheet->setCellValue('V1', 'Handycap');
        $sheet->setCellValue('W1', 'Nom et prénom');
        $sheet->setCellValue('X1', 'Contact');
        $sheet->setCellValue('Y1', 'Adresse');
        $sheet->setCellValue('Z1', 'Nom du père');
        $sheet->setCellValue('AA1', 'Nom du mère');
        $sheet->setCellValue('AB1', 'Situation');
        $sheet->setCellValue('AC1', 'Nom et prenom(s)s conjoint(e)');
        $sheet->setCellValue('AD1', 'Nb enfant(s)');
        // Remplir les données
        $row = 2;
        foreach ($employees as $employee) {
            $sheet->setCellValue('A' . $row, $employee->em_id); // Notation objet car result() est utilisé
            $sheet->setCellValue('B' . $row, $employee->first_name);   // Ajusté selon votre modèle
            $sheet->setCellValue('C' . $row, $employee->last_name); // Ajusté selon votre modèle
            $sheet->setCellValue('D' . $row, $employee->des_id);
            $sheet->setCellValue('E' . $row, $employee->dep_id);
            $sheet->setCellValue('F' . $row, $employee->em_gender);
            $sheet->setCellValue('G' . $row, $employee->em_joining_date);
           
                  
                    // Calcul de l'ancienneté
                    try {
                        // Convertir la date d'entrée au format DD/MM/YYYY
                        $joiningDate = DateTime::createFromFormat('d/m/Y', $employee->em_joining_date);
                        $today = new DateTime(); // Date actuelle (dynamique)

                        if ($joiningDate === false) {
                            // En cas d'échec de conversion
                            $seniority = "Date invalide";
                        } else {
                            // Calculer la différence
                            $interval = $today->diff($joiningDate);
                            $years = $interval->y;
                            $months = $interval->m;
                            $days = $interval->d;
                            $seniority = "$years ans $months mois $days jours";
                        }
                    } catch (Exception $e) {
                        // En cas d'erreur
                        $seniority = "Erreur date";
                    }

            $sheet->setCellValue('H' . $row, $seniority); // Ajouter l'ancienneté dans la colonne G
            $sheet->setCellValue('I' . $row, $employee->em_address);
            $sheet->setCellValue('J' . $row, $employee->em_phone);
            $sheet->setCellValue('K' . $row, $employee->nation);
            $sheet->setCellValue('L' . $row, $employee->categorie);
            $sheet->setCellValue('M' . $row, $employee->contrat);
            $sheet->setCellValue('N' . $row, $employee->groupe);
            $sheet->setCellValue('O' . $row, $employee->em_birthday);
            $sheet->setCellValue('P' . $row, $employee->lieu_naiss);

                    // Calcul de l'âge
                    try {
                        $birthDate = DateTime::createFromFormat('d/m/Y', $employee->em_birthday);
                        $today = new DateTime();
                        if ($birthDate === false) {
                            $age = "Date invalide";
                        } else {
                            $age = $today->diff($birthDate)->y; // Prend seulement les années
                        }
                    } catch (Exception $e) {
                        $age = "Erreur date";
                    }
            $sheet->setCellValue('Q' . $row, $age); // Ajouter l'âge dans la colonne Q
            $sheet->setCellValue('R' . $row, $employee->em_nid);
            $sheet->setCellValue('S' . $row, $employee->date_cin);
            $sheet->setCellValue('T' . $row, $employee->lieu_cin);
            $sheet->setCellValue('U' . $row, $employee->n_cnaps);
            $sheet->setCellValue('V' . $row, $employee->handycap);
            $sheet->setCellValue('W' . $row, $employee->nom_ur);
            $sheet->setCellValue('X' . $row, $employee->contact_ur);
            $sheet->setCellValue('Y' . $row, $employee->adresse_ur);
            $sheet->setCellValue('Z' . $row, $employee->pere);
            $sheet->setCellValue('AA' . $row, $employee->mere);
            $sheet->setCellValue('AB' . $row, $employee->situation);
            $sheet->setCellValue('AC' . $row, $employee->conjoint);
            $sheet->setCellValue('AD' . $row, $employee->nb_enfant);
            $row++;
        }

        // Nettoyer le tampon de sortie pour éviter toute corruption
        if (ob_get_length()) {
            ob_end_clean();
        }

        // Définir les en-têtes HTTP
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="employes_' . date('Y-m-d') . '.xlsx"');
        header('Cache-Control: max-age=0');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Pragma: no-cache');

        // Générer et envoyer le fichier
        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }


    public function GetEmployee() {
        $data = $this->employee_model->emselect();
        $output = array();
    
        foreach ($data as $value) {
            $imageUrl = base_url() . 'uploads/users/' . $value->em_image;
            $fullName = htmlspecialchars($value->first_name . ' ' . $value->last_name);
            $anciennete = $this->calculateAnciennete($value->em_joining_date);
    
            $output[] = array(
                'image' => $imageUrl,
                'em_id' => $value->em_id,
                'name' => $fullName,
                'des_id' => $value->des_id,
                'phone' => $value->em_phone,
                'contrat' => $value->contrat,
                'joining_date' => $value->em_joining_date,
                'anciennete' => $anciennete
            );
        }
    
        echo json_encode(array('data' => $output));
    }
    
  // Fonction pour calculer l'ancienneté avec prise en charge du format d/m/Y
private function calculateAnciennete($date) {
    try {
        // Créer un objet DateTime en spécifiant le format d/m/Y
        $dateContrat = DateTime::createFromFormat('d/m/Y', $date);
        
        // Vérifier si la date est valide
        if ($dateContrat === false) {
            return 'Date invalide';
        }

        $today = new DateTime();
        $diff = $dateContrat->diff($today);
        return $diff->y . ' Ans, ' . $diff->m . ' Mois';
    } catch (Exception $e) {
        return 'Erreur dans le calcul';
    }
}


    public function Nplus_un(){
        if($this->session->userdata('user_login_access') != False) {
        
        $emid= $this->session->userdata('user_login_id');
        $data['employee'] = $this->employee_model->nplus_un($emid);
        $this->load->view('backend/nplus_un', $data);
        }
        else{
            redirect(base_url() , 'refresh');
        }
    }
    


    public function timing(){
        if($this->session->userdata('user_login_access') != False) { 
        $this->load->view('backend/timing');
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }

    public function shift(){
        if($this->session->userdata('user_login_access') != False) { 
        $this->load->view('backend/shift');
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }

    public function GetShift(){
        $data = $this->employee_model->Shift();
        foreach($data as $value){
            ?>
            <tr>
                <td><?php echo $value->em_id; ?></td>
                <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
                <td><?php echo $value->shift; ?></td>
                <td><?php echo $value->heure_e; ?></td>
                <td><button class="btn btn-primary" onclick="editShift('<?php echo $value->em_id; ?>')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></td> <!-- Bouton Edit -->
            </tr>
            <?php
        }
    }
    
    public function GetEmployeeShift(){
        $em_id = $this->input->post('em_id');
        $data = $this->employee_model->getEmployeeShift($em_id);
        echo json_encode($data);
    }

    
    
    public function UpdateShift(){
        $em_id = $this->input->post('em_id');
        $shift = $this->input->post('shift');
        $heure_e = $this->input->post('heure_e');
        $this->employee_model->updateShift($em_id, $shift, $heure_e);
    }
    
    


    public function Pointage(){
        if($this->session->userdata('user_login_access') != False) { 
        $this->load->view('backend/pointage');
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function getListeH() {
        $data = $this->employee_model->getListeH();
        echo json_encode($data);
    }



    public function Absent() {
        if($this->session->userdata('user_login_access') != False) { 
            $this->load->view('backend/Absent');
            }
        else{
            redirect(base_url() , 'refresh');
        }     
    }
   
   
    public function GetAbsent() {
        $data['absentEmployees'] = $this->employee_model->get_absences_by_date();
        
        // Définir l'en-tête pour le JSON et envoyer la réponse
        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($data));
    }

    public function GetTiming(){
        
		$data = $this->employee_model->timingselect();
		$output = array();
		foreach($data as $value){
			?>
			<tr>
            <td><?php echo $value->em_id; ?></td>
            <td><?php echo $value->des_id; ?></td>
            <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
            <td><?php echo $value->time; ?></td>
            <td><?php echo $value->tdate; ?></td>
          
			</tr>
			<?php
		}
	}



    public function GetTimingSingle(){
        $emid = $this->session->userdata('user_login_id');
		$data = $this->employee_model->timingselectSingle($emid);
		$output = array();
		foreach($data as $value){
			?>
			<tr>
            <td><?php echo $value->em_id; ?></td>
            <td><?php echo $value->des_id; ?></td>
            <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
            <td><?php echo $value->time; ?></td>
            <td><?php echo $value->tdate; ?></td>
          
			</tr>
			<?php
		}
	}
    public function GetTimingTeam(){
        $emid = $this->session->userdata('user_login_id');
		$data = $this->employee_model->timingselectTeam($emid);
		$output = array();
		foreach($data as $value){
			?>
			<tr>
            <td><?php echo $value->em_id; ?></td>
            <td><?php echo $value->des_id; ?></td>
            <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
            <td><?php echo $value->time; ?></td>
            <td><?php echo $value->tdate; ?></td>
          
			</tr>
			<?php
		}
	}
    


public function GetPointage() {
    $data = $this->employee_model->pointageselect();
    $output = array();
    foreach ($data as $value) {
        ?>
        <tr <?php echo (!empty($value->em_entree) && strtotime($value->Time_in) - strtotime($value->em_entree) > 600) ? 'class="text-danger"' : ''; ?>>
            <td><?php echo $value->sName; ?></td>
            <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
            <td><?php echo $value->des_id; ?></td>
           
           
            <td><?php echo $value->Date; ?></td>
            <td><?php echo $value->shift; ?></td>
            <td><?php echo $value->em_entree; ?></td>
            <td><?php echo $value->Time_in; ?></td>
            <td>
                <?php
                if (!empty($value->em_entree)) {
                    $timeIn = strtotime($value->Time_in);
                    $emEntree = strtotime($value->em_entree);
                    $retard = $timeIn - $emEntree;

                    if ($retard > 0) {
                        $retardFormatted = sprintf("%02d:%02d:%02d", ($retard / 3600), ($retard % 3600 / 60), ($retard % 60));
                        echo $retardFormatted;
                    } else {
                        echo "00:00:00";
                    }
                } else {
                    echo "";
                }
                ?>
            </td>
            <td><?php echo $value->Time_out; ?></td>
            <td><?php echo $value->Time_diff; ?></td>
            <td><?php echo $value->dep; ?></td>
            <td>
                <button class="btn btn-warning edit" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>
                <button class="btn btn-danger delete" data-id="<?php echo $value->id; ?>"><i class="fa fa-trash-o"></i></button>
            </td>
        </tr>
        <?php
    }
}


    public function Planning() {
        if ($this->session->userdata('user_login_access') != False) { 
            $this->load->view('backend/planning');
        } else {
            redirect(base_url(), 'refresh');
        }
    }
    
   
    public function GetPlanning(){
        
		$data = $this->employee_model->getPlanningid();
		$output = array();
		foreach($data as $value){
			?>
			<tr>
            <td><?php echo $value->em_id; ?></td>
            <td><?php echo $value->des_id; ?></td>
            <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
            <td><?php echo $value->type; ?></td>
           
				<td>
                	<button class="btn btn-warning edit" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button> 
					<button class="btn btn-danger delete" data-id="<?php echo $value->id; ?>"><i class="fa fa-trash-o"></i></button>
				</td>
			</tr>
			<?php
		}
	}

    public function GetPlanning_pm(){
        
		$data = $this->employee_model->getPlanningid();
		$output = array();
		foreach($data as $value){
			?>
			<tr>
            <td><?php echo $value->em_id; ?></td>
            <td><?php echo $value->type; ?></td>
           
				<td>
                	<button class="btn btn-warning edit" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button> 
					<button class="btn btn-danger delete" data-id="<?php echo $value->id; ?>"><i class="fa fa-trash-o"></i></button>
				</td>
			</tr>
			<?php
		}
	}


    public function GetPointage_em() {
        if ($this->session->userdata('user_login_access') != 1)
            redirect(base_url() . 'login', 'refresh');
        if ($this->session->userdata('user_login_access') == 1)
          $data= array();
        $id = $this->session->userdata('user_login_id');
        $data = $this->employee_model->GetPointageEm($id);
        $output = array();
        foreach ($data as $value) {
            ?>
            <tr <?php echo (!empty($value->em_entree) && strtotime($value->Time_in) - strtotime($value->em_entree) > 600) ? 'class="text-danger"' : ''; ?>>
                <td><?php echo $value->sName; ?></td>
                <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
                <td><?php echo $value->des_id; ?></td>
               <td><?php echo $value->Date; ?></td>
               <td><?php echo $value->shift; ?></td>
                <td><?php echo $value->em_entree; ?></td>
                <td><?php echo $value->Time_in; ?></td>
                <td>
                    <?php
                    if (!empty($value->em_entree)) {
                        $timeIn = strtotime($value->Time_in); // Convertir l'heure en timestamp
                        $emEntree = strtotime($value->em_entree); // Convertir l'heure d'entrée prévue en timestamp
                        $retard = $timeIn - $emEntree; // Calculer la différence
    
                        // Vérifier si le retard est positif avant de l'afficher
                        if ($retard > 0) {
                            // Formatter la différence en heures:minutes:secondes
                            $retardFormatted = sprintf("%02d:%02d:%02d", ($retard / 3600), ($retard % 3600 / 60), ($retard % 60));
                            echo $retardFormatted; // Afficher le retard
                        } else {
                            echo "00:00:00";
                        }
                    } else {
                        echo ""; // Afficher rien si em_entree est vide
                    }
                    ?>
                </td>
                <td><?php echo $value->Time_out; ?></td>
                <td><?php echo $value->Time_diff; ?></td>
                <td><?php echo $value->dep; ?></td>
                <td>
                    <button class="btn btn-warning edit" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>
                </td>
            </tr>
            <?php
        }
    }
    
public function getidPointage(){
		$id = $_POST['id'];
		$data = $this->employee_model->getidPointage($id);
		echo json_encode($data);
	}
	public function deletePointage(){
		$id = $_POST['id'];
		$query = $this->employee_model->deleteP($id);
	}


    
//supprimer pointage par date

public function deletePointageByDate() {
    $date = $this->input->post('date');
    $deleted = $this->employee_model->deletePByDate($date);
    
    $response = array('success' => $deleted > 0);
    echo json_encode($response);
}



    public function filtrerPointage() {
        if ($this->session->userdata('user_login_access') != False) { 
            $date_debut = $this->input->post('date_debut');
            $date_fin = $this->input->post('date_fin');
            $data['pointage'] = $this->employee_model->filtrerPointageParDate($date_debut, $date_fin);
            $this->load->view('backend/pointage', $data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }


    
    
    public function DeleteP($id){
        if($this->session->userdata('user_login_access') != False) { 
        $this->employee_model->deletePerso($id);
       $this->session->set_flashdata('delsuccess', 'Successfully Deleted');
        echo "Suppression Réussi"; 
       redirect('employee/pointage');
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    
    public function updateConge() {
        // Récupérez les données à mettre à jour depuis la requête Ajax
        $newNbJour = 2.5;

        // Mettez à jour tous les enregistrements dans la table "conge" avec la nouvelle valeur
        $this->employee_model->updateAllConge($newNbJour);

        // Réponse Ajax
        echo json_encode(array('success' => true));
    }




    // Méthode pour gérer l'upload du fichier
    private function uploadDoc() {
        $config['upload_path'] = './uploads/'; // Dossier où stocker les fichiers temporairement
        $config['allowed_types'] = 'xls|xlsx'; // Types de fichiers autorisés
        $config['max_size'] = 10240; // Taille max : 10MB (en KB)
        $config['file_name'] = 'excel_upload_' . time(); // Nom unique pour éviter les conflits

        $this->load->library('upload', $config);

        if (!is_dir($config['upload_path'])) {
            mkdir($config['upload_path'], 0777, TRUE); // Crée le dossier s'il n'existe pas
        }

        if ($this->upload->do_upload('excel_file')) {
            $upload_data = $this->upload->data();
            return $upload_data['file_name']; // Retourne le nom du fichier uploadé
        } else {
            return false; // Échec de l'upload
        }
    }

    

    public function importExcel() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (!empty($_FILES['excel_file']['name'])) {
                $inputFileName = $_FILES['excel_file']['tmp_name'];
                $extension = strtolower(pathinfo($_FILES['excel_file']['name'], PATHINFO_EXTENSION));
                if (!in_array($extension, ['xls', 'xlsx'])) {
                    $response = array(
                        'status' => 'error',
                        'message' => 'Format de fichier non supporté. Utilisez .xls ou .xlsx'
                    );
                    echo json_encode($response);
                    exit;
                }
    
                try {
                    $inputFileType = IOFactory::identify($inputFileName);
                    $reader = IOFactory::createReader($inputFileType);
                    $spreadsheet = $reader->load($inputFileName);
                    $sheet = $spreadsheet->getSheet(0);
                    $sheetData = $sheet->toArray();
                    unset($sheetData[0]);
    
                    $success_count = 0;
                    $dataToInsertEmployee = []; // Pour employee
                    $dataToInsertCongeMois = []; // Pour conge_mois
    
                    foreach ($sheetData as $row) {
                        $employee_data = array(
                            'em_id' => isset($row[0]) ? $row[0] : null,
                            'first_name' => isset($row[1]) ? $row[1] : null,
                            'last_name' => isset($row[2]) ? $row[2] : null,
                            'des_id' => isset($row[3]) ? $row[3] : null,
                            'dep_id' => isset($row[4]) ? $row[4] : null,
                            'em_gender' => isset($row[5]) ? $this->format_gender($row[5]) : null,
                            'em_joining_date' => isset($row[7]) ? $this->format_date($row[7]) : null,
                            'em_address' => isset($row[11]) ? $row[11] : null,
                            'em_phone' => isset($row[12]) ? $row[12] : null,
                            'nation' => isset($row[13]) ? $row[13] : null,
                            'categorie' => isset($row[14]) ? $row[14] : null,
                            'contrat' => isset($row[15]) ? $row[15] : null,
                            'groupe' => isset($row[16]) ? $row[16] : null,
                            'em_birthday' => isset($row[17]) ? $this->format_date($row[17]) : null,
                            'lieu_naiss' => isset($row[18]) ? $row[18] : null,
                            'em_nid' => isset($row[20]) ? $row[20] : null,
                            'date_cin' => isset($row[21]) ? $this->format_date($row[21]) : null,
                            'lieu_cin' => isset($row[22]) ? $row[22] : null,
                            'n_cnaps' => isset($row[23]) ? $row[23] : null,
                            'handycap' => isset($row[24]) ? $row[24] : null,
                            'nom_ur' => isset($row[25]) ? $row[25] : null,
                            'contact_ur' => isset($row[26]) ? $row[26] : null,
                            'adresse_ur' => isset($row[27]) ? $row[27] : null,
                            'pere' => isset($row[28]) ? $row[28] : null,
                            'mere' => isset($row[29]) ? $row[29] : null,
                            'situation' => isset($row[30]) ? $row[30] : null,
                            'conjoint' => isset($row[31]) ? $row[31] : null,
                            'nb_enfant' => isset($row[32]) ? $row[32] : null,
                            'em_password' => 'f7c3bc1d808e04732adf679965ccc34ca7ae3441',
                            'em_image' => 'Tel1001.jpg'
                        );
    
                        // Préparer les données pour conge_mois
                        $conge_mois_data = array(
                            'em_id' => isset($row[0]) ? $row[0] : null
                            // Ajoutez d'autres champs si nécessaire
                        );
    
                        if (!empty(array_filter($employee_data))) {
                            $dataToInsertEmployee[] = $employee_data;
                            $dataToInsertCongeMois[] = $conge_mois_data;
                        }
                    }
    
                    if (!empty($dataToInsertEmployee)) {
                        log_message('debug', 'Nombre d\'enregistrements à insérer dans employee : ' . count($dataToInsertEmployee));
                        log_message('debug', 'Données à insérer dans employee : ' . print_r($dataToInsertEmployee, true));
                        $success_count = $this->employee_model->import_batch_employee($dataToInsertEmployee);
    
                        // Insérer dans conge_mois
                        log_message('debug', 'Nombre d\'enregistrements à insérer dans conge_mois : ' . count($dataToInsertCongeMois));
                        log_message('debug', 'Données à insérer dans conge_mois : ' . print_r($dataToInsertCongeMois, true));
                        $this->employee_model->import_batch_conge_mois($dataToInsertCongeMois);
                    }
    
                    $response = array(
                        'status' => 'success',
                        'message' => "$success_count employés importés avec succès" // Message simplifié
                    );
                } catch (Exception $e) {
                    $response = array(
                        'status' => 'error',
                        'message' => 'Erreur lors de l\'importation : ' . $e->getMessage()
                    );
                }
            } else {
                $response = array('status' => 'error', 'message' => 'Aucun fichier sélectionné');
            }
        } else {
            $response = array('status' => 'error', 'message' => 'Méthode non autorisée');
        }
    
        echo json_encode($response);
        exit;
    }

    private function format_gender($gender) {
        // Supprime les espaces et met en majuscule pour uniformiser
        $gender = trim(strtoupper($gender));
        
        // Si c'est 'M', retourne 'Homme'
        if ($gender === 'M') {
            return 'Homme';
        }
        // Si c'est 'F', retourne 'Femme'
        elseif ($gender === 'F') {
            return 'Femme';
        }
        // Sinon, conserve la valeur originale (Homme ou Femme)
        elseif (in_array($gender, ['HOMME', 'FEMME'])) {
            return $gender === 'HOMME' ? 'Homme' : 'Femme';
        }
        // Par défaut, retourne null ou la valeur si elle est valide
        return $gender ?: null;
    }

    private function format_date($date) {
        if (empty($date)) return null;

        // Si la date est numérique (format Excel)
        if (is_numeric($date)) {
            return date('d/m/Y', PhpOffice\PhpSpreadsheet\Shared\Date::excelToTimestamp($date));
        }

        // Convertir la chaîne en date (gère d-m-Y ou d/m/Y)
        $date_str = trim($date);
        // Essayer différents formats
        $formats = [
            'd-m-Y', // Exemple : 15-06-2017
            'd/m/Y'  // Exemple : 15/06/2017
        ];

        foreach ($formats as $format) {
            $d = DateTime::createFromFormat($format, $date_str);
            if ($d && $d->format($format) === $date_str) {
                return $d->format('d/m/Y'); // Retourne au format d-m-Y
            }
        }

        // Si la date n'est pas reconnue, essayer strtotime comme fallback
        $timestamp = strtotime($date_str);
        if ($timestamp !== false) {
            return date('d/m/Y', $timestamp);
        }

        // Si tout échoue, retourner null ou loguer une erreur
        log_message('warning', 'Date invalide trouvée : ' . $date_str);
        return null;
    }







    public function Aadd_employee() {
        if (!$this->input->is_ajax_request()) {
            show_404();
            return;
        }
    
        // Récupérer em_id dès le début pour l'utiliser dans le nom du fichier
        $em_id = $this->input->post('eid', TRUE);
        if (empty($em_id)) {
            echo json_encode(['status' => 'error', 'message' => 'L\'identifiant employé (em_id) est requis.']);
            return;
        }
    
        // Traitement de l'image si elle existe
        $img_url = '';
        if (isset($_FILES['image_url']) && !empty($_FILES['image_url']['name'])) {
            $file_name = $_FILES['image_url']['name'];
            $fileSize = $_FILES["image_url"]["size"] / 1024;
            $fileType = $_FILES["image_url"]["type"];
    
            // Récupérer l'extension du fichier original
            $extension = pathinfo($file_name, PATHINFO_EXTENSION);
            $new_file_name = $em_id . '.' . $extension; // Ex: "EMP001.jpg"
    
            $config = array(
                'file_name' => $new_file_name,
                'upload_path' => "./uploads/users",
                'allowed_types' => "gif|jpg|png|jpeg",
                'overwrite' => false, // Si false, provoque une erreur si le fichier existe déjà
                'max_size' => "20240000" // Environ 20 Mo
            );
    
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
    
            if (!$this->upload->do_upload('image_url')) {
                echo json_encode(['status' => 'error', 'message' => $this->upload->display_errors()]);
                return;
            } else {
                $path = $this->upload->data();
                $img_url = $path['file_name']; // Contiendra "EMP001.jpg"
            }
        }
    
        // Si img_url est vide, définir une image par défaut
        if (empty($img_url)) {
            $img_url = 'Tel1001.jpg';
        }
    
        // Récupération des données envoyées en POST
        $data = [
            'em_id' => $em_id,
            'first_name' => $this->input->post('fname', TRUE),
            'last_name' => $this->input->post('lname', TRUE),
            'em_image' => $img_url,
            'nation' => $this->input->post('nation', TRUE),
            'situation' => $this->input->post('situation', TRUE),
            'em_phone' => $this->input->post('em_phone', TRUE),
            'em_email' => $this->input->post('em_email', TRUE),
            'em_birthday' => $this->input->post('dob', TRUE),
           'lieu_naiss' => $this->input->post('lieuu', TRUE),
            'em_nid' => $this->input->post('nid', TRUE),
            'lieu_cin' => $this->input->post('nid_lieu', TRUE),
            'date_cin' => $this->input->post('nid_date', TRUE),
            'em_address' => $this->input->post('adresse', TRUE),
            'dep_id' => $this->input->post('dept', TRUE),
            'des_id' => $this->input->post('deg', TRUE),
            'contrat' => $this->input->post('contrat', TRUE),
            'em_joining_date' => $this->input->post('joindate', TRUE),
            'em_contact_end' => $this->input->post('leavedate', TRUE),
            'categorie' => $this->input->post('cat', TRUE),
            'groupe' => $this->input->post('gp', TRUE),
            'n_cnaps' => $this->input->post('cnaps', TRUE),
            'handycap' => $this->input->post('handycap', TRUE),
            'em_role' => $this->input->post('role', TRUE),
            'em_password' => 'f7c3bc1d808e04732adf679965ccc34ca7ae3441'
        ];
    
        // Données pour conge_mois
        $data_conge = [
            'em_id' => $em_id
        ];
    
        // Vérifier les doublons avant insertion
        $existing_em_ids_employee = $this->employee_model->get_existing_em_ids();
        $existing_em_ids_conge = $this->employee_model->get_existing_conge_mois_em_ids();
    
        if (in_array($data['em_id'], $existing_em_ids_employee)) {
            echo json_encode(['status' => 'error', 'message' => 'Cet employé existe déjà dans la Base de donnée.']);
            return;
        }
    
        if (in_array($data_conge['em_id'], $existing_em_ids_conge)) {
            echo json_encode(['status' => 'error', 'message' => 'Cet employé existe déjà dans la Base de donnée.']);
            return;
        }
    
        // Logs pour débogage
        log_message('debug', 'Données pour employee : ' . json_encode($data));
        log_message('debug', 'Données pour conge_mois : ' . json_encode($data_conge));
    
        // Insérer les données via le modèle
        $employee_inserted = $this->employee_model->insert_employee($data);
        $conge_inserted = $this->employee_model->insert_employee_conge($data_conge);
    
        if ($employee_inserted && $conge_inserted) {
            echo json_encode(['status' => 'success', 'message' => 'Employé ajouté avec succès.']);
        } else {
            log_message('error', 'Échec de l\'ajout de l\'employé : ' . json_encode($this->db->error()));
            echo json_encode(['status' => 'error', 'message' => 'Erreur lors de l\'ajout de l\'employé.']);
        }
    }

    



    public function Add_employee(){
        if($this->session->userdata('user_login_access') != False) { 
        $this->load->view('backend/add-employee');
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Add_pointage(){
        if($this->session->userdata('user_login_access') != False) { 
        $this->load->view('backend/import_pointage');
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }

    public function fetchDatafromDatabase()
	{
		$resultList = $this->ajax_model->fetchAllData('*','employee',array());
		
		$result = array();
		$i = 1;
		foreach ($resultList as $key => $value) {

			$result['data'][] = array(
				$i++,
				$value['id'],
				$value['em_id'],
				$value['first_name'],
			);
		}
		echo json_encode($result);
	}


   
    

    public function Save(){ 
        if($this->session->userdata('user_login_access') != False) {     
            $eid = $this->input->post('eid');    
            $id = $this->input->post('emid');    
            $fname = $this->input->post('fname');
            $lname = $this->input->post('lname');
            $dept = $this->input->post('dept');
            $deg = $this->input->post('deg');
            $role = $this->input->post('role');
            $gender = $this->input->post('gender');
            $contact = $this->input->post('contact');
            $dob = $this->input->post('dob');    
            $joindate = $this->input->post('joindate');    
            $leavedate = $this->input->post('leavedate');    
            $heure_entree = $this->input->post('heure_entree');    
            $email = $this->input->post('email');    
            $password = "f7c3bc1d808e04732adf679965ccc34ca7ae3441";       
            $nid = $this->input->post('nid');        
            $contrat = $this->input->post('contrat');        
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters();
    
            // Validation des champs
            $this->form_validation->set_rules('contact', 'contact', 'trim|min_length[10]|max_length[15]|xss_clean');
    
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
            } else {
                $img_url = ''; // Initialisation de $img_url
    
                if($_FILES['image_url']['name']){
                    $file_name = $_FILES['image_url']['name'];
                    $fileSize = $_FILES["image_url"]["size"]/1024;
                    $fileType = $_FILES["image_url"]["type"];
                    $new_file_name='';
                    $new_file_name .= $emrand;
    
                    $config = array(
                        'file_name' => $new_file_name,
                        'upload_path' => "./uploads/users",
                        'allowed_types' => "gif|jpg|png|jpeg",
                        'overwrite' => False,
                        'max_size' => "20240000", // Peut être défini à une taille spécifique, ici c'est 2 Mo (2048 Kb)
                        'max_height' => "800",
                        'max_width' => "800"
                    );
    
                    $this->load->library('Upload', $config);
                    $this->upload->initialize($config);                
                    if (!$this->upload->do_upload('image_url')) {
                        echo $this->upload->display_errors();
                    } else {
                        $path = $this->upload->data();
                        $img_url = $path['file_name'];
                    }
                }
    
                // Si img_url est vide, définir une image par défaut
                if (empty($img_url)) {
                    $img_url = 'Tel1001.jpg';
                }
    
                $data = array(
                    'em_id' => $eid,
                    'des_id' => $deg,
                    'dep_id' => $dept,
                    'first_name' => $fname,
                    'last_name' => $lname,
                    'em_email' => $email,
                    'em_password' => $password,
                    'em_role' => $role,
                    'em_gender' => $gender,
                    'status' => 'ACTIF',
                    'em_phone' => $contact,
                    'em_birthday' => $dob,
                    'em_joining_date' => $joindate,
                    'em_contact_end' => $leavedate,
                    'em_image' => $img_url,
                    'em_nid' => $nid,
                    'em_entree' => $heure_entree,
                    'contrat' => $contrat
                );
    
                if($id){
                    $success = $this->employee_model->Update($data, $id); 
                    echo "Enregistrement Réussi";
                } else {
                    $success = $this->employee_model->Add($data);
                    echo "Enregistrement Réussi";                     
                }
    
                // Ajout de em_id dans la table notif
                $notif_data = array(
                    'em_id' => $eid,
                    'shift' => "DAY"

                );
                $this->db->insert('shift', $notif_data);
    
                // Ajout de em_id dans la table conge_mois
                $conge_data = array(
                    'em_id' => $eid
                );
                $this->db->insert('conge_mois', $conge_data);
            }
        } else {
            redirect(base_url() , 'refresh');
        }        
    }
    

    public function Update() {
        if ($this->session->userdata('user_login_access') != false) {
            $eid = $this->input->post('eid');
            $id = $this->input->post('emid');
            $fname = $this->input->post('fname');
            $lname = $this->input->post('lname');
            $dept = $this->input->post('dept');
            $deg = $this->input->post('deg');
            $role = $this->input->post('role');
            $lieu_naiss = $this->input->post('lieuu');
            $lieu_cin = $this->input->post('lieu11');
            $groupe  = $this->input->post('gp');
            $cnaps  = $this->input->post('cnap');
            $handycap  = $this->input->post('hcp');
            $categorie  = $this->input->post('cat');
            $nation  = $this->input->post('nat');
            $situation   = $this->input->post('sit');
            $gender = $this->input->post('gender');
            $contact = $this->input->post('contact');
            $dob = $this->input->post('dob');
            $joindate = $this->input->post('joindate');
            $leavedate = $this->input->post('leavedate');
            $heure_entree = $this->input->post('heure_entree');
            $email = $this->input->post('email');
            $password = $this->input->post('password');
            $confirm = $this->input->post('confirm');
            $address = $this->input->post('address');
            $nid = $this->input->post('nid');
            $status = $this->input->post('status');
            $contrat = $this->input->post('contrat');

            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters();
            $this->form_validation->set_rules('contact', 'contact', 'trim|required|min_length[10]|max_length[15]|xss_clean');

            if ($this->form_validation->run() == FALSE) {
                $response = array('status' => 'error', 'message' => validation_errors());
            } else {
                if ($_FILES['image_url']['name']) {
                    $file_name = $_FILES['image_url']['name'];
                    $fileSize = $_FILES["image_url"]["size"] / 1024;
                    $fileType = $_FILES["image_url"]["type"];
                    $new_file_name = '';
                    $new_file_name .= $id;

                    $config = array(
                        'file_name' => $new_file_name,
                        'upload_path' => "./uploads/users",
                        'allowed_types' => "gif|jpg|png|jpeg",
                        'overwrite' => False,
                        'max_size' => "100240000",
                        'max_height' => "5600",
                        'max_width' => "5600"
                    );

                    $this->load->library('Upload', $config);
                    $this->upload->initialize($config);
                    if (!$this->upload->do_upload('image_url')) {
                        $response = array('status' => 'error', 'message' => $this->upload->display_errors());
                    } else {
                        $employee = $this->employee_model->GetBasic($id);
                        $checkimage = "./uploads/users/$employee->em_image";
                        if (file_exists($checkimage)) {
                            unlink($checkimage);
                        }
                        $path = $this->upload->data();
                        $img_url = $path['file_name'];
                        $data = array(
                            'em_id' => $eid,
                            'des_id' => $deg,
                            'dep_id' => $dept,
                            'first_name' => $fname,
                            'last_name' => $lname,
                            'em_email' => $email,
                            'em_role' => $role,
                            'nation' => $nation,
                            'groupe' => $groupe,
                            'n_cnaps' => $cnaps,
                            'handycap' => $handycap,
                            'situation' => $situation,
                            'categorie' => $categorie,
                            'lieu_naiss' => $lieu_naiss,
                            'lieu_cin' => $lieu_cin,
                            'em_gender' => $gender,
                            'status' => $status,
                            'em_phone' => $contact,
                            'em_birthday' => $dob,
                            'em_joining_date' => $joindate,
                            'em_contact_end' => $leavedate,
                            'em_image' => $img_url,
                            'em_address' => $address,
                            'em_nid' => $nid,
                            'em_entree' => $heure_entree,
                            'contrat' => $contrat
                        );
                        if ($id) {
                            $success = $this->employee_model->Update($data, $id);
                            if ($success) {
                                $response = array('status' => 'success', 'message' => 'Mise à jour réussie.');
                            } else {
                                $response = array('status' => 'error', 'message' => 'Erreur lors de la mise à jour dans la base de données.');
                            }
                        } else {
                            $response = array('status' => 'error', 'message' => 'ID de l\'employé manquant.');
                        }
                    }
                } else {
                    $data = array(
                        'em_id' => $eid,
                        'des_id' => $deg,
                        'dep_id' => $dept,
                        'first_name' => $fname,
                        'last_name' => $lname,
                        'em_email' => $email,
                        'em_role' => $role,
                        'nation' => $nation,
                        'situation' => $situation,
                        'groupe' => $groupe,
                        'n_cnaps' => $cnaps,
                        'handycap' => $handycap,
                        'categorie' => $categorie,
                        'lieu_naiss' => $lieu_naiss,
                        'lieu_cin' => $lieu_cin,
                        'em_gender' => $gender,
                        'status' => $status,
                        'em_phone' => $contact,
                        'em_birthday' => $dob,
                        'em_joining_date' => $joindate,
                        'em_contact_end' => $leavedate,
                        'em_address' => $address,
                        'em_nid' => $nid,
                        'em_entree' => $heure_entree,
                        'contrat' => $contrat
                    );
                    if ($id) {
                        $success = $this->employee_model->Update($data, $id);
                        if ($success) {
                            $response = array('status' => 'success', 'message' => 'Mise à jour réussie.');
                        } else {
                            $response = array('status' => 'error', 'message' => 'Erreur lors de la mise à jour dans la base de données.');
                        }
                    } else {
                        $response = array('status' => 'error', 'message' => 'ID de l\'employé manquant.');
                    }
                }
            }
        } else {
            $response = array('status' => 'error', 'message' => 'Session expirée.');
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    }



        public function view() {
            if ($this->session->userdata('user_login_access') != false) {
                $id = base64_decode($this->input->get('I'));
                $data['basic'] = $this->employee_model->GetBasic($id);
                $data['permanent'] = $this->employee_model->GetperAddress($id);
                $data['present'] = $this->employee_model->GetpreAddress($id);
                $data['education'] = $this->employee_model->GetEducation($id);
                $data['experience'] = $this->employee_model->GetExperience($id);
                $data['bankinfo'] = $this->employee_model->GetBankInfo($id);
                $data['fileinfo'] = $this->employee_model->GetFileInfo($id);
                $data['typevalue'] = $this->payroll_model->GetsalaryType();
                $data['conge'] = $this->employee_model->GetConge($id);
                $data['salaryvalue'] = $this->employee_model->GetsalaryValue($id);
                $data['socialmedia'] = $this->employee_model->GetSocialValue($id);
                $year = date('Y');
                $data['Leaveinfo'] = $this->employee_model->GetLeaveiNfo($id, $year);
                $data['degvalue'] = $this->employee_model->getdesignation();
                $data['depvalue'] = $this->employee_model->getdepartment();
    
                $html = $this->load->view('backend/employee_view', $data, true);
                echo $html;
            } else {
                redirect(base_url(), 'refresh');
            }
        }





    public function sview(){
        if($this->session->userdata('user_login_access') != False) {
        $id = base64_decode($this->input->get('I'));
        $data['basic'] = $this->employee_model->GetBasic($id);
        $data['permanent'] = $this->employee_model->GetperAddress($id);
        $data['present'] = $this->employee_model->GetpreAddress($id);
        $data['education'] = $this->employee_model->GetEducation($id);
        $data['experience'] = $this->employee_model->GetExperience($id);
        $data['bankinfo'] = $this->employee_model->GetBankInfo($id);
        $data['fileinfo'] = $this->employee_model->GetFileInfo($id);
        $data['typevalue'] = $this->payroll_model->GetsalaryType();
        $data['conge'] = $this->employee_model->GetConge($id);  
         
        $data['salaryvalue'] = $this->employee_model->GetsalaryValue($id);
        $data['socialmedia'] = $this->employee_model->GetSocialValue($id);
            $year = date('Y');
        $data['Leaveinfo'] = $this->employee_model->GetLeaveiNfo($id,$year);
        $this->load->view('backend/employee_viewM.php',$data);
        }
    else{
		redirect(base_url() , 'refresh');
	}         
    }

    public function conge(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $nb_jour = $this->input->post('nb_jour');
            $data = array();
                $data = array(
                    'emp_id' => $em_id,
                    'nb_jour' => $nb_jour
                );
            if(!empty($id)){
                $success = $this->employee_model->UpdateConge($id,$data);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";                
            } else {
                $success = $this->employee_model->AjoutConge($data);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            }
                       
        
        }
    else{
		redirect(base_url() , 'refresh');
	}             
    }

    public function Parent(){
        if($this->session->userdata('user_login_access') != False) {
       
        $id = $this->input->post('emid');
        $pere = $this->input->post('pere');
        $mere = $this->input->post('mere');
        $nom_ur = $this->input->post('nom_ur');
        $contact_ur = $this->input->post('contact_ur');
        $adresse_ur = $this->input->post('adresse_ur');
            $data = array();
                $data = array(
                   
                    'pere' => $pere,
                    'mere' => $mere,
                    'nom_ur' => $nom_ur,
                    'contact_ur' => $contact_ur,
                    'adresse_ur' => $adresse_ur
                );
            if(empty($id)){
                $success = $this->employee_model->Update($data,$id);
               
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update($data,$id);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            }
                       
        
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Add_Education(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $certificate = $this->input->post('name');
        $institute = $this->input->post('institute');
        $eduresult = $this->input->post('result');
        $eduyear = $this->input->post('year');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('name', 'name', 'trim|required|min_length[2]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('institute', 'institute', 'trim|required|min_length[5]|max_length[250]|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			#redirect("employee/view?I=" .base64_encode($em_id));
			} else {
            $data = array();
                $data = array(
                    'emp_id' => $em_id,
                    'edu_type' => $certificate,
                    'institute' => $institute,
                    'result' => $eduresult,
                    'year' => $eduyear
                );
            if(empty($id)){
                $success = $this->employee_model->Add_education($data);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update_Education($id,$data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            }
                       
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Save_Social(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $facebook = $this->input->post('facebook');
        $twitter = $this->input->post('twitter');
        $google = $this->input->post('google');
        $skype = $this->input->post('skype');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('facebook', 'company_name', 'trim|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			} else {
            $data = array();
                $data = array(
                    'emp_id' => $em_id,
                    'facebook' => $facebook,
                    'twitter' => $twitter,
                    'google_plus' => $google,
                    'skype_id' => $skype
                );
            if(empty($id)){
                $success = $this->employee_model->Insert_Media($data);
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update_Media($id,$data);
                echo "Enregistrement Réussi";
            }
                       
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Add_Experience(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $company = $this->input->post('company_name');
        $position = $this->input->post('position_name');
        $address = $this->input->post('address');
        $start = $this->input->post('work_duration');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('company_name', 'company_name', 'trim|required|min_length[5]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('position_name', 'position_name', 'trim|required|min_length[5]|max_length[250]|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			#redirect("employee/view?I=" .base64_encode($em_id));
			} else {
            $data = array();
                $data = array(
                    'emp_id' => $em_id,
                    'exp_company' => $company,
                    'exp_com_position' => $position,
                    'exp_com_address' => $address,
                    'exp_workduration' => $start
                );
            if(empty($id)){
                $success = $this->employee_model->Add_Experience($data);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update_Experience($id,$data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                echo "Enregistrement Réussi";
            }
                       
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Disciplinary(){
        if($this->session->userdata('user_login_access') != False) {
        $data['desciplinary'] = $this->employee_model->desciplinaryfetch();
        $this->load->view('backend/disciplinary',$data); 
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function add_Desciplinary(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $warning = $this->input->post('warning');
        $title = $this->input->post('title');
        $details = $this->input->post('details');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('title', 'title', 'trim|required|min_length[5]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('details', 'details', 'trim|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			#redirect('Disciplinary');
			} else {
            $data = array();
                $data = array(
                    'em_id' => $em_id,
                    'action' => $warning,
                    'title' => $title,
                    'description' => $details
                );
            if(empty($id)){
                $success = $this->employee_model->Add_Desciplinary($data);
                $this->session->set_flashdata('feedback','Enregistrement Réussi');
                #redirect('employee/Disciplinary');
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update_Desciplinary($id,$data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #redirect("employee/view?I=" .base64_encode($em_id));
                echo "Enregistrement Réussi";
            }
                       
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Add_bank_info(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $em_id = $this->input->post('emid');
        $holder = $this->input->post('holder_name');
        $bank = $this->input->post('bank_name');
        $branch = $this->input->post('branch_name');
        $number = $this->input->post('account_number');
        $account = $this->input->post('account_type');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('holder_name', 'holder name', 'trim|required|min_length[5]|max_length[120]|xss_clean');
        $this->form_validation->set_rules('account_number', 'account name', 'trim|required|min_length[5]|max_length[120]|xss_clean');
        $this->form_validation->set_rules('branch_name', 'branch name', 'trim|required|min_length[5]|max_length[120]|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			redirect("employee/view?I=" .base64_encode($em_id));
			} else {
            $data = array();
                $data = array(
                    'em_id' => $em_id,
                    'holder_name' => $holder,
                    'bank_name' => $bank,
                    'branch_name' => $branch,
                    'account_number' => $number,
                    'account_type' => $account
                );
            if(empty($id)){
                $success = $this->employee_model->Add_BankInfo($data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #redirect("employee/view?I=" .base64_encode($em_id));
                echo "Enregistrement Réussi";
            } else {
                $success = $this->employee_model->Update_BankInfo($id,$data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #redirect("employee/view?I=" .base64_encode($em_id));
                echo "Enregistrement Réussi";
            }
                       
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Reset_Password_Hr(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('emid');
        $onep = $this->input->post('new1');
        $twop = $this->input->post('new2');
            if($onep == $twop){
                $data = array();
                $data = array(
                    'em_password'=> sha1($onep)
                );
        $success = $this->employee_model->Reset_Password($id,$data);
        #$this->session->set_flashdata('feedback','Enregistrement Réussi');
        #redirect("employee/view?I=" .base64_encode($id));
                echo "Enregistrement Réussi";
            } else {
        $this->session->set_flashdata('feedback','Please enter valid password');
        #redirect("employee/view?I=" .base64_encode($id)); 
                echo "Please enter valid password";
            }

        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Reset_Password(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('emid');
        $oldp = sha1($this->input->post('old'));
        $onep = $this->input->post('new1');
        $twop = $this->input->post('new2');
        $pass = $this->employee_model->GetEmployeeId($id);
        if($pass->em_password == $oldp){
            if($onep == $twop){
                $data = array();
                $data = array(
                    'em_password'=> sha1($onep)
                );
        $success = $this->employee_model->Reset_Password($id,$data);
        $this->session->set_flashdata('feedback','Enregistrement Réussi');
        #redirect("employee/view?I=" .base64_encode($id));
                echo "Enregistrement Réussi";
            } else {
        $this->session->set_flashdata('feedback','Please enter valid password');
        #redirect("employee/view?I=" .base64_encode($id));
                echo "Please enter valid password";
            }
        } else {
            $this->session->set_flashdata('feedback','Please enter valid password');
            #redirect("employee/view?I=" .base64_encode($id));
            echo "Please enter valid password";
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Department(){
        if($this->session->userdata('user_login_access') != False) {
        $data['department'] = $this->employee_model->depselect();
        $this->load->view('backend/department',$data);
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Save_dep(){
        if($this->session->userdata('user_login_access') != False) {
       $dep = $this->input->post('department');
       $this->load->library('form_validation');
       $this->form_validation->set_error_delimiters();
       $this->form_validation->set_rules('department','department','trim|required|xss_clean');

       if ($this->form_validation->run() == FALSE) {
           echo validation_errors();
           redirect('employee/Department');
       }else{
        $data = array();
        $data = array('dep_name' => $dep);
        $success = $this->employee_model->Add_Department($data);
        #$this->session->set_flashdata('feedback','Enregistrement Réussi');
        #redirect('employee/Department');
       }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Designation(){
        if($this->session->userdata('user_login_access') != False) {
        $data['designation'] = $this->employee_model->desselect();
        $this->load->view('backend/designation',$data);
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Des_Save(){
        if($this->session->userdata('user_login_access') != False) {
        $des = $this->input->post('designation');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('designation','designation','trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
            redirect('employee/Designation');
        }else{
            $data = array();
            $data = array('des_name' => $des);
            $success = $this->employee_model->Add_Designation($data);
            $this->session->set_flashdata('feedback','Enregistrement Réussi');
            redirect('employee/Designation');
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}
    }
    public function Assign_leave(){
        if($this->session->userdata('user_login_access') != False) {
        $emid = $this->input->post('em_id');
        $type = $this->input->post('typeid');
        $day = $this->input->post('noday');
        $year = $this->input->post('year');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('typeid','typeid','trim|required|xss_clean');
        $success = $this->employee_model->Add_Assign_Leave($data);
        echo "Enregistrement Réussi";
        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
            #redirect('employee/Designation');
        }else{
            $data = array();
            $data = array(
                'emp_id' => $emid,
                'type_id' => $type,
                'day' => $day,
                'total_day' => '0',
                'year' => $year
            );
            $success = $this->employee_model->Add_Assign_Leave($data);
            echo "Enregistrement Réussi";
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}
    }
    public function Add_File(){
    if($this->session->userdata('user_login_access') != False) { 
    $em_id = $this->input->post('em_id');    		
    $filetitle = $this->input->post('title');    		
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('title', 'title', 'trim|required|min_length[10]|max_length[120]|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			
			} else {
            if($_FILES['file_url']['name']){
            $file_name = $_FILES['file_url']['name'];
			$fileSize = $_FILES["file_url"]["size"]/1024;
			$fileType = $_FILES["file_url"]["type"];
			$new_file_name='';
            $new_file_name .= $file_name;

            $config = array(
                'file_name' => $new_file_name,
                'upload_path' => "./uploads/users/",
                'allowed_types' => "gif|jpg|png|jpeg|pdf|doc|docx|xml|text|txt",
                'overwrite' => False,
                'max_size' => "40480000"
            );
    
            $this->load->library('Upload', $config);
            $this->upload->initialize($config);                
            if (!$this->upload->do_upload('file_url')) {
                echo $this->upload->display_errors();
                #redirect("employee/view?I=" .base64_encode($em_id));
			}
   
			else {
                $path = $this->upload->data();
                $img_url = $path['file_name'];
                $data = array();
                $data = array(
                    'em_id' => $em_id,
                    'file_title' => $filetitle,
                    'file_url' => $img_url
                );
            $success = $this->employee_model->File_Upload($data); 
            #$this->session->set_flashdata('feedback','Enregistrement Réussi');
            #redirect("employee/view?I=" .base64_encode($em_id));
                echo "Enregistrement Réussi";
			}
        }
            
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function educationbyib(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$data['educationvalue'] = $this->employee_model->GetEduValue($id);
		echo json_encode($data);
        }
    else{
		redirect(base_url() , 'refresh');
	} 
        
    }
    public function experiencebyib(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$data['expvalue'] = $this->employee_model->GetExpValue($id);
		echo json_encode($data);
        }
    else{
		redirect(base_url() , 'refresh');
	} 
        
    }
    public function DisiplinaryByID(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$data['desipplinary'] = $this->employee_model->GetDesValue($id);
		echo json_encode($data);
        }
    else{
		redirect(base_url() , 'refresh');
	} 
} 
    public function PointageByID(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$data['pointage'] = $this->employee_model->Getpointageid($id);
		echo json_encode($data);
        }
    else{
		redirect(base_url() , 'refresh');
	} 
        
    }
    public function EduvalueDelet(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$success = $this->employee_model->DeletEdu($id);
		echo "Successfully Deletd";
        }
    else{
		redirect(base_url() , 'refresh');
	} 
    }
    public function EXPvalueDelet(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('id');
		$success = $this->employee_model->DeletEXP($id);
		echo "Successfully Deletd";
        }
    else{
		redirect(base_url() , 'refresh');
	} 
    }
    public function DeletDisiplinary(){
        if($this->session->userdata('user_login_access') != False) {  
		$id= $this->input->get('D');
		$success = $this->employee_model->DeletDisiplinary($id);
		#echo "Successfully Deletd";
            redirect('employee/Disciplinary');
        }
    else{
		redirect(base_url() , 'refresh');
	} 
    }
    public function Add_Salary(){
        if($this->session->userdata('user_login_access') != False) { 
        $sid = $this->input->post('sid');
        $aid = $this->input->post('aid');
        $did = $this->input->post('did');
        $em_id = $this->input->post('emid');
        $type = $this->input->post('typeid');
        $total = $this->input->post('total');
        $basic = $this->input->post('basic');
        $medical = $this->input->post('medical');
        $houserent = $this->input->post('houserent');
        $conveyance = $this->input->post('conveyance');
        $provident = $this->input->post('provident');
        $bima = $this->input->post('bima');
        $tax = $this->input->post('tax');
        $others = $this->input->post('others');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('total', 'total', 'trim|required|min_length[3]|max_length[10]|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
			#redirect("employee/view?I=" .base64_encode($em_id));
			} else {
            $data = array();
                $data = array(
                    'emp_id' => $em_id,
                    'type_id' => $type,
                    'total' => $total
                );
            if(!empty($sid)){
                $success = $this->employee_model->Update_Salary($sid,$data);
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #echo "Enregistrement Réussi";
                #$success = $this->employee_model->Add_Salary($data);
                #$insertId = $this->db->insert_id();
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #echo "Enregistrement Réussi";
                if(!empty($aid)){
                $data1 = array();
                $data1 = array(
                    'salary_id' => $sid,
                    'basic' => $basic,
                    'medical' => $medical,
                    'house_rent' => $houserent,
                    'conveyance' => $conveyance
                );
                $success = $this->employee_model->Update_Addition($aid,$data1);                    
                }
                if(!empty($did)){
                 $data2 = array();
                $data2 = array(
                    'salary_id' => $sid,
                    'provident_fund' => $provident,
                    'bima' => $bima,
                    'tax' => $tax,
                    'others' => $others
                );
                $success = $this->employee_model->Update_Deduction($did,$data2);                    
                }

                echo "Enregistrement Réussi";                
            } else {
                $success = $this->employee_model->Add_Salary($data);
                $insertId = $this->db->insert_id();
                #$this->session->set_flashdata('feedback','Enregistrement Réussi');
                #echo "Enregistrement Réussi";
                $data1 = array();
                $data1 = array(
                    'salary_id' => $insertId,
                    'basic' => $basic,
                    'medical' => $medical,
                    'house_rent' => $houserent,
                    'conveyance' => $conveyance
                );
                $success = $this->employee_model->Add_Addition($data1);
                $data2 = array();
                $data2 = array(
                    'salary_id' => $insertId,
                    'provident_fund' => $provident,
                    'bima' => $bima,
                    'tax' => $tax,
                    'others' => $others
                );
                $success = $this->employee_model->Add_Deduction($data2); 
                echo "Enregistrement Réussi";
            }           
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
	public function confirm_mail_send($email,$pass_hash){
		$config = Array( 
		'protocol' => 'smtp', 
		'smtp_host' => 'ssl://smtp.googlemail.com', 
		'smtp_port' => 465, 
		'smtp_user' => 'mail.imojenpay.com', 
		'smtp_pass' => ''
		); 		  
         $from_email = "imojenpay@imojenpay.com"; 
         $to_email = $email; 
   
         //Load email library 
         $this->load->library('email',$config); 
   
         $this->email->from($from_email, 'Dotdev'); 
         $this->email->to($to_email);
         $this->email->subject('Hr Syatem'); 
		 $message	 =	"Your Login Email:"."$email";
		 $message	.=	"Your Password :"."$pass_hash"; 
         $this->email->message($message); 
   
         //Send mail 
         if($this->email->send()){ 
         	$this->session->set_flashdata('feedback','Kindly check your email To reset your password');
		 }
         else {
         $this->session->set_flashdata("feedback","Error in sending Email."); 
		 }			
	}
    public function Inactive_Employee(){
       
        $this->load->view('backend/invalid_user');
    }

    public function GetInactif() {
        $invalidUsers = $this->employee_model->getInvalidUser();
        
        foreach ($invalidUsers as $value) {
            ?>
            <tr>
                <td><?php echo $value->em_id; ?></td>
                <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
                <td><?php echo $value->des_id; ?></td>
                <td><?php echo $value->type; ?></td>
                <td><?php echo $value->date; ?></td>
                <td>
                    <button class="btn btn-warning edit" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>
                </td>
            </tr>
            <?php
        }
    }
    
    public function addInactif() {
        // Obtenir les données du formulaire
        $em_id = $this->input->post('emid');
        $type = $this->input->post('type');
        $date = $this->input->post('date');

        // Validation basique des données
        if (!empty($em_id) && !empty($type) && !empty($date)) {
            // Ajouter l'employé dans la table inactif
            $insertData = array(
                'em_id' => $em_id,
                'type' => $type,
                'date' => $date
            );
            $inserted = $this->employee_model->insertInactif($insertData);

            // Si l'insertion dans la table inactif est réussie, mettre à jour le statut de l'employé
            if ($inserted) {
                $updateStatus = $this->employee_model->updateEmployeeStatus($em_id);

                // Répondre avec un succès ou une erreur
                if ($updateStatus) {
                    echo json_encode(array('status' => 'success', 'message' => 'Employé inactif ajouté et statut mis à jour.'));
                } else {
                    echo json_encode(array('status' => 'error', 'message' => 'Erreur lors de la mise à jour du statut.'));
                }
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Erreur lors de l\'ajout à la table inactif.'));
            }
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'Données invalides.'));
        }
    }


    public function addInactifd() {
        // Obtenir les données du formulaire
        $em_id = $this->input->post('emid');
        $type = $this->input->post('type');
        $date = $this->input->post('date');
    
        // Ajouter des messages de log pour vérifier les données reçues
        log_message('debug', 'em_id: ' . $em_id);
        log_message('debug', 'type: ' . $type);
        log_message('debug', 'date: ' . $date);
    
        // Validation basique des données
        if (!empty($em_id) && !empty($type) && !empty($date)) {
            // Code pour l'insertion et la mise à jour...
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'Données invalides.'));
        }
    }
    

   
}