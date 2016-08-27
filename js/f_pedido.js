$( document ).ready(function() {

	$("#_i_fecha").datepicker( {dateFormat: "dd-mm-yy" });
	$(".seccion_prods").hide();	
	$(".select_longitud").show();		
	$(".select_peso").hide();
	$("#campo_editable").hide();
	datos =JSON.parse(localStorage.getItem("datos"));
	if(datos)
	{
		$(".seccion_prods").show();	
		setTimeout(function(){
			for(var n = 0 ; n<datos.length ; n++){
				registro = new Registro(datos[n].prod,
						datos[n].longitud,
						datos[n].peso,
						datos[n].corte,
						datos[n].bunches,
						datos[n].qxbunch,
						datos[n].precio,
						datos[n].tipo_precio);
				registro.paquete = datos[n].paquete;	
				registro.tipo_caja = datos[n].tipo_caja;
				registro.piezas = datos[n].piezas;
			}
 			Registro.paquete = datos[n-1].paquete;
			Registro.tipo_caja = datos[n-1].tipo_caja;
			Registro.piezas = datos[n-1].piezas;
			registro.print_reg();		
		},10);
	}


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
		registro = new Registro($("#_s_producto").val(),
				$("#_s_longitud").val(),
				$("#_s_peso").val(),
				$("#_s_corte").val(),
				$("#_i_bunches").val(),
				$("#_i_qxbunch").val(),
				$("#_i_eprecio").val(),
				$('input[name=tipo_precio]:checked').val());
		registro.paquete = Registro.paquete;
		registro.tipo_caja = Registro.tipo_caja;
		registro.piezas = Registro.piezas;
		$(".fila_par").empty();
		$(".fila_impar").empty();
		registro.print_reg();
		registro.persist_registro();
	});


	$("button#_i_addbox").click(
	function add_box(event){
		event.preventDefault();
		Registro.prototype.set_caja();
		$(".seccion_prods").show();	
	});


	$("button#_i_adinformation").click(
	function(event){
		event.preventDefault();
		localStorage.removeItem("datos");
	});


	$("body").on("click",".borrar_registro",
	function (){
		$(".fila_par").empty();
		$(".fila_impar").empty();
		var posicion = ($(this).attr("id").split("-"))[1];
		registro.eliminar_reg(posicion);
		registro.print_reg();
		registro.persist_registro();
	});


	$("body").on("click",".editable_reg",
	function(event){
		$(".editable_reg").css({"text-decoration":"none"});
		$(this).css({"text-decoration":"underline"});
		$("#campo_editable").show();
		var x = event.pageX;
		var y = event.pageY;
		$("#campo_editable").css({"left": x+20 , "top": y-20 });
		$("#txt_editable").val($(this).text());			
		id_tr = $(this).attr("id");
	});


	$("body").on("click","#bt_ok",
	function(event){
		event.preventDefault();
		var valor = $("#txt_editable").val();
		registro.editar_reg(id_tr, valor);
		$(".editable_reg").css({"text-decoration":"none"});
		$("#campo_editable").hide();
		registro.persist_registro();
	});
		

	$("body").on("click","#bt_cancel",
	function(event){
		event.preventDefault();
		$(".editable_reg").css({"text-decoration":"none"});
		$("#campo_editable").hide();
	});
		

	$("body").on("mouseenter",".editable_reg",
	function(){
			$(this).css({"text-decoration":"underline","font-size":"16px"});
	});


	$("body").on("mouseleave",".editable_reg",
	function(){
			$(this).css({"text-decoration":"none","font-size":"12px"});
	});


	$("body").on("click","#borrar_caja", function(event){
		event.preventDefault();
		Registro.prototype.eliminar_caja();
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
	}

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

	Registro.prototype.print_reg = function(){
		Registro.box_marker = 1;
		$("#caja_vacia").remove();
		for(n=0 ;n<Registro.items.length;n++){
			if(n == 0 || Registro.items[n].paquete != Registro.items[n-1].paquete){Registro.box_marker = 1;}
			else {Registro.box_marker = 0;}
			var k = (n+1) % 2;
			$("<tr class=" + (k == 1 ? 'fila_par' : 'fila_impar').toString() + " id= f"+(n+1).toString() +
			"><td>"+ (n+1) +
			"</td><td>" + (Registro.box_marker == 1 ? Registro.items[n].paquete : ' ') +
			"</td><td class='centrado'>" + (Registro.box_marker == 1 ? Registro.items[n].tipo_caja : ' ') +
			"</td><td class='centrado'>" + (Registro.box_marker == 1 ? Registro.items[n].piezas : ' ' ) +
			"</td><td>" + Registro.items[n].get_producto() + 
			"</td><td class='centrado'>" + (Registro.items[n].get_dim() == 'w' ? Registro.items[n].peso : Registro.items[n].longitud).toString() +
			"</td><td class='centrado'>" + Registro.items[n].corte +
			"</td><td class = 'editable_reg centrado' id ='bunches-" + (n+1) +  "'>" + Registro.items[n].bunches +
			"</td><td class = 'editable_reg centrado' id ='qxbunch-" + (n+1) +  "'>" + Registro.items[n].qxbunch +
			"</td><td class='editable_reg centrado' id='precio-" + (n+1) + "'>" + Registro.items[n].precio +
			"</td><td class='centrado'>" + Registro.items[n].tipo_precio +
			"</td><td> <button class = 'borrar_registro' id = ' bf-" + (n+1) + "'>-</button>" + 
			"</td></tr>").insertAfter("#f"+(n).toString());			
		}
		Registro.box_marker = 0;
		Registro.lock_set_caja = 0;
	}	


	Registro.prototype.eliminar_reg = function(posicion){
		Registro.paquete = Registro.items[posicion-2].paquete	
		Registro.items.splice((posicion-1),1);
		Registro.fila = Registro.items.length;
		
	}


	Registro.prototype.editar_reg = function(campo, valor){
		$("#"+campo).text(valor);
		var a = campo.split("-");
		var fila = Registro.items[(a[1]-1)];
		fila[a[0]] = valor;
		
	}


	Registro.prototype.persist_registro = function(){
		var datos = JSON.stringify(Registro.items);
		var fecha = new Date();
		localStorage.setItem("datos",datos);
		localStorage.setItem("fecha",fecha);		
	}

	Registro.prototype.set_caja = function(){
		if (Registro.lock_set_caja == 0)
		{
			if(Registro.paquete == 0) {Registro.paquete ++;}
			else{Registro.paquete = Registro.items[Registro.fila - 1].paquete + 1 ;}
			Registro.tipo_caja = $("#_s_empaque").val();
			Registro.piezas = $("#_i_piezas").val();
			Registro.box_marker = 1;
			Registro.lock_set_caja = 1;
			
			$("<tr id = 'caja_vacia'><td colspan=11>Box: "+Registro.tipo_caja+
			"  |   Pieces: "+Registro.piezas+
			"   . Now you can choose the products.</td>"+
			"<td id=borrar_caja><button>-</button></td></tr>").insertAfter("#f"+(Registro.fila).toString())			

		}		
	}


	Registro.prototype.eliminar_caja = function(){
		$("#caja_vacia").remove();
		Registro.lock_set_caja = 0;
		if(Registro.paquete == 1){Registro.paquete = 0;}
		else {Registro.paquete --;} 

	}

	Registro.prototype.editar_caja = function(caja){

	}

	Registro.items = new Array();
	Registro.fila = 0;
	Registro.paquete = 0;
	Registro.box_marker = 1;
	Registro.lock_set_caja = 0;


//-----------------------------------------------------------------------------------------------------------------------------------------------------


		



});
	
