<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-qrcode" aria-hidden="true"></i> Rapport conge</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accuiel</a></li>
                        <li class="breadcrumb-item active">Rapport conge</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
            <div class="container-fluid">

            <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                <?php } else { ?>
                <div class="row m-b-10"> 
                    <div class="col-12">
                       


                    </div>
                </div>
                <?php } ?>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste des presences</h4>
                            </div>
                            <div class="card-body">
                            
                        </div>
                            <div class="card-body">
                            
             <div id="cercle_row">
                <div id="cercle_row1">
               
                <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                <?php } else { ?>
                



                <?php } ?>

                
    <label>Département:</label>
    <input type="text" id="dep_id" placeholder="Département">

    <label>Filtre de Date:</label>
    <select id="date_filter_type">
        <option value="daily">Journalier</option>
        <option value="weekly">Hebdomadaire</option>
        <option value="monthly">Mensuel</option>
    </select>
    <input type="date" id="date">

    <button type="button" id="filterBtn">Filtrer</button>
</div>
<div>

                </div>
                
                   <!--
                    <div>
                        <label for="startDate"><i class="fa fa-calendar-o" aria-hidden="true"></i></label>
                        <input type="text"  class="form-dt" id="startDate" name="startDate" placeholder="Date 1">
                        <label for="endDate"><i class="fa fa-calendar-o" aria-hidden="true"></i></label>
                        <input type="text"  class="form-dt" id="endDate" name="endDate" placeholder="Date 2">
                        <button class="btn btn-info" id="resetDates"><i class="fa fa-refresh" aria-hidden="true"></i> Vider date</button>

                    </div>
                -->
                 </div> 


                     <div class="table-responsive ">
                     
     <table id="congesTable" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>N°</th>
            <th>Nom</th>
            <th>Poste</th>
            <th>Date</th>
            <th>Shift</th>
            <th>H.E Prévu</th>
            <th>H. d'entrée</th>
            <th>Retard</th>
            <th>H. de sortie</th>
            <th>Occupation</th>
            <th>Dep</th>
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














<!-- Delete -->
<div class="modal fade" id="delmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <center><h4 class="modal-title" id="myModalLabel"><i class="fa fa-trash-o"></i> Supprimer pointage</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
				<h4 class="text-center">Voulez-vous vraiment supprimer le pointage du </h4>
                <h3 id="datename" class="text-center"></h3>
                <h4 class="text-center">pour le matricule:</h4>
				<h3 id="delfname" class="text-center"></h3>

			</div>
            <div class="modal-footer">
            <button type="button" id="delid" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span><i class="fa fa-trash-o"></i> Supprimer</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Annuler</button>
            </div>
			
        </div>
    </div>
</div>



<?php $this->load->view('backend/footer'); ?>


<script>
    (function($) {
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';

            // Fonction pour initialiser la DataTable
            function initializeDataTable() {
                return $('#congesTable').DataTable({
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

            // Fonction pour charger les données du tableau avec ou sans filtres
            function showTable(dep_id = null, date_filter_type = null, date = null) {
                $.ajax({
                    type: 'POST',
                    url: url + 'leave/liste_conges',
                   
                    data: {
                        dep_id: dep_id,
                        date_filter_type: date_filter_type,
                        date: date
                    },
                    success: function(response) {
                        // Détruire et recréer la DataTable avec les nouvelles données
                        if ($.fn.DataTable.isDataTable('#congesTable')) {
                            table.destroy();
                        }
                        $('#congesTable tbody').empty();

                        // Convertir la réponse JSON
                        const conges = JSON.parse(response);

                        if (conges.length > 0) {
                            // Ajouter chaque enregistrement au tableau
                            conges.forEach(function(conge) {
                                const row = `
                                    <tr>
                                        <td>${conge.em_id}</td>
                                       <td>${conge.first_name} ${conge.last_name}</td>
                                        <td>${conge.dep_id}</td>
                                        <td>${conge.start_date}</td>
                                        <td>${conge.end_date}</td>
                                        <td>${conge.apply_date}</td>
                                    </tr>
                                `;
                                $('#congesTable tbody').append(row);
                            });
                        } else {
                            $('#congesTable tbody').append('<tr><td colspan="5">Aucun résultat trouvé</td></tr>');
                        }

                        table = initializeDataTable();
                    },
                    error: function() {
                        alert('Erreur lors du chargement des données.');
                    }
                });
            }

            // Appelez showTable au chargement de la page sans filtre
            showTable();

            // Ajouter l'événement de filtrage via le bouton
            $('#filterBtn').on('click', function() {
                // Récupérer les valeurs des filtres
                const dep_id = $('#dep_id').val();
                const date_filter_type = $('#date_filter_type').val();
                const date = $('#date').val();

                // Appeler showTable avec les filtres
                showTable(dep_id, date_filter_type, date);
            });
        });
    })(jQuery);
</script>


