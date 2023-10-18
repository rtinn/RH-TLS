<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>

<?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>
    
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
            <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste des personnels</h4>
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
            <div class="message"></div>
            <div class="container-fluid">
                <div class="row m-b-10"> 
                    <div class="col-12">
                    <button type="button" id="monBoutonDay" class="btn btn-info"><i class="fa fa-plus"></i> Day</button>
                    <button type="button" id="monBoutonNight" class="btn btn-info"><i class="fa fa-plus"></i> NIGHT</button>
                    <button type="button" id="monBoutonPM" class="btn btn-info"><i class="fa fa-plus"></i> PM</button>
                  
                    
                    <!--
                    <button type="button" class="btn btn-primary"><i class="fa fa-bars"></i><a href="<?php echo base_url(); ?>employee/Disciplinary" class="text-white"><i class="" aria-hidden="true"></i>  Disciplinary List</a></button>
                    -->    
                </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 id="texte_titre"  class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste des personnels</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive ">
                                <table id="planning" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>N°</th>
            <th>Poste</th>
            <th>Nom</th>
            <th>Type</th>
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
<script>
    (function($) {
    $(document).ready(function(){
        var url = '<?php echo base_url(); ?>';
        var table; // Déclarez la variable de la DataTable ici pour qu'elle soit accessible en dehors de la fonction initializeDataTable

        // Fonction pour initialiser la DataTable
        function initializeDataTable() {
            table = $('#planning').DataTable({
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

        function showTable() {
            $.ajax({
                type: 'POST',
                url: url + 'employee/GetPlanning',
                success: function(response) {
                    // Détruire et recréer la DataTable avec les nouvelles données
                    if ($.fn.DataTable.isDataTable('#planning')) {
                        table.destroy();
                    }
                    $('#planning tbody').html(response);
                    initializeDataTable(); // Réinitialisez la DataTable
                   
                    table.column(3).search('DAY').draw();
                    $('#texte_titre').text('Liste des travailleurs jour');
                    $('#monBoutonDay').addClass('btn-danger');
                    $('#monBoutonNight').removeClass('btn-danger');
                    $('#monBoutonPM').removeClass('btn-danger');
                }
            });
        }

        // Appelez showTable au chargement de la page
        showTable();

        // Gérez le filtrage en dehors de la DataTable
        $('#monBoutonDay').click(function() {
            table.column(3).search('DAY').draw();
            $('#texte_titre').text('Liste des travailleurs jour');
            $('#monBoutonDay').addClass('btn-danger');
            $('#monBoutonNight').removeClass('btn-danger');
            $('#monBoutonPM').removeClass('btn-danger');
        });

        $('#monBoutonNight').click(function() {
            table.column(3).search('NIGHT').draw();
            $('#texte_titre').text('Liste des travailleurs nuit');
            $('#monBoutonDay').removeClass('btn-danger');
            $('#monBoutonNight').addClass('btn-danger');
            $('#monBoutonPM').removeClass('btn-danger');
        });

        $('#monBoutonPM').click(function() {
            table.column(3).search('PM').draw();
            $('#texte_titre').text('Liste des travailleurs PM');
            $('#monBoutonDay').removeClass('btn-danger');
            $('#monBoutonNight').removeClass('btn-danger');
            $('#monBoutonPM').addClass('btn-danger');
        });
    });
})(jQuery);

</script>