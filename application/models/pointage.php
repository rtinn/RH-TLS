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
                <div class="row m-b-10"> 
                    <div class="col-12">
                        <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#noticemodel" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Import csv </a></button>
                    </div>
                </div>
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
                <div id="cercle"></div>
                    <div> Retard + de 10 Minutes</div>
                </div>
                   
                    <div>
                        <label for="startDate">Date de début:</label>
                        <input type="text" id="startDate" name="startDate">
                        <label for="endDate">Date de fin:</label>
                        <input type="text" id="endDate" name="endDate">
                      
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
            <th>Heure d'entrée prevu</th>
            <th>Heure d'entrée</th>
            <th>Heure de sortie</th>
            <th>Heure de travail</th>
            <th>Retard</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach($pointage as $value): ?>
            <?php
                $timeIn = strtotime($value->Time_in); // Convertir l'heure en timestamp
                $rowClass = '';
                if ($value->des_id === 'Opérateur Anglophone' && $timeIn > strtotime('07:10:00')) {
                    $rowClass = 'table-danger'; // Ajouter la classe table-danger si des_id = Opérateur Anglophone et Time_in > 07:10
                }
            ?>
            <tr class="<?php echo $rowClass; ?>">
                <td><?php echo $value->sName; ?></td>
                <td><?php echo $value->des_id; ?></td>
                <td><?php echo $value->first_name . ' ' . $value->last_name; ?></td>
                <td><?php echo $value->Date; ?></td>
                <td><?php echo $value->em_entree; ?></td>
                <td><?php echo $value->Time_in; ?></td>
                <td><?php echo $value->Time_out; ?></td>
                <td><?php echo $value->Time_diff; ?></td>
                <td class="jsgrid-align-center">
                    <a href="#" data-toggle="modal" class="btn btn-sm btn-primary waves-effect waves-light" data-target="#editPelanggan<?php echo $value->id ?>"><i class="fa fa-eye" aria-hidden="true"></i></a>
                    <a onclick="return confirm('Voulez vous vraiment le supprimer?')" href="<?php echo base_url();?>employee/DeleteP/<?php echo $value->id;?>" title="Delete" class="btn btn-sm btn-danger waves-effect waves-light"><i class="fa fa-trash-o"></i></a>
                                                      
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

                                </div>
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

<?php
                foreach ($pointage as $value) {
            ?>
            <div class="modal fade" id="editPelanggan<?php echo $value->id ?>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="formEditPelanggan" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title font-weight-bold text-primary mx-3 mt-3" id="formEditPelangganLabel"><i class="fa fa-info-circle" aria-hidden="true"></i> Information de présence</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form name="form_add_mahasiswa"  method="post" class="user needs-validation mx-3 mb-4" novalidate>
                            <div class="modal-body"> 
                            

                                <div class="form-group">
                                    <label class="control-label text-secondary" >N° Matricule </label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->sName ?>" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="control-label text-secondary" >Nom et Prénom </label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->first_name . ' ' . $value->last_name ?>" readonly>
                                </div>

                                <div class="form-group">
                                    <label class="control-label text-secondary">Date</label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->Date ?>" readonly>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label text-secondary">Heure d'entrée</label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->Time_in ?>" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="control-label text-secondary">Heure de sortie</label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->Time_out ?>" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="control-label text-secondary">Temps de Travail</label>
                                    <input type="text" class="form-control" placeholder="Customer ID" autofocus name="id" value="<?php echo $value->Time_diff ?>" readonly>
                                </div>
                                
                            </div>
                            <div class="modal-footer d-flex">
                                <button type="button" class="flex-fill btn btn-danger btn-user" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Fermer</button>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php
                }
            ?>


<?php $this->load->view('backend/footer'); ?>

<script>

$(document).ready(function() {

  
    // Initialisation des datepickers
    $('#startDate, #endDate').datepicker({
    dateFormat: 'dd/mm/yy', // Format de la date
    changeMonth: true,
    changeYear: true,
   
});
    
    
    // Initialisation de la DataTable
    var table = $('#employees123').DataTable();
table.destroy(); // Détruit la table DataTable existante

// Réinitialisez la table avec les options et les fonctionnalités souhaitées
table = $('#employees123').DataTable({
    "paging": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "aaSorting": [[1,'asc']],
    dom: 'Bfrtip',
    buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
    ]
});

    // Gestion du filtre par date
  

    $('#startDate, #endDate').on('change', function() {
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();

    console.log('startDate:', startDate);
    console.log('endDate:', endDate);

    table.draw();
});



    // Ajoutez une fonction de filtre personnalisée pour DataTables
    

    $.fn.dataTable.ext.search.push(
    function(settings, data, dataIndex) {
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        var date = data[3]; // L'indice 3 correspond à la colonne "Date" dans votre DataTable
       
        console.log('startDate in filter function:', startDate);
        console.log('endDate in filter function:', endDate);
        console.log('date in filter function:', date);

        if ((startDate === "" && endDate === "") ||
            (startDate <= date && endDate >= date)) {
            return true;
        }

        return false;
    }
);




});

</script>