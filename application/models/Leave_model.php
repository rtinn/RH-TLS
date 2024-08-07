<?php

	class Leave_model extends CI_Model {


	function __consturct(){
	parent::__construct();
	
	}
    public function Add_HolidayInfo($data){
        $this->db->insert('holiday',$data);
    }

    public function getLeaveData($em_id) {
        // Effectuez une requête pour récupérer les données en fonction de l'em_id et du leavetype
        $this->db->select('*');
        $this->db->where('em_id', $em_id);
        $query = $this->db->get('conge_mois');
        // Renvoyez les résultats de la requête
        return $query->row();
    }



    public function getMaladie($em_id) {
        // Remplacez cette requête par la requête SQL pour obtenir le nombre de jours de congé en fonction de l'ID de l'employé et du type de congé (dans ce cas, "Avec solde").
        $this->db->select('maladie');
        $this->db->from('conge_mois');
        $this->db->where('em_id', $em_id);
       
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            $row = $query->row();
            return $row->maladie;
        } else {
            return 0; // Retournez 0 ou une autre valeur par défaut si aucune correspondance n'est trouvée.
        }
    }





    // Add the application of leave with ID no ID
    public function Application_Apply($data){
        $this->db->insert('emp_leave',$data);
    }
    public function Application_Apply_notif($notif_data){
        $this->db->insert('notif',$notif_data);
    }

   

    // Add Earn leave with ID no ID
    public function Add_Earn_Leave($data){
        $this->db->insert('earned_leave',$data);
    }

    // Update application with employee ID
    public function Application_Apply_Update($id, $data){
        $this->db->where('id', $id);
        $this->db->update('emp_leave', $data);         
    }

    public function Add_leave_Info($data){
        $this->db->insert('leave_types',$data);
    }
    public function Application_Apply_Approve($data){
        $this->db->insert('assign_leave', $data);
    }
    public function GetAllHoliInfo(){
        $sql = "SELECT * FROM `holiday`";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result;
    }
    public function GetAllHoliInfoForCalendar(){
        $sql = "SELECT holiday_name AS `title`, from_date AS `start` FROM `holiday`";
        $query = $this->db->query($sql);
        $result = $query->result();
        return json_encode($result);
    }
    public function GetLeaveValue($id){
        $sql = "SELECT * FROM `holiday` WHERE `id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetEarneBalanceByEmCode($id){
        $sql = "SELECT `earned_leave`.*,
        `employee`.`em_id`,CONCAT(`first_name`, ' ', `last_name`) AS emname
        FROM `earned_leave`
        LEFT JOIN `employee` ON `earned_leave`.`em_id`=`employee`.`em_id`
        WHERE `earned_leave`.`em_id`='$id'";        
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetLeaveType($id){
        $sql = "SELECT * FROM `leave_types` WHERE `type_id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetleavetypeInfo(){
        $sql = "SELECT * FROM `leave_types` WHERE `status`='1' ORDER BY `type_id` DESC";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result; 
    }
    public function GetleavetypeInfoid($id){
        $sql = "SELECT * FROM `leave_types` WHERE `status`='1' AND `type_id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetemassignLeaveType($emid,$id,$year){
        $sql = "SELECT `hour` FROM `assign_leave` WHERE `assign_leave`.`emp_id`='$emid' AND `type_id`='$id' AND `dateyear`='$year'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result;
    }
    public function GetTotalDay($type){
        $sql = "SELECT * FROM `assign_leave` WHERE `assign_leave`.`type_id`='$type'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetemLeaveType($id,$year){
        $sql = "SELECT `assign_leave`.*,
        `leave_types`.`name`
        FROM `assign_leave`
        LEFT JOIN `leave_types` ON `assign_leave`.`type_id`=`leave_types`.`type_id`
        WHERE `assign_leave`.`emp_id`='$id' AND `dateyear`='$year'
        ";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result; 
    }
    public function GetEmLEaveReport($emid, $day, $year){

        if($emid == "all") {
        $sql = "SELECT `emp_leave`.*,
                (SELECT SUM(`leave_duration`) 
                    FROM emp_leave
                    WHERE  MONTH(start_date) = '$day' AND YEAR(start_date) = '$year') AS `total_duration`,
                    `employee`.`first_name`,`last_name`,`em_id`,
                    `leave_types`.`name`
                FROM `emp_leave`
                    LEFT JOIN `leave_types` ON `emp_leave`.`typeid`=`leave_types`.`type_id`
                    LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
                WHERE MONTH(start_date) = '$day' AND YEAR(start_date) = '$year'";
    } else {

        $sql = "SELECT `emp_leave`.*, (SELECT SUM(`leave_duration`) 
       FROM emp_leave
       WHERE  `emp_leave`.`em_id` = '$emid' AND MONTH(start_date) = '$day' AND YEAR(start_date) = '$year') AS `total_duration`,
        `employee`.`first_name`,`last_name`,`em_id`, 
        `leave_types`.`name`
        FROM `emp_leave`
        LEFT JOIN `leave_types` ON `emp_leave`.`typeid`=`leave_types`.`type_id`
        LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
        WHERE `emp_leave`.`em_id` = '$emid' AND MONTH(start_date) = '$day' AND YEAR(start_date) = '$year'";

/*public function GetEmLEaveReport($emid, $date){

        if($emid == "all") {
            $sql = "SELECT `assign_leave`.*,
        `employee`.`first_name`,`last_name`,
        `leave_types`.`name`
        FROM `assign_leave`
        LEFT JOIN `leave_types` ON `assign_leave`.`type_id`=`leave_types`.`type_id`
        LEFT JOIN `employee` ON `assign_leave`.`emp_id`=`employee`.`em_id`
        WHERE `dateyear`='$date'
        ";
    } else {

        $sql = "SELECT `assign_leave`.*,
        `employee`.`first_name`,`last_name`,
        `leave_types`.`name`
        FROM `assign_leave`
        LEFT JOIN `leave_types` ON `assign_leave`.`type_id`=`leave_types`.`type_id`
        LEFT JOIN `employee` ON `assign_leave`.`emp_id`=`employee`.`em_id`
        WHERE `assign_leave`.`emp_id`='$emid' AND `dateyear`='$date'
        ";
    }

*/
        
    }
    $query = $this->db->query($sql);
    $result = $query->result();
    return $result; 
}
    public function GetLeaveTodayN($dep){
    $sql = "SELECT `emp_leave`.*,
      `employee`.`em_id`,`first_name`,`last_name`,
      `notif`.`id_conge`,`st_emp`
      FROM `emp_leave`
      LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
      LEFT JOIN `notif` ON `emp_leave`.`id_conge`=`notif`.`id_conge`
      WHERE `employee`.`dep_id` = '$dep' AND `notif`.`st_emp`= '0' ";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result; 
    }

    public function GetLeaveTodayE($id){
        $sql = "SELECT `emp_leave`.*,
          `employee`.`em_id`,`first_name`,`last_name`,
          `notif`.`id_conge`,`st_n`
          FROM `emp_leave`
          LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
          LEFT JOIN `notif` ON `emp_leave`.`id_conge`=`notif`.`id_conge`
          WHERE `emp_leave`.`em_id` = '$id' AND `notif`.`st_emp`= '1' ";
            $query=$this->db->query($sql);
            $result = $query->result();
            return $result; 
        }
        public function GetLeaveTodayAll(){
            $sql = "SELECT `emp_leave`.*,
              `employee`.`em_id`,`first_name`,`last_name`,
              `notif`.`id_conge`,`st_n`
              FROM `emp_leave`
              LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
              LEFT JOIN `notif` ON `emp_leave`.`id_conge`=`notif`.`id_conge`
              WHERE `notif`.`st_n`= '1' ";
                $query=$this->db->query($sql);
                $result = $query->result();
                return $result; 
            }

    public function GetLeaveApply($id){
        $sql = "SELECT `emp_leave`.*,
      `employee`.`em_id`,`first_name`,`last_name`
      FROM `emp_leave`
      LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id` 
      WHERE `emp_leave`.`id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetEarnedleaveBalance(){
        $sql = "SELECT `earned_leave`.*, `employee`.`first_name`,`last_name`,`em_id` FROM `earned_leave` LEFT JOIN `employee` ON `earned_leave`.`em_id`=`employee`.`em_id` WHERE `earned_leave`.`hour` > 0 AND `employee`.`status`='ACTIVE'";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result; 
    }
    public function emEarnselectByLeave($emid){
        $sql = "SELECT * FROM `earned_leave` WHERE `em_id`='$emid'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetallApplication($emid){
    $sql = "SELECT `emp_leave`.*,
      `employee`.`em_id`,`first_name`,`last_name`
   
      FROM `emp_leave`
      LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
     
      WHERE `emp_leave`.`em_id`='$emid'";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result; 

        
    }
    public function GetNallApplication($dep){
        $sql = "SELECT `emp_leave`.*,
          `employee`.`em_id`,`first_name`,`last_name`,`dep_id`
       
          FROM `emp_leave`
          LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
         
          WHERE `employee`.`dep_id`='$dep'";
            $query=$this->db->query($sql);
            $result = $query->result();
            return $result; 
    
            
        }

       //NOMBRE DE NOTIFICATIONS POUR EMPLOYEE
        public function GetnbnotifE2($id) {
            $sql = "SELECT COUNT(*) as nb_notif FROM `notif`
                    WHERE `em_id`='$id' AND `st_admin`='1'";
            $query = $this->db->query($sql);
            $result = $query->row(); // Utilisez row() au lieu de result() pour obtenir une seule ligne
        
            // Accédez au nombre de notifications avec $result->nb_notif
            return $result->nb_notif;
        }
        public function GetnbnotifE1($id) {
            $sql = "SELECT COUNT(*) as nb_notif FROM `notif`
                    WHERE `em_id`='$id' AND `st_emp`='1'";
            $query = $this->db->query($sql);
            $result = $query->row(); // Utilisez row() au lieu de result() pour obtenir une seule ligne
        
            // Accédez au nombre de notifications avec $result->nb_notif
            return $result->nb_notif;
        }

        public function GetnbnotifE($id) {
            $countE1 = $this->GetnbnotifE1($id);
            $countE2 = $this->GetnbnotifE2($id);
        
            // Somme des résultats
            $sum = $countE1 + $countE2;
        
            return $sum;
        }
    //FIN NOMBRE DE NOTIFICATIONS POUR EMPLOYEE


    public function GetnbnotifN($dep) {
        $sql = "SELECT COUNT(*) as `notif`
                FROM (
                    SELECT `employee`.`em_id`, `dep_id`
                    FROM `notif`
                    LEFT JOIN `employee` ON `notif`.`em_id` = `employee`.`em_id`
                    WHERE `employee`.`dep_id` = ?
                    AND `st_emp` = '0'
                ) AS subquery";
        
        $query = $this->db->query($sql, array($dep));
        $result = $query->row();
        
        // Accédez au nombre de notifications avec $result->notif
        return $result->notif;
    }
    

    public function GetnbnotifAll() {
        $sql = "SELECT COUNT(*) as nb_notif FROM `notif`
        WHERE `st_n`='1'";
        $query = $this->db->query($sql);
        $result = $query->row(); // Utilisez row() au lieu de result() pour obtenir une seule ligne

        // Accédez au nombre de notifications avec $result->nb_notif
        return $result->nb_notif;
    }
  




    public function getidConger($id){
        $sql = "SELECT `emp_leave`.*,
        `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`dep_id`,
        `conge_mois`.`nb_jour`,`maladie`,`maternite`,`except`,
        `notif`.`id_conge`,`st_emp`,`st_n`,`st_admin`
         FROM `emp_leave`
         LEFT JOIN `employee` ON `emp_leave`.`em_id` = `employee`.`em_id`
         LEFT JOIN `conge_mois` ON `emp_leave`.`em_id` = `conge_mois`.`em_id`
         LEFT JOIN `notif` ON `emp_leave`.`id_conge` = `notif`.`id_conge`
         WHERE `emp_leave`.`id` = ?";
         
        $query = $this->db->query($sql, array($id));
        return $query->row_array();
      }
      

      public function UpdateLeave($id,$status_n, $coms_n, $full_name) {

        $data = array(
            'leave_status' => $status_n,
            'coms_n' => $coms_n,
            'id_nplus' => $full_name

            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('id', $id);
        return $this->db->update('emp_leave', $data);
    }
    public function UpdateLeave_notif($id_conge) {

        $data = array(
            'st_emp' => 1,
            'st_n' => 1
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('id_conge', $id_conge);
        return $this->db->update('notif', $data);
    }

    public function UpdateLeaveRH($id,$status_rh, $coms_rh) {

        $data = array(
            'leave_status_rh' => $status_rh,
            'coms_rh' => $coms_rh,
          

            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('id', $id);
        return $this->db->update('emp_leave', $data);
    }


    public function UpdateLeave_notifRH($id_conge) {

        $data = array(
           
            'st_n' => 2,
            'st_admin' => 1
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('id_conge', $id_conge);
        return $this->db->update('notif', $data);
    }

    
    
    public function UpdateLeaveAvecsolde($ids,$retenu) {

        $data = array(
            'nb_jour' => $retenu
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('em_id', $ids);
        return $this->db->update('conge_mois', $data);
    }
    public function UpdateLeaveMaladie($ids,$retenu) {

        $data = array(
            'maladie' => $retenu
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('em_id', $ids);
        return $this->db->update('conge_mois', $data);
    }
    public function UpdateLeaveMaternite($ids,$retenu) {

        $data = array(
            'maternite' => $retenu
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('em_id', $ids);
        return $this->db->update('conge_mois', $data);
    }
    public function UpdateLeaveExceptionnel($ids,$retenu) {

        $data = array(
            'except' => $retenu
            // Ajoutez d'autres champs à mettre à jour ici si nécessaire
        );
    
        $this->db->where('em_id', $ids);
        return $this->db->update('conge_mois', $data);
    }






    public function AllLeaveAPPlication(){
    $sql = "SELECT `emp_leave`.*,
      `employee`.`em_id`,`first_name`,`last_name`
      FROM `emp_leave`
      LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
     WHERE `emp_leave`.`leave_status`='Approuvé'
      ";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result; 
    }

    public function AllLeaveAPPlicationok(){
        $sql = "SELECT `emp_leave`.*,
          `employee`.`em_id`,`first_name`,`last_name`,
          `leave_types`.`type_id`,`name`
          FROM `emp_leave`
          LEFT JOIN `employee` ON `emp_leave`.`em_id`=`employee`.`em_id`
             WHERE `emp_leave`.`leave_status`='Approuvé'";
            $query=$this->db->query($sql);
            $result = $query->result();
            return $result; 
        }

    public function EmLeavesheet($emid){
    $sql = "SELECT `assign_leave`.*,
      `employee`.`em_id`,`first_name`,`last_name`,
      `leave_types`.`type_id`,`name`
      FROM `assign_leave`
      LEFT JOIN `employee` ON `assign_leave`.`emp_id`=`employee`.`em_id`
      LEFT JOIN `leave_types` ON `assign_leave`.`type_id`=`leave_types`.`type_id`
      WHERE `assign_leave`.`emp_id`='$emid'";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result; 
    }
    public function Update_HolidayInfo($id,$data){
		$this->db->where('id', $id);
		$this->db->update('holiday',$data);         
    }

    public function Update_leave_Info($id,$data){
		$this->db->where('type_id', $id);
		$this->db->update('leave_types',$data);         
    }
    public function Assign_Duration_Update($type,$data){
        $this->db->where('type_id', $type);
        $this->db->update('assign_leave', $data);         
    }
    public function DeletHoliday($id){
        $this->db->delete('holiday',array('id'=> $id));        
    }
    public function DeletType($id){
        $this->db->delete('leave_types',array('type_id'=> $id));        
    }
    public function DeletApply($id){
        $this->db->delete('emp_leave',array('id'=> $id));        
    }




    public function updateAplicationAsResolved($id, $data){
        $this->db->where('id', $id);
        $this->db->update('emp_leave', $data);         
    }  

    public function getLeaveTypeTotal($emid, $type){
        $sql = "SELECT SUM(`hour`) AS 'totalTaken' FROM `assign_leave` WHERE `assign_leave`.`emp_id`='$emid' AND `assign_leave`.`type_id`='$type'";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result;
    }

    public function updateLeaveAssignedInfo($employeeID, $type, $data){
        
        $this->db->where('type_id', $type);
        $this->db->where('emp_id', $employeeID);
        $this->db->update('assign_leave', $data);         
    }

    public function UpdteEarnValue($emid,$data){
        $this->db->where('em_id', $emid);
        $this->db->update('earned_leave', $data);         
    }


    public function insertLeaveAssignedInfo($data){
        $this->db->insert('assign_leave', $data);
    }

    public function determineIfNewLeaveAssign($employeeId, $type){
         $sql = "SELECT * FROM `assign_leave` WHERE `assign_leave`.`emp_id` = '$employeeId' AND `assign_leave`.`type_id` = '$type'";
        $query = $this->db->query($sql);
        return $query->num_rows();
    }

    public function get_holiday_between_dates($day) {
        $sql = "SELECT * FROM `holiday` WHERE ('$day' = `holiday`.`from_date`) OR ('$day' BETWEEN `holiday`.`from_date` AND `holiday`.`to_date`)";
        $query = $this->db->query($sql);
        return $query->row();
    }

  
    public function Getidconge($id){
        $sql = "SELECT * FROM `emp_leave`
         WHERE `id` = ?";
        $query = $this->db->query($sql, array($id));
        return $query->row_array();
      }

      public function updateStatus($id, $newStatus){
        $this->db->where('id', $id);
        return $this->db->update('emp_leave', array('leave_status' => $newStatus));
    }
    

    }
?>    