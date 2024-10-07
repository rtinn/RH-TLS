<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
class Pointage extends CI_Controller {


    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('login_model');
        $this->load->model('dashboard_model'); 
        $this->load->model('employee_model'); 
        $this->load->model('pointage_model');
        $this->load->model('settings_model');
        $this->load->model('leave_model');
    }
    
	public function index()
	{
		#Redirect to Admin dashboard after authentication
        if ($this->session->userdata('user_login_access') == 1)
            redirect('dashboard/Dashboard');
            $data=array();
            #$data['settingsvalue'] = $this->dashboard_model->GetSettingsValue();
			$this->load->view('login');
	}
/*

	public function import()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$upload_status = $this->uploadDoc();
			if ($upload_status != false) {
				$inputFileName = 'uploads/' . $upload_status;
	
				$inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				$dataToInsert = []; // Tableau pour stocker les données à insérer
	
				// Initialiser un tableau pour suivre les valeurs minimales et maximales d'Idp pour chaque combinaison de sName et Date
				$idpRanges = [];
	
				// Parcourir les lignes pour collecter les plages d'Idp et les valeurs de Time
				foreach ($sheet->getRowIterator() as $row) {
					$sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
					$Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
					$Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());
					$Idp = (int)trim($spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue());
	
					// Ajouter une vérification pour ignorer les lignes où sName est NULL
					if ($sName !== null && $sName !== 'NULL') {
						if (!isset($idpRanges[$sName][$Date])) {
							// Initialiser la plage d'Idp pour une nouvelle combinaison de sName et Date
							$idpRanges[$sName][$Date] = [
								'min' => $Idp,
								'max' => $Idp,
								'Time_in' => $Time,
								'Time_out' => $Time,
							];
						} else {
							// Mettre à jour les valeurs minimales et maximales d'Idp
							if ($Idp < $idpRanges[$sName][$Date]['min']) {
								$idpRanges[$sName][$Date]['min'] = $Idp;
								$idpRanges[$sName][$Date]['Time_in'] = $Time;
							}
							if ($Idp > $idpRanges[$sName][$Date]['max']) {
								$idpRanges[$sName][$Date]['max'] = $Idp;
								$idpRanges[$sName][$Date]['Time_out'] = $Time;
							}
						}
					}
				}
	
				// Vérifier si une entrée avec la même date existe déjà dans la base de données
				foreach ($idpRanges as $sName => $dateRanges) {
					foreach ($dateRanges as $Date => $range) {
						$existingData = $this->db->query("SELECT * FROM pointage WHERE Date = ? LIMIT 1", [$Date])->row();
						if ($existingData) {
							echo "Une entrée de la même date existe déjà. Veuillez choisir un autre fichier.";
							return; // Arrêter le processus d'importation
						}
	
						$timeIn = $range['Time_in'];
						$timeOut = $range['Time_out'];
	
						// Calculez la différence de temps
						$timeInObj = new DateTime($timeIn);
						$timeOutObj = new DateTime($timeOut);
						$diff = $timeInObj->diff($timeOutObj);
	
						// Insérer les données dans la base de données
						$dataToInsert[] = [
							'sName' => $sName,
							'Date' => $Date,
							'Time_in' => $timeIn,
							'Time_out' => $timeOut,
							'Time_diff' => $diff->format('%H:%i:%s'), // Format de la différence de temps
						];
					}
				}
				// Insérer les données dans la base de données
				foreach ($dataToInsert as $data) {
					$this->db->insert('pointage', $data);
				}
	
				echo "Fichier importé avec succès";
			}
		}
	}
	
	
	public function importN()
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $upload_status = $this->uploadDoc();
        if ($upload_status != false) {
            $inputFileName = 'uploads/' . $upload_status;

            $inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
            $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
            $spreadsheet = $reader->load($inputFileName);
            $sheet = $spreadsheet->getSheet(0);
            $idpRanges = [];

            foreach ($sheet->getRowIterator() as $row) {
                $sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
                $Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
                $Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());
                $Idp = (int)trim($spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue());

                if ($sName !== null && $sName !== 'NULL') {
                    if (!isset($idpRanges[$sName]) || $Idp < $idpRanges[$sName]['minIdp']) {
                        $idpRanges[$sName] = [
                            'minIdp' => $Idp,
                            'maxIdp' => $Idp,
                            'Date' => $Date,
                            'Time_in' => $Time,
                            'Time_out' => $Time,
                        ];
                    } else {
                        if ($Idp < $idpRanges[$sName]['minIdp']) {
                            $idpRanges[$sName]['minIdp'] = $Idp;
                            $idpRanges[$sName]['Time_in'] = $Time;
                        }
                        if ($Idp > $idpRanges[$sName]['maxIdp']) {
                            $idpRanges[$sName]['maxIdp'] = $Idp;
                            $idpRanges[$sName]['Time_out'] = $Time;
                        }
                    }
                }
            }

            foreach ($idpRanges as $sName => $data) {
                // Calculez la différence de temps
                // Calculate the time difference considering midnight
				$timeInObj = new DateTime($data['Time_in']);
				$timeOutObj = new DateTime($data['Time_out']);

				// If 'Time_out' is before 'Time_in', it means it spans midnight
				if ($timeOutObj < $timeInObj) {
					$timeOutObj->modify('+1 day'); // Add 24 hours to 'Time_out'
				}
                $diff = $timeInObj->diff($timeOutObj);

                // Insérer les données dans la base de données
                $this->db->insert('pointage', [
                    'sName' => $sName,
                    'Date' => $data['Date'],
                    'Time_in' => $data['Time_in'],
                    'Time_out' => $data['Time_out'],
                    'Time_diff' => $diff->format('%H:%i:%s'), // Format de la différence de temps
                ]);
            }

            echo "Fichier importé avec succès";
        }
    }
}







   /*
	public function import()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$upload_status =  $this->uploadDoc();
			if ($upload_status != false) {
				$inputFileName = 'uploads/' . $upload_status;
				$inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
				$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
				$spreadsheet = $reader->load($inputFileName);
				$sheet = $spreadsheet->getSheet(0);
				$count_Rows = 0;
				$dataToInsert = []; // Tableau pour stocker les données à insérer
	
				foreach ($sheet->getRowIterator() as $row) {
					
					$sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
					$Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
					$Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());

	
					// Analyser l'heure pour déterminer time_in ou time_out
					$timeParts = explode(':', $Time);
					$hour = (int)$timeParts[0]; // Récupérer l'heure
					$minute = (int)$timeParts[1]; // Récupérer les minutes
	
					if ($hour < 12) {
						// Heure avant midi, c'est time_in
						$dataToInsert[] = [
							'sName' => $sName,
							'Date' => $Date,
							'time_in' => $Time,
							'time_out' => null, // Initialiser time_out comme null
						];
					} else {
						// Heure après midi, c'est time_out
						// Vérifier si nous avons déjà une entrée pour la même sName et Date
						$existingIndex = null;
						foreach ($dataToInsert as $index => $data) {
							if ($data['sName'] == $sName && $data['Date'] == $Date) {
								$existingIndex = $index;
								break;
							}
						}
	
						if ($existingIndex !== null) {
							// Si oui, mettez à jour time_out
							$dataToInsert[$existingIndex]['time_out'] = $Time;
						} else {
							// Sinon, créez une nouvelle entrée
							$dataToInsert[] = [
								'sName' => $sName,
								'Date' => $Date,
								'time_in' => null, // Initialiser time_in comme null
								'time_out' => $Time,
							];
						}
					}
				}
	
				// Calculer la différence entre time_in et time_out
				foreach ($dataToInsert as &$data) {
					if ($data['time_in'] !== null && $data['time_out'] !== null) {
						$timeIn = new DateTime($data['time_in']);
						$timeOut = new DateTime($data['time_out']);
						$interval = $timeIn->diff($timeOut);
						$data['time_diff'] = $interval->format('%H:%I:%S');
					}
				}
	
				// Maintenant, insérez les données dans la base de données
				foreach ($dataToInsert as $data) {
					$this->db->insert('pointage', $data);
				}
				echo "Fichier importé avec succès";
			}
		}
	}
	
	


public function importOK() {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $upload_status = $this->uploadDoc();
        if ($upload_status != false) {
            $inputFileName = 'uploads/' . $upload_status;

            $inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
            $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
            $spreadsheet = $reader->load($inputFileName);
            $sheet = $spreadsheet->getSheet(0);
            $idpRanges = [];
            $dataToInsert = [];
            $errors = [];

            foreach ($sheet->getRowIterator() as $row) {
                $sName = trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue());
                $Date = trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue());
                $Time = trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue());
                $Idp = (int)trim($spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue());

                if ($sName !== null && $sName !== 'NULL') {
                    // Récupérer le shift de l'employé
                    $employeeData = $this->db->query("SELECT shift FROM shift WHERE em_id = ?", [$sName])->row();
                    if ($employeeData) {
                        $shift = $employeeData->shift;

                        if ($shift === 'DAY') {
                            // Pour shift = DAY, on stocke le min et max idp pour chaque date
                            if (!isset($idpRanges[$sName][$Date])) {
                                $idpRanges[$sName][$Date] = [
                                    'minIdp' => $Idp,
                                    'maxIdp' => $Idp,
                                    'Time_in' => $Time,
                                    'Time_out' => $Time,
                                ];
                            } else {
                                if ($Idp < $idpRanges[$sName][$Date]['minIdp']) {
                                    $idpRanges[$sName][$Date]['minIdp'] = $Idp;
                                    $idpRanges[$sName][$Date]['Time_in'] = $Time;
                                }
                                if ($Idp > $idpRanges[$sName][$Date]['maxIdp']) {
                                    $idpRanges[$sName][$Date]['maxIdp'] = $Idp;
                                    $idpRanges[$sName][$Date]['Time_out'] = $Time;
                                }
                            }
                        } elseif ($shift === 'PM') {
                            // Pour shift = PM, on stocke le min idp de la date min et le max idp de la date max
                            if (!isset($idpRanges[$sName])) {
                                $idpRanges[$sName] = [
                                    'minIdp' => $Idp,
                                    'minDate' => $Date,
                                    'maxIdp' => $Idp,
                                    'maxDate' => $Date,
                                    'Time_in' => $Time,
                                    'Time_out' => $Time,
                                ];
                            } else {
                                if ($Date < $idpRanges[$sName]['minDate'] || ($Date == $idpRanges[$sName]['minDate'] && $Idp < $idpRanges[$sName]['minIdp'])) {
                                    $idpRanges[$sName]['minIdp'] = $Idp;
                                    $idpRanges[$sName]['minDate'] = $Date;
                                    $idpRanges[$sName]['Time_in'] = $Time;
                                }
                                if ($Date > $idpRanges[$sName]['maxDate'] || ($Date == $idpRanges[$sName]['maxDate'] && $Idp > $idpRanges[$sName]['maxIdp'])) {
                                    $idpRanges[$sName]['maxIdp'] = $Idp;
                                    $idpRanges[$sName]['maxDate'] = $Date;
                                    $idpRanges[$sName]['Time_out'] = $Time;
                                }
                            }
                        }
                    }
                }
            }

            foreach ($idpRanges as $sName => $data) {
                if (isset($data['minDate'])) {
                    // Pour shift = PM
                    $timeIn = $data['Time_in'];
                    $timeOut = $data['Time_out'];
                    // Vérifier si une entrée existe déjà pour la même date
                    $existingEntry = $this->db->query("SELECT * FROM pointage WHERE sName = ? AND Date = ?", [$sName, $data['minDate']])->row();
                    if ($existingEntry) {
                        $errors[] = "Une entrée existe déjà pour $sName le " . $data['minDate'];
                        continue;
                    }

                    // Calculez la différence de temps
                    $timeInObj = new DateTime($timeIn);
                    $timeOutObj = new DateTime($timeOut);

                    // Si 'Time_out' est avant 'Time_in', cela signifie qu'il traverse minuit
                    if ($timeOutObj < $timeInObj) {
                        $timeOutObj->modify('+1 day'); // Ajoutez 24 heures à 'Time_out'
                    }
                    $diff = $timeInObj->diff($timeOutObj);

                    $dataToInsert[] = [
                        'sName' => $sName,
                        'Date' => $data['minDate'],
                        'Time_in' => $timeIn,
                        'Time_out' => $timeOut,
                        'Time_diff' => $diff->format('%H:%I:%S'), // Format de la différence de temps
                    ];
                } else {
                    // Pour shift = DAY
                    foreach ($data as $Date => $range) {
                        $timeIn = $range['Time_in'];
                        $timeOut = $range['Time_out'];
                        // Vérifier si une entrée existe déjà pour la même date
                        $existingEntry = $this->db->query("SELECT * FROM pointage WHERE sName = ? AND Date = ?", [$sName, $Date])->row();
                        if ($existingEntry) {
                            $errors[] = "Une entrée existe déjà pour $sName le " . $Date;
                            continue;
                        }

                        // Calculez la différence de temps
                        $timeInObj = new DateTime($timeIn);
                        $timeOutObj = new DateTime($timeOut);
                        $diff = $timeInObj->diff($timeOutObj);

                        $dataToInsert[] = [
                            'sName' => $sName,
                            'Date' => $Date,
                            'Time_in' => $timeIn,
                            'Time_out' => $timeOut,
                            'Time_diff' => $diff->format('%H:%I:%S'), // Format de la différence de temps
                        ];
                    }
                }
            }

            // Afficher les erreurs s'il y en a
            if (!empty($errors)) {
                foreach ($errors as $error) {
                    echo $error . "<br>";
                }
            } else {
                // Insérer les données dans la base de données
                foreach ($dataToInsert as $data) {
                    $this->db->insert('pointage', $data);
                }
                echo "Fichier importé avec succès";
            }
        }
    }
}
 
*/public function importCSV() {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Téléchargement des fichiers
        $upload_status_entree = $this->uploadDoc('file_entree');
        $upload_status_sortie = $this->uploadDoc('file_sortie');

        if ($upload_status_entree !== false && $upload_status_sortie !== false) {
            $inputFileNameEntree = 'uploads/' . $upload_status_entree;
            $inputFileNameSortie = 'uploads/' . $upload_status_sortie;

            try {
                // Lecture des fichiers CSV
                $dataEntree = $this->readCSV($inputFileNameEntree, true);  // true pour les entrées
                $dataSortie = $this->readCSV($inputFileNameSortie, false); // false pour les sorties

                $dataToInsert = [];
                $errors = [];

                // Détection des dates minimales et maximales dans $dataSortie
                $datesSortie = array_column($dataSortie, 'Date');
                $minDate = min($datesSortie);
                $maxDate = max($datesSortie);

                // Préparer les données de sortie pour une recherche rapide
                $dataSortieIndexed = [];
                foreach ($dataSortie as $sortieData) {
                    $dataSortieIndexed[$sortieData['sName'] . '-' . $sortieData['Date']] = $sortieData;
                }

                foreach ($dataEntree as $entreeData) {
                    $sName = $entreeData['sName'];
                    $Date = $entreeData['Date'];
                    $timeIn = $entreeData['Time_in'];

                    // Vérifier si l'enregistrement existe déjà
                    $existingRecord = $this->db->get_where('pointage', ['Date' => $Date, 'sName' => $sName])->row();
                    if ($existingRecord) {
                        echo "Enregistrement existe déjà pour sName: {$sName}, Date: {$Date}<br>";
                        continue;
                    }

                    // Correspondance avec $dataSortie (date minimale)
                    $keyMinDate = $sName . '-' . $minDate;
                    $keyMaxDate = $sName . '-' . $maxDate;

                    if (isset($dataSortieIndexed[$keyMinDate])) {
                        $sortieData = $dataSortieIndexed[$keyMinDate];
                    } else if (isset($dataSortieIndexed[$keyMaxDate])) {
                        $sortieData = $dataSortieIndexed[$keyMaxDate];
                    } else {
                        // Pas de correspondance dans $dataSortie
                        $dataToInsert[] = [
                            'sName' => $sName,
                            'Date' => $Date,
                            'Time_in' => $timeIn,
                            'Time_out' => 'N/A',
                            'Time_diff' => 'N/A', // Pas de différence de temps
                            'shift' => '', // Pas de shift disponible
                            'heure_e' => '', // Pas d'heure_e disponible
                        ];
                        continue;
                    }

                    $timeOut = isset($sortieData['Time_out']) ? $sortieData['Time_out'] : null;

                    try {
                        $timeInObj = new DateTime($timeIn);
                        $timeOutObj = new DateTime($timeOut);

                        // Si l'heure de sortie est avant l'heure d'entrée, ajouter un jour
                        if ($timeOutObj < $timeInObj) {
                            $timeOutObj->modify('+1 day');
                        }
                        $diff = $timeInObj->diff($timeOutObj);

                        // Formater la différence en H:i:s
                        $timeDiffFormatted = $diff->format('%H:%I:%S');
                    } catch (Exception $e) {
                        $errors[] = "Erreur de format de date pour sName: {$sName}, Date: {$Date}: " . $e->getMessage();
                        continue;
                    }

                    // Récupération des données du shift et autres informations
                    $employeeData = $this->db->query("SELECT shift, heure_e FROM shift WHERE em_id = ?", [$sName])->row_array();
                    $shift = $employeeData ? $employeeData['shift'] : '';
                    $heure_e = $employeeData ? $employeeData['heure_e'] : '';

                    // Ajout des données à insérer
                    $dataToInsert[] = [
                        'sName' => $sName,
                        'Date' => $Date,
                        'Time_in' => $timeIn,
                        'Time_out' => $timeOut,
                        'Time_diff' => $timeDiffFormatted, // Différence de temps formatée
                        'shift' => $shift,
                        'heure_e' => $heure_e,
                    ];
                }

                // Insertion des données dans la base de données
                if (!empty($dataToInsert)) {
                    $this->db->insert_batch('pointage', $dataToInsert);
                }

                // Gestion des erreurs
                if (!empty($errors)) {
                    $this->session->set_flashdata('error', implode('<br>', $errors));
                }
            } catch (Exception $e) {
                $this->session->set_flashdata('error', 'Erreur lors du traitement des fichiers CSV: ' . $e->getMessage());
            }
        } else {
            $this->session->set_flashdata('error', 'Erreur lors du téléchargement des fichiers.');
        }

        echo "Les fichiers CSV ont été importés avec succès.";
    }
}

