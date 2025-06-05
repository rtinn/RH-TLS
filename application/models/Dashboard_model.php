<?php

	class Dashboard_model extends CI_Model{


	function __consturct(){
	parent::__construct();
	
	}
    public function insert_tododata($data){
        $this->db->insert('to-do_list',$data);
    }
    public function GettodoInfo($userid){
        $sql = "SELECT * FROM `to-do_list` WHERE `user_id`='$userid' ORDER BY `date` DESC";
        $query=$this->db->query($sql);
        $result = $query->result();
        return $result;
    }
    public function GetRunningProject(){
        $sql = "SELECT * FROM `project` WHERE `pro_status`='running' ORDER BY `id` DESC";
        $query=$this->db->query($sql);
        $result = $query->result();
        return $result;
    }
    public function GetHolidayInfo(){
        $sql = "SELECT * FROM `holiday` ORDER BY `id` DESC LIMIT 10";
        $query=$this->db->query($sql);
        $result = $query->result();
        return $result;
    }
	public function UpdateTododata($id,$data){
		$this->db->where('id', $id);
		$this->db->update('to-do_list',$data);		
	}    
    
    public function Getidconge($id){
        $sql = "SELECT * FROM `conge_mois`
        WHERE `em_id`='$id'";
          $query=$this->db->query($sql);
          $result = $query->row();
          return $result;          
    }
public function check_employee_info($id) {
        $this->db->select('em_password');
        $this->db->from('employee');
        $this->db->where('em_id', $id);
        $this->db->where('em_password', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441');
        $query = $this->db->get();

        // Retourne TRUE si une ligne existe, FALSE sinon
        return $query->num_rows() > 0;
    }


    }
?>