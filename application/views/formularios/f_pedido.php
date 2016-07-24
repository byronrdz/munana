
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
<tr><td colspan=2> <button id= "_i_addbox" onclick="add_box()">Add Box</button> </td></tr>
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
<tr><td colspan=2> <button id = "_i_addproduct" onclick="add_product()">Add Product</button> </td></tr>




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
<table id="tablapedido" border=1>
<tr id="f0">
<td width="25">#</td><td width="280">Product</td><td>long/wgt</td><td>Cut Stage</td><td>Bunches</td><td>QxBunch</td><td>E.Price</td><td>B/S</td>
</tr>
</table>

</div>


<script type="text/javascript">
$( document ).ready(function() {

	$("#_i_fecha").datepicker( {dateFormat: "dd-mm-yy" });
	
	$(".select_longitud").show();		
	$(".select_peso").hide();

	var d;
	var b = -1;
	var n = -1;
	var mprods = new Array();
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

	$("button#_i_addbox").click(
	function add_box(event){

		event.preventDefault();
		b++;

	});


	$("button#_i_addproduct").click(
	function add_product(event){

		event.preventDefault();
		n++;
		mprods[n] = new Array();
		mprods[n][0] = $("#_s_producto").val();
		mprods[n][2] = $("#_s_corte").val();
		mprods[n][3] = $("#_i_bunches").val();
		mprods[n][4] = $("#_i_qxbunch").val();
		mprods[n][5] = $("#_i_eprecio").val();
		mprods[n][6] = $('input[name=tipo_precio]:checked').val();

		if(d =='l'){mprods[n][1] = $("#_s_longitud").val();}
		if(d =='w'){mprods[n][1] = $("#_s_peso").val();}
		
		m = JSON.stringify(mprods);
		var fecha = new Date();
		fecha.setTime(fecha.getTime() + (7*24*60*60*1000));
		var expires = "expires="+ fecha.toUTCString();
		document.cookie = "data=" + m + ";"+ expires  +"; path=/";

		$("<tr id= f"+(n+1) +"><td>"+ (n+1) +"</td><td>"+mprods[n][0]+"</td><td>"+mprods[n][1]+"</td><td>"+mprods[n][2]+
		"</td><td>"+mprods[n][3]+"</td><td>"+mprods[n][4]+"</td><td>"+mprods[n][5]+"</td><td>"+mprods[n][6]+"</td>  </tr>").insertAfter("#f"+n);

	});

});
	
</script>
