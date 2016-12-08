<?php 
	class model_db{
		private $server,
				$port,
				$user,
				$password,
				$db,
				$sql,
				$result,
				$con;

		private function connect(){
			$this->server = "localhost";
			$this->port = "";
			$this->user = "root";
			$this->password = "123456";
			$this->db = "market";
			$this->result = null;
			$this->con = mysql_connect($this->server, $this->user, $this->password) or die ("Error al Conectar al Servidor ".mysql_error());

			mysql_select_db($this->db, $this->con) or die ("Error al Conectar a la Base de Datos ".mysql_error());
		}

		protected function execute($sql){
			$this->connect();
			$this->result = mysql_query($sql, $this->con) or die ("Error al Realizar la Consulta ".mysql_error());
			return mysql_affected_rows();
		}

		protected function getdata(){
			return mysql_fetch_array($this->result);
		}

		protected function transaction($t){
			$t = strtolower($t);
			$sql = "";
			switch ($sql) {
				case 'begin':
					$sql = "BEGIN";
				break;
				case 'commit':
					$sql = "COMMIT";
				break;
				case 'roolback':
					$sql = 'ROOLBACK';
				break;
			}
			return $this->execute($sql);
		}

		protected function free_result(){
			mysql_free_result($this->result);
		}

		protected function close(){
			mysql_close($this->con);
		}
	}
?>