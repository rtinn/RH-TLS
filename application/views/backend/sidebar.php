        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- User profile -->
                        <?php 
                        $id = $this->session->userdata('user_login_id');
                        $basicinfo = $this->employee_model->GetBasic($id); 
                       
                        ?>                
                <div class="user-profile">
                    <!-- User profile image -->
                    <div class="profile-img"> <img src="<?php echo base_url(); ?>uploads/users/<?php echo $basicinfo->em_image ?>" alt="user" />
                        <!-- this is blinking heartbit-->
                        <!-- <div class="notify setpos"> <span class="heartbit"></span> <span class="point"></span> </div> -->
                    </div>

                    <!-- User profile text-->
                    <div class="profile-text">
                        <h5><?php echo $basicinfo->first_name.' '.$basicinfo->last_name; ?></h5>
                        <?php if($this->session->userdata('user_type')== 'EMPLOYEE' || $this->session->userdata('user_type') == 'N+1'){ ?>
                         
                        <?php } else { ?>

                        <a href="<?php echo base_url(); ?>settings/Settings" class="dropdown-toggle u-dropdown" role="button" aria-haspopup="true" aria-expanded="true" title="Paramètres"><i class="mdi mdi-settings"></i></a>
                        <?php } ?>

                        <a href="<?php echo base_url(); ?>login/logout" class="" data-toggle="tooltip" title="Deconnexion"><i class="mdi mdi-power"></i></a>
                    </div>
                </div>
                <!-- End User profile text-->
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li> <a href="<?php echo base_url(); ?>" ><i class="mdi mdi-gauge"></i><span class="hide-menu">Tableau de bord </span></a></li>
                        <?php if($this->session->userdata('user_type')=='EMPLOYEE'){ ?>

                            
                   
                    <li><a href="<?php echo base_url(); ?>employee/view?I=<?php echo base64_encode($basicinfo->em_id); ?>"><i class="mdi mdi-account-multiple"></i> Mon Profil</a></li>
                        <li><a href="<?php echo base_url(); ?>employee/Pointage"> <i class="fa fa-qrcode" aria-hidden="true"></i> Pointage</a></li>
                        <li><a href="<?php echo base_url(); ?>leave/Application"> <i class="mdi mdi-rocket" aria-hidden="true"></i> Conge</a></li>
                         
                       <!--
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-briefcase-check"></i><span class="hide-menu">Projects </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>Projects/All_Projects">Projects </a></li>
                                <li><a href="<?php echo base_url(); ?>Projects/All_Tasks"> Task List </a></li>
                                <!--<li><a href="<?php #echo base_url(); ?>Projects/All_Tasks"> Field Visit</a></li>
                            </ul>
                        </li>   
                        -->                                                                    
                        <?php } else if($this->session->userdata('user_type')=='N+1'){ ?>

                            
                   
                        <li><a href="<?php echo base_url(); ?>employee/view?I=<?php echo base64_encode($basicinfo->em_id); ?>"><i class="mdi mdi-account-multiple"></i> Mon Profil</a></li>
                        <li><a href="<?php echo base_url(); ?>employee/Nplus_un"> <i class="fa fa-qrcode" aria-hidden="true"></i> N+1</a></li>
                        
                    
                        <li><a href="<?php echo base_url(); ?>employee/Pointage"> <i class="fa fa-qrcode" aria-hidden="true"></i> Pointage</a></li>
                               
                        
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-rocket"></i><span class="hide-menu">Conge </span></a>
                            <ul aria-expanded="false" class="collapse">
                              
                                <li><a href="<?php echo base_url(); ?>leave/Application"> Demande de congé </a></li>
                                <li><a href="<?php echo base_url(); ?>leave/Application"> Demande des Autres </a></li>
                               
                            </ul>
                        </li> 

                        <?php } else { ?>
                            
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-building-o"></i><span class="hide-menu">Organisations </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url();?>organization/Department"> <i class="fa fa-circle-o"></i> Departement </a></li>
                                <li><a href="<?php echo base_url();?>organization/Designation"> <i class="fa fa-circle-o"></i> Poste</a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-account-multiple"></i><span class="hide-menu">Personnels </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>employee/Employees"> <i class="fa fa-circle-o"></i> Personnels </a></li>
                                <!--
                                <li><a href="<?php echo base_url(); ?>employee/Disciplinary">Disciplinary </a></li>
                                -->
                                <li><a href="<?php echo base_url(); ?>employee/Inactive_Employee"> <i class="fa fa-circle-o"></i> Personnels inactifs </a></li>
                                <li><a href="<?php echo base_url(); ?>employee/Planning"> <i class="fa fa-circle-o"></i> Planning Personnels </a></li>
                                <li><a href="<?php echo base_url(); ?>employee/pointage"> <i class="fa fa-circle-o"></i> Pointage</a></li>
                               
                                <li>
                                <a class = "ayam" href="<?php echo base_url();?>employee/pointage"> <i class="fa fa-circle-o"></i> Kimai
                                </a>
                                </li>
                            </ul>
                        </li>
                       
                        <!--
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-clipboard-text"></i><span class="hide-menu">Attendance </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>attendance/Attendance">Attendance List </a></li>
                                <li><a href="<?php echo base_url(); ?>attendance/Save_Attendance">Add Attendance </a></li>
                                <li><a href="<?php echo base_url(); ?>attendance/Attendance_Report">Attendance Report </a></li>
                            </ul>
                            
                        </li>
                        -->
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-account-off"></i><span class="hide-menu">Conge </span></a>
                            <ul aria-expanded="false" class="collapse">
                             <!--     <li><a href="<?php echo base_url(); ?>leave/Holidays"> Holiday </a></li>-->
                                <li><a href="<?php echo base_url(); ?>leave/leavetypes"> Type de congé</a></li>
                                <li><a href="<?php echo base_url(); ?>leave/Application"> Demande de congé </a></li>
                                <li><a href="<?php echo base_url(); ?>leave/Earnedleave"> Congé gagné </a></li>
                                <li><a href="<?php echo base_url(); ?>leave/Leave_report"> Report </a></li>
                            </ul>
                        </li>
                        <!--
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-briefcase-check"></i><span class="hide-menu">Project </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>Projects/All_Projects">Projects </a></li>
                                <li><a href="<?php echo base_url(); ?>Projects/All_Tasks"> Task List </a></li>
                                <li><a href="<?php echo base_url(); ?>Projects/Field_visit"> Field Visit</a></li>
                            </ul>
                        </li>
                        -->
                        <!--
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-receipt"></i><span class="hide-menu">Payroll </span></a>
                            <ul aria-expanded="false" class="collapse">
                                
                                <!--<li><a href="<?php #echo base_url(); ?>Payroll/Salary_Type"> Payroll Type </a></li>
                                <li><a href="<?php echo base_url(); ?>Payroll/Salary_List"> Payroll List </a></li>
                                <li><a href="<?php echo base_url(); ?>Payroll/Generate_salary"> Generate Payslip</a></li>
                                <li><a href="<?php echo base_url(); ?>Payroll/Payslip_Report"> Payslip Report</a></li>
                            </ul>
                        </li>
                        

                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-cash"></i><span class="hide-menu">Loan </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>Loan/View"> Grant Loan </a></li>
                                <li><a href="<?php echo base_url(); ?>Loan/installment"> Loan Installment</a></li>
                            </ul>
                        </li>
                    
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-grid"></i><span class="hide-menu">Assets </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="<?php echo base_url(); ?>Logistice/Assets_Category"> Assets Category </a></li>
                                <li><a href="<?php echo base_url(); ?>Logistice/All_Assets"> Asset List </a></li>
                            <li><a href="<?php #echo base_url(); ?>Logistice/View"> Logistic Support List </a></li>
                                <li><a href="<?php echo base_url(); ?>Logistice/logistic_support"> Logistic Support </a></li>
                            </ul>
                        </li>
                        
                        <li> <a href="<?php echo base_url()?>notice/All_notice" ><i class="mdi mdi-clipboard"></i><span class="hide-menu">Notice <span class="hide-menu"></a></li>
                        -->
                        <li> <a href="<?php echo base_url(); ?>settings/Settings" ><i class="mdi mdi-settings"></i><span class="hide-menu">Paramètres <span class="hide-menu"></a></li>
                        <?php } ?>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>

        <script type="text/javascript">


  $(document).on('click','.ayam',function(){

   var href = $(this).attr('href');
   $('#haha').empty().load(href).fadeIn('slow');
   return false;

 });


</script>






<script type="text/javascript">

  $('.apam').removeClass('active');

</script>


<script>


  $(document).ready(function(){

    $( "body" ).on( "click", ".ayam", function() {

      $('.ayam').each(function(a){
       $( this ).removeClass('selectedclass')
     });
      $( this ).addClass('selectedclass');
    });

  })


</script>

