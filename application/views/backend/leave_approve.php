<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
<div class="page-wrapper">
    <div class="message"></div>
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-themecolor"><i class="fa fa-clone" style="color:#1976d2"> </i> Demande de congé</h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Accueil</a></li>
                <li class="breadcrumb-item active">Demande de congé</li>
            </ol>
        </div>
    </div>
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div class="row m-b-10">
            <?php // if($this->session->userdata('user_type')=='EMPLOYEE'){ ?> 
                <div class="col-12">
                    <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#appmodel" data-whatever="@getbootstrap" class="text-white"><i class="" aria-hidden="true"></i> Ajouter Demande </a></button>
                </div>                       
            <?php // } ?> 
        </div> 
        <div class="row">
            <div class="col-12">
                <div class="card card-outline-info">
                    <div class="card-header">
                        <h4 class="m-b-0 text-white">   Liste des demandes de congé                     
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive ">

                            <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                    <th>N°</th>
                                        <th>Nom et Prenoms</th>
                                        <th>Type</th>
                                        <th>Date demande</th>
                                        <th>Date debut</th>
                                        <th>Date fin</th>
                                        <th>Duration</th>
                                        <th>Status</th>
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

<!--Modal pour validé congé-->
        <div class="modal fade" id="validemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <center><h4 class="modal-title" id="myModalLabel"><i <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Validation congé</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
				<h4 class="text-center">Voulez-vous vraiment validé le demande de congé </h4>
                <h3 id="datename" class="text-center"></h3>
                <h4 class="text-center">pour le matricule:</h4>
				<h3 id="matr" class="text-center"></h3>

			</div>
            <div class="modal-footer">
            <button type="button" id="valid_id" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Validé</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Fermer</button>
            </div>
			
        </div>
    </div>
</div>

