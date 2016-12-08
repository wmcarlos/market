<?php
	require_once("models/model_db.php"); 
 	class helper_url extends model_db{
 		public function load(){
 			$v = $_GET['v'];
 			if(isset($v) and !empty($v)){
 				$controller = "controllers/controller_".$v.".php";
 				$view = "views/view_".$v.".php";
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