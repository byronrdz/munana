<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	 
        public function __construct()
        {
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('munana_model');		
	}	 

	 
	public function index()
	{
		$this->inicia_sesion();
	}
	
	
	public function inicia_sesion()
	{
		
		if($this->session->activa){
			redirect("http://localhost/munana/pedidos/view_form");		
		}	
		else{
			$this->f_login('sesion_nueva');		
		}
	}

	
	public function f_login($tipo)
	{
		
        	$this->load->view('templates/header');
	        if($tipo == 'sesion_nueva'){$this->load->view('formularios/f_login1.php');}
	        if($tipo == 'clave_errada'){sleep(5);$this->load->view('formularios/f_login2.php');}
	        $this->load->view('templates/footer');		
	}


	public function login()
	{
        	$this->load->view('templates/header');
		$usuario = $this->input->post('input_usuario');	
		$clave = $this->input->post('input_password');
		$verif_usuario = $this->munana_model->verificar_usuario($usuario);
		if(! $verif_usuario){$this->load->view('formularios/f_registro'); return;}
		$verif_credenciales = $this->munana_model->verificar_credenciales($usuario,$clave);
		if(! $verif_credenciales){$this->f_login('clave_errada');return;}
	        $this->load->view('templates/footer');		
	}
		
	public function register()
	{
		$registro = array(
		$name => $this->input->post('input_nombre'),
		$email => $this->input->post('input_email'),
		$password => $this->input->post('password'),
		$name => $this->input->post('input_nombre'),
		$country => $this->input->post('input_pais'),
		$city => $this->input->post('input_ciudad'),
		$telephone => $this->input->post('input_telefono'),
		$company => $this->input->post('input_empresa'),
		$web => $this->input->post('input_web'),
		$facebook => $this->input->post('input_facebook'),
		$linkedin => $this->input->post('input_linkedin')
		);
		$this->munana_model->cargar_reg_usuario($registro);

	}
		
		
	
}
