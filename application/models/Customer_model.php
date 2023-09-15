<?php
/**
 * Description of Customer Model: CodeIgniter 
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Customer_model extends CI_Model {
    private $_customerID;
    private $_firstname;
    private $_lastname;
    private $_email;
    private $_phone;
    private $_status;
    private $_limit;
    private $_pageNumber;
    private $_offset; 

    public function setCustomerID($customerID) {
        $this->_customerID = $customerID;
    }
    
    public function setFirstName($firstname) {
        $this->_firstname = $firstname;
    }
    
    public function setLastName($lastname) {
        $this->_lastname = $lastname;
    }
    
    public function setEmail($email) {
        $this->_email = $email;
    }
    
    public function setPhone($phone) {
        $this->_phone = $phone;
    }
    
    public function setStatus($status) {
        $this->_status = $status;
    }

    public function setLimit($limit) {
        $this->_limit = $limit;
    }

    public function setPageNumber($pageNumber) {
        $this->_pageNumber = $pageNumber;
    }

    public function setOffset($offset) {
        $this->_offset = $offset;
    }    

    // count Customer
    public function countCustomer() {
        $this->db->where('status', $this->_status);
        $this->db->from('customer'); 
        return $this->db->count_all_results();
    }

    // get customer List
    public function getcustomerList() {
        $this->db->select(array('c.customer_id', 'c.firstname', 'c.lastname', 'c.email', 'c.phone', 'c.status'));
        $this->db->from('customer as c');        
        $this->db->where('c.status', $this->_status);
        if(!empty($this->_pageNumber)) {
            $this->db->limit($this->_pageNumber, $this->_offset);
        }
        $query = $this->db->get();
        return $query->result_array();
    } 
    
    // create Customer
    public function createCustomer() {
        $tableName = 'customer';
        $this->db->select(array('c.customer_id'));
        $this->db->from($tableName . ' as c');
        $this->db->where('c.email', $this->_email);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $data = array(
                'firstname' => $this->_firstname,
                'lastname' => $this->_lastname,                
                'phone' => $this->_phone,
                'status' => $this->_status,
            );
            $this->db->where('email', $this->_email);
            $this->db->update($tableName, $data);
        } else {
            $data = array(
                'firstname' => $this->_firstname,
                'lastname' => $this->_lastname,
                'email' => $this->_email,
                'phone' => $this->_phone,
                'status' => $this->_status,
            );
            $this->db->insert($tableName, $data);
            return $this->db->insert_id();
        }
        
    }    
}
