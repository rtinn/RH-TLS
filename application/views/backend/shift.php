<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-qrcode" aria-hidden="true"></i> Timing</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accuiel</a></li>
                        <li class="breadcrumb-item active">Timing</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
            <div class="container-fluid">

            <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                <?php } else { ?>
                    
                <div class="row m-b-10"> 
                    <div class="col-12">
                    <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#shiftmodal" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Import csv </a></button>
                    <p>Assurez-vous d'importer uniquement un fichier csv.Téléchargez le modèle  
                         <a href="<?php echo base_url('uploads/modely/plannig_shift.csv'); ?>" download="plannig_shift.csv">ici.</a>
                    </p>
                     </div>
                
                
                </div>
                <?php } ?>
                
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Liste des temps de travail</h4>
                            </div>
                            
                        <div class="card-body">
                            
                            <div >     
                            <button type="button" id="monBoutonD" class="btn btn-danger" data-shift="DAY"><i class="fa fa-sun-o" aria-hidden="true"></i> DAY SHIFT</button>
                            <button type="button" id="monBoutonP" class="btn btn-info" data-shift="PM"><i class="fa fa-star-o" aria-hidden="true"></i> PM SHIFT</button>
                            <button type="button" id="monBoutonN" class="btn btn-info" data-shift="NIGHT"><i class="fa fa-star" aria-hidden="true"></i> NIGHT SHIFT</button>
  
                                
                            </div> 

            <div class="table-responsive ">
                     
            <table id="employees123" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>N°</th>
                    <th>Nom et prenoms</th>
                    <th>Shift</th>
                    <th>Heure d'entree prevu</th>
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







                <div class="modal fade" id="shiftmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content ">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel1">Importer un fichier CSV</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    
                                    <form action="<?=base_url('Pointage/importShift')?>" enctype="multipart/form-data" method="post">
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



<!-- Modal -->
<div class="modal fade" id="editShiftModal" tabindex="-1" role="dialog" aria-labelledby="editShiftModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
               
                <h5 class="modal-title" id="editShiftModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editShiftForm">
                <div class="form-group">
                        <label for="editShift">Shift</label>
                        <select class="form-control" id="editShift" name="shift">
                            <option value="DAY">DAY</option>
                            <option value="PM">PM</option>
                            <option value="NIGHT">NIGHT</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="editHeureE">Heure d'entree prevu</label>
                        <input type="text" class="form-control" id="editHeureE" name="heure_e">
                    </div>
                    <input type="hidden" id="editEmId" name="em_id">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Close</button>
                <button type="button" class="btn btn-success" onclick="saveShift()"><i class="fa fa-check" aria-hidden="true"></i> Save changes</button>
            </div>
        </div>
    </div>
</div>



<?php $this->load->view('backend/footer'); ?>
<script>
    (function($) {
        $(document).ready(function(){
            var url = '<?php echo base_url(); ?>';
            var table;

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

            // Fonction pour afficher la table
            function showTable() {
                $.ajax({
                    type: 'POST',
                    url: url + 'employee/GetShift',
                    success: function(response) {
                        // Détruire et recréer la DataTable avec les nouvelles données
                        if ($.fn.DataTable.isDataTable('#employees123')) {
                            table.destroy();
                        }
                        $('#employees123 tbody').html(response);
                        table = initializeDataTable();
                        // Appliquer le filtre initial pour DAY SHIFT
                        table.column(2).search('DAY').draw();
                    }
                });
            }

            // Appelez showTable au chargement de la page
            showTable();

            // Filtrer la table en fonction des boutons
            $('button[id^="monBouton"]').on('click', function() {
                var shift = $(this).data('shift');
                table.column(2).search(shift).draw();

                // Mettre à jour la classe des boutons
                $('button[id^="monBouton"]').removeClass('btn-danger').addClass('btn-info');
                $(this).removeClass('btn-info').addClass('btn-danger');
            });

            // Fonction pour éditer un shift
            window.editShift = function(em_id) {
                $.ajax({
                    type: 'POST',
                    url: url + 'employee/GetEmployeeShift',
                    data: {em_id: em_id},
                    success: function(response) {
                        var data = JSON.parse(response);
                        $('#editShift').val(data.shift);
                        $('#editHeureE').val(data.heure_e);
                        $('#editEmId').val(data.em_id);
                        $('#editShiftModalLabel').text(data.first_name + ' ' + data.last_name); // Met à jour le titre du modal
                        $('#editShiftModal').modal('show');
                    }
                });
            }

            // Fonction pour sauvegarder les modifications du shift
            window.saveShift = function() {
                var formData = $('#editShiftForm').serialize();
                $.ajax({
                    type: 'POST',
                    url: url + 'employee/UpdateShift',
                    data: formData,
                    success: function(response) {
                        $('#editShiftModal').modal('hide');
                        showTable();
                    }
                });
            }
        });
    })(jQuery);
</script>