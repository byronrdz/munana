<?php
class Munana_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }


	public function get_nombres_productos()
	{
       		$query = $this->db->from('v_producto');
		$this->db->order_by('producto','asc');
		$query = $this->db->get();
        	return $query->result_array();
	}

	public function get_empaques()
	{
		$this->db->from('t_empaque');
		$this->db->order_by('bunchsref','desc');
		$query = $this->db->get();
        	return $query->result_array();
	}

	public function get_longitudes()
	{
		$this->db->from('t_longitud');
		$this->db->order_by('valor','asc');
		$query = $this->db->get();
        	return $query->result_array();
	}

	public function get_pesos()
	{
		$this->db->from('t_peso');
		$this->db->order_by('valor','asc');
		$query = $this->db->get();
        	return $query->result_array();
	}
	
	public function verificar_usuario($usuario)
	{
		$query = $this->db->get_where('t_usuarios', array( 'email' => $usuario ));
		$result = $query -> result_array();
		if (count($result) > 0 ){return TRUE;}
		if (count($result) == 0 ){return FALSE;}		
	}

	public function verificar_credenciales($usuario,$clave)
	{
		$query = $this->db->get_where('t_usuarios', array( 'email' => $usuario, 'password' => $clave ));
		$result = $query -> result_array();
		if (count($result) > 0 ){return TRUE;}
		if (count($result) == 0 ){return FALSE;}	
	}
	
	public function cargar_registro_usuario($registro)
	{
	
		
	
	}
	


}
