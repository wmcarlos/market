<?php
	require_once("models/model_db.php"); 
 	class helper_url extends model_db{

 		public function load(){
 			$g = $_GET['v'];
 			if(isset($g) and !empty($g)){
 				$controller = "controllers/controller_".$g.".php";
 				$view = "views/view_".$g.".php";
 				if(is_file($controller) and is_file($view)){
 					include($controller);
 					include($view);
 				}else{
 					include("controllers/controller_404.php");
 					include("views/view_404.php");
 				}
 			}else{
 				include("controllers/controller_dashboard.php");
 				include("views/view_dashboard.php");
 			}
 		}
 	}
?>