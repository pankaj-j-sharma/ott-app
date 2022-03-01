<?php
    include('includes/header.php');
    include('includes/function.php');
	  include('language/language.php'); 
    include('zoom/index.php');
	if(isset($_POST['submit']))
	{

      if($_POST['topic']=="")
      {
        $_SESSION['msg']="Topic is required";
      }
      else if($_POST['start_date']=="")
      {
        $_SESSION['msg']="Start date is required";
      }
      else if($_POST['start_time']=="")
      {
        $_SESSION['msg']="Start time is required";
      }
      else if($_POST['duration']=="")
      {
        $_SESSION['msg']="Duration is required";
      }
      else if($_POST['password']=="")
      {
        $_SESSION['msg']="Password is required";
      }
      else
      {
        $date = $_POST['start_date'] . "T" . $_POST['start_time'] . ":00";
        $data = [];
        $data["topic"] = $_POST['topic'];
        $data["type"] = 2;
        $data["start_time"] = $date;
        $data['timezone'] = "Asia/Kolkata";
        $data["duration"] = $_POST['duration']; 
        $data["password"] = $_POST['password'];	
        $data["host_video"] = true;	
        $data["in_meeting"] = true;	
        $data["join_before_host"] = false;	
        $data["approval_type"] = 0;	
        $data["auto_recording"] = "cloud";	
        $data["close_registration"] = true;	
        $data["waiting_room"] = true;	
        $apiResponse = $zoom->createMeeting($data);
        if($apiResponse["code"]!=201)
        {
          session_start();
          $_SESSION['msg']=(isset($apiResponse['message'])?$apiResponse['message']:"Something went wrong. Please try again.");
        }
        else
        {
          $_SESSION['msg'] = "Class created successfully";
          header("Location:manage_live_classes.php");
          die();
        }
      
      }
	}
	
	
?>
  
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  
 <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
                                <h4 class="card-title">Create Class </h4>
                            </div>
          <div class="clearfix"></div>
          <div class="row mrg-top">
            <div class="col-md-12">
               
              <div class="col-md-12 col-sm-12">
                <?php if(isset($_SESSION['msg'])){?> 
               	 <div class="alert alert-success alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                	<?php echo $_SESSION['msg'] ; ?></a> </div>
                <?php unset($_SESSION['msg']);}?>	
              </div>
            </div>
          </div>
          <div class="card-body mrg_bottom"> 
            <form action="" name="create_class" method="post" class="form form-horizontal" enctype="multipart/form-data" >
              <div class="section">
                <div class="section-body">

                  <div class="form-group">
                    <label class="col-md-3 control-label">Topic</label>
                    <div class="col-md-6">
                      <input type="text" name="topic" id="topic" value="" class="form-control" required>
                    </div>
                  </div>
    
                  <div class="form-group">
                    <label class="col-md-3 control-label">Start Date</label>
                    <div class="col-md-6">
                      <input type="date" name="start_date" id="start_date" value="" class="form-control" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">Start Time</label>
                    <div class="col-md-6">
                      <input type="time" name="start_time" id="start_time" value="" class="form-control" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">Duration in minutes</label>
                    <div class="col-md-6">
                      <input type="number" name="duration" id="duration" value="" class="form-control" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-6 control-label">Password to join class (Max 10 character, can contain a-z,A-Z,0-9,@,-,_,*)</label>
                    <div class="col-md-6">
                      <input type="text" name="password" id="password" maxlength="10" value="" class="form-control" required>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-md-9 col-md-offset-3">
                      <button type="submit" name="submit" class="btn btn-primary btn-round">Create</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
   

<?php include('includes/footer.php');?>                  