$( document ).ready(function() {

	$("#_i_fecha").datepicker( {dateFormat: "dd-mm-yy" });

	$(".seccion_prods").hide();	
	$(".select_longitud").show();		
	$(".select_peso").hide();

	$("#_s_producto").change(function() {
 		d = $("#_s_producto").val();
		d = d.substr(d.length-1,d.length-1);
		if(d == 'l'){
			$(".select_peso").hide();
			$(".select_longitud").show();			
		}
		if(d == 'w'){
			$(".select_longitud").hide();
			$(".select_peso").show();			
		}
	});


	$("button#_i_addproduct").click(
	function add_product(event){
		event.preventDefault();

		var registro = new Registro($("#_s_producto").val(),
				$("#_s_longitud").val(),
				$("#_s_peso").val(),
				$("#_s_corte").val(),
				$("#_i_bunches").val(),
				$("#_i_qxbunch").val(),
				$("#_i_eprecio").val(),
				$('input[name=tipo_precio]:checked').val());

		registro.paquete = Registro.paquete;
		registro.tipo_caja = Registro.tipo_caja
		registro.piezas = Registro.piezas;
		registro.listar();

	});

	$("button#_i_addbox").click(
	function add_box(event){
		event.preventDefault();
		Registro.prototype.set_caja();
		$(".seccion_prods").show();			
	});




//---------------DEFINICION CLASE REGISTRO---------------------------------------------------------------------------------------

	var Registro = function(prod,longitud,peso,corte,bunches,qxbunch,precio,tipo_precio){
		Registro.fila ++;

		this.prod = prod;
		this.longitud = longitud;
		this.peso = peso;
		this.corte = corte;
		this.bunches = bunches;
		this.qxbunch = qxbunch;
		this.precio = precio;
		this.tipo_precio = tipo_precio;
		this.paquete = Registro.paquete;
		this.tipo_caja = Registro.tipo_caja;
		this.piezas = Registro.piezas;

		Registro.items.push(this);
		console.log(JSON.stringify(Registro.items));
	}

	Registro.items = new Array();
	Registro.fila = 0;
	Registro.paquete = 0;
	Registro.box_marker = 1;
	Registro.lock_set_caja = 0;


	Registro.prototype.get_producto = function(){
		var fin = this.prod.length - 2;
		var producto = this.prod.substring(0,fin);
		return producto;
	}

	Registro.prototype.get_dim = function(){
		var pos = this.prod.length;
		var dim = this.prod.substring(pos-1,pos);
		return dim;
	}

	Registro.prototype.listar = function(){
		var k = Registro.fila % 2;
		$("<tr class=" + (k == 1 ? 'fila_par' : 'fila_impar').toString() + " id= f"+(Registro.fila).toString() +
		"><td>"+ Registro.fila +
		"</td><td>" + (Registro.box_marker == 1 ? this.paquete : ' ').toString() +
		"</td><td>" + (Registro.box_marker == 1 ? this.tipo_caja : ' ').toString() +
		"</td><td>" + (Registro.box_marker == 1 ? this.piezas : ' ').toString() +
		"</td><td>" + this.get_producto() +
		"</td><td>" + (this.get_dim() == 'w' ? this.peso : this.longitud).toString() +
		"</td><td>" + this.corte.toString() +
		"</td><td>" + this.bunches.toString() +
		"</td><td>" + this.qxbunch.toString() +
		"</td><td>" + this.precio.toString() +
		"</td><td>" + this.tipo_precio.toString() +
		"</td></tr>").insertAfter("#f"+(Registro.fila-1).toString());

		Registro.box_marker = 0;
		Registro.lock_set_caja = 0;
	
	}

	Registro.prototype.set_caja = function(){
		if (Registro.lock_set_caja == 0)
		{
			Registro.paquete ++;
			Registro.tipo_caja = $("#_s_empaque").val();
			Registro.piezas = $("#_i_piezas").val();
			Registro.box_marker = 1;
			Registro.lock_set_caja = 1;
		}		
	}

	Registro.prototype.eliminar_reg = function(posicion){


	}


	Registro.prototype.eliminar_caja = function(caja){


	}

	Registro.prototype.editar_reg = function(posicion){


	}

	Registro.prototype.editar_caja = function(caja){


	}


//-----------------------------------------------------------------------------------------------------------------------------------------------------


});
	
