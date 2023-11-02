<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
<div class="page-wrapper">
    <div class="message"></div>
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-themecolor"><i class="fa fa-fighter-jet" style="color:#1976d2"> </i> Demande congé</h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Accueil</a></li>
                <li class="breadcrumb-item active">Demande congé</li>
            </ol>
        </div>
    </div>
    <!-- Container fluid  -->
    <!-- ==================================================== -->
    <div class="container-fluid">
        <div class="row m-b-10">
            <?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>
            <div class="col-12">
                <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#appmodel" data-whatever="@getbootstrap" class="text-white"><i class="" aria-hidden="true"></i> Ajouter </a></button>
            </div>
            <?php } ?>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card card-outline-info">
                    <div class="card-header">
                        <h4 class="m-b-0 text-white"> Liste
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive ">
                            <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                   
                                        <th>N°</th>
                                        <th>Noms et prenoms</th>
                                        <th>Type</th>
                                        <th>Date de demande</th>
                                        <th>Date de debut</th>
                                        <th>Date de fin</th>
                                        <th>Duration</th>
                                        <th>Status</th>
                                       
                                    </tr>
                                </thead>
                                <!-- <tfoot>
                                <tr>
                                    <th>Employee Name</th>
                                    <th>PIN</th>
                                    <th>Leave Type</th>
                                    <th>Apply Date</th>
                                    <th>start Date</th>
                                    <th>End Date</th>
                                    <th>Leave Duration</th>
                                    <th>Leave Status</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot> -->
                                <tbody>
                                    <?php foreach($application as $value): ?>
                                    <tr style="vertical-align:top">
                                    <td><?php echo $value->em_id; ?></td>
                                        <td><mark><?php echo $value->first_name.' '.$value->last_name ?></mark></td>
                                      
                                        <td><?php echo $value->name; ?></td>
                                        <td><?php echo $value->apply_date; ?></td>
                                        <td><?php echo $value->start_date; ?></td>
                                        <td><?php echo $value->end_date; ?></td>
                                        <td><?php echo $value->leave_duration; ?></td>
                                        <td><?php echo $value->leave_status; ?></td>
                                        <?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>
                                        
                                        <?php } else { ?>
                                        <td class="jsgrid-align-center">
                                            <?php if($value->leave_status =='Approve'){ ?>
                                            
                                            <?php } elseif($value->leave_status =='Non Approuvé'){ ?>
                                            <a href="" title="Edit" class="btn btn-sm btn-success waves-effect waves-light leaveapproval" data-id="<?php echo $value->id; ?>"><i class="fa fa-check-square" aria-hidden="true"></i></a>
                                            <a href="" title="Edit" class="btn btn-sm btn-danger waves-effect waves-light  Status" data-id = "<?php echo $value->id; ?>" data-value="Rejected" >pReject</a><br>
                                            <?php } elseif($value->leave_status =='Rejected'){ ?>
                                            <?php } ?>
                                            <a href="" title="Edit" class="btn btn-sm btn-primary waves-effect waves-light leaveapp" data-id="<?php echo $value->id; ?>" ><i class="fa fa-pencil-square-o"></i> Edit</a>
                                        </td>
                                        <?php } ?>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="appmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel1">Demande congé</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form method="post" action="Add_Applications" id="leaveapply" enctype="multipart/form-data">
                        <div class="modal-body">
                        <div class="form-group">
                                    <span style="color:red" id="total"></span>
                            </div>
                            <div class="form-group">
                                <label>N° matricule</label>
                                <select class=" form-control custom-select selectedEmployeeID"  tabindex="1" name="emid" required>
                                    <option value="<?php echo $employee->em_id ?>"><?php echo $employee->em_id?></option>
           
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Nom et Prénoms</label>
                                <select class=" form-control custom-select selectedEmployeeID"  tabindex="1" name="emid" required>
                                    <option value="<?php echo $employee->em_id ?>"><?php echo $employee->first_name.' '.$employee->last_name?></option>
                                       
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Type de congé</label>
                                <select class="form-control custom-select  fetchLeaveTotal"  tabindex="1" name="typeid" id="leavetype" required>
                                    <option value="">Selectionner un congé..</option>
                                    <?php foreach($leavetypes as $value): ?>

                                    <option value="<?php echo $value->type_id ?>"><?php echo $value->name ?></option>

                                    <?php endforeach; ?>
                                </select>
                            </div>
                           
                            <div class="form-group">
                                <label class="control-label">Durée du congé</label><br>
                                <input name="type" type="radio" id="radio_1" data-value="Half" class="duration" value="Half Day" checked="">
                                <label for="radio_1">Demi-journée</label>
                                <input name="type" type="radio" id="radio_2" data-value="Full" class="type" value="Full Day">
                                <label for="radio_2">Journée complète</label>
                                <input name="type" type="radio" class="with-gap duration" id="radio_3" data-value="More" value="More than One day">
                                <label for="radio_3">Au dessus d'un jour</label>
                            </div>
                            <div class="form-group">
                                <label class="control-label" id="hourlyFix">Date</label>
                                <input type="date" name="startdate" class="form-control" id="recipient-name1" required>
                            </div>
                            <div class="form-group" id="enddate" style="display:none">
                                <label class="control-label"> Date fin</label>
                                <input type="date" name="enddate" class="form-control" id="recipient-name1">
                            </div>

                           
                            <div class="form-group">
                                <label class="control-label">Reasons</label>
                                <textarea class="form-control" name="reason" id="message-text1" required minlength="10"></textarea>                                                
                            </div>
                            
                        </div>
                        <script>
                        $(document).ready(function () {
                            $('#leaveapply input').on('change', function(e) {
                                e.preventDefault(e);

                                // Get the record's ID via attribute  
                                var duration = $('input[name=type]:checked', '#leaveapply').attr('data-value');

                                if(duration =='Half'){
                                    $('#enddate').hide();
                                    $('#hourlyFix').text('Date');
                                    $('#hourAmount').show();
                                }
                                else if(duration =='Full'){
                                    $('#enddate').hide();  
                                    $('#hourAmount').hide();  
                                    $('#hourlyFix').text('Date de debut');  
                                }
                                else if(duration =='More'){
                                    $('#enddate').show();
                                    $('#hourAmount').hide();
                                }
                            });
                        }); 
                        </script>
                        <div class="modal-footer">
                            <input type="hidden" name="id" class="form-control" id="recipient-name1" required>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                            <button type="submit" class="btn btn-success">Enregistrer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
