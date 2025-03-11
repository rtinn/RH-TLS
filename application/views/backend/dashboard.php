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



<!--REPARTITIONS PAR DEPARTEMENTS-->
        <div class="row">
        <div class="col-lg-6 col-6">
            <div class="small-box bg-light">
                <div class="inner">
                    <h4>Effectifs par departements</h4>
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#b">Barres</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#d">Doughnut</a>
                            </li>
                         </ul>

                <div class="tab-content">
                    <div id="b" class="container tab-pane active">
           
                     <canvas id="employeeBarChart" width="400" height="200"></canvas>

                    </div>
                    <div id="d" class="container tab-pane fade">
           
                     <canvas id="employeeDoughnutChart" width="400" height="200"></canvas>

                    </div>
                </div>

                </div>
                </div>
            </div>


<!--REPARTITIONS PAR DEPARTEMENTS-->

<!--TRANCHE D'AGE-->

                <div class="col-lg-6 col-6">

                    <div class="small-box bg-light">
                        <div class="inner">
                    <h4>Graphique de répartition par tranche d'âge</h4>


                <ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
			  <a class="nav-link active" data-toggle="tab" href="#3">Barres</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" data-toggle="tab" href="#4">Doughnut</a>
			</li>
		  </ul>

          <div class="tab-content">
            <div id="3" class="container tab-pane active">
           
            <canvas id="ageChart" width="400" height="200"></canvas>
                        
            </div>

            <div id="4" class="container tab-pane fade">
            
                <canvas id="ageChart1" width="400" height="200"></canvas>
                   </div>
        </div>
      
        </div>  
    </div>  
</div>           
              
        </div>
<!--TRANCHE D'AGE-->

<!--ETAT DE PRESENCES-->
<div class="row">  
    <div class="col-lg-12 col-6">
        <div class="small-box bg-light">
            <div class="inner">
               <h4>Etat des Présences et Absences par Date</h4>
               <canvas id="attendanceChart" width="400" height="200"></canvas>
                <div id="pagination" style="text-align: center; margin-top: 20px;">
                    <button class="btn btn-info"id="prevPage1">Précédent</button>
                    <button class="btn btn-info" id="nextPage1">Suivant</button>
                </div>
            </div>
        </div>
    </div> 
</div>

<!--FIN ETAT DE PRESENCES-->


<!--GRAPHIDE TAUX DE PRESENCES PAR DATE-->

<div class="row">
    <div class="col-lg-6 col-6">
            <!-- small box -->
        <div class="small-box bg-light">
            <div class="inner">
            <h4>Nombre de presences</h4>

<!--


                    <h5>Graphique du Taux de Présence par Date</h5>
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#1">Barres</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#2">Doughnut</a>
                        </li>
                    </ul>
                <div class="tab-content">
                    <div id="1" class="container tab-pane active">
                        <h5>Graphique du Taux de Présence par Date (Barres)</h5>
                        <canvas id="barChart" width="400" height="200"></canvas>
                    </div>

                    <div id="2" class="container tab-pane fade">
                        <h5 style="margin-top: 50px;">Graphique du Taux de Présence par Date (Doughnut)</h5>
                        <canvas id="doughnutChart" width="400" height="200"></canvas>
                    </div>
                </div>
                <!-- Boutons de pagination --
                    <div style="text-align: center; margin-top: 20px;">
                        <button class="btn btn-info" id="prevPage" disabled>Précédent</button>
                        <button class="btn btn-info" id="nextPage">Suivant</button>
                    </div>  

<!--FIN GRAPHIDE TAUX DE PRESENCES PAR DATE-->


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
                $sqlDates = "SELECT DISTINCT Date FROM pointage WHERE Date ";
   
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
                
                <a href="#" class="small-box-footer footer1">Details <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
</div>



