<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once FCPATH . 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

class Test_phpspreadsheet extends CI_Controller {
    public function index() {
        try {
            $reader = IOFactory::createReader('Xlsx');
            echo "PhpSpreadsheet est chargé avec succès !";
        } catch (Exception $e) {
            echo "Erreur : " . $e->getMessage();
        }
    }
}