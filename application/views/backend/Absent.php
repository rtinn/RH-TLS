<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-user-times" aria-hidden="true"></i> Absences</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accuiel</a></li>
                        <li class="breadcrumb-item active">Absent</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
            <div class="container-fluid">

            <?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>
                <?php } else { ?>
                <div class="row m-b-10"> 
                    <div class="col-12">
                    <button type="button" class="btn btn-info"><i class="fa fa-qrcode"></i><a href="<?php echo base_url(); ?>employee/pointage" class="text-white"><i class="" aria-hidden="true"></i> Pointage</a></button>
                    </div>
                </div>
                <?php } ?>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-times" aria-hidden="true"></i> Liste d' Absences</h4>
                            </div>
                            <div class="card-body">
                            
                        </div>
                            <div class="card-body">
                            
             <div id="cercle_row">
                <div id="cercle_row1">
                
                   
                    
                </div>
                   
                    <div>
                        <label for="startDate"><i class="fa fa-calendar-o" aria-hidden="true"></i></label>
                        <input type="text"  class="form-dt" id="startDate" name="startDate" placeholder="Date 1">
                        <label for="endDate"><i class="fa fa-calendar-o" aria-hidden="true"></i></label>
                        <input type="text"  class="form-dt" id="endDate" name="endDate" placeholder="Date 2">
                        <button class="btn btn-info" id="resetDates"><i class="fa fa-refresh" aria-hidden="true"></i> Réinitialiser</button>

                    </div>
                 </div> 

    


<div class="table-responsive ">
<table id="employees123" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>N°</th>
            <th>Poste</th>
            <th>Nom</th>
            <th>Date</th>
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
              <!-- /.modalimport --> 


                <div class="modal fade" id="noticemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content ">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel1">Importer un fichier CSV</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    
                                    <form action="<?=base_url('Pointage/import')?>" enctype="multipart/form-data" method="post">
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

<!-- /.modal --> 
<div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <center><h4 class="modal-title" id="myModalLabel">Détails pointage</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
			<div class="container-fluid">
			<form id="editForm">
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Matricule:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="mat" id="mat" readonly>
					</div>
				</div>
				<div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Nom:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="nom" id="nom" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Poste:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="poste" id="poste" readonly>
					</div>
				</div>
				<div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Date:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="date" id="date" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">H.E Prévue:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="hp" id="hp" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">H.Entrée:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="he" id="he" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Retard:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="retard" id="retard" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">H.Sortie:</label>
					</div>
					<div class="col-md-9">
                        <input type="text" class="form-control" name="hs" id="hs" readonly>
					</div>
				</div>
                <div style="height:10px;"></div>
				<div class="row">
					<div class="col-md-3">
						<label class="control-label" style="position:relative; top:7px;">Occupation:</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" name="occ" id="occ" readonly>
                        
					</div>
				</div>
                
				<input type="hidden" name="id" id="userid">
            </div> 
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
           </form>
            </div>
			
        </div>
    </div>
</div>



<?php $this->load->view('backend/footer'); ?>


<script>
    (function($) {
        $(document).ready(function(){
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
            
            // Initialisation des datepickers
            $('#startDate, #endDate').datepicker({
                dateFormat: 'dd/mm/yy', // Format de la date
                changeMonth: true,
                changeYear: true,
            });

            // Gestion du filtre par date
            $('#startDate, #endDate').on('change', function() {
                table.draw();
            });

            $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
                var startDate = $('#startDate').val();
                var endDate = $('#endDate').val();
                var date = data[3]; // L'indice 3 correspond à la colonne "Date" dans votre DataTable

                if ((startDate === "" && endDate === "") ||
                    (moment(startDate, 'DD/MM/YYYY') <= moment(date, 'DD/MM/YYYY') && moment(endDate, 'DD/MM/YYYY') >= moment(date, 'DD/MM/YYYY'))) {
                    return true;
                }

                return false;
            });


            function showTable() {
                $.ajax({
                    type: 'POST',  
                    url: url + 'employee/GetAbsent',
                    dataType: 'json', // Définir le type de données attendu
                    success: function(response) {
                        // Détruire et recréer la DataTable avec les nouvelles données
                        if ($.fn.DataTable.isDataTable('#employees123')) {
                            table.destroy();
                        }
                        
                        // Ajouter les données au tableau
                        var tbody = $('#employees123 tbody');
                        tbody.empty(); // Effacer le contenu précédent

                        $.each(response.absentEmployees, function(date, employees) {
                            $.each(employees, function(index, employee) {
                                var row = '<tr>' +
                                    '<td>' + employee.em_id + '</td>' +
                                    '<td>' + employee.des_id + '</td>' +
                                    '<td>' + employee.first_name + ' ' + employee.last_name +'</td>' +
                                   
                                    '<td>' + date + '</td>' +
                                    '<td>Actions</td>' + // Ajoutez les actions nécessaires ici
                                    '</tr>';
                                tbody.append(row);
                            });
                        });

                        table = initializeDataTable(); // Réinitialiser la DataTable
                    }
                });
            }

            // Appelez showTable au chargement de la page
            showTable();

              // Réinitialisation des champs de date et actualisation du tableau
              $('#resetDates').on('click', function() {
                $('#startDate').val('');
                $('#endDate').val('');
                table.draw();
                showTable();
            });

        });
    })(jQuery);
</script>
