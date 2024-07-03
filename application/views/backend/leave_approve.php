<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
<div class="page-wrapper">
    <div class="message"></div>
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-themecolor"><i class="fa fa-clone" style="color:#1976d2"> </i> Demande congé</h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Accueil</a></li>
                <li class="breadcrumb-item active">Demande congé</li>
            </ol>
        </div>
    </div>
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div class="row m-b-10">
            
                <div class="col-12">

                <?php if($this->session->userdata('user_type')== 'EMPLOYEE'){ ?>
                        <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#appmodel" data-whatever="@getbootstrap" class="text-white"><i class="" aria-hidden="true"></i> Envoyer Demande </a></button>
                        <button type="button" id="monBoutonA" class="btn btn-info"><i class="fa fa-clock-o" aria-hidden="true"></i> En Attente</button>
                        <button type="button" id="monBoutonV" class="btn btn-info"><i class="fa fa-check" aria-hidden="true"></i> Validé</button>
                        <button type="button" id="monBoutonR" class="btn btn-info"><i class="fa fa-times" aria-hidden="true"></i> Rejeté</button>
                  
                    <?php } else if($this->session->userdata('user_type')== 'N+1') { ?>
                        <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#appmodel" data-whatever="@getbootstrap" class="text-white"><i class="" aria-hidden="true"></i> Envoyer Demande </a></button>
                        <button type="button" id="monBoutonA" class="btn btn-info"><i class="fa fa-clock-o" aria-hidden="true"></i> En attente</button>
                        <button type="button" id="monBoutonV" class="btn btn-info"><i class="fa fa-check" aria-hidden="true"></i> Validé</button>
                        <button type="button" id="monBoutonR" class="btn btn-info"><i class="fa fa-times" aria-hidden="true"></i> Rejeté</button>
                  
                    <?php } else { ?>
                        <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#appmodel" data-whatever="@getbootstrap" class="text-white"><i class="" aria-hidden="true"></i> Ajouter Demande </a></button>
                       
                        <button type="button" id="monBoutonA" class="btn btn-info"><i class="fa fa-clock-o" aria-hidden="true"></i> En attente</button>
                         <button type="button" id="monBoutonV" class="btn btn-info"><i class="fa fa-check" aria-hidden="true"></i> Validé</button>
                        <button type="button" id="monBoutonR" class="btn btn-info"><i class="fa fa-times" aria-hidden="true"></i> Rejeté</button>
                        <?php } ?>
                       
                </div>                       
            
        </div> 
        <div class="row">
            <div class="col-12">
                <div class="card card-outline-info">
                    <div class="card-header">

                    <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                        <h4 class="m-b-0 text-white"></h4>
                    <?php } else { ?>
                         <h4 id="texte_titre"  class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> </h4>
                           
                    <?php } ?>
                      
                    </div>
                    <div class="card-body">
                        <div class="table-responsive ">

                            <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                    <th>N°</th>
                                        <th>Nom et Prenoms</th>
                                        <th>Type</th>
                                        <th>Date demande</th>
                                        <th>Date debut</th>
                                        <th>Date fin</th>
                                        <th>Duration</th>
                                        <th>N+1</th>
                                        <th>RH</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                        
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!--Modal pour validé congé-->
        <div class="modal fade" id="validemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <center><h4 class="modal-title" id="myModalLabel"><i <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Validation congé</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
				<h4 class="text-center">Voulez-vous vraiment validé le demande de congé </h4>
                <h3 id="datename" class="text-center"></h3>
                <h4 class="text-center">pour le matricule:</h4>
				<h3 id="matr" class="text-center"></h3>

			</div>
            <div class="modal-footer">
            <button type="button" id="valid_id" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Validé</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Fermer</button>
            </div>
			
        </div>
    </div>
</div>

<!--Modal pour rejété congé-->
<div class="modal fade" id="rejetmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <center><h4 class="modal-title" id="myModalLabel"><i <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Rejet congé</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
				<h4 class="text-center">Voulez-vous vraiment rejeté le demande de congé </h4>
                <h3 id="datename" class="text-center"></h3>
                <h4 class="text-center">pour le matricule:</h4>
				<h3 id="matri" class="text-center"></h3>

			</div>
            <div class="modal-footer">
            <button type="button" id="rejet_id" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span><i class="fa fa-calendar-times-o" aria-hidden="true"></i> Rejeté</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Fermer</button>
            </div>
			
        </div>
    </div>
</div>
<div class="modal fade reussimodal" id="reussimodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content reussi_modal">
           
            <div class="modal-body">
				
                <div class="success_img">
                <img src="https://media.tenor.com/bm8Q6yAlsPsAAAAi/verified.gif" alt="">
                </div>
			</div>
            
			
        </div>
    </div>
</div>

