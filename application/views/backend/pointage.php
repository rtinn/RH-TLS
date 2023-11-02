<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-qrcode" aria-hidden="true"></i> Pointage</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accuiel</a></li>
                        <li class="breadcrumb-item active">Pointage</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
            <div class="container-fluid">

            <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                <?php } else { ?>
                <div class="row m-b-10"> 
                    <div class="col-12">
                        <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#noticemodel" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Import csv </a></button>
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
                <button  class="btn btn-info" id="filterSup0"></button>
                <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                <?php } else { ?>
                <button  class="btn btn-info"  id="" style="margin-left: 20px;"><a href="<?php echo base_url(); ?>employee/Absent"  class="text-white"> P. Absent</a></button>
                <?php } ?>
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
            <th>H.E Prévu</th>
            <th>H. d'entrée</th>
            <th>Retard</th>
            <th>H. de sortie</th>
            <th>Occupation</th>
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

            // Fonction pour réinitialiser le filtre de retard
            function resetDelayFilter() {
                $.fn.dataTable.ext.search.pop(); // Supprimer le filtre de retard
                table.draw(); // Redessiner la table pour appliquer le changement
            }

            // Fonction pour appliquer le filtre de retard supérieur à 0
            function applyDelayFilter() {
    $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
        var delayStr = data[6]; // Supposons que la colonne des retards est la 7e colonne (index 6)

        // Convertir la chaîne HH:MM:SS en un objet Date JavaScript
        var delayParts = delayStr.split(":");
        var delayDate = new Date(0, 0, 0, parseInt(delayParts[0]), parseInt(delayParts[1]), parseInt(delayParts[2]));

        // Créer un objet Date pour 00:10:00 (10 minutes)
        var tenMinutes = new Date(0, 0, 0, 0, 10, 0);

        // Comparer les retards
        return delayDate > tenMinutes;
    });

    table.draw(); // Redessiner la table pour appliquer le filtre
}

           // Ajoutez une variable pour suivre l'état du filtre et le texte du bouton
                var isDelayFilterApplied = false;

                // Fonction pour mettre à jour le texte du bouton en fonction de l'état
                function updateFilterButton() {
                    var button = $('#filterSup0');
                    if (isDelayFilterApplied) {
                        button.html('<i class="fa fa-list" aria-hidden="true"></i> Afficher Tous');
                        button.removeClass('btn-danger').addClass('btn-info');
                    } else {
                        button.html('<i class="fa fa-list" aria-hidden="true"></i> Retard + de 10 Minutes');
                        button.removeClass('btn-info').addClass('btn-danger');
                    }
                }

                    // Attachez le gestionnaire de clic au bouton de filtrage des retards
                    $('#filterSup0').on('click', function() {
                        if (isDelayFilterApplied) {
                            resetDelayFilter();
                            isDelayFilterApplied = false;
                        } else {
                            applyDelayFilter();
                            isDelayFilterApplied = true;
                        }
                        updateFilterButton(); // Mettez à jour le texte du bouton
                    });

                    // ...

                    // Appelez la fonction pour initialiser le texte du bouton au chargement de la page
                    updateFilterButton();




            function showTable() {
                $.ajax({
                    type: 'POST',
                    <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                        url: url + 'employee/GetPointage_em',
                    <?php } else { ?>
                    url: url + 'employee/GetPointage',
                        <?php } ?>
                    success: function(response) {
                        // Détruire et recréer la DataTable avec les nouvelles données
                        if ($.fn.DataTable.isDataTable('#employees123')) {
                            table.destroy();
                        }
                        $('#employees123 tbody').html(response);
                        table = initializeDataTable();
                    }
                });
            }

            // Appelez showTable au chargement de la page
            showTable();

            $(document).on('click', '.delete', function(){
            var id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'employee/getidPointage',
                dataType: 'json',
                data: {id: id},
                success: function(response){
                    console.log(response);
                    $('#delfname').html(response.sName);
                    $('#datename').html(response.Date);
                    $('#delid').val(response.id);
                    $('#delmodal').modal('show');
                }
            });
        });
        $('#delid').click(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: url + 'employee/deletePointage',
                data: {id: id},
                success: function(){
                    $('#delmodal').modal('hide');
                    $('#reussimodal').modal('show');
                     
                     // Ajouter un délai de 3 secondes avant de fermer le modal
                     setTimeout(function(){
                         $('#reussimodal').modal('hide');
                     }, 2000);
                    showTable();
                }
            });
        });


        // Réinitialisation des champs de date et actualisation du tableau
            $('#resetDates').on('click', function() {
                $('#startDate').val('');
                $('#endDate').val('');
                table.draw();
                showTable();
            });





        $(document).on('click', '.edit', function(){
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
            url: url + 'employee/getidPointage',
			dataType: 'json',
			data: {id: id},
			success:function(response){
				console.log(response);
				$('#mat').val(response.sName);
                $('#nom').val(response.first_name + ' ' + response.last_name);
                $('#poste').val(response.des_id);
                $('#date').val(response.Date);
                $('#hp').val(response.em_entree);
                $('#he').val(response.Time_in);
            // Calcul de la différence entre Time_in et em_entree
            var timeIn = moment(response.Time_in, 'HH:mm:ss');
            var emEntree = moment(response.em_entree, 'HH:mm:ss');
            var retardMinutes = timeIn.diff(emEntree, 'minutes');
            var retardHours = Math.floor(retardMinutes / 60);
// Affichage du retard si la différence est positive ou nulle
if (retardMinutes >= 0) {
    $('#retard').val(retardHours + ' heures ' + (retardMinutes % 60) + ' minutes');
} else {
    // Si la différence est négative, n'affiche rien
    $('#retard').val('pas de retard');
}


                $('#hs').val(response.Time_out);
                $('#occ').val(response.Time_diff);
				
				$('#editmodal').modal('show');
			}
		});
	});

 

        });
    })(jQuery);
</script>