private function readCSV($fileName, $isEntree = true) {
    $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($fileName);
    $sheet = $spreadsheet->getSheet(0);
    $data = [];

    foreach ($sheet->getRowIterator() as $row) {
        $cellIterator = $row->getCellIterator();
        $cellIterator->setIterateOnlyExistingCells(false); // All cells in the row

        $sName = str_replace(' ', '', trim($sheet->getCell('A' . $row->getRowIndex())->getValue()));
        $Date = trim($sheet->getCell('B' . $row->getRowIndex())->getValue());
        $Time = trim($sheet->getCell('C' . $row->getRowIndex())->getValue());

        // Ignorer si sName est vide ou égal à 'NULL'
        if (!empty($sName) && $sName !== 'NULL' && !empty($Date) && !empty($Time)) {
            $key = $sName . '-' . $Date;

            // Selon le type de fichier (entrée ou sortie), on stocke différemment le temps
            if ($isEntree) {
                $data[$key] = [
                    'sName' => $sName,
                    'Date' => $Date,
                    'Time_in' => $Time,
                ];
            } else {
                $data[$key] = [
                    'sName' => $sName,
                    'Date' => $Date,
                    'Time_out' => $Time,
                ];
            }
        }
    }
    return $data;
}








public function importOKle() {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $upload_status = $this->uploadDoc();
        if ($upload_status !== false) {
            $inputFileName = 'uploads/' . $upload_status;

            // Identifie le type de fichier et crée un lecteur approprié
            $inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
            $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
            $spreadsheet = $reader->load($inputFileName);
            $sheet = $spreadsheet->getSheet(0);
            
            $shiftsData = [
                'DAY' => [],
                'PM' => [],
                'NIGHT' => [],
                'OFF' => []
            ];
            $idpRanges = [];
            $dataToInsert = [];
            $errors = [];

            // Parcourt chaque ligne de la feuille de calcul
            foreach ($sheet->getRowIterator() as $row) {
                $sName = str_replace(' ', '', trim($spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue()));
                $Date = str_replace(' ', '', trim($spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue()));
                $Time = str_replace(' ', '', trim($spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue()));
                $Idp = (int)str_replace(' ', '', trim($spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue()));

                if ($sName !== null && $sName !== 'NULL') {
                    // Récupérer le shift et heure_e de l'employé
                    $employeeData = $this->db->query("SELECT shift, heure_e FROM shift WHERE em_id = ?", [$sName])->row();
                    if ($employeeData) {
                        $shift = $employeeData->shift;
                        $heure_e = $employeeData->heure_e;

                        // Stocker les données dans le tableau correspondant au shift
                        $shiftsData[$shift][] = [
                            'sName' => $sName,
                            'Date' => $Date,
                            'Time' => $Time,
                            'Idp' => $Idp,
                            'shift' => $shift,
                            'heure_e' => $heure_e
                        ];
                    }
                }
            }

            // Traiter les données pour le shift DAY
            foreach ($shiftsData['DAY'] as $data) {
                $sName = $data['sName'];
                $Date = $data['Date'];
                $Time = $data['Time'];
                $Idp = $data['Idp'];

                if (!isset($idpRanges[$sName][$Date])) {
                    $idpRanges[$sName][$Date] = [
                        'minIdp' => $Idp,
                        'maxIdp' => $Idp,
                        'minTime' => $Time,
                        'maxTime' => $Time,
                    ];
                } else {
                    if ($Idp < $idpRanges[$sName][$Date]['minIdp']) {
                        $idpRanges[$sName][$Date]['minIdp'] = $Idp;
                        $idpRanges[$sName][$Date]['minTime'] = $Time;
                    }
                    if ($Idp > $idpRanges[$sName][$Date]['maxIdp']) {
                        $idpRanges[$sName][$Date]['maxIdp'] = $Idp;
                        $idpRanges[$sName][$Date]['maxTime'] = $Time;
                    }
                }
            }

            // Traiter les données pour le shift PM
            foreach ($shiftsData['PM'] as $data) {
                $sName = $data['sName'];
                $Date = $data['Date'];
                $Time = $data['Time'];
                $Idp = $data['Idp'];

                if (!isset($idpRanges[$sName][$Date])) {
                    $idpRanges[$sName][$Date] = [
                        'minIdp' => $Idp,
                        'maxIdp' => $Idp,
                        'minTime' => $Time,
                        'maxTime' => $Time,
                    ];
                } else {
                    if ($Idp < $idpRanges[$sName][$Date]['minIdp']) {
                        $idpRanges[$sName][$Date]['minIdp'] = $Idp;
                        $idpRanges[$sName][$Date]['minTime'] = $Time;
                    }
                    if ($Idp > $idpRanges[$sName][$Date]['maxIdp']) {
                        $idpRanges[$sName][$Date]['maxIdp'] = $Idp;
                        $idpRanges[$sName][$Date]['maxTime'] = $Time;
                    }
                }
            }

            // Traiter les données pour le shift NIGHT
            foreach ($shiftsData['NIGHT'] as $data) {
                $sName = $data['sName'];
                $Date = $data['Date'];
                $Time = $data['Time'];
                $Idp = $data['Idp'];

                if (!isset($idpRanges[$sName])) {
                    $idpRanges[$sName] = [
                        'maxIdpMinDate' => $Idp,
                        'minIdpMaxDate' => $Idp,
                        'minDate' => $Date,
                        'maxDate' => $Date,
                        'maxTimeMinDate' => $Time,
                        'minTimeMaxDate' => $Time,
                    ];
                } else {
                    if ($Date < $idpRanges[$sName]['minDate'] || ($Date == $idpRanges[$sName]['minDate'] && $Idp > $idpRanges[$sName]['maxIdpMinDate'])) {
                        $idpRanges[$sName]['maxIdpMinDate'] = $Idp;
                        $idpRanges[$sName]['minDate'] = $Date;
                        $idpRanges[$sName]['maxTimeMinDate'] = $Time;
                    }
                    if ($Date > $idpRanges[$sName]['maxDate'] || ($Date == $idpRanges[$sName]['maxDate'] && $Idp < $idpRanges[$sName]['minIdpMaxDate'])) {
                        $idpRanges[$sName]['minIdpMaxDate'] = $Idp;
                        $idpRanges[$sName]['maxDate'] = $Date;
                        $idpRanges[$sName]['minTimeMaxDate'] = $Time;
                    }
                }
            }

            // Traiter les données pour le shift OFF
            $offShiftData = [];
            foreach ($shiftsData['OFF'] as $data) {
                $sName = $data['sName'];
                $Date = $data['Date'];
                $shift = $data['shift'];

                if (!isset($offShiftData[$sName])) {
                    $offShiftData[$sName] = [
                        'minDate' => $Date,
                        'maxDate' => $Date,
                        'shift' => $shift,
                    ];
                } else {
                    if ($Date < $offShiftData[$sName]['minDate']) {
                        $offShiftData[$sName]['minDate'] = $Date;
                    }
                    if ($Date > $offShiftData[$sName]['maxDate']) {
                        $offShiftData[$sName]['maxDate'] = $Date;
                    }
                }
            }

            // Ajouter les données du shift OFF à dataToInsert (seulement pour la date minimale)
            foreach ($offShiftData as $sName => $data) {
                // On n'ajoute que l'enregistrement correspondant à la date minimale
                $dataToInsert[] = [
                    'sName' => $sName,
                    'Date' => $data['minDate'],
                    'Time_in' => '',
                    'Time_out' => '',
                    'Time_diff' => '00:00:00',
                    'shift' => $data['shift'],
                    'heure_e' => '',  // heure_e vide pour le shift OFF
                ];
                // L'enregistrement correspondant à la date maximale est simplement ignoré
            }

            // Parcourt les données collectées pour insertion dans la base de données
            foreach ($idpRanges as $sName => $data) {
                // Récupérer le shift et heure_e de l'employé
                $employeeData = $this->db->query("SELECT shift, heure_e FROM shift WHERE em_id = ?", [$sName])->row();
                if ($employeeData) {
                    $shift = $employeeData->shift;
                    $heure_e = $employeeData->heure_e;
                }

                if (isset($data['minDate'])) {
                    // Pour shift = PM
                    $timeIn = $data['maxTimeMinDate'];
                    $timeOut = $data['minTimeMaxDate'];
                    $date = $data['minDate'];
                } else {
                    // Pour shift = DAY
                    foreach ($data as $Date => $range) {
                        $timeIn = $range['minTime'];
                        $timeOut = $range['maxTime'];
                        $date = $Date;
                        break;
                    }
                }

                // Calculez la différence de temps
                $timeInObj = new DateTime($timeIn);
                $timeOutObj = new DateTime($timeOut);

                // Si 'Time_out' est avant 'Time_in', cela signifie qu'il traverse minuit
                if ($timeOutObj < $timeInObj) {
                    $timeOutObj->modify('+1 day'); // Ajoutez 24 heures à 'Time_out'
                }
                $diff = $timeInObj->diff($timeOutObj);

                // Prépare les données pour insertion
                $dataToInsert[] = [
                    'sName' => $sName,
                    'Date' => $date,
                    'Time_in' => $timeIn,
                    'Time_out' => $timeOut,
                    'Time_diff' => $diff->format('%H:%I:%S'), // Format de la différence de temps
                    'shift' => $shift,
                    'heure_e' => $heure_e,
                ];
            }

            // Afficher les erreurs s'il y en a
            if (!empty($errors)) {
                foreach ($errors as $error) {
                    echo $error . "<br>";
                }
            } else {
                // Insérer les données dans la base de données
                foreach ($dataToInsert as $data) {
                    $this->db->insert('pointage', $data);
                }
                echo "Fichier importé avec succès";
            }
        }
    }
}







