<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>


<?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
    <div class="page-wrapper">
           

             <div class="container-fluid">
                <div class="row m-b-10"> 
                    <div class="col-12">
                    <div class="denied">
                        <img src="https://www.perthnow.com.au/stories/sent-packing-no-vax-djokovic-has-aussie-visa-cancelled/assets/11.gif" alt="">
                    </div>    
                </div>
                </div>
            </div>
             
    </div> 
    





   
<?php } else { ?>

         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-users" aria-hidden="true"></i> Personnels</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accueil</a></li>
                        <li class="breadcrumb-item active">Personnel</li>
                    </ol>
                </div>
            </div>

            <?php $degvalue = $this->employee_model->getdesignation(); ?>
            <?php $depvalue = $this->employee_model->getdepartment(); ?>





            <div class="message"></div>
            <div class="container-fluid">
                <div class="row m-b-10"> 
                    <div class="col-12">
                        <!-- Bouton pour ouvrir le modal -->
                    <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#addEmployeeModal" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Ajouter un Employer </a></button>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#importModal"><i class="fa fa-file-excel-o" aria-hidden="true"></i> Importer Excel</button>
                    <p>Téléchargez les modèles de fichier excel à importer 
    <a href="javascript:void(0);" onclick="downloadCSVFiles()">ici</a>.
</p>
<script>
    function downloadCSVFiles() {
        // Créez des éléments d'ancrage pour déclencher le téléchargement des deux fichiers
        var link1 = document.createElement('a');
        link1.href = '<?php echo base_url('uploads/modely/Modele_base_à_importer.xlsx'); ?>';
        link1.download = 'Modele_base_à_importer.xlsx';
        link1.click();  // Télécharger le premier fichier

    }
</script>
                   
                    <!--
                    <button type="button" class="btn btn-primary"><i class="fa fa-bars"></i><a href="<?php echo base_url(); ?>employee/Disciplinary" class="text-white"><i class="" aria-hidden="true"></i>  Disciplinary List</a></button>
                    -->    
                </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste des personnels</h4>
                            </div>
                            <div class="card-body">
                                
                            <a href="<?php echo base_url('employee/export_excel'); ?>" class="btn btn-success "><i class="fa fa-file-excel-o" aria-hidden="true"></i> Exporter en Excel</a>

<!-- Tableau des employés (à placer à l'endroit approprié dans votre application) -->
<div class="table-responsive">
    <table id="employees123" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th><i class="fa fa-cogs" aria-hidden="true"></i></th>
                <th>Photo</th>
                <th>N°</th>
                <th>Nom</th>
                <th>Poste</th>
                <th>Téléphone</th>
                <th>Contrat</th>
                <th>Date d'embauche</th>
                <th>Ancienneté</th>
                <th><i class="fa fa-cogs" aria-hidden="true"></i></th>
            </tr>
        </thead>
        <tbody>
            <!-- Les données seront chargées dynamiquement -->
        </tbody>
    </table>
</div>


                            </div>
                        </div>
                    </div>
                </div>



<!-- Modal -->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="importModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importModalLabel">Importer fichier Excel</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="importExcelForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="excel_file">Sélectionner fichier Excel</label>
                        <input type="file" class="form-control" id="excel_file" name="excel_file" accept=".xls,.xlsx">
                    </div>
                    <button type="button" class="btn btn-primary" id="submitBtn">Importer</button>
                    
                    <div id="progressBar" class="progress mt-3" style="display: none;">
                        <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div id="message" class="mt-3"></div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>










<!-- Modal d'ajout d'employé -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Ajouter un employé</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

        <div class="modal-body">
            <!-- Onglets Bootstrap (Visibles mais désactivés) -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active disabled-tab" data-toggle="tab" href="#info1">Infos 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled-tab" data-toggle="tab" href="#info2">Infos 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled-tab" data-toggle="tab" href="#info3">Infos 3</a>
                </li>
            </ul>
            <form id="employeeForm" enctype="multipart/form-data">
         
                <div class="tab-content">
                    <!-- Page 1 -->
                    <div class="tab-pane fade show active" id="info1">
                        <div class="row">
                            <div class="form-group col-md-2 m-t-20">
                                <label>Matricule </label>
                                <input type="text" name="eid" class="form-control form-control-line" placeholder="Ex: T00101" required> 
                            </div>
                            <div class="form-group col-md-4 m-t-20">
                                <label>Nom</label>
                                <input type="text" name="fname" class="form-control form-control-line" placeholder="Nom" minlength="2" required > 
                            </div>
                            <div class="form-group col-md-6 m-t-20">
                                <label>Prénoms </label>
                                <input type="text" id="" name="lname" class="form-control form-control-line" value="" placeholder="Prénoms" minlength="2" required> 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Genre </label>
                                <select name="gender" class="form-control custom-select" required>
                                    <option>Select genre</option>
                                    <option value="Homme">Homme</option>
                                    <option value="Femme">Femme</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3 m-t-20">
                                <label>Nationalité</label>
                                <input type="text" name="nation" class="form-control" value="" placeholder="Nationalite" minlength=""> 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Situation </label>
                                <select name="situation" class="form-control custom-select">
                                    <option></option>
                                    <option value="Célibataire">Célibataire</option>
                                    <option value="Marié(e)">Marié(e)</option>
                                    <option value="Divorcé(e)">Divorcé(e)</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3 m-t-20">
                                <label>Téléphone</label>
                                <input type="text" name="em_phone" class="form-control" value="" placeholder="phone" minlength=""> 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Email</label>
                                <input type="text" name="em_email" class="form-control" value="" placeholder="mail@mail.com" minlength=""> 
                            </div>

                            <div class="form-group col-md-3 m-t-20">
                                <label>Date de Naissance</label>
                                <input type="text" id="dt_naiss" name="dob" class="form-control" placeholder="jj/mm/aaaa" > 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Lieu de Naissance </label>
                                <input type="text" id="example-email2" name="lieuu" class="form-control" placeholder="Lieu de naissance"  > 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>CIN</label>
                                <input type="text" name="nid" class="form-control" value="" placeholder="(Max. 12)" minlength="12">
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Lieu de delivrance CIN </label>
                                <input type="text" id="example-email2" name="nid_lieu" class="form-control" placeholder="Lieu de delivrance"  > 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Date de delivrance</label>
                                <input type="text" id="dt_delivr" name="nid_date" class="form-control" placeholder="jj/mm/aaaa" > 
                            </div>
                            
                            <div class="form-group col-md-3 m-t-20">
                                <label>Adresse</label>
                                <input type="text" name="adresse" class="form-control" value="" placeholder="Adresse" minlength=""> 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                        <label>Image </label>
                                        <input type="file" name="image_url" class="form-control" value=""> 
                            </div>
                        </div>
                    </div>

                    <!-- Page 2 -->
                    <div class="tab-pane fade" id="info2">
                        <div class="row">
                            <div class="form-group col-md-4 m-t-20">
                                <label>Departement</label>
                                <select name="dept" value="" class="form-control custom-select" required>
                                    <option>Selectionner Departement</option>
                                    <?Php foreach($depvalue as $value): ?>
                                    <option value="<?php echo $value->dep_name ?>"><?php echo $value->dep_name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4 m-t-20">
                                <label>Poste </label>
                                <select name="deg" class="form-control custom-select" required>
                                    <option>Select Poste</option>
                                        <?Php foreach($degvalue as $value): ?>
                                    <option value="<?php echo $value->des_name ?>"><?php echo $value->des_name ?></option>
                                        <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Type de contrat </label>
                                <select name="contrat" class="form-control custom-select">
                                    <option>Select type de contrat Group</option>
                                    <option value="CDI">CDI</option>
                                    <option value="CDD">CDD</option>
                                    <option value="Pigiste">Pigiste</option>
                                </select>
                            </div>
            
                            <div class="form-group col-md-3 m-t-20">
                                <label>Début de contrat</label>
                                <input type="text" id="joindatea" name="joindate" class="form-control" placeholder="jj/mm/aaaa" > 
                            </div>
                            <div class="form-group col-md-3 m-t-20">
                                <label>Fin de contrat</label>
                                <input type="text" id="leavedatea" name="leavedate" class="form-control" placeholder="jj/mm/aaaa" > 
                            </div>
            
                            <div class="form-group col-md-3 m-t-20">
                                <label>Categorie </label>
                                <input type="text" name="cat" class="form-control" value="" placeholder="Categorie" > 
                            </div> 
                            <div class="form-group col-md-3 m-t-20">
                                <label>Groupe </label>
                                <input type="text" name="gp" class="form-control" value="" placeholder="Groupe" > 
                            </div> 
                            <div class="form-group col-md-3 m-t-20">
                                <label>N° CNAPS </label>
                                <input type="text" name="cnaps" class="form-control" value="" placeholder="cnaps" > 
                            </div>
                            <div class="form-group col-md-2 m-t-20">
                                <label>Handycap </label>
                                <select name="handycap" class="form-control custom-select" >
                                    <option></option>
                                    <option value="Apte">Apte</option>
                                    <option value="Inapte">Inapte</option>
                                </select>
                            </div>
            
                            <div class="form-group col-md-2 m-t-20">
                                <label>Rôle </label>
                                <select name="role" class="form-control custom-select" required>
                                    <option>Select Role</option>
                                    <option value="ADMIN">ADMIN</option>
                                    <option value="N+1">N+1</option>
                                    <option value="EMPLOYEE">EMPLOYEE</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Page 3 -->
                    <div class="tab-pane fade" id="info3">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="contact_name">Nom et prenoms</label>
                                <input type="text" class="form-control" id="contact_name" name="contact_name" >
                            </div>
                            <div class="col-md-6">
                                <label for="contact_phone">Télephone</label>
                                <input type="text" class="form-control" id="contact_phone" name="contact_phone" >
                            </div>
                            <div class="col-md-6">
                                <label for="contact_address">Adresse</label>
                                <input type="text" class="form-control" id="contact_address" name="contact_address" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="pere">Nom du Père</label>
                                <input type="text" class="form-control" id="pere" name="pere" >
                            </div>
                            <div class="col-md-6">
                                <label for="mere">Nom du Mère</label>
                                <input type="text" class="form-control" id="mere" name="mere" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="conjoint">Nom & prénom(s) conjoint (e)</label>
                                <input type="text" class="form-control" id="conjoint" name="conjoint" >
                            </div>
                            <div class="col-md-6">
                                <label for="nb_enfant">Nombre d'enfant</label>
                                <input type="text" class="form-control" id="nb_enfant" name="nb_enfant" >
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Boutons de navigation -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary prev-tab d-none">Précédent</button>
                    <button type="button" class="btn btn-primary next-tab">Suivant</button>
                    <button type="button" id="mybt" class="btn btn-success d-none btok">Enregistrer</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>


<div class="modal fade" id="modalEmployee" tabindex="-1" role="dialog" aria-labelledby="modalEmployeeLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEmployeeLabel">Détails de l'employé</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>



<script>
     // Initialisation des datepickers
     $('#dt_naiss, #dt_delivr, #joindatea,#leavedatea').datepicker({
                dateFormat: 'dd/mm/yy', // Format de la date
                changeMonth: true,
                changeYear: true,
            });
</script>






<!-- Script JavaScript -->
<script>
$(document).ready(function () {
    var url = '<?php echo base_url(); ?>';
    var table;
    var currentTab = 0;
    var tabCount = $('.tab-pane').length;



// Réinitialiser le formulaire quand le modal se ferme
$('#submitBtn').on('click', function(e) {
        e.preventDefault();
        
        let fileInput = $('#excel_file')[0];
        
        if (!fileInput.files[0]) {
            Swal.fire({
                title: 'Attention!',
                text: 'Veuillez sélectionner un fichier Excel.',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
            return;
        }

        Swal.fire({
            title: 'Importation en cours...',
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });

        let formData = new FormData(document.getElementById('importExcelForm'));

        $.ajax({
            type: 'POST',
            url: url + 'employee/importExcel',
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);
                if (response.status === 'success') {
                    Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: 'Succès!',
                        text: response.message, // Affiche uniquement "X employés importés avec succès"
                        showConfirmButton: false,
                        timer: 3500
                    }).then((result) => {
                        $('#importModal').modal('hide');
                        $('#importExcelForm')[0].reset();
                        showTable();
                    });
                } else {
                    Swal.fire({
                        title: 'Erreur!',
                        text: response.message,
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error('Erreur AJAX:', xhr.responseText);
                Swal.fire({
                    title: 'Erreur!',
                    text: 'Une erreur s\'est produite lors de l\'importation.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });


   // Fonction pour afficher les détails de l'employé dans un modal
   function afficherModalEmployee(employeeId) {
        $.ajax({
            type: 'GET',
            url: url + 'employee/view?I=' + btoa(employeeId),
            success: function (response) {
                $('#modalEmployee .modal-body').html(response);
                $('#modalEmployee').modal('show');
            },
            error: function (xhr, status, error) {
                console.error('Erreur lors de la récupération des données de l\'employé:', error);
                Swal.fire({
                    title: 'Erreur!',
                    text: 'Impossible de récupérer les données de l\'employé.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    }
    
    
    // Fonction pour charger et afficher le tableau des employés
    function showTable() {
        $.ajax({
            type: 'POST',
            url: url + 'employee/GetEmployee',
            dataType: 'json',
            success: function (response) {
                if ($.fn.DataTable.isDataTable('#employees123')) {
                    table.clear().rows.add(response.data).draw();
                } else {
                    table = $('#employees123').DataTable({
                        data: response.data,
                        columns: [
                            {
                                data: 'em_id',
                                render: function (data) {
                                    return '<a href="#" title="Voir les détails" class="btn btn-sm btn-success waves-effect waves-light voir-details" data-id="' + data + '"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
                                }
                            },
                            {
                                data: 'image',
                                render: function (data) {
                                    return '<img src="' + data + '" alt="Avatar" style="width: 50px; height: 50px; border-radius: 50%;">';
                                }
                            },
                            { data: 'em_id' },
                            { data: 'name' },
                            { data: 'des_id' },
                            { data: 'phone' },
                            { data: 'contrat' },
                            { data: 'joining_date' },
                            { data: 'anciennete' },
                            {
                                data: 'em_id',
                                render: function (data) {
                                    return '<a href="#" title="Voir les détails" class="btn btn-sm btn-success waves-effect waves-light voir-details" data-id="' + data + '"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>';
                                }
                            }
                            
                        ],
                        paging: true,
                        searching: true,
                        ordering: true,
                        info: true,
                        aaSorting: [[1, 'asc']],
                        dom: 'frtip'
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error('Erreur lors du chargement des employés:', error);
                Swal.fire({
                    title: 'Erreur!',
                    text: 'Impossible de charger la liste des employés.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    }

    // Événement de clic sur le bouton "Voir les détails"
    $(document).on('click', '.voir-details', function (e) {
        e.preventDefault();
        let employeeId = $(this).data('id');
        afficherModalEmployee(employeeId);
    });

    // Charger le tableau au démarrage
    showTable();





    
    // Fonction pour réinitialiser complètement le formulaire
    function resetForm() {
        $('#employeeForm')[0].reset(); // Réinitialiser le formulaire
        $('.is-invalid').removeClass('is-invalid'); // Supprimer les validations visuelles
        currentTab = 0; // Revenir au premier onglet
        showTab(currentTab); // Afficher le premier onglet
    }

    // Initialiser la navigation par onglets
    function setupTabs() {
        showTab(currentTab);

        $('.next-tab').click(function() {
            if (validateForm()) {
                currentTab++;
                showTab(currentTab);
            }
        });

        $('.prev-tab').click(function() {
            currentTab--;
            showTab(currentTab);
        });
    }

    function showTab(n) {
        $('.tab-pane').removeClass('show active');
        $('.tab-pane').eq(n).addClass('show active');

        if (n == 0) {
            $('.prev-tab').addClass('d-none');
        } else {
            $('.prev-tab').removeClass('d-none');
        }

        if (n == (tabCount - 1)) {
            $('.next-tab').addClass('d-none');
            $('.btok').removeClass('d-none');
        } else {
            $('.next-tab').removeClass('d-none');
            $('.btok').addClass('d-none');
        }

        $('.nav-link').removeClass('active');
        $('.nav-link').eq(n).addClass('active');
    }

    function validateForm() {
        var valid = true;
        var inputs = $('.tab-pane').eq(currentTab).find('input[required], select[required]');

        inputs.each(function() {
            if ($(this).val() === '') {
                $(this).addClass('is-invalid');
                valid = false;
            } else {
                $(this).removeClass('is-invalid');
            }
        });

        return valid;
    }

    setupTabs();

    $('#mybt').click(function(e) {
        e.preventDefault();

        if (validateForm()) {
            Swal.fire({
                title: 'Enregistrement en cours...',
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading();
                }
            });

           
            var formData = new FormData(document.getElementById('employeeForm'));
        $.ajax({
            type: 'POST',
            url: url + 'employee/Aadd_employee',
            data: formData,
            dataType: 'json',
            // Ajoutez ces deux lignes importantes:
            contentType: false,
            processData: false,
            success: function(response) {
                    console.log(response);
                    if (response.status === 'success') {

                        Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: 'Succès!',
                        text: response.message,
                        showConfirmButton: false,
                        timer: 3500
                        }).then((result) => {
                            $('#addEmployeeModal').modal('hide'); // Fermer la modal
                            resetForm(); // Réinitialiser le formulaire
                            showTable(); // Rafraîchir le tableau
                        });
                    } else {
                        Swal.fire({
                            title: 'Erreur!',
                            text: response.message,
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Erreur AJAX:', xhr.responseText);
                    Swal.fire({
                        title: 'Erreur!',
                        text: 'Une erreur s\'est produite.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            });
        } else {
            Swal.fire({
                title: 'Attention!',
                text: 'Veuillez remplir tous les champs obligatoires.',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        }
    });

});

</script>



  <div class="modal fade" id="employemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content ">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel1">Importer un fichier CSV</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    
                                    <form action="<?=base_url('Pointage/importp')?>" enctype="multipart/form-data" method="post">
                                    <div class="modal-body">
                                            
                                    
                                        <input type="file" name="upload_excel" required />
                                        <?php if($this->session->flashdata('success'))  { ?>
                                            <p><?=$this->session->flashdata('success')?></p>
                                        <?php  } ?>
                                        <?php if($this->session->flashdata('error'))  { ?>
                                            <p><?=$this->session->flashdata('error')?></p>
                                        <?php  } ?>
                                  
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
                                        <button type="submit" class="btn btn-success">Importer</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
   
                        <!-- /.modal --> 



<?php } ?>

<?php $this->load->view('backend/footer'); ?>