<!--DEBUT MODAL DEMANDE CONGE-->

        <div class="modal fade" id="appmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">

                    <div class="modal-dialog" role="document">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel1">Demanded congé</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                
                            </div>
                            <div class="total">
                                    <span style="color:red" id="total"></span>
                            </div>
                                
                            <form method="post" action="Add_Applications" id="leaveapply" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="form_emp">
                                <?php if($this->session->userdata('user_type')== 'EMPLOYEE'){ ?>
                                    <div class="form-group">
                                <label>N° matricule</label>
                                <select class=" form-control custom-select selectedEmployeeID"  tabindex="1" name="emid" id="em_id" required>
                                    <option value="<?php echo $employee->em_id ?>"><?php echo $employee->em_id?></option>
           
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Nom et Prénoms</label>
                                <select class=" form-control custom-select selectedEmployeeID"  tabindex="1" name="names" required>
                                    <option value="<?php echo $employee->em_id ?>"><?php echo $employee->first_name.' '.$employee->last_name?></option>
                                       
                                </select>
                            </div>
                                    <?php } else { ?>
                            <div class="form-group">
                                <label>Matricule</label>
                                    <select class="form-control custom-select selectedEmployeeID fetchLeaveTotal" tabindex="1" name="emid" id="em_id"  required>
                                    <?php foreach ($employee as $value): ?>
                                    <option value="<?php echo $value->em_id ?>"><?php echo $value->em_id ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

    
                            <div class="form-group">
                                <label>Nom-prenoms</label>
                                <select class="form-control custom-select selectedEmployeeName" tabindex="1" name="names" id="employee_name" required>
                                    <?php foreach ($employee as $value): ?>
                                    <option value="<?php echo $value->em_id ?>"><?php echo $value->first_name . ' ' . $value->last_name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                                <?php } ?>

                            </div>


                                <div class="form-group">
                                    <label>Type de congé</label>
                                    <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="typeid" id="leavetype" required>
                                        <option value="">Selectinner type de congé</option>
                                        <option value="Avec solde">Avec solde</option>
                                        <option value="Sans solde">Sans solde</option>
                                        <option value="Maladie">Maladie</option>
                                        <option value="Maternité">Maternité</option>
                                        <option value="Exceptionnel">Exceptionnel</option>
                                        
                                    </select>
                                </div>
                                <div class="form-group"id="pj" style="display:none">
                                    <label>P. J</label>
                                    <input type="file" class="form-control-file" name="file_url" id="file_url" >
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Durée du congé</label><br>
                                    <input name="type" type="radio" id="radio_1" data-value="Half" class="duration" value="Half Day" checked="">
                                    <label for="radio_1">Demi-journée</label>
                                    <input name="type" type="radio" id="radio_2" data-value="Full" class="type" value="Full Day">
                                    <label for="radio_2">Journée complète</label>
                                    <input name="type" type="radio" class="with-gap duration" id="radio_3" data-value="More" value="More than One day">
                                    <label for="radio_3">Au dessus d'un jour</label>
                                </div>
                                <div class="form-group">
                                        <label class="control-label" id="hourlyFix">Date de départ</label>
                                        <input type="date" name="startdate" class="form-control" id="recipient-name1" required>
                                    </div>

                                    <div class="form-group" id="enddate" style="display:none">
                                        <label class="control-label">Date de retour</label>
                                        <input type="date" name="enddate" class="form-control" id="recipient-name2">
                                        <span style="color:red" id="different"></span>
                                    </div>


                            <script>
                                // Sélectionnez les éléments d'entrée de date
                            const startDateInput = document.querySelector('input[name="startdate"]');
                            const endDateInput = document.querySelector('input[name="enddate"]');
                            const differentSpan = document.getElementById('different');

                            // Function to calculate and update the date difference
                            function updateDateDifference() {
                                const startDate = new Date(startDateInput.value);
                                const endDate = new Date(endDateInput.value);
                                const currentDate = new Date();

                                if (startDate <= endDate) {
                                    // Calculate the difference in milliseconds
                                    const timeDiff = endDate - startDate;

                                    // Convert the difference to days
                                    const daysDiff = timeDiff / (1000 * 60 * 60 * 24);
                            /*

        // Check if the conditions for displaying the alert are met
        if (1 <= daysDiff <= 3  && (startDate - currentDate) / (1000 * 60 * 60 * 24) <2) {
            alert("Pour le congé de 1 à 3 jours,Vous devez envoyer la demande au moins 3 jours à l'avance.");

            // Clear the date fields
            startDateInput.value = '';
            endDateInput.value = '';

            // Exit the function after displaying the alert and clearing the fields
            return;
        }else if (4 <= daysDiff <= 7  && (startDate - currentDate) / (1000 * 60 * 60 * 24) <7) {
            alert("Pour le congé de 4 à 7 jours,Vous devez envoyer la demande au moins 3 jours à l'avance.");

            // Clear the date fields
            startDateInput.value = '';
            endDateInput.value = '';

            // Exit the function after displaying the alert and clearing the fields
            return;
        }else if (8 <= daysDiff <= 15  && (startDate - currentDate) / (1000 * 60 * 60 * 24) <14) {
            alert("Pour le congé de 8 à 15 jours,Vous devez envoyer la demande au moins 15 jours à l'avance.");

            // Clear the date fields
            startDateInput.value = '';
            endDateInput.value = '';

            // Exit the function after displaying the alert and clearing the fields
            return;
        }else if (daysDiff > 15  && (startDate - currentDate) / (1000 * 60 * 60 * 24) <20) {
            alert("Pour le congé de + 15 jours,Vous devez envoyer la demande au moins 20 jours à l'avance.");

            // Clear the date fields
            startDateInput.value = '';
            endDateInput.value = '';

            // Exit the function after displaying the alert and clearing the fields
            return;
        }
*/
        // Update the content of the element #different
        differentSpan.textContent = `${daysDiff} jours`;
    } else {
        // If the end date is earlier than the start date, display an error message
        differentSpan.textContent = 'La date de retour doit être ultérieure à la date de départ';
        
    }
}