public function importp()
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $upload_status = $this->uploadDoc('upload_excel');
        if ($upload_status != false) {
            $inputFileName = 'uploads/' . $upload_status;
            $inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
            $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
            $spreadsheet = $reader->load($inputFileName);
            $sheet = $spreadsheet->getSheet(0);
            $count_Rows = 0;

            foreach ($sheet->getRowIterator() as $row) {
                $em_id = $spreadsheet->getActiveSheet()->getCell('A' . $row->getRowIndex())->getValue();
                $first_name = $spreadsheet->getActiveSheet()->getCell('B' . $row->getRowIndex())->getValue();
                $last_name = $spreadsheet->getActiveSheet()->getCell('C' . $row->getRowIndex())->getValue();
                $des_id = $spreadsheet->getActiveSheet()->getCell('D' . $row->getRowIndex())->getValue();
                $dep_id = $spreadsheet->getActiveSheet()->getCell('E' . $row->getRowIndex())->getValue();
                $contrat = $spreadsheet->getActiveSheet()->getCell('F' . $row->getRowIndex())->getValue();
                $em_joining_date = $spreadsheet->getActiveSheet()->getCell('G' . $row->getRowIndex())->getValue();
                $em_birthday = $spreadsheet->getActiveSheet()->getCell('H' . $row->getRowIndex())->getValue();
                $em_phone = $spreadsheet->getActiveSheet()->getCell('I' . $row->getRowIndex())->getValue();
                $em_gender = $spreadsheet->getActiveSheet()->getCell('J' . $row->getRowIndex())->getValue();
                $em_nid = $spreadsheet->getActiveSheet()->getCell('K' . $row->getRowIndex())->getValue();

                // Convertir chaque champ en UTF-8 si nécessaire
                $first_name = mb_convert_encoding($first_name, 'UTF-8', 'auto');
                $last_name = mb_convert_encoding($last_name, 'UTF-8', 'auto');
                $des_id = mb_convert_encoding($des_id, 'UTF-8', 'auto');
                $dep_id = mb_convert_encoding($dep_id, 'UTF-8', 'auto');

                // Générer un mot de passe par défaut (MD5 hash)
               // $em_password = md5("123456789");
               
                
               
                // Préparer les données pour l'insertion dans la table 'employee'
                $data = array(
                    'em_id' => $em_id,
                    'first_name' => $first_name,
                    'last_name' => $last_name,
                    'dep_id' => $dep_id,
                    'des_id' => $des_id,
                    'contrat' => $contrat,
                    'em_joining_date' => $em_joining_date,
                    'em_birthday' => $em_birthday,
                    'em_phone' => $em_phone,
                    'em_gender' => $em_gender,
                    'em_nid' => $em_nid,
                    'em_image' => 'Tel1001.jpg',  // Assurez-vous que le nom de l'image est correct
                    'em_password' => 'f7c3bc1d808e04732adf679965ccc34ca7ae3441',
                );

                // Insérer les données dans la table 'employee'
                if (!$this->db->insert('employee', $data)) {
                    // Gestion de l'erreur si l'insertion échoue
                    echo "Erreur lors de l'insertion pour em_id: {$em_id}<br>";
                } else {
                    $count_Rows++;
                }
            }

            echo "Fichier importé avec succès";
        } else {
            redirect(base_url());
        }
    } else {
        // Traitement pour les autres méthodes HTTP si nécessaire
    }
}




