<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Chronometer extends CI_Controller {

    public function start() {
        $this->session->set_userdata('start_time', time());
        echo json_encode(['status' => 'started', 'start_time' => time()]);
    }

    public function stop() {
        $start_time = $this->session->userdata('start_time');
        if ($start_time) {
            $elapsed_time = time() - $start_time;
            $this->session->unset_userdata('start_time');
            echo json_encode(['status' => 'stopped', 'elapsed_time' => $elapsed_time]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Chronometer not started.']);
        }
    }

/*

    public function stop() {
        $start_time = $this->session->userdata('start_time');
        if ($start_time) {
            $elapsed_time = time() - $start_time;
            $this->session->unset_userdata('start_time');
            
            // Insérer le temps écoulé dans la base de données
            $this->Chronometer_model->insert_elapsed_time($elapsed_time);
            
            $response = ['status' => 'stopped', 'elapsed_time' => $elapsed_time];
        } else {
            $response = ['status' => 'error', 'message' => 'Chronometer not started.'];
        }
        
        // Envoyer la réponse JSON
        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($response));
    }

*/


    public function status() {
        $start_time = $this->session->userdata('start_time');
        if ($start_time) {
            $elapsed_time = time() - $start_time;
            echo json_encode(['status' => 'running', 'start_time' => $start_time, 'elapsed_time' => $elapsed_time]);
        } else {
            echo json_encode(['status' => 'stopped']);
        }
    }

    


}
