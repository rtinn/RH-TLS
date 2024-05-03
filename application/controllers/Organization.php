 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Organization extends CI_Controller {


    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('login_model');
        $this->load->model('dashboard_model'); 
        $this->load->model('employee_model'); 
        $this->load->model('organization_model');
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
    public function Department(){
        if($this->session->userdata('user_login_access') != False) { 
        $data['department'] = $this->organization_model->depselect();
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
       $this->form_validation->set_error_delimiters('<div class="error">', '</div>');
       $this->form_validation->set_rules('department','department','trim|required|xss_clean');

       if ($this->form_validation->run() == FALSE) {
           echo validation_errors();
       }else{
        $data = array();
        $data = array('dep_name' => $dep);
        $success = $this->organization_model->Add_Department($data);
        $this->session->set_flashdata('feedback','Successfully Added');
           echo "Successfully Added";
       }
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Delete_dep($dep_id){
        if($this->session->userdata('user_login_access') != False) { 
        $this->organization_model->department_delete($dep_id);
        $this->session->set_flashdata('delsuccess', 'Successfully Deleted');
        redirect('organization/Department');
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Dep_edit($dep){
        if($this->session->userdata('user_login_access') != False) { 
        $data['department'] = $this->organization_model->depselect();
        $data['editdepartment']=$this->organization_model->department_edit($dep);
        $this->load->view('backend/department', $data);
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Update_dep(){
        if($this->session->userdata('user_login_access') != False) { 
        $id = $this->input->post('id');
        $department = $this->input->post('department');
        $data =  array('dep_name' => $department );
        $this->organization_model->Update_Department($id, $data);
        #$this->session->set_flashdata('feedback','Updated Successfully');
        echo "Successfully Added";
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Designation(){
        if($this->session->userdata('user_login_access') != False) { 
        $data['designation'] = $this->organization_model->desselect();
        $this->load->view('backend/designation',$data);
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Hierarchie(){
        
        if($this->session->userdata('user_login_access') != False) { 
        $data['employee']    = $this->employee_model->emselect();
       
        $this->load->view('backend/hierarchie',$data);
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }



    public function get_hierarchie_data() {
        $data = $this->organization_model->hierarchie();
        $output = '';
        foreach($data as $value){
            $output .= '<tr>';
            $output .= '<td>' . $value->em_id . '</td>';
            $output .= '<td>' . $value->first_name . ' ' . $value->last_name . '</td>';
            $output .= '<td><button class="btn btn-danger delete" data-id="' . $value->em_id . '"><i class="fa fa-trash-o"></i></button></td>';
            $output .= '</tr>';
        }
        echo $output;
    }
    
    public function delete_hierarchie() {
        $em_id = $this->input->post('em_id');
        if ($em_id) {
            $this->organization_model->delete_hierarchie($em_id);
            echo 'Employee deleted successfully.';
        } else {
            echo 'Employee ID is missing.';
        }
    }




    public function add_hierarchie() {
        // Vérification de la requête AJAX
        if ($this->input->is_ajax_request()) {
            // Récupérer les données du formulaire
            $em_id = $this->input->post('emid');
           

            // Appeler la méthode du modèle pour enregistrer les données
            $result = $this->organization_model->enregistrer_hierarchie($em_id);

            // Retourner la réponse JSON
            echo json_encode($result);
        } else {
            // Redirection si la requête n'est pas AJAX
            redirect(''); // Remplacez 'accueil' par votre page d'accueil ou une autre page appropriée
        }
    }


    public function get_hierarchie_json() {
        

        $data['employees'] = $this->organization_model->hierarchie();
        echo json_encode($data);
    }
    
    public function get_employee2_list() {
        $id_np = $this->input->get('em_id'); // Récupérer l'ID de l'employé 1 sélectionné
        $data['employees2'] = $this->organization_model->get_employee2_list($id_np);
        echo json_encode($data);
    }



    public function Save_des(){
        if($this->session->userdata('user_login_access') != False) { 
        $des = $this->input->post('designation');
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('designation','designation','trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
        }else{
            $data = array();
            $data = array('des_name' => $des);
            $success = $this->organization_model->Add_Designation($data);
            echo "Successfully Added";
        }
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function des_delete($des_id){
        if($this->session->userdata('user_login_access') != False) {
        $this->organization_model->designation_delete($des_id);
        $this->session->set_flashdata('delsuccess', 'Successfully Deleted');
        redirect('organization/Designation');
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }
    public function Edit_des($des){
        if($this->session->userdata('user_login_access') != False) {
        $data['designation'] = $this->organization_model->desselect();
        $data['editdesignation']=$this->organization_model->designation_edit($des);
        $this->load->view('backend/designation', $data);
        }
    else{
		redirect(base_url() , 'refresh');
	}            
    }
    public function Update_des(){
        if($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('id');
        $designation = $this->input->post('designation');
        $data =  array('des_name' => $designation );
        $this->organization_model->Update_Designation($id, $data);
        echo "Successfully Updated";
        }
    else{
		redirect(base_url() , 'refresh');
	}        
    }

 // Supprimer id np
    public function update_id_np() {
        // Récupérer l'ID de l'employé à mettre à jour
        $em_id = $this->input->post('em_id');

        // Mettre à jour id_np de l'employé en vide dans le modèle
        $this->organization_model->update_id_np($em_id);
        
        // Répondre avec un message de succès (ou tout autre réponse appropriée)
        echo json_encode(array('success' => true));
    }
    
    public function get_all_employees() {
        $employees = $this->employee_model->emselect();
        echo json_encode(array('employees' => $employees));
    }

      // Mettre à jour id_np en fonction de em_id
      public function update_id_np_by_em_id() {
        $em_id = $this->input->post('em_id');
        $employee_id = $this->input->post('employee_id');
        $affected_rows = $this->organization_model->update_id_np_by_em_id($em_id, $employee_id);
        echo json_encode(array('affected_rows' => $affected_rows));
    }

}