<div class="row">
            <!-- STATISTIQUES DE GENRE PAR DEPARTEMENTS -->
    <div class="col-lg-6 col-6">
        <!-- small box -->
        <div class="small-box bg-light">
            <div class="inner">
                <h4>Statistiques de Genre par Département</h4>
                <canvas id="genderChart" width="400" height="200"></canvas>
            </div>
        </div>
    </div>
 <!-- FIN STATISTIQUES DE GENRE PAR DEPARTEMENTS -->

 <!-- DEBUT STATISTIQUES DE GENRE PAR DEPARTEMENTS -->
    <div class="col-lg-6 col-6">
        <!-- small box -->
        <div class="small-box bg-light">
            <div class="inner">
                <h4>Statistiques de Genre par Département</h4>
                <canvas id="contractChart" width="400" height="200"></canvas>
            </div>
        </div>
    </div>
 <!-- FIN STATISTIQUES DE GENRE PAR DEPARTEMENTS -->
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
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';
            // Appel AJAX pour récupérer les données de l'API age_distribution

//DISTRUBITION PAR AGE

            $.ajax({
                url: url + 'dashboard/age_distribution',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Créer le graphique avec les données renvoyées par AJAX
                    var ctx = document.getElementById('ageChart').getContext('2d');
                    var ageChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['18-25', '26-35', '36-45', '46-55', '56+'],
                            datasets: [{
                                label: 'Nombre d\'employés par tranche d\'âge',
                                data: [
                                    data['18-25'],
                                    data['26-35'],
                                    data['36-45'],
                                    data['46-55'],
                                    data['56+']
                                ],
                                backgroundColor: [
                                    'rgba(0,92,0,0.64)'
                                
                                ],
                                
                                borderColor: [
                                   
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1
                                
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Erreur lors de la récupération des données: ", error);
                }
            });


            // Appel AJAX pour récupérer les données de l'API age_distribution
            $.ajax({
                url: url + 'dashboard/age_distribution',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Créer le Donut Chart avec les données renvoyées par AJAX
                    var ctx = document.getElementById('ageChart1').getContext('2d');
                    var ageChart = new Chart(ctx, {
                        type: 'doughnut', // Type de graphique: Donut (doughnut)
                        data: {
                            labels: ['18-25', '26-35', '36-45', '46-55', '56+'],
                            datasets: [{
                                label: 'Nombre d\'employés par tranche d\'âge',
                                data: [
                                    data['18-25'],
                                    data['26-35'],
                                    data['36-45'],
                                    data['46-55'],
                                    data['56+']
                                ],
                                backgroundColor: [
                                   'rgba(75, 192, 192, 0.5)',
                                'rgba(255, 99, 132, 0.5)',
                                'rgba(54, 162, 235, 0.5)',
                                'rgba(255, 206, 86, 0.5)',
                                'rgba(75, 192, 192, 0.5)'
                                ],
                                borderColor: [
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'top',  // Positionnement de la légende
                                },
                                tooltip: {
                                    enabled: true  // Active les infobulles
                                }
                            }
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Erreur lors de la récupération des données: ", error);
                }
            });

         





    });
    </script>


 <script>
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';

            // Effectuer une requête AJAX pour obtenir les statistiques de genre
            $.ajax({
                url: url + 'dashboard/gender_statistics',
                type: 'GET',
                dataType: 'json',
                success: function(genderData) {
                    // Traiter les données reçues
                    const departments = Object.keys(genderData);
                    const maleData = departments.map(dep => genderData[dep]['Homme'] || 0);
                    const femaleData = departments.map(dep => genderData[dep]['Femme'] || 0);

                    // Configurer le graphique Chart.js
                    const ctx = document.getElementById('genderChart').getContext('2d');
                    const genderChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: departments,
                            datasets: [
                                {
                                    label: 'Hommes',
                                    data: maleData,
                                    backgroundColor: '#ffb22b',
                                   /*
                                    borderColor: 'rgba(54, 162, 235, 1)',
                                    borderWidth: 1
                                    */
                                },
                                {
                                    label: 'Femmes',
                                    data: femaleData,
                                    backgroundColor: '#28a745',
                                    /*
                                    borderColor: 'rgba(255, 99, 132, 1)',
                                    borderWidth: 1
                                    */
                                }
                            ]
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Erreur lors du chargement des données :", error);
                }
            });
        });
    </script>



<!-- STATISTIQUE TYPE DE CONTRAT PAR DEPARTEMENTS-->

<script>
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';

            // Requête AJAX pour obtenir les statistiques de contrat
            $.ajax({
                url: url + 'dashboard/contract_statistics',
                type: 'GET',
                dataType: 'json',
                success: function(contractData) {
                    // Traiter les données
                    const departments = Object.keys(contractData);
                    const contractTypes = Array.from(new Set(departments.flatMap(dep => Object.keys(contractData[dep]))));
                    
                    const datasets = contractTypes.map(type => ({
                        label: type,
                        data: departments.map(dep => contractData[dep][type] || 0),
                        backgroundColor: type === 'CDI' ? 'rgba(75, 192, 192, 0.6)' : 'rgba(153, 102, 255, 0.6)',
                        borderColor: type === 'CDI' ? 'rgba(75, 192, 192, 1)' : 'rgba(153, 102, 255, 1)',
                        borderWidth: 1
                    }));

                    // Configurer le graphique avec Chart.js
                    const ctx = document.getElementById('contractChart').getContext('2d');
                    const contractChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: departments,
                            datasets: datasets
                        },
                        options: {
                            responsive: true,
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Erreur lors du chargement des données :", error);
                }
            });
        });
    </script>







