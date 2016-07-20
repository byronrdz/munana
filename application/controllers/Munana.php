<?php
class Munana extends CI_Controller {

        public function __construct()
        {
		parent::__construct();
		$this->load->model('munana_model');
		$this->load->helper('url');
		$this->inicia_sesion("Byron Rodriguez",'byronrdz@gmail.com');
        }

	public function inicia_sesion($nombre,$email)
	{
		$this->load->library('session');
		$this->session->set_userdata(array("name"=>$nombre,"email"=>$email,"fecha"=>date("Y-m-d H:i:s")));
	}

 
       public function view_form($page = 'f_pedido')
        {

        	if ( ! file_exists(APPPATH.'views/formularios/'.$page.'.php'))
        	{
        	        // Whoops, we don't have a page for that!
                	show_404();
        	}
		
		if($page == 'f_pedido'){
			$data['productos'] = $this->munana_model->get_nombres_productos();
			$data['empaques'] = $this->munana_model->get_empaques();
			$data['longitudes'] = $this->munana_model->get_longitudes();
			$data['pesos'] = $this->munana_model->get_pesos();
		}

        	$this->load->view('templates/header', $data);
	        $this->load->view('formularios/'.$page, $data);
	        $this->load->view('templates/footer', $data);
        }
}

