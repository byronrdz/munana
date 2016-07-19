
<div id="form_pedido" class="formulario">

<div class="titulo_form">ORDERS</div><br>
<table cellpadding=3 width="250">

<tr><th colspan=2>Product information</th></tr>

<tr><td colspan=2>
<label for "select_producto">Product:</label>
<select name="f_producto" id="select_producto">
	<option value="" selected></option> 
	<?php foreach ($productos as $prod_item)
     		echo '<option value="'.$prod_item['producto'].'+'.$prod_item['dimension'].'">'.$prod_item['producto'].'</option>';?>
</select>
</tr></td>
<tr><td>
<label for "select_longitud" class="select_longitud" >Length:</label>
<select name="f_longitud" class="select_longitud" >
	<option value="" selected></option> 
	<?php foreach ($longitudes as $longitud_item) 
     		echo '<option value='.$longitud_item['valor'].'>'.$longitud_item['valor'].' cm'.'</option>';?>
</select>

<label for "select_empaque" class="select_peso">Weight:</label>
<select name="f_peso" class="select_peso">
	<option value="" selected></option> 
	<?php foreach ($pesos as $peso_item) 
     		echo '<option value='.$peso_item['valor'].'>'.$peso_item['valor'].' gr'.'</option>';?>
</select>
</td><td>
<label for "select_corte" class="select_corte" class="noblock">Cut Stage:</label>
<select name="f_corte" class="select_corte" class="noblock">
	<option value="" selected></option>
	<option value="USA">USA</option>
	<option value="Europe">Europe</option>
	<option value="Russia">Russia</option> 
</select>
</td></tr>
<tr>
<td>
<label for "input_bunches">Bunches:</label>
<input name="f_bunches" type="numeric" id="input_bunches" data-toggle="tooltip" title="Number of bunches" size=4></input>
</td>
<td>
<tr><td colspan=2> <button onclick="l_p()">Submit Products</button> </td></tr>

<tr><td colspan=2><hr></td></tr>
<tr><th colspan=2>Package information</th></tr>

<tr><td>
<label for "select_empaque">Box:</label>
<select name="f_empaque" id="select_empaque">
	<option value="" selected></option> 
	<?php foreach ($empaques as $empq_item) 
     		echo '<option value='.$empq_item['nombre'].'>'.$empq_item['nombre'].'</option>';?>
</select>
</td>
<td>
<label for "input_piezas">Pieces:</label>
<input name="f_piezas" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of boxes" size=4 value=5></input>
</td>
<tr>
<td>
<label for "input_uxbunch">Qty x Bunch:</label>
<input name="f_uxbunch" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of units per bunch" size=4 value=25></input>
</td>
<td>
<label for "input_uxcaja">Qty x Box:</label>
<input name="f_uxcaja" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of bunches per box" size=4 value=9></input>
</td>
</tr>

<tr><td colspan=2><input class="boton_largo" type="submit" value="Submit Package Information" width=100% onclick="listar_productos()"></td></tr>
<tr><td colspan=2><hr></td></tr>
<tr><th colspan=2>Additional information</th></tr>

<tr><td colspan=2>
<label for "input_fecha">Fly Date:</label>
<input type="text" name="f_fecha" id="input_fecha"></input>
</td></tr>


<tr><td colspan=2>
<label for "input_eprice">Estimated price:</label>
<input name="f_eprice" type="numeric" id="input_eprice" data-toggle="tooltip" title="We can use this value in searching for your product. It is a reference price." size=5 ></input>

<input type="radio" name="tipo_precio" value="precioxstem" class="noblock" checked>per Stem</input>
<input type="radio" name="tipo_precio" value="precioxbunch" class="noblock">per Bunch</input>
</td>
</tr>

<tr><td colspan=2><input class="boton_largo" type="submit" value="Submit Aditional Info" width=100%></td></tr>

</table>

</div>

<script type="text/javascript">
$( document ).ready(function() {

	$("button").click(
	function l_p(){
		alert("OK, funcion listar productos operativa");
	});

	$("#input_fecha").datepicker( {dateFormat: "dd-mm-yy" });
	
	$(".select_longitud").show();		
	$(".select_peso").hide();		
	$("#select_producto").change(function() {
 		var d = $("#select_producto").val();
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




});
	
</script>