<!-- COMPARAISONS D'ETAT DE PRESENCES ET ABSENCES-->
<script>
        $(document).ready(function() {
            var url = '<?php echo base_url(); ?>';  // URL de base de l'application
            var currentPage = 0;
            var pageSize = 10;
            var allData = [];
            window.attendanceChart = null;  // Initialiser le graphique comme null

            // Charger les données via AJAX
            $.ajax({
                url: url + 'dashboard/get_data',  // Assurez-vous que cette URL est correcte
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    allData = data;  // Enregistrer toutes les données
                    console.log(allData);  // Vérifier les données dans la console
                    renderChart();    // Afficher la première page du graphique
                },
                error: function() {
                    alert("Erreur lors du chargement des données");
                }
            });

            // Fonction pour afficher le graphique pour la page actuelle
            function renderChart() {
                // Calculer les données de la page actuelle
                var paginatedData = allData.slice(currentPage * pageSize, (currentPage + 1) * pageSize);
                var labels = paginatedData.map(item => item.date);
                var presenceCounts = paginatedData.map(item => item.presence);
                var absenceCounts = paginatedData.map(item => item.absence);

                // Détruire le graphique existant si nécessaire
                if (window.attendanceChart) {
                    window.attendanceChart.destroy();
                }

                // Créer un nouveau graphique
                var ctx = document.getElementById('attendanceChart').getContext('2d');
                window.attendanceChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [
                            {
                                label: 'Présences',
                                data: presenceCounts,
                                backgroundColor: 'rgba(0,1,255,0.57)',
                               
                               
                            },
                            {
                                label: 'Absences',
                                data: absenceCounts,
                                backgroundColor: 'rgba(255,0,0,0.61)',
                               
                                
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            title: {
                                display: true,
                                text: 'Comparaison des Présences et Absences par Date'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Nombre d\'employés'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Date'
                                }
                            }
                        }
                    }
                });
            }

            // Gestion des boutons de pagination
            $('#prevPage1').click(function() {
                if (currentPage > 0) {
                    currentPage--;
                    renderChart();
                }
            });

            $('#nextPage1').click(function() {
                if ((currentPage + 1) * pageSize < allData.length) {
                    currentPage++;
                    renderChart();
                }
            });
        });
    </script>




