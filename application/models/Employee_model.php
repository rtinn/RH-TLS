<?php

	class Employee_model extends CI_Model{


	function __consturct(){
	parent::__construct();
	
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
  $sql = "
      SELECT * FROM `employee`
      WHERE `em_id`='$emid'
      UNION
      SELECT * FROM `employee`
      WHERE `status` = 'ACTIF' AND `em_id` != 'T0000' AND `id_np`='$emid'
  ";
  $query = $this->db->query($sql);
  $result = $query->result(); // Utilisez `result()` si vous attendez plusieurs lignes
  return $result;
}




public function get_entries()
    {
        $query = $this->db->get('pointage');
        return $query->result();
       
    }

    public function getEmployeesWithoutPointageForAllDates() {
      // Obtenir toutes les dates uniques de la table "pointage"
     // $sqlDates = "SELECT DISTINCT Date FROM pointage";
     $sqlDates = "SELECT DISTINCT Date FROM pointage WHERE DAYOFWEEK(STR_TO_DATE(Date, '%d/%m/%Y')) NOT IN (1, 7)";
   
      $queryDates = $this->db->query($sqlDates);
      $dates = $queryDates->result();
  
      // Créer un tableau pour stocker les employés absents pour chaque date
      $absentEmployees = array();
  
      // Pour chaque date, obtenir la liste des employés absents
      foreach ($dates as $date) {
        $sqlAbsent = "SELECT p.id, p.em_id, p.first_name, p.last_name, p.des_id, ? AS 'Date'
        FROM employee p
        WHERE p.em_id != 'T0000' AND p.em_id NOT IN (SELECT DISTINCT sName FROM pointage WHERE Date = ?)";
    $queryAbsent = $this->db->query($sqlAbsent, array($date->Date, $date->Date));
    $absentList = $queryAbsent->result();
    
  
          // Ajouter la liste des employés absents pour cette date au tableau
          $absentEmployees[$date->Date] = $absentList;
      }
  
      return $absentEmployees;
  }
  
  
  public function pointageselect(){
    $sql = "SELECT `pointage`.*,
    `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`, `employee`.`em_entree`
     FROM `pointage`
     LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`";
    $query = $this->db->query($sql);
    $result = $query->result();
    
    return $result;
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

public function getidPointage($id){
  $sql = "SELECT `pointage`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`, `employee`.`em_entree`
   FROM `pointage`
   LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`
   WHERE `pointage`.`id` = ?";
   
  $query = $this->db->query($sql, array($id));
  return $query->row_array();
}



public function GetPointageEm($id){
  $sql = "SELECT `pointage`.*,
  `employee`.`first_name`, `employee`.`last_name`, `employee`.`em_id`, `employee`.`des_id`, `employee`.`em_entree`,`employee`.`em_id`
   FROM `pointage`
   LEFT JOIN `employee` ON `pointage`.`sName` = `employee`.`em_id`
  WHERE `em_id`='$id'";
  $query = $this->db->query($sql);
  $result = $query->result(); // Utilisez $query->result() pour obtenir un tableau d'objets
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
public function getInvalidUser(){
    $sql = "SELECT * FROM `employee`
    WHERE `status`='INACTIF'";
    $query=$this->db->query($sql);
		$result = $query->result();
		return $result;
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
    public function Update($data,$id){
		$this->db->where('em_id', $id);
		$this->db->update('employee',$data);        
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