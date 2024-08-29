<?php
/**
 * Description of Customer Controller: CodeIgniter 
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Customer extends CI_Controller {

    public function __construct() {
        parent::__construct();
        //load model
        $this->load->model('Customer_model', 'customer');
        // load pagination library
        $this->load->library('pagination');
        // Load form validation library
        $this->load->library('form_validation');
        // load CSV library
        $this->load->library('CSVReader');
        // Load file helper
        $this->load->helper('file');
    }
    // list customer
    public function index() {
        $data = array();
        $data['page'] = 'customer-list';
        $data['title'] = 'Customer Info | TechArise'; 
        $data['breadcrumbs'] = array('Home' => '#');
        $this->customer->setStatus(1);
        $config['total_rows'] = $this->customer->countCustomer();
        $page_number = $this->uri->segment(2);
        $config['base_url'] = base_url() . 'customer';
        
        if (empty($page_number))
            $page_number = 1;
        $offset = ($page_number - 1) * $this->pagination->per_page;
        $this->customer->setPageNumber($this->pagination->per_page);
        $this->customer->setOffset($offset);
        $this->pagination->cur_page = $offset;
        $this->pagination->initialize($config);
        $data['page_links'] = $this->pagination->create_links();
        $data['customerInfo'] = $this->customer->getcustomerList();
        $this->load->view('customer/index', $data);
    }
    
    // add customer
    public function add() {
        $data = array();
        $data['page'] = 'customer-add';
        $data['title'] = 'Customer Add | TechArise'; 
        $data['breadcrumbs'] = array('Home' => '#');
        $this->load->view('customer/add', $data);
    }
    
    // save
    public function save() {
         $this->form_validation->set_rules('fileURL', 'Upload File', 'callback_checkFileValidation');
         if($this->form_validation->run() == false) {
            $data = array();
            $data['page'] = 'customer-add';
            $data['title'] = 'Customer Add | TechArise'; 
            $data['breadcrumbs'] = array('Home' => '#');
            $this->load->view('customer/add', $data);
         } else {
            // If file uploaded
            if(is_uploaded_file($_FILES['fileURL']['tmp_name'])) {                            
                // Parse data from CSV file
                $csvData = $this->csvreader->parse_csv($_FILES['fileURL']['tmp_name']);            
                // create array from CSV file
                if(!empty($csvData)){
                    foreach($csvData as $element){                    
                        // Prepare data for DB insertion
                        $data[] = array(
                            'firstname' => $element['FirstName'],
                            'lastname' => $element['LastName'],
                            'email' => $element['Email'],
                            'phone' => $element['Phone'],
                            'status' => $element['Status'],
                        );
                    }
                }
            }
            // insert/update data into database
            foreach($data as $element) {
                $this->customer->setFirstName($element['firstname']);
                $this->customer->setLastName($element['lastname']);
                $this->customer->setEmail($element['email']);
                $this->customer->setPhone($element['phone']);
                $this->customer->setStatus($element['status']);
                $this->customer->createCustomer();
            }
            redirect('customer'); 
        }              
    }
    // checkFileValidation
    public function checkFileValidation($str) {        
        $mime_types = array(
            'text/csv',
            'text/x-csv', 
            'application/csv', 
            'application/x-csv', 
            'application/excel',
            'text/x-comma-separated-values', 
            'text/comma-separated-values', 
            'application/octet-stream', 
            'application/vnd.ms-excel',
            'application/vnd.msexcel', 
            'text/plain',
        );
        if(isset($_FILES['fileURL']['name']) && $_FILES['fileURL']['name'] != ""){
            // get mime by extension
            $mime = get_mime_by_extension($_FILES['fileURL']['name']);
            $fileExt = explode('.', $_FILES['fileURL']['name']);
            $ext = end($fileExt);
            if(($ext == 'csv') && in_array($mime, $mime_types)){
                return true;
            }else{
                $this->form_validation->set_message('checkFileValidation', 'Please choose correct file.');
                return false;
            }
        }else{
            $this->form_validation->set_message('checkFileValidation', 'Please choose a file.');
            return false;
        }
    }
    
    // export Data
    public function exportData() {
        $storData = array();
        $metaData[] = array('firstname' => 'FirstName', 'lastname' => 'LastName', 'email' => 'Email', 'phone' => 'Phone', 'status' => 'Status');       
        $this->customer->setStatus(1);
        $customerInfo = $this->customer->getcustomerList(); 
        foreach($customerInfo as $key=>$element) {
            $storData[] = array(
                'firstname' => $element['firstname'],
                'lastname' => $element['lastname'],
                'email' => $element['email'],
                'phone' => $element['phone'],
                'status' => $element['status'],
            );
        }
        $data = array_merge($metaData,$storData);
        header("Content-type: application/csv");
        header("Content-Disposition: attachment; filename=\"csv-sample-customer".".csv\"");
        header("Pragma: no-cache");
        header("Expires: 0");
        $handle = fopen('php://output', 'w');
        foreach ($data as $data) {
            fputcsv($handle, $data);
        }
            fclose($handle);
        exit;
    }
}
