<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Main_model extends CI_Model {

  public function __construct() {
    parent::__construct(); 
  }

  // Fetch records
  public function getUsers() {

    // Posts
    $this->db->select('*');
    $this->db->from('planning');
    $this->db->order_by("id", "asc");
    $usersquery = $this->db->get();

    $usersResult = $usersquery->result_array();

    return $usersResult;
  }

  // Delete record
  public function deleteUser($user_ids = array() ){

    foreach($user_ids as $userid){
        $this->db->delete('planning', array('id' => $userid));
    }

    return 1;
  }

}
