<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
         <div class="page-wrapper">
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-university" aria-hidden="true"></i>Employee Inactif</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Actif</a></li>
                        <li class="breadcrumb-item active">Employee</li>
                    </ol>
                </div>
            </div>


            <div class="message"></div>
            <div class="container-fluid">
                <div class="row m-b-10"> 
                    <div class="col-12">
                    <button type="button"  data-toggle="modal" data-target="#myModal"  class="btn btn-primary"> <i class="fa fa-check"></i> Ajouter</button>

                 
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste d'employée inactif</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive ">
                                <table id="employees123" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">      <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Nom et prénoms</th>
                                                <th>Poste</th>
                                                <th>Type</th>
                                                <th>Date de départ</th>
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




  <!-- The Modal -->
 <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel1">Ajouter Départ</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="card-body">
                    <form method="post" action="<?php echo base_url('controller/method'); ?>" enctype="multipart/form-data">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form_emp">
                                        <!-- Matricule -->
                                        <div class="form-group">
                                            <label>Matricule</label>
                                            <select class="form-control custom-select selectedEmployeeID" name="emid" id="em_id" required>
                                                <!-- Dynamically loaded options -->
                                            </select>
                                        </div>

                                        <!-- Nom-prenoms -->
                                        <div class="form-group">
                                            <label>Nom-prenoms</label>
                                            <select class="form-control custom-select selectedEmployeeName" name="names" id="employee_name" required>
                                                <!-- Dynamically loaded options -->
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <label>Type de départ</label>
                                    <select class="form-control custom-select"  tabindex="1" name="type" id="type" required>
                                        <option value="">Selectionner un type de départ</option>
                                        <option value="Démission">Démission</option>
                                        <option value="Renvoyé">Renvoyé</option>
                                        <option value="Standby">Standby</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                        <label class="control-label" >Date de départ</label>
                                        <input type="date" name="date" class="form-control" id="date" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" id="btn_enregistrer" class="btn btn-success">
                                <i class="fa fa-check"></i> Enregistrer
                            </button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<?php $this->load->view('backend/footer'); ?>
<script>
$(document).ready(function() {
    var url = '<?php echo base_url(); ?>';


            // Fonction pour initialiser la DataTable
    function initializeDataTable() {
                return $('#employees123').DataTable({
                    "paging": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "aaSorting": [[1, 'asc']],
                    dom: 'Bfrtip',
                    buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
                });
    }

    var table = initializeDataTable();


    function showTable() {
    $.ajax({
        type: 'POST',
        url: url + 'employee/GetInactif',
        success: function(response) {
            // Si la DataTable existe, détruisez-la d'abord
            if ($.fn.DataTable.isDataTable('#employees123')) {
                table.destroy();
            }

            // Insérez le nouveau HTML pour le tbody
            $('#employees123 tbody').html(response);

            // Réinitialisez la DataTable
            table = initializeDataTable();
        }
    });
}

            // Appelez showTable au chargement de la page
            showTable();


    // Gestionnaire d'événements pour ouvrir le modal et charger les données
    $('#myModal').on('shown.bs.modal', function () {
        charge_sup(); // Charger la liste des employés chaque fois que le modal est affiché
    });

    // Fonction pour charger la liste des supérieurs hiérarchiques (employés)
    function charge_sup() {
        $.ajax({
            type: "GET",
            url: url + 'organization/get_all_employees', // Changez cette URL si nécessaire
            dataType: "json",
            success: function(data) {
                var employees = data.employees;

                // Vider les listes déroulantes avant de les recharger
                $('#em_id').empty();
                $('#employee_name').empty();

                // Ajouter les nouvelles options
                $.each(employees, function(key, value) {
                    $('#em_id').append('<option value="' + value.em_id + '">' + value.em_id + '</option>');
                    $('#employee_name').append('<option value="' + value.em_id + '">' + value.first_name + ' ' + value.last_name + '</option>');
                });
            },
            error: function(xhr, status, error) {
                console.error('Erreur de chargement des employés:', error);
            }
        });
    }

// Fonction pour synchroniser les sélections entre deux paires de listes déroulantes
function synchronizeSelection(sourceSelect, targetSelect) {
        sourceSelect.addEventListener('change', function () {
            const selectedValue = sourceSelect.value;
            const targetOption = targetSelect.querySelector(`option[value="${selectedValue}"]`);
            if (targetOption) {
                targetOption.selected = true;
            }
        });
    }

    // Récupérer les éléments select
    const emIdSelect1 = document.getElementById('em_id');
    const employeeNameSelect1 = document.getElementById('employee_name');
   

    // Appliquer la synchronisation pour la première paire de listes déroulantes
    synchronizeSelection(emIdSelect1, employeeNameSelect1);
    synchronizeSelection(employeeNameSelect1, emIdSelect1);

    $('#btn_enregistrer').on('click', function(e) {
    e.preventDefault();

    // Récupérer les données du formulaire
    var formData = {
        emid: $('#em_id').val(),
        type: $('#type').val(),
        date: $('#date').val()
    };

    console.log(formData);  // Ajouter cette ligne pour vérifier les données dans la console

    // Vérifier que tous les champs sont remplis
    if (formData.emid && formData.type && formData.date) {
        $.ajax({
            type: 'POST',
            url: url + 'employee/addInactif',
          
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log(response);  // Vérifier la réponse dans la console
                if (response.status == 'success') {
                    alert(response.message);
                    $('#myModal').modal('hide');
                    showTable();
                } else {
                    alert(response.message);
                }
            },
            error: function() {
                alert('Erreur lors de l\'envoi des données.');
            }
        });
    } else {
        alert('Veuillez remplir tous les champs.');
    }
});



});
</script>