<?php

class Organization_model extends CI_Model{


    	function __consturct(){
    	   parent::__construct();
    	
    	}

      public function get_all_employees() {
        // Retourne tous les employés de la base de données
        return $this->db->get('employees')->result();
    }
    
    public function get_employee_by_id($employee_id) {
        // Retourne un employé en fonction de son ID
        return $this->db->get_where('employee', array('em_id' => $employee_id))->row();
    }






    public function depselect(){
        $query = $this->db->get('department');
        $result = $query->result();
        return $result;
        }
      public function Add_Department($data){
        $this->db->insert('department',$data);
      }

      public function department_delete($dep_id){
        $this->db->delete('department',array('id' => $dep_id ));
      }

      public function department_edit($dep){
          $sql    = "SELECT * FROM `department` WHERE `id`='$dep'";
          $query  = $this->db->query($sql);
          $result = $query->row();
          return $result;
      }
      public function Update_Department($id, $data){
        $this->db->where('id',$id);
        $this->db->update('department',$data);
      }

      public function Add_Designation($data){
        $this->db->insert('designation',$data);
      }
    public function designation_delete($des_id){
        $this->db->delete('designation',array('id'=> $des_id));
    }

      public function designation_edit($des){
          $sql    = "SELECT * FROM `designation` WHERE `id`='$des'";
          $query  = $this->db->query($sql);
          $result = $query->row();
          return $result;
      }
      public function Update_Designation($id, $data){
        $this->db->where('id',$id);
        $this->db->update('designation',$data);
      }
    public function desselect(){
        $query = $this->db->get('designation');
        $result = $query->result();
        return $result;
    }  
    
    public function hierarchie(){
      $sql = "SELECT n1.em_id, e.first_name, e.last_name
              FROM `hierarchie` AS n1
              LEFT JOIN employee AS e ON n1.em_id = e.em_id";
      $query = $this->db->query($sql);
      return $query->result();
  } 


  //Afficher listes personnel par hierarchie 
  
  public function get_employee2_list($id_np) {
    $sql = "SELECT * FROM employee WHERE id_np = ?";
    $query = $this->db->query($sql, array($id_np));
    return $query->result();
}

  // Mettre à jour id_np en fonction de em_id
  public function update_id_np_by_em_id($em_id, $employee_id) {
    $this->db->where('em_id', $em_id);
    $this->db->update('employee', array('id_np' => $employee_id));
    return $this->db->affected_rows();
}


public function update_id_np($em_id) {
  $this->db->set('id_np', '');
  $this->db->where('em_id', $em_id);
  $this->db->update('employee');
}


  public function enregistrer_hierarchie($em_id) {
    // Table concernée dans la base de données (à adapter selon votre structure)
    $table = 'hierarchie';

    // Données à insérer
    $data = array(
        'em_id' => $em_id
    );

    // Insérer les données dans la table
    $this->db->insert($table, $data);

    // Vérifier si l'insertion a réussi
    if ($this->db->affected_rows() > 0) {
        return array('success' => true, 'message' => 'Données enregistrées avec succès.');
    } else {
        return array('success' => false, 'message' => 'Échec de l\'enregistrement des données.');
    }
}


public function delete_hierarchie($em_id) {
  $this->db->where('em_id', $em_id);
  $this->db->delete('hierarchie');
}





}
?>