<!--Modal pour rejété congé-->
<div class="modal fade" id="rejetmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <center><h4 class="modal-title" id="myModalLabel"><i <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Rejet congé</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
				<h4 class="text-center">Voulez-vous vraiment rejeté le demande de congé </h4>
                <h3 id="datename" class="text-center"></h3>
                <h4 class="text-center">pour le matricule:</h4>
				<h3 id="matri" class="text-center"></h3>

			</div>
            <div class="modal-footer">
            <button type="button" id="rejet_id" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span><i class="fa fa-calendar-times-o" aria-hidden="true"></i> Rejeté</button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i> Fermer</button>
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
                                <label>N°</label>
                                <select class="form-control custom-select selectedEmployeeID fetchLeaveTotal" tabindex="1" name="emid" id="em_id" required>
                                    <?php foreach ($employee as $value): ?>
                                    <option value="<?php echo $value->em_id ?>"><?php echo $value->em_id ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Employee</label>
                                <select class="form-control custom-select selectedEmployeeName" tabindex="1" name="emid" id="employee_name" required>
                                    <?php foreach ($employee as $value): ?>
                                    <option value="<?php echo $value->em_id ?>"><?php echo $value->first_name . ' ' . $value->last_name ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>


                                <div class="form-group">
                                    <label>Type de congé</label>
                                    <select class="form-control custom-select assignleave fetchLeaveTotal"  tabindex="1" name="typeid" id="leavetype" required>
                                        <option value="">Selectinner type de congé</option>
                                        <?php foreach($leavetypes as $value): ?>

                                        <option value="<?php echo $value->type_id ?>"><?php echo $value->name ?></option>

                                        <?php endforeach; ?>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <span style="color:red" id="total"></span>
                                    
                                    <br>
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
                                    <input type="date" name="startdate" class="form-control " id="recipient-name1" required>
                                </div>
                                <div class="form-group" id="enddate" style="display:none">
                                    <label class="control-label">Date de fin</label>
                                    <input type="date" name="enddate" class="form-control " id="recipient-name1">
                                </div>
 
                                <div class="form-group">
                                    <label class="control-label">Raisons</label>
                                    <textarea class="form-control" name="reason" id="message-text1"></textarea>                                                
                                </div>
                                                                               
                            </div>
                            <script>
                                $(document).ready(function () {
                                    $('#leaveapply input').on('change', function(e) {
                                        e.preventDefault(e);

                                        // Get the record's ID via attribute  
                                        var duration = $('input[name=type]:checked', '#leaveapply').attr('data-value');
                                        console.log(duration);

                                        if(duration =='Half'){
                                            $('#enddate').hide();
                                            $('#hourlyFix').text('Date');
                                            $('#hourAmount').show();
                                        }
                                        else if(duration =='Full'){
                                            $('#enddate').hide();  
                                            $('#hourAmount').hide();  
                                            $('#hourlyFix').text('Date');  
                                        }
                                        else if(duration =='More'){
                                            $('#enddate').show();
                                            $('#hourAmount').hide();
                                        }
                                    });
                                    $('#appmodel').on('hidden.bs.modal', function () {
                                        location.reload();
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
    (function($) {
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';

            function showTable() {
                $.ajax({
                    type: 'POST',
                    <?php if ($this->session->userdata('user_type') == 'EMPLOYEE') { ?>
                    // Your code for EMPLOYEE user type here
                    <?php } else { ?>
                    url: url + 'leave/GetApplication',
                    <?php } ?>
                    success: function(response) {
                        $('#example23').DataTable().destroy(); // Détruire la DataTable existante
           
                        $('#example23 tbody').html(response);

                        // Initialize DataTable after loading data
                        var dataTable = initializeDataTable();
                    }
                });
            }

            // Call showTable on page load
            showTable();

            // Function to initialize the DataTable
            function initializeDataTable() {
                return $('#example23').DataTable({
                    "paging": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "order": [[1, 'asc']],
                    "dom": 'Bfrtip',
                    "buttons": ['copy', 'csv', 'excel', 'pdf', 'print']
                });
            }






            // Appelez la fonction pour initialiser la DataTable
          

            $(document).on('click', '.valide', function(){
            var id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'leave/getidconge',
                dataType: 'json',
                data: {id: id},
                success: function(response){
                    console.log(response);
                    $('#matr').html(response.em_id);
                   
                    $('#valid_id').val(response.id);
                    $('#validemodal').modal('show');
                }
            });
            

        });
        $(document).on('click', '.rejet', function(){
            var id = $(this).data('id');
            $.ajax({
                type: 'POST',
                url: url + 'leave/getidconge',
                dataType: 'json',
                data: {id: id},
                success: function(response){
                    console.log(response);
                    $('#matri').html(response.em_id);
                   
                    $('#rejet_id').val(response.id);
                    $('#rejetmodal').modal('show');
                }
            });
            

        });

        
        $('#valid_id').click(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: url + 'leave/Valideconge',
                data: {id: id},
                success: function(){
                    $('#validemodal').modal('hide');
                    $('#reussimodal').modal('show');
                     
                    // Ajouter un délai de 3 secondes avant de fermer le modal
                    setTimeout(function(){
                        $('#reussimodal').modal('hide');
                    }, 2000);
                    showTable();
                }
            });
        });

        $('#rejet_id').click(function(){
            var id = $(this).val();
            $.ajax({
                type: 'POST',
                url: url + 'leave/rejetconge',
                data: {id: id},
                success: function(){
                    $('#rejetmodal').modal('hide');
                    $('#reussimodal').modal('show');
                    
                    // Ajouter un délai de 3 secondes avant de fermer le modal
                    setTimeout(function(){
                        $('#reussimodal').modal('hide');
                    }, 2000);

                    showTable();
                }
            });
        });


        $(document).ready(function() {

            function formatDateToYMD(dateString) {
    var parts = dateString.split('/');
    if (parts.length === 3) {
        // parts[2] contient l'année, parts[1] le mois et parts[0] le jour
        var year = parts[2];
        var month = parts[1];
        var day = parts[0];
        // Vous pouvez maintenant former la date au format "Y-m-d"
        return year + '-' + month + '-' + day;
    }
    return dateString; // En cas d'erreur ou de format inattendu
}




            $(document).on('click', '.leaveapp', function(){
           
            var iid = $(this).attr('data-id');
                    $('#leaveapply').trigger("reset");
                    $('#appmodel').modal('show');
                    $.ajax({
                        url: 'LeaveAppbyid?id=' + iid,
                        method: 'GET',
                        data: '',
                        dataType: 'json',
                    }).done(function(response) {
                        // console.log(response);
                        // Populate the form fields with the data returned from server
                        $('#leaveapply').find('[name="id"]').val(response.leaveapplyvalue.id).end();
                        $('#leaveapply').find('[name="emid"]').val(response.leaveapplyvalue.em_id).end();
                        $('#leaveapply').find('[name="applydate"]').val(response.leaveapplyvalue.apply_date).end();
                        $('#leaveapply').find('[name="typeid"]').val(response.leaveapplyvalue.typeid).end();
                       
                        $('#leaveapply').find('[name="startdate"]').val(formatDateToYMD(response.leaveapplyvalue.start_date));
                        $('#leaveapply').find('[name="enddate"]').val(formatDateToYMD(response.leaveapplyvalue.end_date));

                        $('#leaveapply').find('[name="reason"]').val(response.leaveapplyvalue.reason).end();
                        $('#leaveapply').find('[name="status"]').val(response.leaveapplyvalue.leave_status).end();

                        if(response.leaveapplyvalue.leave_type == 'Half day') {
                            $('#appmodel').find(':radio[name=type][value="Half Day"]').prop('checked', true).end();
                            $('#hourAmount').show().end();
                            $('#enddate').hide().end();
                        } else if(response.leaveapplyvalue.leave_type == 'Full Day') {
                            $('#appmodel').find(':radio[name=type][value="Full Day"]').prop('checked', true).end();
                            $('#hourAmount').hide().end();
                        } else if(response.leaveapplyvalue.leave_type == 'More than One day'){
                            $('#appmodel').find(':radio[name=type][value="More than One day"]').prop('checked', true).end();
                            $('#hourAmount').hide().end();
                            $('#enddate').show().end();
                        }

                        $('#hourAmountVal').val(response.leaveapplyvalue.leave_duration).show().end();
                    });
                });
            });


            $('.fetchLeaveTotal').click(function() {
            
            var em_id = $('#em_id').val();
            if (em_id !== "") {
                
                $.ajax({
                    type: 'POST',
                    url: url + 'leave/getLeaveDays',
                    data: {
                        em_id: em_id
                    },
                    dataType: 'json',
                    success: function(data) {
                        if (data.nb_jour) {
                            $('#total').text('Nombre de jours de congé : ' + data.nb_jour);
                        }
                    }

                });
            }
        });
        
    






        });



    })(jQuery); // Vous devez envelopper votre code dans une fonction et la passer à jQuery