// Event listeners for date input fields
startDateInput.addEventListener('change', updateDateDifference);
endDateInput.addEventListener('change', updateDateDifference);

    </script>

                                <div class="form-group">
                                    <label class="control-label">Raisons</label>
                                    <textarea class="form-control" name="reason" id="message-text1"></textarea>                                                
                                </div>
                                                                               
                            </div>
                           
                            <script>
                                $(document).ready(function () {
                                    // Détecter le changement dans la sélection du type de congé
                                    $('#leavetype').change(function () {
                                                // Récupérer la valeur sélectionnée
                                                var selectedType = $(this).val();

                                                // Vérifier si le type de congé nécessite l'affichage du champ d'importation d'image
                                                if (selectedType === 'Maladie' || selectedType === 'Maternité' || selectedType === 'Exceptionnel') {
                                                    $('#pj').show(); // Afficher le champ d'importation d'image
                                                } else {
                                                    $('#pj').hide(); // Masquer le champ d'importation d'image
                                                }
                                            });



                                    $('#leaveapply input').on('change', function(e) {
                                        e.preventDefault(e);

                                        // Get the record's ID via attribute  
                                        var duration = $('input[name=type]:checked', '#leaveapply').attr('data-value');
                                        var champDate = document.getElementById("recipient-name2");
                                        
                                        console.log(duration);

                                        if(duration =='Half'){
                                            $('#enddate').hide();
                                            $('#hourlyFix').text('Date');
                                            champDate.value = "";
                                            document.getElementById("different").textContent = "";
                                        }
                                        else if(duration =='Full'){
                                            $('#enddate').hide();  
                                            $('#hourlyFix').text('Date');  
                                            champDate.value = "";
                                            document.getElementById("different").textContent = "";
                                        }
                                        else if(duration =='More'){
                                            $('#enddate').show();
                                            
                                        }
                                    });
                                    $('#appmodel').on('hidden.bs.modal', function () {
                                    //    location.reload();
                                    });
                                });                                                          
                            </script>
                            <div class="modal-footer">
                                <input type="hidden" name="id" class="form-control" id="recipient-name1" required> 
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Annuler</button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-paper-plane" aria-hidden="true"></i> Envoyer</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

<!--FIN MODAL DEMANDE CONGE-->



