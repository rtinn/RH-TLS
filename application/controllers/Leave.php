<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Leave extends CI_Controller
{
    
    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *         http://example.com/index.php/welcome
     *    - or -
     *         http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->model('login_model');
        $this->load->model('dashboard_model');
        $this->load->model('employee_model');
        $this->load->model('leave_model');
        $this->load->model('settings_model');
        $this->load->model('project_model');
    }

    public function index()
    {
        #Redirect to Admin dashboard after authentication
        if ($this->session->userdata('user_login_access') == 1)
            redirect('dashboard/Dashboard');
        $data = array();
        #$data['settingsvalue'] = $this->dashboard_model->GetSettingsValue();
        $this->load->view('login');
    }

 

   

    public function Add_leaves_Type()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id     = $this->input->post('id');
            $name   = $this->input->post('leavename');
            $nodays = $this->input->post('leaveday');
            $status = $this->input->post('status');
            $this->form_validation->set_error_delimiters();
            $this->form_validation->set_rules('leavename', 'leave name', 'trim|required|min_length[1]|max_length[220]|xss_clean');
            
            if ($this->form_validation->run() == FALSE) {
                echo validation_errors();
                #redirect("leave/Holidays");
            } else {
                $data = array();
                $data = array(
                    'name' => $name,
                    'leave_day' => $nodays,
                    'status' => $status
                );
                if (empty($id)) {
                    $success = $this->leave_model->Add_leave_Info($data);
                    echo "Successfully Added";
                } else {
                    $success = $this->leave_model->Update_leave_Info($id, $data);
                    echo "Successfully Updated";
                }
                
            }
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function Application()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $emid = $this->session->userdata('user_login_id');
            $dep= $this->session->userdata('user_dep');
            if($this->session->userdata('user_type')== 'EMPLOYEE'){
                $data['employee']    = $this->employee_model->emselectByID($emid);
             } else if($this->session->userdata('user_type')== 'N+1'){
                $data['employee'] = $this->employee_model->nplus_un($dep);
             } else {
                $data['employee']    = $this->employee_model->emselect(); // obtient les détails des employés actifs
            } 
           
            $this->load->view('backend/leave_approve', $data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }


  
   

    public function LeaveAppbyid()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id                      = $this->input->get('id');
            $emid                    = $this->input->get('emid');
            $data['leaveapplyvalue'] = $this->leave_model->GetLeaveApply($id);
            /*$leaveapplyvalue = $this->leave_model->GetEmLeaveApply($emid);*/
            echo json_encode($data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    
    public function Earnedleave(){
        if ($this->session->userdata('user_login_access') != False) { 
         $data['employee']    = $this->employee_model->emselect(); // obtient les détails des employés actifs
         $data['leavetypes']  = $this->leave_model->GetleavetypeInfo();
         $this->load->view('backend/earnleave');           
        } else {
             redirect(base_url(), 'refresh');
         }           
     }


    public function GetApplication() {
        $data['application'] = $this->leave_model->AllLeaveAPPlication();
        $output = array();
        
        foreach ($data['application'] as $value) { // Itérez sur les demandes de congé (supposons que les demandes de congé sont dans $data['application'])
            ?>
            <tr style="vertical-align: top">
                <td><?php echo $value->em_id; ?></td>
                <td><span><?php echo $value->first_name.' '.$value->last_name ?></span></td>
                <td><?php echo $value->typeid; ?></td>
                <td><?php echo $value->apply_date; ?></td>
                <td><?php echo $value->start_date; ?></td>
                <td>
                <?php
                if ($value->end_date !== null) {
                    echo $value->end_date;
                } else {
                    echo "------------";
                }
                ?>
                </td>
                <td><?php echo $value->leave_duration; ?></td>
                <td><?php echo $value->leave_status; ?></td>
                <td><?php echo $value->leave_status_rh; ?></td>
                    <td class="jsgrid-align-center">
                    <button class="btn btn-primary edit " data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>  
                    </td>
            </tr>
            <?php
        }   
    }

    public function getidConger(){
		$id = $_POST['id'];
		$data = $this->leave_model->getidConger($id);
		echo json_encode($data);
}

public function UpdateLeave() {
    if ($this->session->userdata('user_login_access') != False) {
    $id = $this->input->post('idc');
    $status_n = $this->input->post('status_n');
    $coms_n = $this->input->post('coms_n');
    $full_name = $this->session->userdata('full_name');
    
    // Effectuez la mise à jour de la demande de congé dans la base de données en utilisant le modèle
    $result = $this->leave_model->UpdateLeave($id,$status_n, $coms_n, $full_name);

    // En fonction du résultat de la mise à jour, renvoyez une réponse appropriée
    if ($result) {
        echo json_encode(array('success' => true));
    } else {
        echo json_encode(array('success' => false));
    }
} else {
    redirect(base_url(), 'refresh');
}
}


public function UpdateLeaveRH() {
    if ($this->session->userdata('user_login_access') != False) {
        $id = $this->input->post('idc');
        $ids = $this->input->post('ids');
        $status_rh = $this->input->post('status_rh');
        $coms_rh = $this->input->post('coms_rh');
        $retenu = $this->input->post('retenu');
        $type = $this->input->post('type');  // Ajout de la récupération du type de congé

        $full_name = $this->session->userdata('full_name');

        // Effectuez la mise à jour de la demande de congé dans la base de données en utilisant le modèle
        $result = $this->leave_model->UpdateLeaveRH($id, $status_rh, $coms_rh);
        
        // Ajout de la condition pour mettre à jour en fonction du type de congé
        if ($type == 'Avec solde') {
            $result = $this->leave_model->UpdateLeaveAvecsolde($ids, $retenu); 

        } elseif ($type == 'Maladie') {
            $result = $this->leave_model->UpdateLeaveMaladie($ids, $retenu); 	
        } elseif ($type == 'Maternité') {
            $result = $this->leave_model->UpdateLeaveMaternite($ids, $retenu); 
        }elseif ($type == 'Exceptionnel') {
            $result = $this->leave_model->UpdateLeaveExceptionnel($ids, $retenu);
        }

        // En fonction du résultat de la mise à jour, renvoyez une réponse appropriée
        if ($result) {
            echo json_encode(array('success' => true));
        } else {
            echo json_encode(array('success' => false));
        }
    } else {
        redirect(base_url(), 'refresh');
    }
}

// Modification du modèle pour prendre en compte la mise à jour en fonction du type de congé
public function UpdateLeaveMaladie($ids, $retenu) {
    $data = array(
        'maladie' => $retenu
        // Ajoutez d'autres champs à mettre à jour ici si nécessaire
    );

    $this->db->where('em_id', $ids);
    return $this->db->update('conge_mois', $data);
}








    public function GetEmApplication() {
        $emid = $this->session->userdata('user_login_id');
           
        $data['application'] = $this->leave_model->GetallApplication($emid);
        $output = array();
        
        foreach ($data['application'] as $value) { // Itérez sur les demandes de congé (supposons que les demandes de congé sont dans $data['application'])
            ?>
            <tr style="vertical-align: top">
                <td><?php echo $value->em_id; ?></td>
                <td><span><?php echo $value->first_name.' '.$value->last_name ?></span></td>
                <td><?php echo $value->typeid; ?></td>
                <td><?php echo $value->apply_date; ?></td>
                <td><?php echo $value->start_date; ?></td>
                <td>
                <?php
                if ($value->end_date !== null) {
                    echo $value->end_date;
                } else {
                    echo "------------";
                }
                ?>
                </td>
                <td><?php echo $value->leave_duration; ?></td>
                <td><?php echo $value->leave_status; ?></td>
                <td><?php echo $value->leave_status_rh; ?></td>
                    <td class="jsgrid-align-center">
                    <button class="btn btn-primary edit " data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>  
                    </td>
            </tr>
            <?php
        }      
    }

    public function GetNApplication() {
     
        $dep= $this->session->userdata('user_dep');
        $data['application'] = $this->leave_model->GetNallApplication($dep);
        $output = array();
        
        foreach ($data['application'] as $value) { // Itérez sur les demandes de congé (supposons que les demandes de congé sont dans $data['application'])
            ?>
            <tr style="vertical-align: top">
                <td><?php echo $value->em_id; ?></td>
                <td><span><?php echo $value->first_name.' '.$value->last_name ?></span></td>
                <td><?php echo $value->typeid; ?></td>
                <td><?php echo $value->apply_date; ?></td>
                <td><?php echo $value->start_date; ?></td>
                <td>
                <?php
                if ($value->end_date !== null) {
                    echo $value->end_date;
                } else {
                    echo "------------";
                }
                ?>
                </td>
                <td><?php echo $value->leave_duration; ?></td>
                <td><?php echo $value->leave_status; ?></td>
                <td><?php echo $value->leave_status_rh; ?></td>
                    <td class="jsgrid-align-center">
                    <button class="btn btn-primary edit " data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>  
                    </td>
            </tr>
            <?php
        }      
    }



    public function GetEarnedleave() {
        $data['application'] = $this->leave_model->AllLeaveAPPlicationok();
        $output = array();
        
        foreach ($data['application'] as $value) { // Itérez sur les demandes de congé (supposons que les demandes de congé sont dans $data['application'])
            ?>
            <tr style="vertical-align: top">
                <td><?php echo $value->em_id; ?></td>
                <td><span><?php echo $value->first_name.' '.$value->last_name ?></span></td>
                <td><?php echo $value->name; ?></td>
                <td><?php echo $value->apply_date; ?></td>
                <td><?php echo $value->start_date; ?></td>
                <td><?php echo $value->end_date; ?></td>
                <td>
                    <!-- Votre code pour la durée ici -->
                </td>
                <td><?php echo $value->leave_status; ?></td>
                <?php if ($this->session->userdata('user_type') != 'EMPLOYEE') { ?>
                    <td class="jsgrid-align-center">
                        <?php if ($value->leave_status == 'En attente') { ?>
                            <!-- Votre code ici -->
                        <?php } elseif ($value->leave_status == 'Approuvé') { ?>
                           
                            <button class="btn btn-primary leaveapp " data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></button>
                            <button class="btn btn-success valide" data-id="<?php echo $value->id; ?>"><i class="fa fa-print" aria-hidden="true"></i></button>
                        <?php } elseif ($value->leave_status == 'Rejeté') { ?>
                            <!-- Votre code ici -->
                        <?php } ?>
                        
                       
                    </td>
                <?php } ?>
            </tr>
            <?php
        }   
    }





    public function getidconge(){
		$id = $_POST['id'];
		$data = $this->leave_model->getidconge($id);
		echo json_encode($data);
	}
  
	

    public function Valideconge(){
        $id = $_POST['id'];
        $newStatus = 'Approuvé'; // Remplacez 'NouveauStatut' par la valeur de statut souhaitée
    
        // Appeler la méthode pour mettre à jour le statut
        $query = $this->leave_model->updateStatus($id, $newStatus);
    
        // Vous pouvez également vérifier si la mise à jour s'est bien passée ici
        if ($query) {
            echo "Mise à jour du statut réussie.";
        } else {
            echo "Échec de la mise à jour du statut.";
        }
    }
    public function Rejetconge(){
        $id = $_POST['id'];
        $newStatus = 'Rejeté'; // Remplacez 'NouveauStatut' par la valeur de statut souhaitée
    
        // Appeler la méthode pour mettre à jour le statut
        $query = $this->leave_model->updateStatus($id, $newStatus);
    
    }

    



public function Add_Applications() {
    if ($this->session->userdata('user_login_access') != False) {
        $id           = $this->input->post('id');
            $emid         = $this->input->post('emid');
            $typeid       = $this->input->post('typeid');
            $applydate    = date('d/m/Y');
            $appstartdate = $this->input->post('startdate');
            $appenddate   = $this->input->post('enddate');
            $hourAmount   = $this->input->post('hourAmount');
            $reason       = $this->input->post('reason');
            $type         = $this->input->post('type');
        // Supposez que $emid soit une chaîne de caractères
            // Supposez que $emid soit une chaîne de caractères
            $lastFourDigits = substr($emid, -4);
            $id_conge = str_replace('/', '', $applydate) . $lastFourDigits . rand(1, 9);



            if($type == 'Half Day') {
                $duration = "demi-journée";
            } else if($type == 'Full Day') { 
                $duration = "1 jour" ;
            } else { 
                
                 // Date de début
                $formattedStart = new DateTime($appstartdate);

                // Date de fin
                $formattedEnd = new DateTime($appenddate);

                // Calculer la différence
                $interval = $formattedStart->diff($formattedEnd);

                // Obtenir le nombre de jours
                $duration = $interval->format('%a') . ' jours';
            }

           $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters();
        $this->form_validation->set_rules('startdate', 'Start Date', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
            #redirect("employee/view?I=" .base64_encode($eid));
        } else {
            $data = array();
            $newStartDate = date('d/m/Y', strtotime($appstartdate));

            $newEndDate = null; // Initialisez $newEndDate avec NULL par défaut

            if (!empty($appenddate)) {
                $newEndDate = date('d/m/Y', strtotime($appenddate));
            }

        // Ajoutez la gestion de l'upload d'image ici
        if ($_FILES['file_url']['name']) {
            $file_name = $_FILES['file_url']['name'];
           
            $fileSize = $_FILES["file_url"]["size"] / 1024;
            $fileType = $_FILES["file_url"]["type"];
            $new_file_name = $emid . '_' . $file_name;

            $config = array(
                'file_name' => $new_file_name,
                'upload_path' => "uploads/pj",
                'allowed_types' => "gif|jpg|png|jpeg|pdf|doc|docx",
                'overwrite' => False,
                'max_size' => "50720000"
            );

            $this->load->library('Upload', $config);
            $this->upload->initialize($config);

            if (!$this->upload->do_upload('file_url')) {
                echo $this->upload->display_errors();
            } else {
                $path = $this->upload->data();
                $img_url = $path['file_name'];
            }
        } else {
            // Aucun fichier n'a été téléchargé, définissez 'pj' sur une chaîne vide
            $img_url = '';
        }

        $data = array(
            'em_id' => $emid,
            'typeid' => $typeid,
            'apply_date' => $applydate,
            'start_date' => $newStartDate,
            'end_date' => $newEndDate,
            'reason' => $reason,
            'leave_type' => $type,
            'leave_duration' => $duration,
            'leave_status' => 'En attente',
            'id_conge' => $id_conge,
            'pj' => $img_url
        );

        $notif_data = array(
            'em_id' => $emid,
            'id_conge' => $id_conge
            
        );

        $success = $this->leave_model->Application_Apply($data);
        $success = $this->leave_model->Application_Apply_notif($notif_data);
        echo "Enregistrement Réussi";
    }
}

}




    public function Add_L_Status()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id       = $this->input->post('lid');
            $value    = $this->input->post('lvalue');
            $duration = $this->input->post('duration');
            $type     = $this->input->post('type');
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters();
            $data    = array();
            $data    = array(
                'leave_status' => $value
            );
            $success = $this->leave_model->Application_Apply_Update($id, $data);
            if ($value == 'Approuvé') {
                $totalday = $this->leave_model->GetTotalDay($type);
                $total    = $totalday->total_day + $duration;
                $data     = array();
                $data     = array(
                    'total_day' => $total
                );
                $success  = $this->leave_model->Assign_Duration_Update($type, $data);
                echo "Successfully Updated";
            } else {
                echo "Successfully Updated";
            }
        } else {
            redirect(base_url(), 'refresh');
        }
    }



    public function GetEarneBalanceByEmCode()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id                     = $this->input->get('id');
            $data['earnval'] = $this->leave_model->GetEarneBalanceByEmCode($id);
            echo json_encode($data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function HOLIvalueDelet()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id      = $this->input->get('id');
            $success = $this->leave_model->DeletHoliday($id);
            echo "Successfully Deletd";
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function APPvalueDelet()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id      = $this->input->get('id');
            $success = $this->leave_model->DeletApply($id);
            redirect('leave/Application');
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function LeavetypeDelet()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $id      = $this->input->get('D');
            $success = $this->leave_model->DeletType($id);
            redirect('leave/leavetypes');
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function leavetypes()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $data['leavetypes'] = $this->leave_model->GetleavetypeInfo();
            $this->load->view('backend/leavetypes', $data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }

    public function EmLeavesheet()
    {
        $emid              = $this->session->userdata('user_login_id');
        $data              = array();
        $data['embalance'] = $this->leave_model->EmLeavesheet($emid);
        $this->load->view('backend/leavebalance', $data);
    }

    public function GetemployeeGmLeave()
    {
        $year        = $this->input->get('year');
        $id          = $this->input->get('typeid');
        $emid        = $this->input->get('emid');
        $assignleave = $this->leave_model->GetemassignLeaveType($emid, $id, $year);
        $totaldays   = 0;
        foreach ($assignleave as $value) {
            $totaldays = $totaldays + $value->day;
        }
        $day        = $totaldays;
        $leavetypes = $this->leave_model->GetleavetypeInfoid($id);
        $totalday   = $day . '/' . $leavetypes->leave_day;
        echo $totalday;
    }

    public function Leave_report()
    {
        if ($this->session->userdata('user_login_access') != False) {
            $data['employee'] = $this->employee_model->emselect();
            $this->load->view('backend/leave_report', $data);
        } else {
            redirect(base_url(), 'refresh');
        }
    }
    
    // Get leave details hourly
    public function Get_LeaveDetails()
    {
        $emid   = $this->input->get('emp_id');
        $date   = $this->input->get('date_time');
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters();
            $this->form_validation->set_rules('date_time', 'Date Time', 'trim|required|xss_clean');
            $this->form_validation->set_rules('emp_id', 'Employee', 'trim|required|xss_clean');
        $date = explode('-', $date);

        $day = @$date[0];
        $year = @$date[1];
        
        $report = $this->leave_model->GetEmLEaveReport($emid, $day, $year);

        if (is_array($report) || is_object($report))
        {
            foreach ($report as $value) {

                /*if($value->hour > 8) {
                    $originalDays = $value->hour;
                    $days = $originalDays / 8;
                    $hour = 0;
                    // 120 / 8 = 15 // 15 day
                    // 13 - (1*8) = 5 hour

                    if(is_float($days)) {
                        
                        $days = floor($days); // 1
                        $hour = $value->hour - ($days * 8); // 5
                    }
                } else {
                    $days = 0;
                    $hour = $value->hour;
                }*/
                

                /*$daysDenom = ($days == 1) ? " day " : " days ";
                $hourDenom = ($hour == 1) ? " hour " : " hours ";
                <td>$value->total_duration hours</td>*/

                echo "<tr>
                        <td>$value->em_id</td>
                        <td>$value->first_name $value->last_name</td>
                        <td>$value->name</td>
                        <td>$value->leave_duration hours</td>
                        <td>$value->start_date</td>
                        <td>$value->end_date</td>
                    </tr>";
            }
        } else {
            echo "<p>No Data Found</p>";
        }
    }


    /*Approve and update leave status*/
    public function approveLeaveStatus() {
        if ($this->session->userdata('user_login_access') != False) {
            $employeeId = $this->input->post('employeeId');
            $id       = $this->input->post('lid');
            $value    = $this->input->post('lvalue');
            $duration = $this->input->post('duration');
            $type     = $this->input->post('type');
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters();
            
            $data    = array();
            $data    = array(
                'leave_status' => $value
            );
            $success = $this->leave_model->updateAplicationAsResolved($id, $data);
            if ($value == 'Approuvé') {
                $determineIfNew = $this->leave_model->determineIfNewLeaveAssign($employeeId, $type);
                //How much taken
                $totalHour = $this->leave_model->getLeaveTypeTotal($employeeId, $type);
                //If already taken some
                if($determineIfNew  > 0) {
                    $total    = $totalHour[0]->totalTaken + $duration;
                    $data     = array();
                    $data     = array(
                        'hour' => $total
                    );
            $success  = $this->leave_model->updateLeaveAssignedInfo($employeeId, $type, $data);
            $earnval = $this->leave_model->emEarnselectByLeave($employeeId); 
              $data = array();
              $data = array(
                        'present_date' => $earnval->present_date - ($duration/8),
                        'hour' => $earnval->hour - $duration
                    );
            $success = $this->leave_model->UpdteEarnValue($employeeId,$data);                     
            echo "Updated successfully";
                } else {
                //If not taken yet
                    $data     = array();
                    $data = array(
                        'emp_id' => $employeeId,
                        'type_id' => $type,
                        'hour' => $duration,
                        'dateyear' => date('Y')
                    );
                    $success  = $this->leave_model->insertLeaveAssignedInfo($data);
                    echo "Updated successfully";
                }
            } else {
                echo "Updated successfully";
            }
        }
    }


    public function getLeaveData() {
        $em_id = $this->input->post('em_id');
        $leaveData = $this->leave_model->getLeaveData($em_id);
        
        // Envoyez les données en réponse Ajax
        echo json_encode($leaveData);
    }






    public function Update_Earn_Leave(){
        $employee = $this->input->post('emid');
        $start    = $this->input->post('startdate');
        $end     = $this->input->post('enddate');
            if(empty($end)){
               $days = '1'; 
                //die($nofdate);
            } else{
            $date1 = new DateTime($start);
            $date2 = new DateTime($end);
            $diff = date_diff($date1,$date2);
            $days = $diff->format("%a");
            //die($nofdate);     
            }        
        $hour = $days * 8;
        $emcode = $this->employee_model->emselectByCode($employee);
        $emid = $emcode->em_id;
        $earnval = $this->leave_model->emEarnselectByLeave($emid);
        if(!empty($earnval)){
              $data = array();
              $data = array(
                        'present_date' => $earnval->present_date + $days,
                        'hour' => $earnval->hour + $hour,
                        'status' => '1'
                    );
        $success = $this->leave_model->UpdteEarnValue($emid,$data);          
        } else {
              $data = array();
              $data = array(
                        'em_id' => $emid,
                        'present_date' => $days,
                        'hour' => $hour,
                        'status' => '1'
                    );
        $success = $this->leave_model->Add_Earn_Leave($data);  
        }

        if($this->db->affected_rows()){
            $startdate = strtotime($start);
            $enddate = strtotime($end);
            for($i = $startdate; $i <= $enddate; $i = strtotime('+1 day', $i)){
                $date = date('Y-m-d',$i);
              $data = array();
              $data = array(
                        'emp_id' => $employee,
                        'atten_date' => $date,
                        'working_hour' => '480',
                        'signin_time' => '09:00:00',
                        'signout_time' => '17:00:00',
                        'status' => 'E'
                    );
        $this->project_model->insertAttendanceByFieldVisitReturn($data); 
                
            }
            echo "Successfully Added";
    }
    }
    public function Update_Earn_Leave_Only(){
        $emid = $this->input->post('employee');
        $days         = $this->input->post('day');
        $hour         = $this->input->post('hour');
              $data = array();
              $data = array(
                        'present_date' => $days,
                        'hour' => $hour
                    );
        $success = $this->leave_model->UpdteEarnValue($emid,$data);
        echo "Successfully Updated.";
    }
}