</script>









        <script>
        /*DATETIME PICKER*/
          $("#bbbSubmit").on("click", function(event){
              event.preventDefault();
              var typeid = $('.typeid').val();
              var datetime = $('.mydatetimepicker').val();
              var emid = $('.emid').val();
              //console.log(datetime);
              $.ajax({
                  url: "GetemployeeGmLeave?year="+datetime+"&typeid="+typeid+"&emid="+emid,
                  type:"GET",
                  dataType:'',
                  data:'data',          
                  success: function(response) {
                      // console.log(response);
                      $('.leaveval').html(response);             
                  },
                  error: function(response) {
                    // console.log(response);
                  }
              });
          });			
        </script>  


        <script type="text/javascript">
        /*PARSE DURATION DATA*/
        $('.duration').on('input',function() {
            var day = parseInt($('.duration').val());
            var hour = 8;
            $('.totalhour').val((day * hour ? day * hour : 0).toFixed(2));
        });
        </script>
<script>
  $(".Status").on("click", function(event){
      event.preventDefault();
      // console.log($(this).attr('data-value'));
      $.ajax({
          url: "approveLeaveStatus",
          type:"POST",
          data:
          {
              'employeeId': $(this).attr('data-employeeId'),
              'lid': $(this).attr('data-id'),
              'lvalue': $(this).attr('data-value'),
              'duration': $(this).attr('data-duration'),
              'type': $(this).attr('data-type')
          },
          success: function(response) {
            // console.log(response);
            $(".message").fadeIn('fast').delay(30000).fadeOut('fast').html(response);
            window.setTimeout(function(){location.reload()}, 30000);
          },
          error: function(response) {
            //console.error();
          }
      });
  });           
</script>

<!-- RECUPERER LA VALEUR OPTION SELECT ID ET NOM PRENOMS-->

<script>
    // Récupérer les éléments select
    const emIdSelect = document.getElementById('em_id');
    const employeeNameSelect = document.getElementById('employee_name');

    // Ajouter un gestionnaire d'événements de changement à emIdSelect
    emIdSelect.addEventListener('change', function () {
        // Obtenir la valeur sélectionnée dans emIdSelect
        const selectedEmId = emIdSelect.value;

        // Trouver l'option correspondante dans employeeNameSelect
        const employeeNameOption = employeeNameSelect.querySelector(`option[value="${selectedEmId}`);

        // Sélectionner l'option dans employeeNameSelect
        employeeNameOption.selected = true;
    });

    // Ajouter un gestionnaire d'événements de changement à employeeNameSelect
    employeeNameSelect.addEventListener('change', function () {
        // Obtenir la valeur sélectionnée dans employeeNameSelect
        const selectedEmployeeName = employeeNameSelect.value;

        // Trouver l'option correspondante dans emIdSelect
        const emIdOption = emIdSelect.querySelector(`option[value="${selectedEmployeeName}"]`);

        // Sélectionner l'option dans emIdSelect
        emIdOption.selected = true;
    });
</script>






<script type="text/javascript">

            
        </script>                     
<?php $this->load->view('backend/footer'); ?>