<!--DEBUT MODAL EDIT CONGE-->
<div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-view">
        <div class="modal-content">
            <div class="modal-header">
                <center><h4 class="modal-title" id="myModalLabel">Details demande congé</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               
            </div>
            <div class="modal-body">
			<div class="container-fluid">
			<form id="editForm">
           
                <div class="row">
                    <div class="col-sm-3">
                        <label class="control-label" style="position:relative; top:7px;">Date de demande:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="date_dem" id="date_dem" readonly>
                    </div>
                    <div class="col-sm-2">
                        <input type="hidden" class="form-control" name="idc" id="idc" readonly>
					</div>
                    <div class="col-sm-2">
                    <input type="hidden" class="form-control" name="solde_moins" id="solde_moins" readonly>
					</div>
                </div>
           

        <div class="info_row">
            <div class="row" >
				
					<div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Matricule:</label>
					</div>
                    <div class="col-sm-2">
						<input type="text" class="form-control" name="mat" id="mat" readonly>
                    </div>
                  
				
                    <div class="col-sm-1">
						<label class="control-label" style="position:relative; top:7px;">Nom:</label>
                    </div>
                    <div class="col-sm-6">
						<input type="text" class="form-control" name="nom" id="nom" readonly>
					</div>
            </div>
             
				<div class="row">
                <div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Departement:</label>
                    </div>
                    <div class="col-sm-8">
						<input type="text" class="form-control" name="poste" id="poste" readonly>
					</div>
                </div>

            <div class="row" >
				
                <div class="col-sm-3">
                <label class="control-label" style="position:relative; top:7px;">Type congé:</label>
                </div>
                <div class="col-sm-3">
                <input type="text" class="form-control" name="type" id="type" readonly>
                </div>
             
            
                <div class="col-sm-3">
                    <label class="control-label" style="position:relative; top:7px;">Solde conge:</label>
              </div>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="solde" id="solde" readonly> 
				 </div>
           
        </div>
        
				
               
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Date de départ :</label>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="date_deb" id="date_deb" readonly>
					</div>
				
					<div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Date de retour:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="date_fin" id="date_fin" readonly>
					</div>
				</div>
              
				<div class="row">
					<div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Durée:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="duree" id="duree" readonly>
					</div>
                    <div class="col-sm-3">
						<label class="control-label reste" style="position:relative; top:7px;">Nouveau solde:</label>
					</div>
					
                    <div class="col-sm-3">
                        <input type="text" class="form-control reste" name="retenu" id="retenu" readonly>
					</div>
                    
				</div>
               
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Raison:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="reason" id="reason" readonly>
                        
					</div>
				</div>
                <div class="row" id="img_pj">
                    <div class="col-md-3">
                        <label class="control-label" style="position:relative; top:7px;">P. J:</label>
                    </div>
                <div class="col-md-9">
                 <!--    <input type="text" class="form-control" name="pj_img" id="pj_img" readonly>
                    <!-- Optionnel: Afficher l'image -->
                    <img id="pj_img_preview" src="" alt="Image PJ">
                </div>
            </div>

                
            </div>
                

                    <?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>
                        <div class="row">
                            <div class="col-sm-3">
                                <label class="control-label" style="position:relative; top:7px;">Validation N+1:</label>
                                <!--<input type="text" class="form-control" name="status_n" id="status_n" readonly>
                            -->
                            </div>
                            <div class="col-sm-3">
                                    <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="status_n" id="status_n" disabled>
                                        <option value="En attente">En attente</option>
                                        <option value="Approuvé">Approuvé</option>
                                        <option value="Rejeté">Rejeté</option>
                                    </select>
                            </div>
                            <div class="col-sm-6" id="par">
					            <input type="textarea" class="form-control" name="id_nplus" id="id_nplus" readonly>
                        
					        </div>
                        </div>
                 <br>
                 <div class="row" id="n_coms">
                    <div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Raison:</label>
                    </div>
                    <div class="col-sm-8">
					<input type="textarea" class="form-control" name="coms_n" id="coms_n" readonly>
                        
					</div>
                </div>
                <div class="row"> 
					<div class="col-sm-3">
                    <label class="control-label" style="position:relative; top:7px;">RH:</label>
					</div>
                    <div class="col-sm-3">
                        <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="status_rh" id="status_rh" disabled>
                                    <option value="En attente">En attente</option>
                                    <option value="Approuvé">Approuvé</option>
                                    <option value="Rejeté">Rejeté</option>
                                </select>
					</div>
                    <div class="col-sm-6" >
					<input type="textarea" class="form-control" name="id_nplus" id="id_nplus" readonly>
                        
					</div>
					
				</div>
                <div class="row" id="rh_coms">
				
                    <div class="col-sm-3">
                        <label class="control-label" style="position:relative; top:7px;">Raison:</label>
                    </div>
                    <div class="col-sm-8">
					<input type="textarea" class="form-control" name="coms_rh" id="coms_rh" readonly>
                        
					</div>

				</div>


                    <?php } else  if($this->session->userdata('user_type')=='N+1'){ ?>
                        
                        <div class="row">
                            <div class="col-sm-3">
                                <label class="control-label" style="position:relative; top:7px;">Validation N+1:</label>
                                <!--<input type="text" class="form-control" name="status_n" id="status_n" readonly>
                            -->
                            </div>
                    <div class="col-sm-3">
                        <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="status_n" id="status_n">
                                    <option value="En attente">En attente</option>
                                    <option value="Approuvé">Approuvé</option>
                                    <option value="Rejeté">Rejeté</option>
                                </select>
					</div>
                      <div class="col-sm-6" id="par">
					            <input type="textarea" class="form-control" name="id_nplus" id="id_nplus" readonly>
                        
					        </div>
                    </div>
                 <br>
                 <div class="row" id="n_coms">
                    <div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Raison:</label>
                    </div>
                    <div class="col-sm-8">
					<input type="textarea" class="form-control" name="coms_n" id="coms_n">
                        
					</div>
                </div>

                <br>
                <div class="row">
                    <div class="col-sm-12">
                    <button type="button"  id="saveButton" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i> Enregistrer</button>
                    </div>
                </div>
                    <?php } else { ?>    
                       
                        <div class="row">
                            <div class="col-sm-3">
                                <label class="control-label" style="position:relative; top:7px;">Validation N+1:</label>
                                <!--<input type="text" class="form-control" name="status_n" id="status_n" readonly>
                            -->
                            </div>
                    <div class="col-sm-3">
                        <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="status_n" id="status_n" disabled>
                                    <option value="En attente">En attente</option>
                                    <option value="Approuvé">Approuvé</option>
                                    <option value="Rejeté">Rejeté</option>
                                </select>
					</div>
                      <div class="col-sm-6" id="par">
					            <input type="textarea" class="form-control" name="id_nplus" id="id_nplus" readonly>
                        
					        </div>
                    </div>
                 <br>
                 <div class="row" id="n_coms">
                    <div class="col-sm-3">
						<label class="control-label" style="position:relative; top:7px;">Raison:</label>
                    </div>
                    <div class="col-sm-8">
					<input type="textarea" class="form-control" name="coms_n" id="coms_n">
                        
					</div>
                </div>

               
                <div class="row"> 
					<div class="col-sm-3">
                    <label class="control-label" style="position:relative; top:7px;">RH:</label>
					</div>
                    <div class="col-sm-3">
                        <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="status_rh" id="status_rh" required>
                                    <option value="En attente">En attente</option>
                                    <option value="Approuvé">Approuvé</option>
                                    <option value="Rejeté">Rejeté</option>
                                </select>
					</div>
					
				</div>
                <div class="row" id="rh_coms">
				
                    <div class="col-sm-3">
                        <label class="control-label" style="position:relative; top:7px;">Raison:</label>
                    </div>
                    <div class="col-sm-8">
					<input type="textarea" class="form-control" name="coms_rh" id="coms_rh">
                        
					</div>

				</div>
                <br>

                <div class="row">
                    <div class="col-sm-12">
                        <button type="button"  id="saveButton_rh" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i> Enregistrer</button>
                    </div>
                </div>
                <div class="row">
   
</div>
                    <?php } ?>
                
                 
                
				<input type="hidden" name="id" id="userid">
                <input type="hidden" name="id_conge" id="id_conge">
            </div> 
			</div>
            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
              
            </form>
            </div>
			
        </div>
    </div>
</div>

<!--FIN MODAL EDIT CONGE-->




<script>
    $(document).ready(function(){
        // Hide n_coms initially
      

        // Attach change event to status_n dropdown
        $('#status_n').change(function(){
            // If Rejeté is selected, show n_coms, otherwise hide it
            if($(this).val() === 'Rejeté'){
                $('#n_coms').show();
            } else {
                $('#n_coms').hide();
            }
        });
        $('#status_rh').change(function(){
            // If Rejeté is selected, show n_coms, otherwise hide it
            if($(this).val() === 'Rejeté'){
                $('#rh_coms').show();
            } else {
                $('#rh_coms').hide();
            }
        });
    });
</script>
            


                

