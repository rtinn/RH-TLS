<?php $this->load->view('backend/header'); ?>
<?php $this->load->view('backend/sidebar'); ?>
      <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor"><i class="fa fa-university" aria-hidden="true"></i> Personnels</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Personnels</li>
                    </ol>
                </div>
            </div>
            <div class="message"></div>
    <?php $degvalue = $this->employee_model->getdesignation(); ?>
    <?php $depvalue = $this->employee_model->getdepartment(); ?>
            <div class="container-fluid">
                <div class="row m-b-10"> 
                    <div class="col-12">
                        <button type="button" class="btn btn-primary"><i class="fa fa-bars"></i><a href="<?php echo base_url(); ?>employee/Employees" class="text-white"><i class="" aria-hidden="true"></i> Liste des personnels</a></button>
                        <!--
                        <button type="button" class="btn btn-primary"><i class="fa fa-bars"></i><a href="<?php echo base_url(); ?>employee/Disciplinary" class="text-white"><i class="" aria-hidden="true"></i>  Disciplinary List</a></button>
-->
                    </div>
                </div>
               <div class="row">
                    <div class="col-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white"><i class="fa fa-user-o" aria-hidden="true"></i> Ajouter Nouveau<span class="pull-right " ></span></h4>
                            </div>
                           
                               
                            <div class="card-body">

                                <form class="row" method="post" action="Save" enctype="multipart/form-data">
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Nom</label>
                                        <input type="text" name="fname" class="form-control form-control-line" placeholder="Nom" minlength="2" required > 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Prénoms </label>
                                        <input type="text" id="" name="lname" class="form-control form-control-line" value="" placeholder="Prénoms" minlength="2" required> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Matricule </label>
                                        <input type="text" name="eid" class="form-control form-control-line" placeholder="Example: T00101"> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Departement</label>
                                        <select name="dept" value="" class="form-control custom-select" required>
                                            <option>Selectionner Departement</option>
                                            <?Php foreach($depvalue as $value): ?>
                                             <option value="<?php echo $value->dep_name ?>"><?php echo $value->dep_name ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Poste </label>
                                        <select name="deg" class="form-control custom-select" required>
                                            <option>Select Poste</option>
                                            <?Php foreach($degvalue as $value): ?>
                                            <option value="<?php echo $value->des_name ?>"><?php echo $value->des_name ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Rôle </label>
                                        <select name="role" class="form-control custom-select" required>
                                            <option>Select Role</option>
                                            <option value="ADMIN">ADMIN</option>
                                            <option value="N+1">N+1</option>
                                            <option value="EMPLOYEE">EMPLOYEE</option>
                                          
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Genre </label>
                                        <select name="gender" class="form-control custom-select" required>
                                            <option>Select genre</option>
                                            <option value="Homme">Homme</option>
                                            <option value="Femme">Femme</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Type de contrat </label>
                                        <select name="contrat" class="form-control custom-select">
                                            <option>Select type de contrat Group</option>
                                            <option value="CDI">CDI</option>
                                            <option value="CDD">CDD</option>
                                            <option value="Pigiste">Pigiste</option>
                                            
                                        </select>
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>CIN</label>
                                        <input type="text" name="nid" class="form-control" value="" placeholder="(Max. 12)" minlength="12" required> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Télephone </label>
                                        <input type="text" name="contact" class="form-control" value="" placeholder="03*0000000" minlength="10" maxlength="15" required> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Date de Naissance </label>
                                        <input type="date" name="dob" id="example-email2" name="example-email" class="form-control" placeholder="" required> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Date de début </label>
                                        <input type="date" name="joindate" id="example-email2" name="example-email" class="form-control" placeholder=""> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Date de fin </label>
                                        <input type="date" name="leavedate" id="example-email2" name="example-email" class="form-control" placeholder=""> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Heure d'entrée </label>
                                        <input type="time" id="timePicker" class="form-control"  name="heure_entree" >
                                    </div>
                                    

                                    <div class="form-group col-md-3 m-t-20">
                                        <label>E-mail </label>
                                        <input type="email" id="example-email2" name="email" class="form-control" placeholder="email@mail.com" minlength="7" required > 
                                    </div><!--
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Password </label>
                                        <input type="text" name="password" class="form-control" value="" placeholder="**********"> 
                                    </div>
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Confirm Password </label>
                                        <input type="text" name="confirm" class="form-control" value="" placeholder="**********"> 
                                    </div>-->
                                    <div class="form-group col-md-3 m-t-20">
                                        <label>Image </label>
                                        <input type="file" name="image_url" class="form-control" value=""> 
                                    </div>
                                    <div class="form-actions col-md-12">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Enregistrer</button>
                                        <a class="btn btn-danger" href="<?php echo base_url(); ?>employee/Employees">  <i class="fa fa-times" aria-hidden="true"></i> Annuler </a>
				                                       
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
<?php $this->load->view('backend/footer'); ?>