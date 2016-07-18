
<div id="form_pedido" class="formulario">

<div class="titulo_form">PEDIDOS</div><br>

<label for "select_producto">Product:</label>
<select name="f_producto" id="select_producto">
	<option value="" selected></option> 
	<?php foreach ($productos as $prod_item)
     		echo '<option value="'.$prod_item['producto'].'+'.$prod_item['dimension'].'">'.$prod_item['producto'].'</option>';?>
</select>

<label for "select_longitud" class="select_longitud">Length:</label>
<select name="f_longitud" class="select_longitud">
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

<label for "select_empaque">Package:</label>
<select name="f_empaque" id="select_empaque">
	<option value="" selected></option> 
	<?php foreach ($empaques as $empq_item) 
     		echo '<option value='.$empq_item['nombre'].'>'.$empq_item['nombre'].'</option>';?>
</select>

<label for "input_piezas">Pieces:</label>
<input name="f_piezas" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of boxes" value=5></input>

<label for "input_uxbunch">Qty x Bunch:</label>
<input name="f_uxbunch" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of units per bunch" value=25></input>

<label for "input_uxcaja">Qty x Box:</label>
<input name="f_uxcaja" type="numeric" id="input_piezas" data-toggle="tooltip" title="Number of bunch per box" value=9></input>

<label for "input_eprice">Estimated price:</label>
<input name="f_eprice" type="numeric" id="input_eprice" data-toggle="tooltip" title="We can use this value in searching for your product. It is a reference price."></input>
<input type="radio" name="tipo_precio" value="precioxstem"> Price per Stem<br>
<input type="radio" name="tipo_precio" value="precioxbunch"> Price per Bunch<br>

<input type="text" name="f_fecha" id="input_fecha"></input>


</div>

<script type="text/javascript">
$( document ).ready(function() {



	$("#input_fecha").datepicker( {dateFormat: "yy-mm-dd" });
	
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