<script>
    (function($) {
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';
            var table; 

// Fonction pour initialiser la DataTable
function initializeDataTable() {
            table = $('#example23').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "aaSorting": [[1, 'asc']],
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        }

        // Appelez la fonction pour initialiser DataTable
        initializeDataTable();

        <?php if($this->session->userdata('user_type')== 'EMPLOYEE'){ ?>

        function showTable() {  
                $.ajax({
                    type: 'POST',
                        url: url + 'leave/GetEmApplication',
                    
                    success: function(response) {
                        $('#example23').DataTable().destroy(); // Détruire la DataTable existante
           
                        $('#example23 tbody').html(response);

                        // Initialize DataTable after loading data
                        var dataTable = initializeDataTable();
                        table.column(8).search('En attente').draw();
                    $('#texte_titre').text('');
                    $('#monBoutonA').addClass('btn-danger');
                    $('#monBoutonV').removeClass('btn-danger');
                    $('#monBoutonR').removeClass('btn-danger');

                    }
                });
            }

            // Call showTable on page load
            showTable();
            

// Gérez le filtrage en dehors de la DataTable
            $('#monBoutonA').click(function() {
            table.column(8).search('En attente').draw();
            $('#texte_titre').text('Liste des demande congé');
            $('#monBoutonA').addClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonV').click(function() {
            table.column(8).search('Approuvé').draw();
            $('#texte_titre').text('Liste des congé Validé');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').addClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonR').click(function() {
            table.column(8).search('Rejeté').draw();
            $('#texte_titre').text('Liste des congé Rejeté');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').addClass('btn-danger');
        });


        <?php } else if($this->session->userdata('user_type')== 'N+1'){ ?>


        function showTable() {  
                $.ajax({
                    type: 'POST',
                   
                        url: url + 'leave/GetNApplication',   
                       
                    success: function(response) {
                        $('#example23').DataTable().destroy(); // Détruire la DataTable existante
           
                        $('#example23 tbody').html(response);

                        // Initialize DataTable after loading data
                        var dataTable = initializeDataTable();
                        table.column(7).search('En attente').draw();
                    $('#texte_titre').text('');
                    $('#monBoutonA').addClass('btn-danger');
                    $('#monBoutonV').removeClass('btn-danger');
                    $('#monBoutonR').removeClass('btn-danger');

                    }
                });
            }

            // Call showTable on page load
            showTable();
            

// Gérez le filtrage en dehors de la DataTable
            $('#monBoutonA').click(function() {
            table.column(7).search('En attente').draw();
            $('#texte_titre').text('Liste desl demande congé');
            $('#monBoutonA').addClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonV').click(function() {
            table.column(7).search('Approuvé').draw();
            $('#texte_titre').text('Liste desh congé Validé');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').addClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonR').click(function() {
            table.column(7).search('Rejeté').draw();
            $('#texte_titre').text('Liste desh congé Rejeté');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').addClass('btn-danger');
        });

        <?php } else { ?>

            function showTable() {  
                $.ajax({
                    type: 'POST',
                    
                    url: url + 'leave/GetApplication',
                   
                    success: function(response) {
                        $('#example23').DataTable().destroy(); // Détruire la DataTable existante
           
                        $('#example23 tbody').html(response);

                        // Initialize DataTable after loading data
                        var dataTable = initializeDataTable();
                        table.column(8).search('En attente').draw();
                    $('#texte_titre').text('');
                    $('#monBoutonA').addClass('btn-danger');
                    $('#monBoutonV').removeClass('btn-danger');
                    $('#monBoutonR').removeClass('btn-danger');

                    }
                });
            }

            // Call showTable on page load
            showTable();
            

// Gérez le filtrage en dehors de la DataTable
            $('#monBoutonA').click(function() {
            table.column(8).search('En attente').draw();
            $('#texte_titre').text('Liste des demande congé');
            $('#monBoutonA').addClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonV').click(function() {
            table.column(8).search('Approuvé').draw();
            $('#texte_titre').text('Liste des congé Validé');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').addClass('btn-danger');
            $('#monBoutonR').removeClass('btn-danger');
        });

        $('#monBoutonR').click(function() {
            table.column(8).search('Rejeté').draw();
            $('#texte_titre').text('Liste des congé Rejeté');
            $('#monBoutonA').removeClass('btn-danger');
            $('#monBoutonV').removeClass('btn-danger');
            $('#monBoutonR').addClass('btn-danger');
        });


        <?php } ?>





            $(document).on('click', '.valide', function(){
            var id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'leave/getidconge',
                dataType: 'json',
                data: {id: id},
                success: function(response){
                    console.log(response);
                    $('#matr').html(response.em_id);
                    $('#valid_id').val(response.id);
                    $('#validemodal').modal('show');
                }
            });
            

        });
//AFFICHER DETAIL CONGE ET MISE A JOUR

        $(document).on('click', '.edit', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
            url: url + 'leave/getidConger',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
                $('#idc').val(response.id);
				$('#mat').val(response.em_id);
                $('#nom').val(response.first_name + ' ' + response.last_name);
                $('#poste').val(response.dep_id);
                $('#type').val(response.typeid);
                $('#date_dem').val(response.apply_date);
                $('#type').val(response.typeid);
                $('#date_deb').val(response.start_date);
                $('#date_fin').val(response.end_date);
                $('#duree').val(response.leave_duration);
                $('#reason').val(response.reason);
                $('#coms_n').val(response.coms_n);
                $('#coms_rh').val(response.coms_rh);
                $('#status_n').val(response.leave_status);
                $('#status_rh').val(response.leave_status_rh);
                $('#id_nplus').val("Par " + response.id_nplus);
                $('#id_conge').val(response.id_conge);
               

            // Récupérer le nom du fichier image et son emplacement
            var imageFileName = response.pj;
            var imagePath = '<?php echo base_url(); ?>uploads/pj/';
// Masquer l'élément #img_pj si imageFileName est vide
if (imageFileName === "") {
    $('#img_pj').hide();
} else {
    // Afficher l'élément #img_pj
    $('#img_pj').show();

    // Afficher le nom du fichier dans le champ de texte
    $('#pj_img').val(imageFileName);

    // Afficher l'image dans un élément img (optionnel)
    var imageUrl = imagePath + imageFileName;
    $('#pj_img_preview').attr('src', imageUrl);

   
    $('#pj_img_preview').click(function () {
        // Récupérer l'URL de l'image
        var imageUrl = $(this).attr('src');

        // Afficher l'image zoomée dans un conteneur
        var zoomContainer = $('<div id="zoom-container"></div>');
        var zoomedImg = $('<img id="zoomed-img" src="' + imageUrl + '" alt="Zoomed Image">');
        var closeIcon = $('<i class="fa fa-times"  id="close-icon" aria-hidden="true"></i>'); // Utilisez × pour un symbole "X"
       
        var downloadIcon = $('<i class="fa fa-download" id="download-icon" aria-hidden="true"></i>'); // Icône de téléchargement (exemple avec FontAwesome)

        // Ajouter l'image zoomée, l'icône de fermeture et l'icône de téléchargement au conteneur
        zoomContainer.append(zoomedImg);
        zoomContainer.append(closeIcon);
        zoomContainer.append(downloadIcon);

        // Ajouter le conteneur au body
        $('body').append(zoomContainer);

        // Afficher le conteneur
        zoomContainer.fadeIn(300);

        // Fermer le zoom en cliquant sur l'icône de fermeture
        closeIcon.click(function () {
            closeZoomContainer(zoomContainer);
        });

        // Désactiver le clic droit sur l'image zoomée
        zoomedImg.on('contextmenu', function (e) {
            e.preventDefault();
        });

        // Télécharger l'image en cliquant sur l'icône de téléchargement
        downloadIcon.click(function () {
            // Créer un lien temporaire et déclencher le téléchargement
            var downloadLink = document.createElement('a');
            downloadLink.href = imageUrl;
            
           // downloadLink.download = 'image.jpg'; // Nom de fichier par défaut (vous pouvez ajuster selon vos besoins)
           downloadLink.download = imageFileName; // Nom de fichier personnalisé
           document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
        });
    });

    // ... (suite de votre code)

    function closeZoomContainer(container) {
        container.fadeOut(300, function () {
            container.remove();
        });
    }

}


                var leaveDuration = response.leave_duration;
                var duree2;

                if (leaveDuration === "demi-journée") {
                    duree2 = 0.5;
                } else {
                    // On suppose que leaveDuration est de la forme "x jour(s)"
                    var match = leaveDuration.match(/(\d+) jour(s)?/);

                    if (match) {
                        duree2 = parseFloat(match[1]);
                    }
                }
                $('#solde_moins').val(duree2);


                if (response.typeid === "Avec solde") {
                $('#solde').val(response.nb_jour);

                } else if (response.typeid === "Maladie") {
                    $('#solde').val(response.maladie);
                } else if (response.typeid === "Maternité") {
                    $('#solde').val(response.maternite);
                } else if (response.typeid === "Exceptionnel") {
                    $('#solde').val(response.except);
                }
                    // Calculate total
                    var soldeValue = parseFloat($('#solde').val()) || 0; // Parse the value as a float, default to 0 if not a valid number
                    var soldeMoinsValue = parseFloat($('#solde_moins').val()) || 0;

                    var totalValue = soldeValue - soldeMoinsValue;

                    // Set the value for the total input field
                    $('#retenu').val(totalValue);

             
               
				
				$('#editmodal').modal('show');
                // If Rejeté is selected, show n_coms, otherwise hide it
                // Affichage ou masquage de n_coms en fonction de la valeur de #status_n
                function generatePDF() {
        var pdf = new jsPDF();

        pdf.text('Details demande congé', 10, 10);
        // Ajoutez d'autres informations de votre modal ici

        pdf.save('demande_conge.pdf');
    }

    $(document).ready(function() {
        // Ajoutez cette ligne pour appeler la fonction generatePDF
        $('#printButton').on('click', generatePDF);
    });
             
                    if($('#status_n').val() === 'Rejeté'){
                        $('#n_coms').show();
                        $('#par').show();
                    } else  if($('#status_n').val() === 'Approuvé'){
                        $('#n_coms').hide();
                        $('#par').show();
                    } else {
                        $('#n_coms').hide();
                          $('#par').hide();
                    }

                    if($('#status_rh').val() === 'Rejeté'){
                        $('#rh_coms').show();
                    } else {
                        $('#rh_coms').hide();
                    }
			}
		});
	});


    //----------------- MISE A JOUR DEMANDE CONGE N+1 --------------------
