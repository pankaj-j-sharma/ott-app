<?php 
	include('zoom/index.php');
	include('includes/header.php'); 

  include('includes/function.php');
	include('language/language.php');  



	if(isset($_POST['user_search']))
	 {
		 
		 
	 }
	 else
	 {
	 
							$targetpage = "manage_live_classes.php"; 	
							$limit = 15; 
							
							//$total_pages = $total_pages['num'];
							
							$stages = 3;
							$page=0;
							if(isset($_GET['page'])){
							$page = mysqli_real_escape_string($mysqli,$_GET['page']);
							}
							if($page){
								$start = ($page - 1) * $limit; 
							}else{
								$start = 0;	
								}	
							
							
							$apiResponse=$zoom->listMeetings(array(
								"page_size"=>15,
								"type"=>(isset($_GET['type'])?$_GET['type']:"scheduled"),
								"page_number"=>($page+1)
							));
							$records = [];
							if($apiResponse["code"]!=200)
							{
								session_start();
								$_SESSION['msg']=(isset($apiResponse['message'])?$apiResponse['message']:"Something went wrong. Please try again.");
							}
							else
							{
								$records = $apiResponse['meetings'];
							}
							
	 }
	
?>


 <div class="row">
      <div class="col-md-16">
        <div class="card card-user">
          <div class="">
            <div class="card-header">
              <h4 class="card-title">Manage Live Classes / Sessions (<?php echo (isset($_GET['type'])?$_GET['type']:"scheduled") ?>)</h4>
            </div>
            <hr/><center>
            <div class="col-md-7 col-xs-12">              
                  <div class="search_list">
                    <div class="search_block">
                      <form  method="post" action="">
                        <!--<input class="form-control " placeholder="Search..." aria-controls="DataTables_Table_0" type="search" name="search_value" required>
                        <button type="submit" name="class_search" class="btn btn-primary btn-round"><i class="fa fa-search"></i></button>-->
						<a href="manage_live_classes.php"><div class="btn btn-primary btn-round"> Scheduled </div></a>
						<a href="manage_live_classes.php?type=live"><div class="btn btn-primary btn-round"> Live </div></a>
						<a href="manage_live_classes.php?type=upcoming"><div class="btn btn-primary btn-round"> Upcoming </div></a>
						<a href="create_class.php"><div class="btn btn-primary btn-round"> Create Class </div></a>
                      </form>  
                    </div>
                    
                    
                  </div>
                  
            </div></center>
          </div><hr/>
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
          <div class="col-md-12 mrg-top">
            <table class="table table-striped table-bordered table-hover">
              <thead class="text-primary">
                <tr>
                  <th class="text-center">Sr. No.</th>
                  <th class="text-center">Topic</th>						 
				  <th class="text-center">Start Date</th>
				  <th class="text-center">Duration</th>
				  <th class="text-center">Zoom Meeting ID</th>
				  <th class="text-center">Meeting URL</th>	 
                  <th class="text-center cat_action_list">Action</th>
                </tr>
              </thead>
              <tbody>
              	<?php
				  		//date_default_timezone_get("Asia/Kolkata");
						$i=$start+1;
						foreach($records as $record)
						{
				?>
                <tr>
                   <td class="text-center"><?php echo $i;?></td>
                   <td class="text-center"><?php echo $record['topic']; ?></td>
                   <td class="text-center"><?php echo date("Y-m-d H:i:s", strtotime($record['start_time'])+270*60); ?></td>
                   <td class="text-center"><?php echo $record['duration']; ?></td>
                   <td class="text-center"><?php echo $record['id']; ?></td>
                   <td class="text-center"><a href="<?php echo $record['join_url']; ?>"><?php echo $record['join_url']; ?></a></td>
		               <td class="text-center">
                      <a href="edit_class.php?meeting_id=<?php echo $record['id'];?>"><i class="fa fa-edit" data-toggle="tooltip" data-placement="top" title="Edit Class"></i></a>
				           </td>
                </tr>
               <?php
						$i++;
						}
			   ?>
              </tbody>
            </table>
          </div>
          <div class="col-md-12 col-xs-12">
            <div class="pagination_item_block">
              <nav>
              	<?php if(!isset($_POST["search"])){ include("pagination.php");}?>                 
              </nav>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>     



<?php include('includes/footer.php');?>                  