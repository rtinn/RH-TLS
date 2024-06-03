<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Telesourcia">
    <!-- Favicon icon -->
    <?php $settingsvalue = $this->settings_model->GetSettingsValue(); ?>
<link rel="icon" type="image/ico" sizes="16x16" href="<?php echo base_url(); ?>assets/images/favicn.ico">
<title><?php echo $settingsvalue->sitetitle; ?></title>
<!-- Bootstrap Core CSS -->


<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- morris CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
<link href="<?php echo base_url(); ?>assets/plugins/morrisjs/morris.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<?php echo base_url(); ?>assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
<link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet" media="all">
<link href="<?php echo base_url(); ?>assets/css/print.css" rel="stylesheet" media='print'>
<!-- You can change the theme colors from here -->
<link href="<?php echo base_url(); ?>assets/css/colors/blue.css" id="theme" rel="stylesheet">
<link href="<?php echo base_url(); ?>assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url(); ?>assets/plugins/switchery/dist/switchery.min.css" rel="stylesheet" />
<link href="<?php echo base_url(); ?>assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url(); ?>assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
<!-- Daterange picker plugins css -->
<link href="<?php echo base_url(); ?>assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="<?php echo base_url(); ?>assets/plugins/multiselect/css/multi-select.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url(); ?>assets/plugins/calendar/dist/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<link href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.7.21/jquery.zoom.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
   
</head>