$('#saveButton').on('click', function() {
    var idc = $('#idc').val();
    var id_conge = $('#id_conge').val();
    var status_n = $('#status_n').val(); // Récupérez le nouveau statut
    var coms_n = $('#coms_n').val(); // Récupérez le nouveau commentaire

    $.ajax({
        type: 'POST',
        url: url + 'leave/UpdateLeave', // Créez une méthode pour mettre à jour la demande de congé
        data: {
            idc: idc,
            id_conge: id_conge,
            status_n: status_n,
            coms_n: coms_n
        },
        success: function(response) {
            if (response.success) {
            $('#editmodal').modal('hide');
            }
            $('#editmodal').modal('hide');
            showTable();
        }
    });
});

  // --------------- MISE A JOUR DEMANDE CONGE RH ------------------------

$('#saveButton_rh').on('click', function() {
    var idc = $('#idc').val();
    var ids = $('#mat').val();
    var status_rh = $('#status_rh').val(); // Récupérez le nouveau statut
    var retenu;
    var id_conge = $('#id_conge').val();
        if (status_rh === 'Approuvé') {
            retenu = $('#retenu').val();
        } else {
            retenu = $('#solde').val();
        }
    var coms_rh = $('#coms_rh').val();
    var type = $('#type').val();
    
    $.ajax({
        type: 'POST',
        url: url + 'leave/UpdateLeaveRH', // Créez une méthode pour mettre à jour la demande de congé
        data: {
            idc: idc,
            ids:ids,
            id_conge: id_conge,
            status_rh: status_rh,
            coms_rh: coms_rh,
            retenu:retenu,
            type:type
        },
        success: function(response) {
            if (response.success) {
            $('#editmodal').modal('hide');
            }
            $('#editmodal').modal('hide');
            showTable();
        }
    });
});









