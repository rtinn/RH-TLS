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
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Employee List</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive ">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Nom et prénoms</th>
                                                <th>Poste </th>
                                                <th>Contact </th>
                                                <th>Contrat </th>
                                                <th>Date d'embauche </th>
                                                <th>Ancienneté </th>
                                               
                                            </tr>
                                        </thead>
                                        <!-- <tfoot>
                                            <tr>
                                                <th>ID </th>
                                                <th>Employee Name</th>
                                                <th>Email </th>
                                                <th>Contact </th>
                                                <th>Roll</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot> -->
                                        <tbody>
                                           <?php foreach($invalidem as $value): ?>
                                            <tr>
                                            <td><?php echo $value->em_code; ?></td>
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
<?php $this->load->view('backend/footer'); ?>