<script>
  
        <script type="text/javascript">
            $('#duration').on('input', function() {
                var day = parseInt($('#duration').val());
                console.log('gfhgf');
                var hour = 8;
                $('.totalhour').val((day * hour ? day * hour : 0).toFixed(2));

            });
        </script>
        <!-- Set leaves approved for ADMIN? -->
        <script type="text/javascript">
            $(document).ready(function() {
                $(".leaveapproval").click(function(e) {
                    e.preventDefault(e);
                    // Get the record's ID via attribute
                    var iid = $(this).attr('data-id');
                    $('#leaveapplyval').trigger("reset");
                    $('#appmodelcc').modal('show');
                    $.ajax({
                        url: 'LeaveAppbyid?id=' + iid,
                        method: 'GET',
                        data: '',
                        dataType: 'json',
                    }).done(function(response) {
                        console.log(response);
                        // Populate the form fields with the data returned from server
                        $('#leaveapplyval').find('[name="id"]').val(response.leaveapplyvalue.id).end();
                        $('#leaveapplyval').find('[name="emid"]').val(response.leaveapplyvalue.em_id).end();
                        $('#leaveapplyval').find('[name="applydate"]').val(response.leaveapplyvalue.apply_date).end();
                        $('#leaveapplyval').find('[name="typeid"]').val(response.leaveapplyvalue.typeid).end();
                        $('#leaveapplyval').find('[name="startdate"]').val(response.leaveapplyvalue.start_date).end();
                        $('#leaveapplyval').find('[name="enddate"]').val(response.leaveapplyvalue.end_date).end();
                        $('#leaveapplyval').find('[name="duration"]').val(response.leaveapplyvalue.leave_duration).end();
                        $('#leaveapplyval').find('[name="reason"]').val(response.leaveapplyvalue.reason).end();
                        $('#leaveapplyval').find('[name="status"]').val(response.leaveapplyvalue.leave_status).end();
                    });
                });
            });
        </script>







        <?php $this->load->view('backend/footer'); ?>