// PARAMETRE DEMANDE DE CONGE 3 JOURS POUR HALF ET FULL
var dateInput = document.getElementById('recipient-name1');
var durationRadioHalf = document.getElementById('radio_1');
var durationRadioFull = document.getElementById('radio_2');

// Écoutez l'événement "change" lorsque la date est modifiée
dateInput.addEventListener('change', function () {
    // Obtenez la date actuelle
    var currentDate = new Date();
    
    // Obtenez la date sélectionnée dans l'élément d'entrée
    var selectedDate = new Date(dateInput.value);

    // Calculez la différence en jours entre les deux dates
    var timeDiff = selectedDate - currentDate;
    var dayDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

    // Vérifiez si la durée est 'Half' ou 'Full' et si dayDiff est inférieur à 3
    if ((durationRadioHalf.checked || durationRadioFull.checked) && dayDiff < 3) {
        alert("Vous devez envoyer la demande au moins 3 jours à l'avance.");
        dateInput.value = ''; // Vide le champ de date
    }
});





        $(document).on('click', '.rejet', function(){
            var id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'leave/getidconge',
                dataType: 'json',
                data: {id: id},
                success: function(response){
                    console.log(response);
                    $('#matri').html(response.em_id);
                   
                    $('#rejet_id').val(response.id);
                    $('#rejetmodal').modal('show');
                }
            });
            

        });

        
        $('#valid_id').click(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: url + 'leave/Valideconge',
                data: {id: id},
                success: function(){
                    $('#validemodal').modal('hide');
                    $('#reussimodal').modal('show');
                     
                    // Ajouter un délai de 3 secondes avant de fermer le modal
                    setTimeout(function(){
                        $('#reussimodal').modal('hide');
                    }, 2000);
                    showTable();
                }
            });
        });

        $('#rejet_id').click(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: url + 'leave/rejetconge',
                data: {id: id},
                success: function(){
                    $('#rejetmodal').modal('hide');
                    $('#reussimodal').modal('show');
                    
                    // Ajouter un délai de 3 secondes avant de fermer le modal
                    setTimeout(function(){
                        $('#reussimodal').modal('hide');
                    }, 2000);

                    showTable();
                }
            });
        });


        $(document).ready(function() {

            function formatDateToYMD(dateString) {
    var parts = dateString.split('/');
    if (parts.length === 3) {
        // parts[2] contient l'année, parts[1] le mois et parts[0] le jour
        var year = parts[2];
        var month = parts[1];
        var day = parts[0];
        // Vous pouvez maintenant former la date au format "Y-m-d"
        return year + '-' + month + '-' + day;
    }
    return dateString; // En cas d'erreur ou de format inattendu
}




            $(document).on('click', '.leaveapp', function(){
           
            var iid = $(this).attr('data-id');
                    $('#leaveapply1').trigger("reset");
                    $('#appmodel1').modal('show');
                    $.ajax({
                        url: 'LeaveAppbyid?id=' + iid,
                        method: 'GET',
                        data: '',
                        dataType: 'json',
                    }).done(function(response) {
                       
                        // console.log(response);
                        // Populate the form fields with the data returned from server
                        $('#leaveapply1').find('[name="id"]').val(response.leaveapplyvalue.id).end();
                        $('#leaveapply1').find('[name="emid"]').val(response.leaveapplyvalue.em_id).end();
                        $('#leaveapply1').find('[name="applydate"]').val(response.leaveapplyvalue.apply_date).end();
                        $('#leaveapply1').find('[name="typeid"]').val(response.leaveapplyvalue.typeid).end();
                       
                        $('#leaveapply1').find('[name="startdate"]').val(formatDateToYMD(response.leaveapplyvalue.start_date));
                        $('#leaveapply1').find('[name="enddate"]').val(formatDateToYMD(response.leaveapplyvalue.end_date));

                        $('#leaveapply1').find('[name="reason"]').val(response.leaveapplyvalue.reason).end();
                        $('#leaveapply1').find('[name="status"]').val(response.leaveapplyvalue.leave_status).end();

                        if(response.leaveapplyvalue.leave_type == 'Half day') {
                            $('#appmodel1').find(':radio[name=type][value="Half Day"]').prop('checked', true).end();
                            $('#hourAmount').show().end();
                            $('#enddate').hide().end();
                        } else if(response.leaveapplyvalue.leave_type == 'Full Day') {
                            $('#appmodel1').find(':radio[name=type][value="Full Day"]').prop('checked', true).end();
                            $('#hourAmount').hide().end();
                        } else if(response.leaveapplyvalue.leave_type == 'More than One day'){
                            $('#appmodel1').find(':radio[name=type][value="More than One day"]').prop('checked', true).end();
                            $('#hourAmount').hide().end();
                            $('#enddate').show().end();
                        }
                      
                        $('#hourAmountVal').val(response.leaveapplyvalue.leave_duration).show().end();

                    });
                   
                });
            });
  
    

        // Écoutez les changements de sélection du type de congé
        // // $('.fetchLeaveTotal').change(function() {
            $(".fetchLeaveTotal").on("click", function(event) {
            var em_id = $('#em_id').val();
            var leavetype = $(this).val();

            // Effectuez la demande Ajax
            $.ajax({
                type: 'POST',
                url: url + 'leave/getLeaveData',
                data: { em_id: em_id},
                success: function(data) {
                    // Mettez à jour le contenu de #total en fonction de la réponse
            var leaveData = JSON.parse(data);
            if (leavetype === 'Avec solde') {
                if (leaveData.nb_jour === null || leaveData.nb_jour === '') {
                    $('#total').text('Vous n\'avez pas de solde');
                } else {
                    $('#total').text('Solde congé: ' + leaveData.nb_jour + ' Jour');
                }
            } else if (leavetype === 'Maladie') {
                if (leaveData.maladie === null || leaveData.maladie === '') {
                    $('#total').text('Vous n\'avez pas de solde');
                } else {
                    $('#total').text('Solde congé: ' + leaveData.maladie + ' Jour');
                }
            } else if (leavetype === 'Maternité') {
                if (leaveData.maternite === null || leaveData.maternite === '') {
                    $('#total').text('Vous n\'avez pas de solde');
                } else {
                    $('#total').text('Solde congé: ' + leaveData.maternite + ' Mois');
                }
            } else if (leavetype === 'Exceptionnel') {
                if (leaveData.except === null || leaveData.except === '') {
                    $('#total').text('Vous n\'avez pas de solde');
                } else {
                    $('#total').text('Solde congé: ' + leaveData.except + ' jours');
                }
            } else {
                $('#total').text('');
            }
                }
            });
        });

        });

        

    })(jQuery); // Vous devez envelopper votre code dans une fonction et la passer à jQuery
