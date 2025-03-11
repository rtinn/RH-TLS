 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	    function __construct() {
        parent::__construct();
        date_default_timezone_set('Asia/Dhaka');
        $this->load->database();
        $this->load->model('login_model');
        $this->load->model('dashboard_model'); 
        $this->load->model('employee_model');
        $this->load->model('settings_model');    
        $this->load->model('notice_model');    
        $this->load->model('project_model');    
        $this->load->model('leave_model'); 
        $this->load->model('Pointage_model');   
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
    function Dashboard(){
        if($this->session->userdata('user_login_access') != False) {
        $this->load->view('backend/dashboard');
        
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }


    public function age_distribution() {
        $this->load->model('Employee_model');
        $age_distribution = $this->employee_model->get_age_distribution();

        // Envoyer les données sous format JSON pour AJAX
        echo json_encode($age_distribution);
    }


    public function age_distributionD() {
        $this->load->model('Employee_model');
        $age_distribution_by_department = $this->Employee_model->get_age_distribution_by_department();
    
        // Envoyer les données sous format JSON pour AJAX
        echo json_encode($age_distribution_by_department);
    }

    public function presence_rate() {
        $presenceRates = $this->employee_model->getPresenceRates();
        
        // Préparer les données pour le graphique
        $data = [];
        foreach ($presenceRates as $rate) {
            $data[$rate->Date] = $rate->total;
        }
        
        // Envoyer les données sous forme de JSON
        echo json_encode($data);
    }


 // Méthode pour retourner les données de présence et d'absence en JSON
 public function get_data() {
    $dates = $this->employee_model->get_all_dates();
    $data = [];

    foreach ($dates as $dateRow) {
        $date = $dateRow['Date'];
        $presenceCount = $this->employee_model->get_presence_count($date);
        $absenceCount = $this->employee_model->get_absence_count($date);

        $data[] = [
            'date' => $date,
            'presence' => $presenceCount,
            'absence' => $absenceCount
        ];
    }

    echo json_encode($data);  // Retourne les données en format JSON
}


public function employeedepartement() {
    $employee_counts = $this->employee_model->getEmployeeCountByDepartment();
    echo json_encode($employee_counts); // Retourne les données en JSON
}

    


//STATISTIQUE PAR GENRE PAR DEPATEMENTS
public function gender_statistics() {
    $data = $this->employee_model->get_gender_statistics();
    echo json_encode($data); // Retourne les données en JSON
}
//STATISTIQUE PAR CONTRAT  PAR DEPATEMENTS
public function contract_statistics() {
    $data = $this->employee_model->get_contract_statistics();
    echo json_encode($data); // Retourne les données en JSON
}



    public function add_todo(){
        $userid = $this->input->post('userid');
        $tododata = $this->input->post('todo_data');
        $date = date("Y-m-d h:i:sa");
        $this->load->library('form_validation');
        //validating to do list data
        $this->form_validation->set_rules('todo_data', 'To-do Data', 'trim|required|min_length[5]|max_length[150]|xss_clean');        
        if($this->form_validation->run() == FALSE){
            echo validation_errors();
        } else {
        $data=array();
        $data = array(
        'user_id' => $userid,
        'to_dodata' =>$tododata,
        'value' =>'1',
        'date' =>$date    
        );
        $success = $this->dashboard_model->insert_tododata($data);
            #echo "successfully added";
            if($this->db->affected_rows()){
                echo "Successfully Added";
            } else {
                echo "validation Error";
            }
        }        
    }
	public function Update_Todo(){
        $id = $this->input->post('toid');
		$value = $this->input->post('tovalue');
			$data = array();
			$data = array(
				'value'=> $value
			);
        $update= $this->dashboard_model->UpdateTododata($id,$data);
        $inserted = $this->db->affected_rows();
		if($inserted){
			$message="Successfully Added";
			echo $message;
		} else {
			$message="Something went wrong";
			echo $message;			
		}
	}    
    
}