<?php

	class Employee_model extends CI_Model{


	function __consturct(){
	parent::__construct();
	
	}

// Insertion dans employee
public function insert_employee($data) {
  try {
      $this->db->insert('employee', $data);
      return $this->db->affected_rows() > 0;
  } catch (Exception $e) {
      log_message('error', 'Erreur lors de l\'insertion dans employee : ' . $e->getMessage());
      return false;
  }
}

// Insertion dans conge_mois
public function insert_employee_conge($data) {
  try {
      $this->db->insert('conge_mois', $data);
      return $this->db->affected_rows() > 0;
  } catch (Exception $e) {
      log_message('error', 'Erreur lors de l\'insertion dans conge_mois : ' . $e->getMessage());
      return false;
  }
}


	public function getdesignation(){
	$query = $this->db->get('designation');
	$result = $query->result();
	return $result;
	}
    public function getdepartment(){
	$query = $this->db->get('department');
	$result = $query->result();
	return $result;
	}
    
  public function fetchAllData($data,$tablename,$where)
	{
		$query = $this->db->select($data)
						->from($tablename)
						->where($where)
						->get();
		return $query->result_array();
	}












// Pour un seul employé (non utilisé ici, mais conservé pour compatibilité)
public function import_employee($data) {
  try {
      return $this->db->insert('employee', $data);
  } catch (Exception $e) {
      log_message('error', 'Erreur lors de l\'insertion : ' . $e->getMessage());
      return false;
  }
}
// Pour plusieurs employés (insertion en masse avec vérification de duplicata sur em_id)
public function import_batch_employee($data) {
  if (empty($data)) return 0;
  
  try {
      $inserted_count = 0;
      $existing_em_ids = $this->get_existing_em_ids();

      foreach ($data as $employee_data) {
          if (!empty($employee_data['em_id']) && !in_array($employee_data['em_id'], $existing_em_ids)) {
              $this->db->insert('employee', $employee_data);
              if ($this->db->affected_rows() > 0) {
                  $inserted_count++;
                  $existing_em_ids[] = $employee_data['em_id'];
              }
          }
      }

      log_message('debug', 'Requête SQL finale (employee) : ' . $this->db->last_query());
      log_message('debug', 'Nombre de lignes insérées dans employee : ' . $inserted_count);
      return $inserted_count;
  } catch (Exception $e) {
      log_message('error', 'Erreur lors de l\'insertion en masse dans employee : ' . $e->getMessage());
      return 0;
  }
}

// Méthode pour récupérer tous les em_id existants dans employee (maintenant publique)
public function get_existing_em_ids() {
  $query = $this->db->select('em_id')->get('employee');
  return array_column($query->result_array(), 'em_id');
}

// Méthode pour récupérer tous les em_id existants dans conge_mois (maintenant publique)
public function get_existing_conge_mois_em_ids() {
  $query = $this->db->select('em_id')->get('conge_mois');
  return array_column($query->result_array(), 'em_id');
}

// Pour plusieurs employés dans conge_mois (insertion en masse avec vérification de duplicata sur em_id)
public function import_batch_conge_mois($data) {
  if (empty($data)) return 0;

  try {
      $inserted_count = 0;
      $existing_em_ids = $this->get_existing_conge_mois_em_ids();

      foreach ($data as $conge_mois_data) {
          if (!empty($conge_mois_data['em_id']) && !in_array($conge_mois_data['em_id'], $existing_em_ids)) {
              $this->db->insert('conge_mois', $conge_mois_data);
              if ($this->db->affected_rows() > 0) {
                  $inserted_count++;
                  $existing_em_ids[] = $conge_mois_data['em_id'];
              }
          }
      }

      log_message('debug', 'Requête SQL finale (conge_mois) : ' . $this->db->last_query());
      log_message('debug', 'Nombre de lignes insérées dans conge_mois : ' . $inserted_count);
      return $inserted_count;
  } catch (Exception $e) {
      log_message('error', 'Erreur lors de l\'insertion en masse dans conge_mois : ' . $e->getMessage());
      return 0;
  }
}


public function get_all_employees() {
  $sql = "SELECT *
          FROM `employee`
          WHERE `status` = 'ACTIF' AND `em_id` != 'T0000'
          ORDER BY `em_id` ASC";
  
  $query = $this->db->query($sql);
  $result = $query->result();
  return $result;
}



  public function emselect(){
    $sql = "SELECT *
            FROM `employee`
            WHERE `status` = 'ACTIF' AND `em_id` != 'T0000'
            ORDER BY `em_id` ASC";
    
    $query = $this->db->query($sql);
    $result = $query->result();
    return $result;
}
//requete pour afficher la liste de personnel sur sup hierarchique
public function getListeH() {
  $sql = "SELECT *
          FROM `employee`
          WHERE `status` = 'ACTIF' 
            AND `em_id` != 'T0000'
            AND (`id_np` IS NULL OR `id_np` = '')
          ORDER BY `em_id` ASC";
  
  $query = $this->db->query($sql);
  $result = $query->result();
  return $result;
}

//requete pour afficher la listes des equipes
public function nplus_un($emid) {
  $sql = "SELECT *
  FROM `employee`
  WHERE `status` = 'ACTIF' AND `em_id` != 'T0000'  AND `id_np`='$emid'";

$query = $this->db->query($sql);
$result = $query->result();
return $result;
}

//requete pour afficher la liste deroulante demande conger N+1 / fusion de n+1 et l'equipe
public function emselectAndNplusUn($emid){
  $sql = "SELECT * FROM `employee`
          WHERE `em_id`='$emid'
          UNION
          SELECT * FROM `employee`
          WHERE `status` = 'ACTIF' AND `em_id` != 'T0000' AND `id_np`='$emid' ";
  $query = $this->db->query($sql);
  $result = $query->result(); // Utilisez `result()` si vous attendez plusieurs lignes
  return $result;
}




public function get_entries()
    {
        $query = $this->db->get('pointage');
        return $query->result();
       
    }

    public function get_absences_by_date() {
      // Étape 1 : Récupérer toutes les dates uniques dans la table pointage
      $this->db->select('Date');
      $this->db->distinct();
      $dates = $this->db->get('pointage')->result_array();
  
      // Étape 2 : Récupérer tous les employés actifs avec em_id différent de 'T0000'
      $this->db->select('em_id, des_id, first_name, last_name');
      $this->db->from('employee');
      $this->db->where('em_id !=', 'T0000');
      $this->db->where('status', 'ACTIF');
      $all_employees = $this->db->get()->result();
  
      $absences_by_date = [];
  
      // Étape 3 : Pour chaque date, trouver les employés absents
      foreach ($dates as $date_row) {
          $date = $date_row['Date'];
  
          // Récupérer les sName des employés présents à cette date
          $this->db->select('sName');
          $this->db->from('pointage');
          $this->db->where('Date', $date);
          $present_employees = $this->db->get()->result_array();
  
          // Extraire les sName des employés présents
          $present_ids = array_column($present_employees, 'sName');
  
          // Filtrer les employés absents pour cette date
          $absent_employees = array_filter($all_employees, function($employee) use ($present_ids) {
              return !in_array($employee->em_id, $present_ids);
          });
  
          // Ajouter la liste des absents pour cette date dans le tableau
          $absences_by_date[$date] = $absent_employees;
      }
  
      return $absences_by_date;
  }
  
  
  public function pointageselect() {
    $sql = "SELECT `pointage`.*,
                   `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`,`employee`.`dep`,
                   `pointage`.`shift`,`pointage`.`heure_e` as `em_entree`
            FROM `pointage`
            LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`";
    $query = $this->db->query($sql);
    $result = $query->result();
    
    return $result;
}

public function GetPointageEm($id){
  $sql = "SELECT `pointage`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`,`employee`.`em_id`,`employee`.`dep`,
   `pointage`.`heure_e` as `em_entree`
   FROM `pointage`
   LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`
  WHERE `em_id`='$id'";
  $query = $this->db->query($sql);
  $result = $query->result(); // Utilisez $query->result() pour obtenir un tableau d'objets
  return $result;          
}

public function getidPointage($id){
  $sql = "SELECT `pointage`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
   FROM `pointage`
   LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`
   WHERE `pointage`.`id` = ?";
   
  $query = $this->db->query($sql, array($id));
  return $query->row_array();
}

public function getPresenceRates() {
  $this->db->select('Date, COUNT(id) as total');
  $this->db->from('pointage');
  $this->db->group_by('Date');
  $this->db->order_by('Date', 'ASC');
  $query = $this->db->get();
  
  return $query->result();
}



 // Obtenir toutes les dates de pointage sans les week-ends
 public function get_all_dates() {
  $sql = "SELECT DISTINCT Date FROM pointage WHERE Date";
  $query = $this->db->query($sql);
  return $query->result_array();
}

// Obtenir le nombre de présences pour une date spécifique
public function get_presence_count($date) {
  $sql = "SELECT COUNT(DISTINCT sName) as presence_count FROM pointage WHERE Date = ?";
  $query = $this->db->query($sql, array($date));
  return $query->row()->presence_count;
}

// Obtenir le nombre d'absences pour une date spécifique
public function get_absence_count($date) {
  $sql = "
      SELECT COUNT(*) as absence_count FROM employee 
      WHERE em_id != 'T0000' 
      AND status = 'ACTIF' 
      AND em_id NOT IN (SELECT DISTINCT sName FROM pointage WHERE Date = ?)
  ";
  $query = $this->db->query($sql, array($date));
  return $query->row()->absence_count;
}

//STATISTIQUE PAR CONTRAT PAR DEPARTEMENTS
public function get_contract_statistics() {
  $this->db->select('dep_id, contrat, COUNT(*) as count');
  $this->db->from('employee');
  $this->db->where('em_id !=', 'T0000');
  $this->db->where('status', 'ACTIF');
  $this->db->group_by(['dep_id', 'contrat']);
  $query = $this->db->get();

  // Structure les données par département et type de contrat
  $data = [];
  foreach ($query->result() as $row) {
      $department = $row->dep_id;
      $contract_type = $row->contrat;
      
      if (!isset($data[$department])) {
          $data[$department] = [];
      }
      $data[$department][$contract_type] = (int)$row->count;
  }
  return $data;
}



//STATISTIQUE PAR GENRE PAR DEPARTEMENTS
public function get_gender_statistics() {
  // Requête pour obtenir le nombre d'hommes et de femmes par département
  $this->db->select('dep_id, em_gender, COUNT(*) as total');
  $this->db->where('em_id !=', 'T0000');
  $this->db->where('status', 'ACTIF');
  $this->db->group_by(['dep_id', 'em_gender']);
  $query = $this->db->get('employee');
  
  $data = [];
  foreach ($query->result() as $row) {
      $data[$row->dep_id][$row->em_gender] = $row->total;
  }
  return $data;
}





public function getEmployeeCountByDepartment() {
  $this->db->select('dep_id, COUNT(id) as count');
  $this->db->where('em_id !=', 'T0000');
  $this->db->where('status', 'ACTIF');
  $this->db->group_by('dep_id');
  $query = $this->db->get('employee');
  return $query->result_array();
}






public function timingselect(){
  $sql = "SELECT `timing`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
   FROM `timing`
   LEFT JOIN `employee` ON `timing`.`em_id` = `employee`.`em_id`";
  $query = $this->db->query($sql);
  $result = $query->result();
  
  return $result;
}




public function Shift(){
  $sql = "SELECT `shift`.*, `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`
          FROM `shift`
          LEFT JOIN `employee` ON `shift`.`em_id` = `employee`.`em_id`
          WHERE `employee`.`status` = 'ACTIF' AND `employee`.`em_id` != 'T0000'";

  $query = $this->db->query($sql);
  return $query->result();
}

public function getEmployeeShift($em_id) {
  $this->db->select('shift.*, employee.first_name, employee.last_name');
  $this->db->from('shift');
  $this->db->join('employee', 'shift.em_id = employee.em_id');
  $this->db->where('shift.em_id', $em_id);
  $query = $this->db->get();
  return $query->row();
}


public function updateShift($em_id, $shift, $heure_e) {
  $this->db->where('em_id', $em_id);
  $this->db->update('shift', array('shift' => $shift, 'heure_e' => $heure_e));
}



public function timingselectSingle($emid){
  $sql = "SELECT `timing`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
   FROM `timing`
   LEFT JOIN `employee` ON `timing`.`em_id` = `employee`.`em_id`
    WHERE `timing`.`em_id`='$emid'";
  $query = $this->db->query($sql);
  $result = $query->result();
  
  return $result;
}

public function timingselectTeam($emid){
  $sql = "SELECT `timing`.*,
         `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
  FROM `timing`
  LEFT JOIN `employee` ON `timing`.`em_id` = `employee`.`em_id`
  WHERE `timing`.`em_id`='$emid'
  
  UNION
  
  SELECT `timing`.*,
         `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
  FROM `timing`
  LEFT JOIN `employee` ON `timing`.`em_id` = `employee`.`em_id`
  WHERE `employee`.`id_np`='$emid'";

  $query = $this->db->query($sql);
  $result = $query->result();
  
  return $result;
}




public function updateAllConge($newNbJour) {

 $this->db->set('nb_jour', 'nb_jour + 2.5', FALSE);
        
 // Mettez à jour tous les enregistrements dans la table "conge" avec la nouvelle valeur
 $this->db->update('conge_mois');

  // Vous pouvez également ajouter une condition WHERE si nécessaire pour filtrer les enregistrements à mettre à jour.
  // $this->db->where('em_id', $em_id);
}


public function deleteP($id){
  $this->db->where('pointage.id', $id);
  return $this->db->delete('pointage');
}




//suppressions par date
public function deletePByDate($date) {
  $this->db->where('pointage.Date', $date);
  $this->db->delete('pointage');
  return $this->db->affected_rows();
}

/*
  public function pointageselect(){
    $sql = "SELECT  `sName`,`Date`,
     MIN(CASE WHEN `Time` IS NOT NULL THEN `Time` END) AS `Time_in`,
     MAX(CASE WHEN `Time` IS NOT NULL THEN `Time` END) AS `Time_out`
     FROM `pointage`
     GROUP BY `sName`,`Date` ";
    $query=$this->db->query($sql);
  	$result = $query->result();
  	return $result;
	}
  public function pointageselect(){
    $sql = "SELECT  `sName`,`Date`,
     MAX(CASE WHEN `Time`<'12:00' THEN `Time` ELSE NULL END) AS `Time_in`,
     MAX(CASE WHEN `Time`>'12:00' THEN `Time` ELSE NULL END) AS `Time_out`
     FROM `pointage`
     GROUP BY `sName`,`Date` ";
    $query=$this->db->query($sql);
  	$result = $query->result();
  	return $result;
	}

  */
public function emselectByID($emid){
    $sql = "SELECT * FROM `employee`
    WHERE `em_id`='$emid'";
    $query=$this->db->query($sql);
	  $result = $query->row();
	  return $result;
	}
public function emselectByCode($emid){
    $sql = "SELECT * FROM `employee`
    WHERE `em_id`='$emid'";
    $query=$this->db->query($sql);
	  $result = $query->row();
	  return $result;
	}
public function getInvalidUser1(){
    $sql = "SELECT * FROM `employee`
    WHERE `status`='INACTIF'";
    $query=$this->db->query($sql);
		$result = $query->result();
		return $result;
	}


public function getInvalidUser(){
    $sql = "SELECT e.*,i.* 
            FROM `employee` e
            INNER JOIN `inactif` i ON e.em_id = i.em_id
            WHERE e.`status` = 'INACTIF'";
    
    $query = $this->db->query($sql);
    $result = $query->result();
    return $result;
}


// Insérer un employé dans la table inactif
public function insertInactif($data) {
  return $this->db->insert('inactif', $data);
}

// Mettre à jour le statut d'un employé dans la table employee
public function updateEmployeeStatus($em_id) {
  $this->db->set('status', 'INACTIF');
  $this->db->where('em_id', $em_id);
  return $this->db->update('employee');
}

//tranche d'age
public function get_age_distribution() {
        $this->db->select('em_birthday');
        $query = $this->db->get('employee');
        $result = $query->result();

        $age_distribution = array(
            '18-25' => 0,
            '26-35' => 0,
            '36-45' => 0,
            '46-55' => 0,
            '56+' => 0
        );

        foreach ($result as $row) {
            $age = $this->calculate_age($row->em_birthday);

            if ($age >= 18 && $age <= 25) {
                $age_distribution['18-25']++;
            } elseif ($age >= 26 && $age <= 35) {
                $age_distribution['26-35']++;
            } elseif ($age >= 36 && $age <= 45) {
                $age_distribution['36-45']++;
            } elseif ($age >= 46 && $age <= 55) {
                $age_distribution['46-55']++;
            } else {
                $age_distribution['56+']++;
            }
        }

        return $age_distribution;
    }

    private function calculate_age($em_birthday) {
        $birthdate = new DateTime($em_birthday);
        $today = new DateTime();
        $age = $today->diff($birthdate)->y;
        return $age;
    }


    public function get_age_distribution_by_department() {
      // Sélectionne les anniversaires et le département
      $this->db->select('em_birthday, dep_id');
      $query = $this->db->get('employee');
      $result = $query->result();
  
      $age_distribution = array();
  
      foreach ($result as $row) {
          $age = $this->calculate_age($row->em_birthday);
  
          // Assurez-vous que le département existe dans le tableau, sinon l'ajouter
          if (!isset($age_distribution[$row->dep_id])) {
              $age_distribution[$row->dep_id] = array(
                  '18-25' => 0,
                  '26-35' => 0,
                  '36-45' => 0,
                  '46-55' => 0,
                  '56+' => 0
              );
          }
  
          // Incrémentation en fonction de la tranche d'âge
          if ($age >= 18 && $age <= 25) {
              $age_distribution[$row->dep_id]['18-25']++;
          } elseif ($age >= 26 && $age <= 35) {
              $age_distribution[$row->dep_id]['26-35']++;
          } elseif ($age >= 36 && $age <= 45) {
              $age_distribution[$row->dep_id]['36-45']++;
          } elseif ($age >= 46 && $age <= 55) {
              $age_distribution[$row->dep_id]['46-55']++;
          } else {
              $age_distribution[$row->dep_id]['56+']++;
          }
      }
  
      return $age_distribution;
  }
  

public function getPlanningid(){
    $sql = "SELECT `planning`.*,
    `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`
    FROM `planning`
    LEFT JOIN `employee` ON `planning`.`em_id` = `employee`.`em_id`";
    $query = $this->db->query($sql);
    $result = $query->result();
  
  return $result;
}





  public function Does_email_exists($email) {
		$user = $this->db->dbprefix('employee');
    $sql = "SELECT `em_email` FROM $user
		WHERE `em_email`='$email'";
		$result=$this->db->query($sql);
      if ($result->row()) {
          return $result->row();
        } else {
          return false;
        }
    }
    public function Add($data){
        $this->db->insert('employee',$data);
    }
    public function GetBasic($id){
      $sql = "SELECT `employee`.*,
      `designation`.*,
      `department`.*
      FROM `employee`
      LEFT JOIN `designation` ON `employee`.`des_id`=`designation`.`id`
      LEFT JOIN `department` ON `employee`.`dep_id`=`department`.`id`
      WHERE `em_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;          
    }

   

   
    public function ProjectEmployee($id){
      $sql = "SELECT `assign_task`.`assign_user`,
      `employee`.`em_id`,`first_name`,`last_name`
      FROM `assign_task`
      LEFT JOIN `employee` ON `assign_task`.`assign_user`=`employee`.`em_id`
      WHERE `assign_task`.`project_id`='$id' AND `user_type`='Team Head'";
      $query=$this->db->query($sql);
      $result = $query->result();
      return $result;          
    }
    public function GetperAddress($id){
      $sql = "SELECT * FROM `address`
      WHERE `emp_id`='$id' AND `type`='Permanent'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;          
    }

    public function GetConge($id){
      $sql = "SELECT * FROM `conge_mois`
      WHERE `em_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;          
    }
    public function GetpreAddress($id){
      $sql = "SELECT * FROM `address`
      WHERE `emp_id`='$id' AND `type`='Present'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;          
    }
    public function GetEducation($id){
      $sql = "SELECT * FROM `education`
      WHERE `emp_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result;          
    }
    public function GetExperience($id){
      $sql = "SELECT * FROM `emp_experience`
      WHERE `emp_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result;          
    }
    public function GetBankInfo($id){
      $sql = "SELECT * FROM `bank_info`
      WHERE `em_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;          
    }
    public function GetAllEmployee(){
      $sql = "SELECT * FROM `employee`";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result;          
    }
   


    public function desciplinaryfetch(){
      $sql = "SELECT `desciplinary`.*,
      `employee`.`em_id`,`first_name`,`last_name`,`em_id`
      FROM `desciplinary`
      LEFT JOIN `employee` ON `desciplinary`.`em_id`=`employee`.`em_id`";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result;        
    }
    public function GetLeaveiNfo($id,$year){
      $sql = "SELECT `assign_leave`.*,
      `leave_types`.`name`
      FROM `assign_leave`
      LEFT JOIN `leave_types` ON `assign_leave`.`type_id`=`leave_types`.`type_id`
      WHERE `assign_leave`.`emp_id`='$id' AND `dateyear`='$year'";
        $query=$this->db->query($sql);
		$result = $query->result();
		return $result;        
    }
    public function GetsalaryValue($id){
      $sql = "SELECT `emp_salary`.*,
      `addition`.*,
      `deduction`.*,
      `salary_type`.*
      FROM `emp_salary`
      LEFT JOIN `addition` ON `emp_salary`.`id`=`addition`.`salary_id`
      LEFT JOIN `deduction` ON `emp_salary`.`id`=`deduction`.`salary_id`
      LEFT JOIN `salary_type` ON `emp_salary`.`type_id`=`salary_type`.`id`
      WHERE `emp_salary`.`emp_id`='$id'";
        $query=$this->db->query($sql);
		$result = $query->row();
		return $result;        
    }
    public function Update($data, $id) {
      $this->db->where('em_id', $id);
      $this->db->update('employee', $data); // Remplacez nom_de_votre_table
      return $this->db->affected_rows();
  }
    


    public function Update_Education($id,$data){
		$this->db->where('id', $id);
		$this->db->update('education',$data);        
    }
    public function Update_BankInfo($id,$data){
		$this->db->where('id', $id);
		$this->db->update('bank_info',$data);        
    }
    public function UpdateParmanent_Address($id,$data){
		$this->db->where('id', $id);
		$this->db->update('address',$data);        
    }
    public function UpdateConge($id,$data){
      $this->db->where('id', $id);
      $this->db->update('conge_mois',$data);        
      }
    public function Reset_Password($id,$data){
		$this->db->where('em_id', $id);
		$this->db->update('employee',$data);        
    }
    public function Update_Experience($id,$data){
		$this->db->where('id', $id);
		$this->db->update('emp_experience',$data);        
    }
    public function Update_Salary($sid,$data){
		$this->db->where('id', $sid);
		$this->db->update('emp_salary',$data);        
    }
    public function Update_Deduction($did,$data){
		$this->db->where('de_id', $did);
		$this->db->update('deduction',$data);        
    }
    public function Update_Addition($aid,$data){
		$this->db->where('addi_id', $aid);
		$this->db->update('addition',$data);        
    }
    public function Update_Desciplinary($id,$data){
		$this->db->where('id', $id);
		$this->db->update('desciplinary',$data);        
    }
    public function Update_Media($id,$data){
		$this->db->where('id', $id);
		$this->db->update('social_media',$data);        
    }
    public function AddParmanent_Address($data){
        $this->db->insert('address',$data);
    } 
    public function AjoutConge($data){
      $this->db->insert('conge_mois',$data);
  } 


    
    public function Add_education($data){
        $this->db->insert('education',$data);
    }
    public function Add_Experience($data){
        $this->db->insert('emp_experience',$data);
    }
    public function Add_Desciplinary($data){
        $this->db->insert('desciplinary',$data);
    }
    public function Add_BankInfo($data){
        $this->db->insert('bank_info',$data);
    }
    public function GetEmployeeId($id){
        $sql = "SELECT `em_password` FROM `employee` WHERE `em_id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetFileInfo($id){
        $sql = "SELECT * FROM `employee_file` WHERE `em_id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->result();
        return $result; 
    }
    public function GetSocialValue($id){
        $sql = "SELECT * FROM `social_media` WHERE `emp_id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetEduValue($id){
        $sql = "SELECT * FROM `education` WHERE `id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetExpValue($id){
        $sql = "SELECT * FROM `emp_experience` WHERE `id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    }
    public function GetDesValue($id){
        $sql = "SELECT * FROM `desciplinary` WHERE `id`='$id'";
        $query = $this->db->query($sql);
        $result = $query->row();
        return $result; 
    } 
    


    
	public function depselect(){
  	$query = $this->db->get('department');
  	$result = $query->result();
  	return $result;
	}
    public function Add_Department($data){
    $this->db->insert('department',$data);
  }

    public function Add_Designation($data){
      $this->db->insert('designation',$data);
    }
    public function File_Upload($data){
    $this->db->insert('employee_file',$data);
  }
    public function Add_Salary($data){
    $this->db->insert('emp_salary',$data);
  }
    public function Add_Addition($data1){
    $this->db->insert('addition',$data1);
  }
    public function Add_Deduction($data2){
    $this->db->insert('deduction',$data2);
  }
    public function Add_Assign_Leave($data){
    $this->db->insert('assign_leave',$data);
  }
    public function Insert_Media($data){
    $this->db->insert('social_media',$data);
  }
    public function desselect(){
  	$query = $this->db->get('designation');
  	$result = $query->result();
  	return $result;
	}
    public function DeletEdu($id){
      $this->db->delete('education',array('id'=> $id));
  }
    public function DeletEXP($id){
      $this->db->delete('emp_experience',array('id'=> $id));
  }
    public function DeletDisiplinary($id){
      $this->db->delete('desciplinary',array('id'=> $id));
  }        
    }
?>