</script>













        <script>
        /*DATETIME PICKER*/
          $("#bbbSubmit").on("click", function(event){
              event.preventDefault();
              var typeid = $('.typeid').val();
              var datetime = $('.mydatetimepicker').val();
              var emid = $('.emid').val();
              //console.log(datetime);
              $.ajax({
                  url: "GetemployeeGmLeave?year="+datetime+"&typeid="+typeid+"&emid="+emid,
                  type:"GET",
                  dataType:'',
                  data:'data',          
                  success: function(response) {
                      // console.log(response);
                      $('.leaveval').html(response);             
                  },
                  error: function(response) {
                    // console.log(response);
                  }
              });
          });			
        </script>  


        <script type="text/javascript">
        /*PARSE DURATION DATA*/
        $('.duration').on('input',function() {
            var day = parseInt($('.duration').val());
            var hour = 8;
            $('.totalhour').val((day * hour ? day * hour : 0).toFixed(2));
        });
        </script>
<script>
  $(".Status").on("click", function(event){
      event.preventDefault();
      // console.log($(this).attr('data-value'));
      $.ajax({
          url: "approveLeaveStatus",
          type:"POST",
          data:
          {
              'employeeId': $(this).attr('data-employeeId'),
              'lid': $(this).attr('data-id'),
              'lvalue': $(this).attr('data-value'),
              'duration': $(this).attr('data-duration'),
              'type': $(this).attr('data-type')
          },
          success: function(response) {
            // console.log(response);
            $(".message").fadeIn('fast').delay(30000).fadeOut('fast').html(response);
            window.setTimeout(function(){location.reload()}, 30000);
          },
          error: function(response) {
            //console.error();
          }
      });
  });           
</script>

<!-- RECUPERER LA VALEUR OPTION SELECT ID ET NOM PRENOMS-->

<script>
    // Récupérer les éléments select
    const emIdSelect = document.getElementById('em_id');
    const employeeNameSelect = document.getElementById('employee_name');

    // Ajouter un gestionnaire d'événements de changement à emIdSelect
    emIdSelect.addEventListener('change', function () {
        // Obtenir la valeur sélectionnée dans emIdSelect
        const selectedEmId = emIdSelect.value;

        // Trouver l'option correspondante dans employeeNameSelect
        const employeeNameOption = employeeNameSelect.querySelector(`option[value="${selectedEmId}`);

        // Sélectionner l'option dans employeeNameSelect
        employeeNameOption.selected = true;
    });

    // Ajouter un gestionnaire d'événements de changement à employeeNameSelect
    employeeNameSelect.addEventListener('change', function () {
        // Obtenir la valeur sélectionnée dans employeeNameSelect
        const selectedEmployeeName = employeeNameSelect.value;

        // Trouver l'option correspondante dans emIdSelect
        const emIdOption = emIdSelect.querySelector(`option[value="${selectedEmployeeName}"]`);

        // Sélectionner l'option dans emIdSelect
        emIdOption.selected = true;
    });
</script>






<script type="text/javascript">

            
        </script>                     
<?php $this->load->view('backend/footer'); ?>