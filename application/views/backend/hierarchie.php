<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?> 
         <div class="page-wrapper">
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-map-o" style="color:#1976d2"></i> Hiérarchie</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accuiel</a></li>
                        <li class="breadcrumb-item active">Superieur hiérarchique</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
            <div class="container-fluid">         
    <div class="row">
        <div class="col-lg-5">
                                 

                <div class="card card-outline-info">
                    <div class="card-header">
                        <h4 class="m-b-0 text-white">Ajouter Superieur hiérarchique</h4>
                    </div>
                    
                   

                    <div class="card-body">
                            <form method="post" action="" enctype="multipart/form-data">
                                <div class="form-body">
                                    <div class="row ">
                                        <div class="col-md-12">
                            <div class="form_emp">              
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

                            
                            </div>   
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                </div>

                                
                                <div class="form-actions">
                                <button type="button" id="btn_enregistrer" class="btn btn-success"> <i class="fa fa-check"></i> Enregistrer</button>
                                </div>
                            </form>
                    </div>
                </div>

                <div class="card card-outline-info">
                    <div class="card-header">
                        <h4 class="m-b-0 text-white">Liste Superieur hiérarchique</h4>
                    </div>
                    
                    <div class="card-body">

                            <table id="hierarch" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>N° </th>
                                        <th>Noms et prenoms </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                            
                                <tbody>
                                                
                                </tbody>
                            </table>
                    </div>
                
                </div>



            
        </div>



<!-----------------------Liste des employees par superieur hiérarchique---------------------->



        <div class="col-7">
            <div class="card card-outline-info">
                <div class="card-header">
                    <h4 class="m-b-0 text-white">Liste des employees par superieur hiérarchique</h4>
                </div>
                
                <div class="card-body">
                            <form method="post" action="" enctype="multipart/form-data">
                                <div class="form-body">
                                    <div class="row ">
                                        <div class="col-md-12">

                                        <div>
                                            <p>Veillez selectionner un superieur hiérarchique</p>
                                        </div>
                                        <div class="form_emp">              
                                            <div class="form-group">
                                                <label>Matricule</label>
                                                <select class="form-control custom-select selectedEmployeeIDD " tabindex="1" name="emidd" id="em_ide"  required>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label>Nom-prenoms</label>
                                                <select class="form-control custom-select selectedEmployeeNamee" tabindex="1" name="namess" id="employee_namee" required>
                                                </select>
                                            </div>
                                        </div> 
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <br>
                                </div>

                            </form>
                    </div>
            </div>
            <div class="card card-outline-info">
                    <div class="card-header">
                        <h4 class="m-b-0 text-white" id="name_sup"></h4>
                    </div>
                    
                    <div class="card-body">

<div>
        <div class="form-group">
            <button type="button" id="btn_add"  class="btn btn-primary"> <i class="fa fa-check"></i> Ajouter</button>
        </div>
</div>

                            <table id="employee2_table" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>N°g </th>
                                        <th>Noms et prenoms </th>
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






  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog dialog1 modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
        
          <h3 class="modal-title" id="titremodal"></h3>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div class="modal-body">
        <table id="personnelTable" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                     
                            <thead>
                                <tr>
                                    <th>Matricule</th>
                                    <th>Nom</th>
                                    <th>Poste</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Les données seront ajoutées ici par jQuery -->
                            </tbody>
        </table>

</table>




                    </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>







    <?php $this->load->view('backend/footer'); ?>
   

  