<body class="fix-header fix-sidebar card-no-border">

       <?php 
            $id = $this->session->userdata('user_login_id');
            $dep = $this->session->userdata('user_dep');
            $basicinfo = $this->employee_model->GetBasic($id); 
            $settingsvalue = $this->settings_model->GetSettingsValue();
            $leavetodayN = $this->leave_model-> GetLeaveTodayN($dep);
            $leavetodayE = $this->leave_model-> GetLeaveTodayE($id);
            $n_notifE = $this->leave_model->GetnbnotifE($id);
            $n_notifN = $this->leave_model->GetnbnotifN($dep);
            $n_notifAll = $this->leave_model->GetnbnotifAll();
            $leavetodayAll = $this->leave_model-> GetLeaveTodayAll();
        ?>
    
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <div id="main-wrapper">
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<?php echo base_url(); ?>">
                     <!-- <b>
                        <img src="<?php echo base_url();?>assets/images/hricn.png" alt="DRI" class="DRI-logo" style="width:50px;"/>
                    </b>
                    -->
                        <!-- Logo text --><span>
                         <img src="<?php echo base_url(); ?>assets/images/<?php echo $settingsvalue->sitelogo; ?>" alt="homepage" class="dark-logo" width="100%" />
                         <!-- Light Logo text -->    
                         </span> </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <li class="nav-item m-l-10"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell"></i>
                                <span class="badge badge-warning navbar-badge"></span>
                           
                        </a>
          
                            <div class="dropdown-menu mailbox scale-up-left">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notificationss</div>
                                    </li>
                                    <li>
                                        <div class="message-center">
                                            <!-- Message -->
                                            <?php foreach($leavetodayE as $value): ?>
                                            <a href="#">
                                                <div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>
                                                <div class="mail-contnet">
                                                    <h5> </h5>
                                                     <span class="mail-desc"></span>
                                                     <span class="mail-n"></span>
                                                      <span class="time"></span> </div>
                                            </a>
                                            <?php endforeach; ?>
                                        </div>
                                    </li>
                                    <li> 
                                        <a class="nav-link text-center" href="<?php echo base_url(); ?>leave/Application"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li>
                                </ul>

                            </div>
                        </li>
                    </ul>



                    <ul class="navbar-nav my-lg-0">
                    <div id="chronometer" style="color: white;">00:00:00</div>
                        <button onclick="startChronometer()">Démarrer</button>
                        <button onclick="stopChronometer()">Arrêter</button>
                    </ul>




                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<?php echo base_url(); ?>uploads/users/<?php echo $basicinfo->em_image; ?>" alt="Genit" class="profile-pic" style="height:40px;width:40px;border-radius:50px" /></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                                <ul class="dropdown-user">
                                    <li>
                                        <div class="dw-user-box">
                                            <div class="u-img"><img src="<?php echo base_url(); ?>uploads/users/<?php echo $basicinfo->em_image; ?>" alt="user"></div>
                                            <div class="u-text">
                                                <h4><?php echo $basicinfo->first_name.' '.$basicinfo->last_name; ?></h4>
                                                <p class="text-muted"><?php echo $basicinfo->em_email ?></p>
                                        </div>
                                    </li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="<?php echo base_url(); ?>employee/view?I=<?php echo base64_encode($basicinfo->em_id); ?>"><i class="ti-user"></i> Mon profile</a></li>
                                    <?php if($this->session->userdata('user_type')!='EMPLOYEE'){ ?>
                                    
                                    <li><a href="<?php echo base_url(); ?>settings/Settings"><i class="ti-settings"></i>Paramètres</a></li>
                                    <?php } ?>
                                    <li><a href="<?php echo base_url(); ?>login/logout"><i class="fa fa-power-off"></i> Deconnexion</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <script>
        let startTime;
        let interval;

        function startChronometer() {
            fetch('http://localhost/RH-TLS/chronometer/start', { method: 'POST' })
                .then(response => response.json())
                .then(data => {
                    console.log('Start response:', data);
                    if (data.status === 'started') {
                        startTime = data.start_time;
                        interval = setInterval(updateChronometer, 1000);
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        function stopChronometer() {
            fetch('http://localhost/RH-TLS/chronometer/stop', { method: 'POST' })
                .then(response => response.json())
                .then(data => {
                    console.log('Stop response:', data);
                    if (data.status === 'stopped') {
                        clearInterval(interval);
                        alert('Temps écoulé: ' + formatTime(data.elapsed_time));
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        function updateChronometer() {
            const currentTime = Math.floor(Date.now() / 1000);
            const elapsedTime = currentTime - startTime;
            document.getElementById('chronometer').innerText = formatTime(elapsedTime);
        }

        function checkStatus() {
            fetch('http://localhost/RH-TLS/chronometer/status')
                .then(response => response.json())
                .then(data => {
                    console.log('Status response:', data);
                    if (data.status === 'running') {
                        startTime = data.start_time;
                        document.getElementById('chronometer').innerText = formatTime(data.elapsed_time);
                        interval = setInterval(updateChronometer, 1000);
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        function formatTime(seconds) {
            const hrs = Math.floor(seconds / 3600);
            const mins = Math.floor((seconds % 3600) / 60);
            const secs = seconds % 60;
            return `${String(hrs).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
        }

        window.onload = checkStatus;
    </script>

 <script>
    $(document).ready(function() {
        var url = '<?php echo base_url(); ?>';
        function loadNotifications() {
            $.ajax({
                url: url + 'leave/getNotifications',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    // Mettez à jour le nombre de notifications dans le badge
                    $('.navbar-badge').text(data.n_notif);

                    // Mettez à jour la liste des notifications
                    var notificationsHtml = '';

                    <?php if($this->session->userdata('user_type')== 'EMPLOYEE'){ ?>
                        $.each(data.notifications, function(index, notification) {
                        notificationsHtml += '<a href="<?php echo base_url(); ?>leave/Application">' +
                            '<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>' +
                            '<div class="mail-contnet">' +
                            '<span class="mail-desc">Demande congé ' + notification.typeid + '</span>'+
                            '<span class="mail-desc">' + notification.leave_status + ' par '+ notification.id_nplus + '</span>'+
                            '<span class="time">' + notification.apply_date + '</span>' +
                            '</div>' +
                            '</a>';
                    });

                    <?php } else { ?>
                        $.each(data.notifications, function(index, notification) {
                        notificationsHtml += '<a href="<?php echo base_url(); ?>leave/Application">' +
                            '<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>' +
                            '<div class="mail-contnet">' +
                           
                            '<h5>' + notification.first_name + ' </h5>' +
                            
                            '<span class="mail-desc">a demandé un congé ' + notification.typeid + '</span>'+

                            '<span class="time">' + notification.apply_date + '</span>' +
                            '</div>' +
                            '</a>';
                    });

                        <?php } ?>
                    
                    $('.message-center').html(notificationsHtml);
                }
            });
        }

        // Appelez loadNotifications une fois au chargement de la page
        loadNotifications();

        // Vous pouvez également appeler loadNotifications périodiquement pour actualiser les notifications
        setInterval(loadNotifications, 2000); // Exemple: actualise toutes les 2 secondes
    });
</script>

