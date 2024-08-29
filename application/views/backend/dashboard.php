<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
<?php 
    $id = $this->session->userdata('user_login_id');
    $nbjour = $this->dashboard_model->Getidconge($id); 
   
   
                       
?> 
      <div class="page-wrapper">
            <div class="message"></div>
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-tachometer" aria-hidden="true"></i> Tableau de bord</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Accueil</a></li>
                        <li class="breadcrumb-item active">Tableau de bord</li>
                    </ol>
                </div>
            </div>
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->




               
        <div class="row">
        <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>

          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>
                <?php 
                    echo $nbjour->nb_jour
                ?></h3>

                <p>Solde congé</p>
              </div>
              <div class="icon">
                <i class="ion ion-calendar"></i>
                
             
              </div>
             <!-- <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
            </div>
          </div>

          <?php if($this->session->userdata('sexe')== 'Femme'){ ?>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>
                <?php 
                    echo $nbjour->maternite
                ?></h3>

                <p>Maternité</p>
              </div>
              <div class="icon">
                <i class="ion ion-calendar"></i>
              </div>
             <!-- <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
            </div>
          </div>
          <?php } else { ?>
            <?php } ?>
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>
                <?php 
                    echo $nbjour->maladie
                ?></h3>

                <p>Maladie</p>
              </div>
              <div class="icon">
                <i class="ion ion-ios-medkit"></i>
              </div>
             <!-- <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>
                <?php 
                    echo $nbjour->except
                ?></h3>

                <p>Exceptionnel</p>
              </div>
              <div class="icon">
                <i class="ion ion-arrow-graph-up-right"></i>
              </div>
             <!-- <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
            </div>
          </div>
          <!-- ./col -->
          <?php } else { ?>

            <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>
                    <?php 
                        $this->db->where('status','ACTIF');
                        $this->db->where('em_id !=', 'T0000');
                        $this->db->from("employee");
                        echo $this->db->count_all_results();
                    ?>
                </h3>

                <p>Personnels Actif</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-stalker"></i>
              </div>
              <a href="<?php echo base_url(); ?>employee/Employees" class="small-box-footer">Details <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->





          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>
                <?php 
                    $this->db->where('status','INACTIF');
                    $this->db->from("employee");
                    echo $this->db->count_all_results();
                ?>
                </h3>

                <p> Personnels Inactif</p>
              </div>
              <div class="icon">
                <i class="ion ion-person"></i>
              </div>
              <a href="<?php echo base_url(); ?>employee/Inactive_Employee" class="small-box-footer">Details <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>
                <?php 
                        $this->db->where('status','ACTIF');
                        $this->db->where('em_id !=', 'T0000');
                        $this->db->where('em_gender !=', 'Homme');
                        $this->db->from("employee");
                        echo $this->db->count_all_results();
                    ?>
                </h3>

                <p>Homme</p>
              </div>
              <div class="icon">
                <i class="ion ion-man "></i>
              </div>
              <a href="<?php echo base_url(); ?>employee/Employees" class="small-box-footer">Details <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>
                <?php 
                        $this->db->where('status','ACTIF');
                        $this->db->where('em_id !=', 'T0000');
                        $this->db->where('em_gender !=', 'Femme');
                        $this->db->from("employee");
                        echo $this->db->count_all_results();
                    ?>
                </h3>

                <p>Femme</p>
              </div>
              <div class="icon">
                <i class="ion ion-woman"></i>
              </div>
              <a href="<?php echo base_url(); ?>employee/Employees" class="small-box-footer">Details <i class="fa fa-arrow-circle-right"></i></a>
             </div>
          </div>
        <!--   ./col -->

          <?php } ?>
        </div>
        <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>

        
        <?php } else { ?>
        <div class="row">
        

          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-light">
              <div class="inner">
              <h4>Personnes present</h4>


              <?php
                // ...

                // Obtenir toutes les dates uniques de la table "pointage"
                $sqlDates = "SELECT DISTINCT Date FROM pointage";
                $queryDates = $this->db->query($sqlDates);
                $dates = $queryDates->result();

                // Commencez un tableau HTML avec DataTables
                echo '<table border="1" id="Table_absent">';
                echo '<thead><tr><th>Date</th><th>Nombre des P. Presents</th></tr></thead>';
                echo '<tbody>';

                foreach ($dates as $date) {
                    $sqlAbsent = "SELECT sName, ? AS 'Date'
                        FROM pointage 
                        WHERE sName != 'T0000' AND Date = ?";
                    $queryAbsent = $this->db->query($sqlAbsent, array($date->Date, $date->Date));
                    $absentList = $queryAbsent->result();

                    // Compter le nombre d'employés absents pour cette date
                    $numberOfAbsentEmployees = count($absentList);

                    // Afficher chaque ligne du tableau
                    echo '<tr>';
                    echo "<td>{$date->Date}</td>";
                    echo "<td>{$numberOfAbsentEmployees}</td>";
                    echo '</tr>';
                }

                echo '</tbody>';
                echo '</table>';

                // ...

                ?>

                <script>
                $(document).ready(function() {
                    $('#Table_absent').DataTable();
                    
                });
                </script>





             </div>
              <div class="icon">
               
              </div>
              <a href="#" class="small-box-footer footer1">Details <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>

          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-light">
              <div class="inner">
                    <h4>Nombre d'absences</h4>


              <?php
                // ...

                // Obtenir toutes les dates uniques de la table "pointage"
                 // $sqlDates = "SELECT DISTINCT Date FROM pointage";
                $sqlDates = "SELECT DISTINCT Date FROM pointage WHERE DAYOFWEEK(STR_TO_DATE(Date, '%d/%m/%Y')) NOT IN (1, 7)";
   
                $queryDates = $this->db->query($sqlDates);
                $dates = $queryDates->result();

                // Commencez un tableau HTML avec DataTables
                echo '<table border="1" id="Table_absent1">';
                echo '<thead><tr><th>Date</th><th>Nombre P.Absents</th></tr></thead>';
                echo '<tbody>';

                foreach ($dates as $date) {
                    $sqlAbsent = "SELECT p.id, p.em_id, ? AS 'Date'

                        FROM employee p
                        WHERE p.em_id != 'T0000' AND p.em_id NOT IN (SELECT DISTINCT sName FROM pointage WHERE Date = ?)";
                    $queryAbsent = $this->db->query($sqlAbsent, array($date->Date, $date->Date));
                    $absentList = $queryAbsent->result();

                    // Compter le nombre d'employés absents pour cette date
                    $numberOfAbsentEmployees = count($absentList);

                    // Afficher chaque ligne du tableau
                    echo '<tr>';
                    echo "<td>{$date->Date}</td>";
                    echo "<td>{$numberOfAbsentEmployees}</td>";
                    echo '</tr>';
                }

                echo '</tbody>';
                echo '</table>';

                // ...

                ?>

                <script>
                $(document).ready(function() {
                    $('#Table_absent1').DataTable();
                    
                });
                </script>





             </div>
              <div class="icon">
               
              </div>
              <a href="#" class="small-box-footer footer1">Details <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
        </div>



        <?php } ?>




                    <!-- Column -->
                    <!-- Column

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-row">
                                    <div class="round align-self-center round-info"><i class="ti-file"></i></div>
                                    <div class="m-l-10 align-self-center">
                                        <h3 class="m-b-0">
                                             <?php 
                                                    $this->db->where('leave_status','Approve');
                                                    $this->db->from("emp_leave");
                                                    echo $this->db->count_all_results();
                                                ?> Leaves
                                        </h3>
                                        <a href="<?php echo base_url(); ?>leave/Application" class="text-muted m-b-0">View Details</a>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                     <!-- 
                    <!-- Column 
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-row">
                                    <div class="round align-self-center round-danger"><i class="ti-calendar"></i></div>
                                    <div class="m-l-10 align-self-center">
                                        <h3 class="m-b-0"> 
                                         <?php 
                                                $this->db->where('pro_status','running');
                                                $this->db->from("project");
                                                echo $this->db->count_all_results();
                                            ?> Projects
                                        </h3>
                                        <a href="<?php echo base_url(); ?>Projects/All_Projects" class="text-muted m-b-0">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     
               

                <div class="row ">
                     
                    <div class="col-md-6 col-lg-3 col-xlg-3">
                        <div class="card card-inverse card-info">
                            <div class="box bg-primary text-center">
                                <h1 class="font-light text-white">
                                    <?php 
                                        $this->db->where('status','INACTIVE');
                                        $this->db->from("employee");
                                        echo $this->db->count_all_results();
                                    ?>
                                </h1>
                                <h6 class="text-white">Former Employees</h6>
                            </div>
                        </div>
                    </div>
                  
                    <div class="col-md-6 col-lg-3 col-xlg-3">
                        <div class="card card-info card-inverse">
                            <div class="box text-center">
                                <h1 class="font-light text-white">
                                             <?php 
                                                    $this->db->where('leave_status','Not Approve');
                                                    $this->db->from("emp_leave");
                                                    echo $this->db->count_all_results();
                                                ?> 
                                </h1>
                                <h6 class="text-white">Pending Leave Application</h6>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-3 col-xlg-3">
                        <div class="card card-inverse card-danger">
                            <div class="box text-center">
                                <h1 class="font-light text-white">
                                     <?php 
                                            $this->db->where('pro_status','upcoming');
                                            $this->db->from("project");
                                            echo $this->db->count_all_results();
                                        ?> 
                                </h1>
                                <h6 class="text-white">Upcoming Project</h6>
                            </div>
                        </div>
                    </div>
                  
                    <div class="col-md-6 col-lg-3 col-xlg-3">
                        <div class="card card-inverse card-success">
                            <div class="box text-center">
                                <h1 class="font-light text-white">
                                         <?php 
                                                $this->db->where('status','Granted');
                                                $this->db->from("loan");
                                                echo $this->db->count_all_results();
                                            ?> 
                                </h1>
                                <h6 class="text-white">Loan Application</h6>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!--
            </div> 
            <div class="container-fluid">
                <?php $notice = $this->notice_model->GetNoticelimit(); 
                $running = $this->dashboard_model->GetRunningProject(); 
                $userid = $this->session->userdata('user_login_id');
                $todolist = $this->dashboard_model->GettodoInfo($userid);                 
                $holiday = $this->dashboard_model->GetHolidayInfo();                 
                ?>
               
                <div class="row">
                    
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Running Project/s</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" style="height:600px;overflow-y:scroll">
                                    <table class="table table-bordered table-hover earning-box">
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <?php foreach($running AS $value): ?>
                                            <tr style="vertical-align:top;">
                                                <td><a href="<?php echo base_url(); ?>Projects/view?P=<?php echo base64_encode($value->id); ?>"><?php echo substr("$value->pro_name",0,25).'...'; ?></a></td>
                                                <td><?php echo $value->pro_start_date; ?></td>
                                                <td><?php echo $value->pro_end_date; ?></td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Column 
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">To Do list</h4>
                                <h6 class="card-subtitle">List of your next task to complete</h6>
                                <div class="to-do-widget m-t-20" style="height:550px;overflow-y:scroll">
                                            <ul class="list-task todo-list list-group m-b-0" data-role="tasklist">
                                               <?php foreach($todolist as $value): ?>
                                                <li class="list-group-item" data-role="task">
                                                   <?php if($value->value == '1'){ ?>
                                                    <div class="checkbox checkbox-info">
                                                        <input class="to-do" data-id="<?php echo $value->id?>" data-value="0" type="checkbox" id="<?php echo $value->id?>" >
                                                        <label for="<?php echo $value->id?>"><span><?php echo $value->to_dodata; ?></span></label>
                                                    </div>
                                                    <?php } else { ?>
                                                    <div class="checkbox checkbox-info">
                                                        <input class="to-do" data-id="<?php echo $value->id?>" data-value="1" type="checkbox" id="<?php echo $value->id?>" checked>
                                                        <label class="task-done" for="<?php echo $value->id?>"><span><?php echo $value->to_dodata; ?></span></label>
                                                    </div> 
                                                    <?php } ?>                                                   
                                                </li>

                                                <?php endforeach; ?>
                                            </ul>                                    
                                </div>
                                <div class="new-todo">
                                   <form method="post" action="add_todo" enctype="multipart/form-data" id="add_todo" >
                                    <div class="input-group">
                                        <input type="text" name="todo_data" class="form-control" style="border: 1px solid #fff !IMPORTANT;" placeholder="Enter New Task...">
                                        <span class="input-group-btn">
                                        <input type="hidden" name="userid" value="<?php echo $this->session->userdata('user_login_id'); ?>">
                                        <button type="submit" class="btn btn-success todo-submit"><i class="fa fa-plus"></i></button>
                                        </span> 
                                    </div>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Notice Board</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive slimScrollDiv" style="height:600px;overflow-y:scroll">
                                    <table class="table table-hover table-bordered earning-box ">
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>File</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <?php foreach($notice AS $value): ?>
                                            <tr class="scrollbar" style="vertical-align:top">
                                                <td><?php echo $value->title ?></td>
                                                <td><mark><a href="<?php echo base_url(); ?>assets/images/notice/<?php echo $value->file_url ?>" target="_blank"><?php echo $value->file_url ?></a></mark>
                                                </td>
                                                <td style="width:100px"><?php echo $value->date ?></td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">
                                    Holidays
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive" style="height:600px;overflow-y:scroll">
                                    <table class="table table-hover table-bordered earning-box">
                                       <thead>
                                            <tr>
                                                <th>Holiday Name</th>
                                                <th>Date</th>
                                            </tr>                                           
                                       </thead>
                                       <tbody>
                                          <?php foreach($holiday as $value): ?>
                                           <tr style="background-color:#e3f0f7">
                                               <td><?php echo $value->holiday_name ?></td>
                                               <td><?php echo $value->from_date; ?></td>
                                           </tr>
                                           <?php endforeach ?>
                                       </tbody> 
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                                          -->
                </div> 
<script>
  $(".to-do").on("click", function(){
      //console.log($(this).attr('data-value'));
      $.ajax({
          url: "Update_Todo",
          type:"POST",
          data:
          {
          'toid': $(this).attr('data-id'),         
          'tovalue': $(this).attr('data-value'),
          },
          success: function(response) {
              location.reload();
          },
          error: function(response) {
            console.error();
          }
      });
  });			
</script>       
<?php $this->load->view('backend/footer'); ?>