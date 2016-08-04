
<div id="seccionformulario" class="formulario">
<div class="titulo_form">ORDERS</div><br>
<table cellpadding=3 width="250" border=0>

<tr><th colspan=2>Package information</th></tr>

<tr><td>
<label for "select_empaque">Box:</label>
<select name="f_empaque" id="_s_empaque">
	<option value="" selected></option> 
	<?php foreach ($empaques as $empq_item) 
     		echo '<option value='.$empq_item['nombre'].'>'.$empq_item['nombre'].'</option>';?>
</select>
</td>
<td>
<label for "input_piezas">Pieces:</label>
<input name="f_piezas" type="numeric" id="_i_piezas" data-toggle="tooltip" title="Number of boxes" size=4 value=5></input>
</td>
</tr>
<tr><td colspan=2> <button id= "_i_addbox">Add Box</button></td></tr>
<tr><td colspan=2><hr></td></tr>
<tr><th colspan=2>Product information</th></tr>
<form id="form_cliente">
<tr><td colspan=2>
<label for "select_producto">Product:</label>
<select name="f_producto" id="_s_producto" class="producto">
	<option value="" selected></option> 
	<?php foreach ($productos as $prod_item)
     		echo '<option value="'.$prod_item['producto'].'+'.$prod_item['dimension'].'">'.$prod_item['producto'].'</option>';?>
</select>
</tr></td>
<tr><td>
<label for "select_longitud" class="select_longitud" >Length:</label>
<select name="f_longitud" class="select_longitud" id= _s_longitud >
	<option value="" selected></option> 
	<?php foreach ($longitudes as $longitud_item) 
     		echo '<option value='.$longitud_item['valor'].'>'.$longitud_item['valor'].' cm'.'</option>';?>
</select>

<label for "select_empaque" class="select_peso">Weight:</label>
<select name="f_peso" class="select_peso" id= _s_peso>
	<option value="" selected></option> 
	<?php foreach ($pesos as $peso_item) 
     		echo '<option value='.$peso_item['valor'].'>'.$peso_item['valor'].' gr'.'</option>';?>
</select>
</td><td>
<label for "select_corte" class="select_corte" class="noblock">Cut Stage:</label>
<select name="f_corte" class="select_corte" class="noblock" id= _s_corte>
	<option value="" selected></option>
	<option value="USA">USA</option>
	<option value="Europe">Europe</option>
	<option value="Russia">Russia</option> 
</select>
</td></tr>
<tr>
<td>
<label for "input_bunches">Bunches:</label>
<input name="f_bunches" type="numeric" id="_i_bunches" data-toggle="tooltip" title="Number of bunches" size=6></input>
</td>
<td>
<label for "input_uxbunch">Qty x Bunch:</label>
<input name="f_uxbunch" type="numeric" id="_i_qxbunch" data-toggle="tooltip" title="Number of units per bunch" size=6 value=25></input>
</td>
</tr>
<tr>
<td rowspan=2>
<label for "input_eprice">Estimated price:</label>
<input name="f_eprecio" type="numeric" id="_i_eprecio" data-toggle="tooltip" title="We can use this value in searching for your product. It is a reference price." size=6 ></input>

<input type="radio" name="tipo_precio" value="perStem" class="noblock" id=_r_tprecio1 checked>per Stem</input>
<input type="radio" name="tipo_precio" value="perBunch" class="noblock" id= _r_tprecio2>per Bunch</input>
</td>
<td>
<label for "input_uxcaja">Qty x Box:</label>
<input name="f_uxcaja" type="numeric" id="_i_qxbox" data-toggle="tooltip" title="Number of bunches per box" size=6 value=8></input>

</td>
</tr>

<td>
<tr><td colspan=2> <button id = "_i_addproduct" >Add Product</button> </td></tr>




<tr><td colspan=2><hr></td></tr>
<tr><th colspan=2>Additional information</th></tr>

<tr><td colspan=2>
<label for "input_fecha">Fly Date:</label>
<input type="text" name="f_fecha" id="_i_fecha"></input>
</td></tr>

</form>

<tr><td colspan=2><input class="boton_largo" type="submit" value="Submit Aditional Info" width=100%></td></tr>

</table>
</div>

<div id="seccionpedido">
<table id="tablapedido" border=0>
<tr id="f0">
<th class= "ttp" width="25">Item</th><th class="ttp">Boxes</th><th class="ttp">Package</th><th class="ttp">Pieces</th><th class="ttp" width="280">Product</th><th class="ttp">long/wgt</th><th class="ttp">Cut Stage</th><th class="ttp">Bunches</th><th class="ttp">QxBunch</th><th class="ttp">E.Price</th><th class="ttp">B/S</th>
</tr>
</table>

</div>


<script type="text/javascript">
$( document ).ready(function() {

	var items = new Array();	

	$("#_i_fecha").datepicker( {dateFormat: "dd-mm-yy" });
	
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

		var registro = new Registro($("#_s_producto").val(),$("#_s_longitud").val(),$("#_s_peso").val(),$("#_s_corte").val(),$("#_i_bunches").val(),$("#_i_qxbunch").val(),$("#_i_eprecio").val(),$('input[name=tipo_precio]:checked').val());
		registro.paquete = Registro.paquete;
		registro.tipo_caja = Registro.tipo_caja
		registro.piezas = Registro.piezas;
		registro.listar();
		items.push(registro);

		console.log(JSON.stringify(items));
		
	});


	$("button#_i_addbox").click(
	function add_box(event){
		event.preventDefault();
		Registro.prototype.set_caja();			
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
		this.paquete = 0;
		this.tipo_caja = "";
		this.piezas = 0;
	}
	
	Registro.fila = 0;
	Registro.paquete = 0;
	Registro.tipo_caja = "Half";
	Registro.piezas = 0;
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
		$("<tr class=" + (k == 1 ? 'fila_par' : 'fila_impar').toString() + " id= f"+(Registro.fila).toString() +"><td>"+ Registro.fila +"</td><td>"+ (Registro.box_marker == 1 ? this.paquete : ' ').toString() +"</td><td>"+(Registro.box_marker == 1 ? this.tipo_caja : ' ').toString()+"</td><td>"+(Registro.box_marker == 1 ? this.piezas : ' ').toString()+"</td><td>"+this.get_producto()+"</td><td>"+(this.get_dim() == 'w' ? this.peso : this.longitud).toString()+"</td><td>"+this.corte.toString()+"</td><td>"+this.bunches.toString()+"</td><td>"+this.qxbunch.toString()+"</td><td>"+this.precio.toString()+"</td><td>"+this.tipo_precio.toString()+"</td>  </tr>").insertAfter("#f"+(Registro.fila-1).toString());
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


//-----------------------------------------------------------------------------------------------------------------------------------------------------


});
	
</script>
