<?php
// Configuration de la base de données MySQL
$servername = "votre_serveur";
$username = "votre_nom_utilisateur";
$password = "votre_mot_de_passe";
$dbname = "votre_base_de_données";

// Connexion à la base de données
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifiez la connexion
if ($conn->connect_error) {
    die("Échec de la connexion à la base de données : " . $conn->connect_error);
}

// Chemin vers le fichier CSV
$csv_file = "chemin/vers/votre_fichier.csv";

// Lire le fichier CSV
if (($handle = fopen($csv_file, "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        // Assurez-vous que la ligne contient suffisamment de données
        if (count($data) >= 3) {
            $sName = $data[0];
            $Date = date("Y-m-d", strtotime($data[1])); // Convertir la date au format MySQL
            $Time = date("H:i:s", strtotime($data[2])); // Convertir le temps au format MySQL
            
            // Vérifiez si le sName existe déjà dans la base de données
            $sql = "SELECT * FROM votre_table WHERE sName = '$sName'";
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                // Si le sName existe déjà, mettez à jour la colonne Time2
                $row = $result->fetch_assoc();
                $id = $row['id'];
                $update_sql = "UPDATE votre_table SET Time2 = '$Time' WHERE id = $id";
                $conn->query($update_sql);
            } else {
                // Si le sName n'existe pas, insérez une nouvelle ligne
                $insert_sql = "INSERT INTO votre_table (sName, Date, Time1) VALUES ('$sName', '$Date', '$Time')";
                $conn->query($insert_sql);
            }
        }
    }
    fclose($handle);
}

// Fermez la connexion à la base de données
$conn->close();
?>






CREATE TABLE votre_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sName VARCHAR(255),
    Date DATE,
    Time1 TIME,
    Time2 TIME
);




















 <!--
    bouton importer
         <button type="button" class="btn btn-info"><i class="fa fa-plus"></i><a data-toggle="modal" data-target="#noticemodel" data-whatever="@getbootstrap" class="text-white "><i class="" aria-hidden="true"></i> Import csv </a></button>
           
         boutton view
              <a href="" title="Edit" class="btn btn-sm btn-primary waves-effect waves-light pointage" data-id="<?php echo $value->id; ?>"><i class="fa fa-eye" aria-hidden="true"></i></a>
        
              
modal import
 
   <div class="modal fade" id="noticemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content ">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel1">Notice Board</h4>
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
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
modal view

                        <!-- /.modal --> 

                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel1">Loan</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form role="form" method="post" action="Add_Loan" id="btnSubmit" enctype="multipart/form-data">
                    <div class="modal-body">
                            
                            <div class="form-group row">
                                <label for="message-text" class="control-label col-md-3">Matricule</label>
                                <input type="text" name="sName" value="" class="form-control col-md-8 amount" id="recipient-name1" required>
                            </div> 
                            <div class="form-group row">
                                <label for="message-text" class="control-label col-md-3">Nom</label>
                                <input type="text" name="first_name" value="" class="form-control col-md-8 amount" id="recipient-name1" required>
                            </div> 
                            <div class="form-group row">
                                <label for="message-text" class="control-label col-md-3">Prenom</label>
                                <input type="text" name="last_name" value="" class="form-control col-md-8 amount" id="recipient-name1" required>
                            </div> 
                            <div class="form-group row">
                                <label for="message-text" class="control-label col-md-3">Date</label>
                                <input type="text" name="Date" value="" class="form-control col-md-8 amount" id="recipient-name1" required>
                            </div> 
                            <div class="form-group row">
                                <label for="message-text" class="control-label col-md-3">Heure</label>
                                <input type="text" name="Time_out" value="" class="form-control col-md-8 amount" id="recipient-name1" required>
                            </div>                                                         
                           
                                                                                                    
                        
                    </div>
                    <div class="modal-footer">
                       <input type="hidden" name="id" value="">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
                   </div>
                    </form>
                </div>
            </div>
        </div>
         


                                    <!-- /.modal -->
  
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $(".pointage").click(function (e) {
                                                e.preventDefault(e);
                                                // Get the record's ID via attribute  
                                                var iid = $(this).attr('data-id');
                                                $('#btnSubmit').trigger("reset");
                                                $('#exampleModal').modal('show');
                                                $.ajax({
                                                    url: 'PointageByID?id=' + iid,
                                                    method: 'GET',
                                                    data: '',
                                                    dataType: 'json',
                                                }).done(function (response) {
                                                    console.log(response);
                                                    // Populate the form fields with the data returned from server
													 $('#btnSubmit').find('[name="sName"]').val(response.pointage.sName).end();
                                                     $('#btnSubmit').find('[name="first_name"]').val(response.pointage.first_name).end();
                                                     $('#btnSubmit').find('[name="last_name"]').val(response.pointage.last_name).end();
                                                   
                                                    $('#btnSubmit').find('[name="Date"]').val(response.pointage.Date).end();
                                                    $('#btnSubmit').find('[name="Time_out"]').val(response.pointage.Time_out).end();
                                              });
                                            });
                                        });
</script>






  -->