<script>
    
    $(document).ready(function() {
        var url = '<?php echo base_url(); ?>';
        
        // Lorsque le bouton d'enregistrement est cliqué
        $('#btn_enregistrer').click(function(e) {
            e.preventDefault();
            // Récupérer les données du formulaire
            var em_id = $('#em_id').val();
            
            // Effectuer la requête AJAX
            $.ajax({
                type: 'POST',
              
                url: url + 'Organization/add_hierarchie',
              
                data: { emid: em_id },
                dataType: 'json',
                success: function(response) {
                    // Afficher le message de succès ou d'échec
                    if (response.success) {
                        //alert(response.message);
                        // Réinitialiser le formulaire ou effectuer d'autres actions
                        showTable();
                        charge_sup();
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('Erreur lors de la requête AJAX.');
                }
            });
            
        });

        function showTable() {
            $.ajax({
                type: 'POST',
                url: url + 'organization/get_hierarchie_data',
                success: function(response) {
                    $('#hierarch tbody').html(response);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        // Function to handle delete button click
        $('#hierarch').on('click', '.delete', function() {
            var em_id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'organization/delete_hierarchie',
                data: { em_id: em_id },
                success: function(response) {
                    // Refresh the table after successful deletion
                    showTable();
                    charge_sup();
                    console.log(response);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });

        showTable();

 // fonction pour chharger la liste derouante de superieur hierarchique
        function charge_sup() {
        $.ajax({
            type: "GET",
            url: url + 'organization/get_hierarchie_json',
            dataType: "json",
            success: function(data) {
                var employees = data.employees;
                 // Vider les listes déroulantes avant de les recharger
                 $('#em_ide').empty();
                $('#employee_namee').empty();

                $.each(employees, function(key, value) {
                    $('#em_ide').append('<option value="' + value.em_id + '">' + value.em_id + '</option>');
                    $('#employee_namee').append('<option value="' + value.em_id + '">' + value.first_name + ' ' + value.last_name + '</option>');
                });
            }
        });
    }

// Fonction pour charger les données dans le tableau personnelTable
function loadPersonnelTable() {
        $.ajax({
            url: url + 'employee/getListeH',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                let tableBody = $('#personnelTable tbody');
                tableBody.empty(); // Vider le contenu existant du tableau

                // Ajouter chaque ligne de personnel au tableau
                data.forEach(function(personnel) {
                    tableBody.append(`
                        <tr data-em-id="${personnel.em_id}">
                            <td>${personnel.em_id}</td>
                            <td>${personnel.first_name} ${personnel.last_name}</td>
                            <td>${personnel.des_id}</td>
                            <td>
                                <button class="btn btn-success btn-sm edit-btnn"><i class="fa fa-check-square-o" aria-hidden="true"></i></button>
                            </td>
                        </tr>
                    `);
                });

                // Ajouter le gestionnaire d'événements pour les boutons "Edit" après le chargement
                $('.edit-btnn').on('click', function() {
                    var emId = $(this).closest('tr').data('em-id'); // Récupérer l'ID de l'employé

                    // Envoyer une requête AJAX pour effectuer l'édition
                    $.ajax({
                        url: url + 'organization/updateIdNp',
                        method: 'POST',
                        data: {
                            em_id: emId,
                            id_np: $('#em_ide').val()
                        },
                        success: function(response) {
                            // Si la mise à jour est réussie, recharger la table personnelTable
                   
                            loadPersonnelTable();
                           loadData();
                        },
                        error: function(xhr, status, error) {
                            console.error('Erreur:', error);
                        }
                    });
                });
                
            },
            error: function(xhr, status, error) {
                console.error('Erreur:', error);
            }
        });
    }

    // Charger la table personnelTable au chargement de la page
    loadPersonnelTable();


    function updateHeaderModal() {
        var selectedEmployeeName = $('#employee_namee option:selected').text();
        $('#titremodal').text('Selectionner equipe pour ' + selectedEmployeeName);
         
    }

    // Gestionnaire d'événements pour le clic sur le bouton "Ajouter" (#btn_add)
    $('#btn_add').on('click', function() {
        // Appeler simplement loadPersonnelTable() pour recharger les données après l'ajout
        loadPersonnelTable();
        updateHeaderModal();
        $('#myModal').modal('show'); // Afficher le modal après l'ajout
       
    });




    charge_sup();





        // Chargement des données lors de la sélection d'un employé 1
    $('#em_ide').change(function() {
        loadData();
      
    });

    // Fonction pour charger les données
    function loadData() {
        var selectedId = $('#em_ide').val();

        $.ajax({
            type: "GET",
            url: url + 'organization/get_employee2_list',
            dataType: "json",
            data: { em_id: selectedId },
            success: function(data) {
                var employees2 = data.employees2;
                displayEmployee2List(employees2);
            }
        });
    }

    // Fonction pour afficher les employés 2 dans le tableau
    function displayEmployee2List(employees2) {
        $('#employee2_table tbody').empty(); // Vider le tableau

        $.each(employees2, function(key, value) {
            var editButton = '<button class="btn btn-danger btn-sm edit-btn"><i class="fa fa-trash-o"></i></button>';
            var rowData = '<tr><td>' + value.em_id + '</td><td>' + value.first_name + ' ' + value.last_name + '</td><td>' + editButton + '</td></tr>';
            $('#employee2_table tbody').append(rowData);
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
    const emIdSelect2 = document.getElementById('em_ide');
    const employeeNameSelect2 = document.getElementById('employee_namee');

    // Appliquer la synchronisation pour la première paire de listes déroulantes
    synchronizeSelection(emIdSelect1, employeeNameSelect1);
    synchronizeSelection(employeeNameSelect1, emIdSelect1);

    // Appliquer la synchronisation pour la deuxième paire de listes déroulantes
    synchronizeSelection(emIdSelect2, employeeNameSelect2);
    synchronizeSelection(employeeNameSelect2, emIdSelect2);

    // Fonction pour mettre à jour le texte dans la balise <h4>
    function updateHeaderText() {
        var selectedEmployeeName = $('#employee_namee option:selected').text();
        $('#name_sup').text('Liste Equipe pour ' + selectedEmployeeName);
        $('#titre modal').text('Selectionner equipe pour ' + selectedEmployeeName);
         
    }

    // Charger les données et mettre à jour le texte lors du clic sur la liste déroulante employee_namee
    $('#employee_namee').click(function() {
        loadData();
        updateHeaderText();
    });


// Gérer le clic sur le bouton "Edit"
$(document).on('click', '.edit-btn', function() {
    var row = $(this).closest('tr');
    var emId = row.find('td:eq(0)').text(); // Récupérer l'ID de l'employé

    // Envoyer une requête AJAX pour mettre à jour id_np
    $.ajax({
        type: "POST",
        url: url + 'organization/update_id_np',
       
        dataType: 'json',
        data: { em_id: emId }, // Envoyez l'ID de l'employé à mettre à jour
        success: function(response) {
            // Si la mise à jour est réussie, rafraîchissez les données ou effectuez toute autre action nécessaire
            // Par exemple, vous pouvez recharger les données dans le tableau
            loadData();
        },
        error: function(xhr, status, error) {
            // Gérer les erreurs de requête AJAX si nécessaire
            console.error(xhr.responseText);
        }
    });
});



// Fonction pour charger la liste des employés dans la liste déroulante
function loadEmployees() {
    $.ajax({
        type: "GET",
         url: url + 'organization/get_all_employees',
        dataType: 'json',
        success: function(response) {
            var employees = response.employees;
            displayEmployees(employees);
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

// Fonction pour afficher les employés dans la liste déroulante
function displayEmployees(employees) {
    var selectEmployee = $('#employee_nam');
    selectEmployee.empty(); // Vider la liste déroulante

    $.each(employees, function(index, employee) {
        var option = $('<option></option>').attr('value', employee.em_id).text(employee.em_id + ' ' + employee.first_name + ' ' + employee.last_name);
        selectEmployee.append(option);
    });
}

// Charger la liste des employés au chargement de la page
$(document).ready(function() {
    loadEmployees();
});







    });
</script>