<script>
    $(document).ready(function() {
        var url = '<?php echo base_url(); ?>';
        const itemsPerPage = 7;  // Nombre de dates par page
        let currentPage = 0;  // Page actuelle
        let labels = [];
        let values = [];

        // Appel AJAX pour récupérer les données de présence par date
        $.ajax({
            url: url + 'dashboard/presence_rate',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                // Stocker les dates et valeurs dans des tableaux
                labels = Object.keys(data);
                values = Object.values(data);

                // Afficher la première page des graphiques
                updateCharts();
            },
            error: function(xhr, status, error) {
                console.error("Erreur lors de la récupération des données: ", error);
            }
        });

        // Mettre à jour les deux graphiques (barres et doughnut) avec la page actuelle
        function updateCharts() {
            const paginatedLabels = labels.slice(currentPage * itemsPerPage, (currentPage + 1) * itemsPerPage);
            const paginatedValues = values.slice(currentPage * itemsPerPage, (currentPage + 1) * itemsPerPage);

            const barCtx = document.getElementById('barChart').getContext('2d');
            const doughnutCtx = document.getElementById('doughnutChart').getContext('2d');

            const chartData = {
                labels: paginatedLabels,
                datasets: [{
                    label: 'Taux de Présence',
                    data: paginatedValues,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(199, 199, 199, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(199, 199, 199, 1)'
                    ],
                    borderWidth: 1
                }]
            };

            // Vérifiez si les graphiques existent déjà avant de les détruire
            if (window.barChart && typeof window.barChart.destroy === 'function') {
                window.barChart.destroy();
            }
            if (window.doughnutChart && typeof window.doughnutChart.destroy === 'function') {
                window.doughnutChart.destroy();
            }

            // Créer le graphique en barres
            window.barChart = new Chart(barCtx, {
                type: 'bar',
                data: chartData,
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 200
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'top'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return paginatedLabels[tooltipItem.dataIndex] + ': ' + paginatedValues[tooltipItem.dataIndex];
                                }
                            }
                        }
                    }
                }
            });

            // Créer le graphique en doughnut
            window.doughnutChart = new Chart(doughnutCtx, {
                type: 'doughnut',
                data: chartData,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return paginatedLabels[tooltipItem.dataIndex] + ': ' + paginatedValues[tooltipItem.dataIndex];
                                }
                            }
                        }
                    }
                }
            });

            // Gérer l'état des boutons de pagination
            document.getElementById('prevPage').disabled = currentPage === 0;
            document.getElementById('nextPage').disabled = (currentPage + 1) * itemsPerPage >= labels.length;
        }

        // Événements des boutons Précédent et Suivant
        $('#prevPage').click(function() {
            if (currentPage > 0) {
                currentPage--;
                updateCharts();
            }
        });

        $('#nextPage').click(function() {
            if ((currentPage + 1) * itemsPerPage < labels.length) {
                currentPage++;
                updateCharts();
            }
        });
    });
</script>

<script>
    $(document).ready(function() {
        var url = '<?php echo base_url(); ?>';
        
        // Appel AJAX pour récupérer les données depuis le contrôleur
        $.ajax({
            url: url + 'dashboard/employeedepartement',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                // Extraction des labels (dep_id) et des données (effectifs)
                const departments = data.map(item => item.dep_id);
                const counts = data.map(item => parseInt(item.count, 10)); // Convertit en entier

                // Création du bar chart avec Chart.js
                const ctxBar = document.getElementById('employeeBarChart').getContext('2d');
                const employeeBarChart = new Chart(ctxBar, {
                    type: 'bar', // Type de graphique en barres
                    data: {
                        labels: departments,
                        datasets: [{
                            label: 'Nombre d\'employés par département',
                            data: counts,
                            backgroundColor: 'rgba(0,92,0,0.64)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // Création du doughnut chart avec Chart.js
                const ctxDoughnut = document.getElementById('employeeDoughnutChart').getContext('2d');
                const employeeDoughnutChart = new Chart(ctxDoughnut, {
                    type: 'doughnut', // Type de graphique en doughnut
                    data: {
                        labels: departments,
                        datasets: [{
                            label: 'Nombre d\'employés par département',
                            data: counts,
                            backgroundColor: [
                                'rgba(75, 192, 192, 0.5)',
                                'rgba(255, 99, 132, 0.5)',
                                'rgba(54, 162, 235, 0.5)',
                                'rgba(255, 206, 86, 0.5)',
                                'rgba(75, 192, 192, 0.5)',
                                'rgba(153, 102, 255, 0.5)',
                                'rgba(255, 159, 64, 0.5)',
                                'rgba(201, 203, 207, 0.5)'
                            ],
                            borderColor: [
                                'rgba(75, 192, 192, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(201, 203, 207, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(tooltipItem) {
                                        return tooltipItem.label + ': ' + tooltipItem.raw; // Affiche le nombre d'employés
                                    }
                                }
                            }
                        }
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error("Erreur lors de la récupération des données:", error);
            }
        });
    });
</script>

<?php $this->load->view('backend/footer'); ?>