public function importShift()
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $upload_status = $this->uploadDoc('upload_excel');

        if ($upload_status !== false) {
            $inputFileName = 'uploads/' . $upload_status;
            $inputTileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);
            $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputTileType);
            $spreadsheet = $reader->load($inputFileName);
            $sheet = $spreadsheet->getSheet(0);
            $count_Rows = 0;
            $count_Updated = 0;

            foreach ($sheet->getRowIterator() as $row) {
                $rowIndex = $row->getRowIndex();

                // Extraire les données de chaque cellule et supprimer les espaces insécables
                $em_id = str_replace([' ', "\xc2\xa0"], '', trim($spreadsheet->getActiveSheet()->getCell('A' . $rowIndex)->getValue()));
                $shift = str_replace([' ', "\xc2\xa0"], '', trim($spreadsheet->getActiveSheet()->getCell('B' . $rowIndex)->getValue()));
                $heure_e = str_replace([' ', "\xc2\xa0"], '', trim($spreadsheet->getActiveSheet()->getCell('C' . $rowIndex)->getValue()));

                // Debugging
                echo "Importing: em_id={$em_id}, shift={$shift}, heure_e={$heure_e}<br>";

                // Préparer les données pour l'insertion ou la mise à jour
                $data = array(
                    'shift' => $shift,
                    'heure_e' => $heure_e,
                );

                // Vérifier si l'em_id existe déjà dans la table 'shift'
                $this->db->where('em_id', $em_id);
                $query = $this->db->get('shift');

                if ($query->num_rows() > 0) {
                    // L'em_id existe, mettre à jour les données
                    $this->db->where('em_id', $em_id);
                    if (!$this->db->update('shift', $data)) {
                        // Gestion de l'erreur si la mise à jour échoue
                        echo "Erreur lors de la mise à jour pour em_id: {$em_id}<br>";
                    } else {
                        $count_Updated++;
                    }
                } else {
                    // L'em_id n'existe pas, insérer les données
                    $data['em_id'] = $em_id;
                    if (!$this->db->insert('shift', $data)) {
                        // Gestion de l'erreur si l'insertion échoue
                        echo "Erreur lors de l'insertion pour em_id: {$em_id}<br>";
                    } else {
                        $count_Rows++;
                    }
                }
            }

            echo "Fichier importé avec succès. Nombre de lignes insérées : {$count_Rows}. Nombre de lignes mises à jour : {$count_Updated}.";
        } else {
            redirect(base_url());
        }
    } else {
        // Traitement pour les autres méthodes HTTP si nécessaire
    }
}






