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
                    <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a href="<?php echo base_url(); ?>employee/Add_employee" class="text-white"><i class="" aria-hidden="true"></i> Ajouter</a></button>
                    <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#employemodal" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Import csv </a></button>
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
                                <div class="table-responsive ">
                                    <table id="employees123" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr class="tete">
                                                <th>N°</th>
                                                <th>Nom et prénoms</th>
                                                <th>Poste </th>
                                                <th>Contact </th>
                                                <th>Contrat </th>
                                                <th>Date d'embauche </th>
                                                <th>Ancienneté </th>
                            
                                                 <th>Action</th>
                                            </tr>
                                        </thead>
                                       
                                        <tbody>
                                           <?php foreach($employee as $value): ?>
                                            <tr>
                                            <td><?php echo $value->em_id; ?></td>
                                                <td title="<?php echo $value->first_name .' '.$value->last_name; ?>"><?php echo $value->first_name .' '.$value->last_name; ?></td>
                                                <td><?php echo $value->des_id; ?></td>
                                                 <td><?php echo $value->em_phone; ?></td>
                                                <td><?php echo $value->contrat; ?></td>
                                                <td><?php echo $value->em_joining_date; ?></td>
                                                <td>
                                                    <?php
                                                    $dateContrat = new DateTime($value->em_joining_date);
                                                    $today = new DateTime();
                                                    $diff = $dateContrat->diff($today);
                                                    echo $diff->y . ' Ans, ' . $diff->m . ' Mois';
                                                    ?>
                                                </td>
                                                
                                                
                                                <td class="jsgrid-align-center ">
                                                    <a href="<?php echo base_url(); ?>employee/view?I=<?php echo base64_encode($value->em_id); ?>" title="Edit" class="btn btn-sm btn-primary waves-effect waves-light"><i class="fa fa-pencil-square-o"></i></a>
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
    $('#employees123').DataTable({
        "aaSorting": [[1,'asc']],
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
</script>