function uploadDoc($fieldName)
{
    $uploadPath = 'uploads/';
    if (!is_dir($uploadPath)) {
        mkdir($uploadPath, 0777, TRUE); // Crée le répertoire s'il n'existe pas
    }

    $config['upload_path'] = $uploadPath;
    $config['allowed_types'] = 'csv|xlsx|xls';
    $config['max_size'] = 1000000;
    $this->load->library('upload', $config);
    $this->upload->initialize($config);
    if ($this->upload->do_upload($fieldName)) {
        $fileData = $this->upload->data();
        return $fileData['file_name'];
    } else {
        return false;
    }
}



	function uploadDocANCIEN()
	{
		$uploadPath = 'uploads/';
		if(!is_dir($uploadPath))
		{
			mkdir($uploadPath,0777,TRUE); // FOR CREATING DIRECTORY IF ITS NOT EXIST
		}

		$config['upload_path']=$uploadPath;
		$config['allowed_types'] = 'csv|xlsx|xls';
		$config['max_size'] = 1000000;
		$this->load->library('upload',$config);
		$this->upload->initialize($config);
		if($this->upload->do_upload('upload_excel'))
		{
			$fileData = $this->upload->data();
			return $fileData['file_name'];
		}
		else
		{
			return false;
		}
	}




 
}
